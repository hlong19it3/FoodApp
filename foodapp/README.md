# FinFree - Dart

- Xứ mệnh cũ, nền tảng mới, FinFree với tên phát triển là FinTech. 
- Được xây dựng với mục tiêu thay đổi giao diện, cách trải nghiệm mới
- Với công cụ tìm kiếm hiện đại, bộ phân tích biểu đồ thông minh, cơ chế bảo mật hiện đại

## Thư viện icon chủ yếu được sử dụng - Truy cập tìm icon cho nhanh

[Ion Icons](https://ionic.io/ionicons)

### Tạo toJson và formJson

`flutter packages pub run build_runner build --delete-conflicting-outputs`

### Tạo file ngôn ngữ

`get generate locales assets/locales`

### Tạo file inject

`flutter packages pub run build_runner build`

### Build app

`flutter build apk --split-per-abi`

### Cập nhập lại tài nguyên cho app

`fluttergen -c pubspec.yaml`

### Cập nhập logo app

`flutter pub run flutter_launcher_icons:main`


  factory StatusModel.fromJson(Map<String, dynamic> json) =>
      _$StatusModelFromJson(json);

  Map<String, dynamic> toJson() => _$StatusModelToJson(this);
