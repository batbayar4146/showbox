class LoginResponseModel {
  LoginResponseModel({
    String? status,
    Message? message,
    Data? data,
  }) {
    _status = status;
    _message = message;
    _data = data;
  }

  LoginResponseModel.fromJson(dynamic json) {
    _status = json['status'].toString();
    _message = json['message'] != null ? Message.fromJson(json['message']) : null;
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _status;
  Message? _message;
  Data? _data;

  String? get status => _status;
  Message? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_message != null) {
      map['message'] = _message?.toJson();
    }
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

class Data {
  Data({
    User? user,
    String? accessToken,
    String? tokenType,
  }) {
    _user = user;
    _accessToken = accessToken;
    _tokenType = tokenType;
  }

  Data.fromJson(dynamic json) {
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _accessToken = json['access_token'];
    _tokenType = json['token_type'];
  }
  User? _user;
  String? _accessToken;
  String? _tokenType;

  User? get user => _user;
  String? get accessToken => _accessToken;
  String? get tokenType => _tokenType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['access_token'] = _accessToken;
    map['token_type'] = _tokenType;
    return map;
  }
}

class User {
  User({
    int? id,
    String? username,
    String? email,
    String? mobile,
    String? status,
    String? createdAt,
  }) {
    _id = id;
    _username = username;
    _email = email;
    _mobile = mobile;
    _status = status;
    _createdAt = createdAt;
  }

  User.fromJson(dynamic json) {
    _id = json['id'];
    _username = json['username'];
    _email = json['email'];
    _mobile = json['mobile'].toString();
    _status = json['status'].toString();
    _createdAt = json['created_at'];
  }
  int? _id;
  String? _username;
  String? _email;
  String? _mobile;
  String? _status;
  String? _createdAt;

  int? get id => _id;
  String? get username => _username;
  String? get email => _email;
  String? get mobile => _mobile;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['username'] = _username;
    map['email'] = _email;
    map['mobile'] = _mobile;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    return map;
  }
}

class Message {
  Message({List<String>? success, List<String>? error}) {
    _success = success;
    _error = error;
  }

  Message.fromJson(dynamic json) {
    _success = json['success'] != null ? json['success'].cast<String>() : null;
    _error = json['error'] != null ? json['error'].cast<String>() : [];
  }
  List<String>? _success;
  List<String>? _error;

  List<String>? get success => _success;
  List<String>? get error => _error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    return map;
  }
}
