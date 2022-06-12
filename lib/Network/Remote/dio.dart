import 'package:dio/dio.dart';
class DioClass{
  static Dio ? dio;
  static init(){
    dio=Dio(
        BaseOptions(
          baseUrl:'https://app.gazz.live/api/v1',
          receiveDataWhenStatusError: true,
          headers: {
            'Accept':'application/json',
          }
        )
    );
  }
  static Future<Response> getData({
  required String path,
  Map<String , dynamic> ? query
})async{
   return await dio!.get(path,queryParameters:query );
  }
  static Future<Response> postData({
    required String path,
    required Map<String,dynamic> data
  })async{
    return await dio!.post(path,data: data);
  }

}