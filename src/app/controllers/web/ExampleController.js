
class ExampleController{
    // functions

    index(req, res){
        res.render('home_page')
    }
}

module.exports = new ExampleController;