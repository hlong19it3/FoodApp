## Install Mysql for docker

`docker pull mysql`

## Init DataBase

### With Cmd (latest mysql version)

`docker run --name foodapp -p 3306:3306 -e MYSQL_ALLOW_EMPTY_PASSWORD -d mysql`

### With cmd and docker-compose.yml file (recommended)

`docker compose up dev-db - d`

## Run app
`npm start`

### Role

#### Admim = 0

#### User = 1

#### Restaurant owner = 2

#### Shipper = 3


## Mobile Team
- [Phạm Hoàng Sang](fb.com/hoangsang17th)
- [Trần Ngọc Thành](https://www.facebook.com/profile.php?id=100042376611276)
`Tiến độ hoàn thành - Các API này vui lòng không đổi param - Mị mệt lắm, mị không muốn update đâu`

- [x] Đăng ký
- [x] Đăng nhập
- [x] Đăng xuất


## Review Team
- Các API cần có chung 1 đường dẫn giống như `/api/auth` theo module
- Các đường dẫn phải có tên khớp với tính năng mà nó cung cấp (ví dụ: `/api/auth/login` là đăng nhập, `/api/auth/register` là đăng ký)
- Việc phải đẩy lên các value ở giá trị null trong khi không sử dụng là điều không cần thiết
    ```
    role ở API đăng ký không được sử dụng, nhưng nếu không đẩy len app sẽ bị crash
    ```
- Các thuộc tính primary nên được sử dụng ở các field dùng để phân biệt cá thể duy nhất id -> Unique identifier
