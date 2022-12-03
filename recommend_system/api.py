
from json import dumps
from sqlalchemy import create_engine
from flask_restful import Resource, Api
from flask import Flask, request, jsonify
import mysql.connector
import numpy as np
import pandas as pd
from IPython.core.interactiveshell import InteractiveShell
InteractiveShell.ast_node_interactivity = "all"

app = Flask(__name__)
api = Api(app)
dbConnect = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="foodapp"
)

dbCursor = dbConnect.cursor()


@app.route('/api/food/popular')
def getPopular():
    try:

        [qItems, foods] = getData()
        popItems = foods.sort_values('sold', ascending=False)
        popItems = popItems.head(10).to_dict('records')

        return jsonify(popItems)
    except Exception as e:
        return jsonify({'error': str(e)})


@app.route('/api/food/toprated')
def getTopRated():
    try:

        [qItems, foods] = getData()
        topRatedItems = qItems.sort_values('score', ascending=False)
        topRatedItems = topRatedItems.head(5).to_dict('records')

        return jsonify(topRatedItems)
    except Exception as e:
        return jsonify({'error': str(e)})


def create_soup(x):
    tags = x['tag'].lower().split(', ')
    tags.extend(x['name'].lower().split())
    tags.extend(x['categoryName'].lower().split())
    return " ".join(sorted(set(tags), key=tags.index))


@app.route('/api/food/searh')
def searchFood():

    searchTerm = request.args.get("searchTerm")
    try:
        [qItems, foods] = getData()
        foods['soup'] = foods.apply(create_soup, axis=1)
        foods['soup'] = foods['soup'].str.replace(' ', '')
        searchTerm = searchTerm.replace(' ', '')
        result = qItems[qItems['soup'].str.contains(searchTerm)]
        result = result.head(10).to_dict('records')
        return jsonify(result)
    except Exception as e:
        return jsonify({'error': str(e)})


def getData():
    dbCursor.execute(
        "SELECT * FROM foods LEFT JOIN categories ON foods.categoryId = categories.id")
    foods = dbCursor.fetchall()

    print(foods[0])
    defaultHead = [
        'id', 'restaurantId', 'name', 'price', 'details', 'image', 'quantity', 'sold',
        'startSell', 'endSell', 'categoryId', 'rating', 'totalRating', "tag", "categoryId", "categoryName", "categoryImage"]

    foods = pd.DataFrame(foods, columns=defaultHead)

    # Đánh giá trung bình của tất cả các sản phẩm
    C = foods['rating'].mean()

    # số lượng phiếu bầu tối thiểu cần thiết để xuất hiện trong danh sách đề xuất, tức là phần trăm thứ 60 trong số 'totalRating'
    m = foods['totalRating'].quantile(0.6)

    # các mục đáp ứng các tiêu chí của số lượng bình chọn tối thiểu
    qItems = foods.copy().loc[foods['totalRating'] >= m]

    # Tính toán xếp hạng có trọng số dựa trên công thức IMDB

    def weighted_rating(x, m=m, C=C):
        v = x['totalRating']
        R = x['rating']
        return (v/(v+m) * R) + (m/(m+v) * C)

    # Applying weighted_rating to qualified items
    qItems['score'] = qItems.apply(weighted_rating, axis=1)
    return [qItems, foods]


if __name__ == '__main__':
    app.run(port=3001)
