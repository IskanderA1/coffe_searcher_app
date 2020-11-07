

class UserModel{

  String login;
  String password;
  String token;

  UserModel();
  UserModel.fromJson(var data):
        token = data["access_token"];
}