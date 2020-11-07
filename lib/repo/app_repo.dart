import 'package:coffe_searcher_app/model/events_response.dart';
import 'package:coffe_searcher_app/model/user_response.dart';
import 'package:dio/dio.dart';


class AppRepository {
  static String mainUrl = "https://ameaty.herokuapp.com/";
  static String loginUrl = "token";
  static String eventsUrl = "users/get_all_events";
  final Dio _dio = Dio();



  Future<EventsResponse> getEvents(String token) async {
    var body = {};
    var header = {
      "Content-Type": "accept: application/json",
      "Authorization": "Bearer $token"
    };
    try {
      Response response = await _dio.post(mainUrl+eventsUrl, data: body,options: Options(
          headers: header,
      ),);
      //var data = jsonDecode(response.data);
      print(response.data);
      //print(jsonEncode(data));
      return EventsResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return EventsResponse.withError("Нет сети");
    }
  }

  Future<UserResponse> userAuth(String login, String password) async {
    if(login=="0101"&&password=="323da"){
      return UserResponse.withError("start");
    }
    if(login=="0102"&&password=="323da"){
      return UserResponse.withError("loading");
    }
    var body = {
      'username': '$login',
      'password': '$password',
    };
    try {
      Response response = await _dio.post(mainUrl+loginUrl, data: body,options: Options(contentType:Headers.formUrlEncodedContentType),);
      //var data = jsonDecode(response.data);
      print(response.data);
      //print(jsonEncode(data));
      return UserResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return UserResponse.withError("Нет сети");
    }
  }






  Future<UserResponse> userLogOut() async {
    //SharedPreferences prefs = await SharedPreferences.getInstance();
    /*prefs.remove("login");
    prefs.remove("password");
    prefs.remove("userData");
    prefs.remove("lessonsData");
    prefs.remove("semestr");
    prefs.remove("group");*/
    return UserResponse.withError("Авторизуйтесь");
  }


/*  Future<void> userAuth(String login, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var params = {

    };
    try {
      Response response = await _dio.get(mainUrl, queryParameters: params);
      var data = jsonDecode(response.data);
      var rest = data["Data"] as List;
      print(data);
      if (rest.isNotEmpty) {
        prefs.setString("login", login);
        prefs.setString("password", password);
        prefs.setString("userData", jsonEncode(data["Data"][0]));
        print(jsonEncode(data["Data"][0]));
        return UserResponse.fromJson(data["Data"][0]);
      } else {
        print("Неверный логин или пароль");
        return UserResponse.withError("Неверный логин или пароль");
      }
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return UserResponse.withError("Нет сети");
    }
  }*/

}