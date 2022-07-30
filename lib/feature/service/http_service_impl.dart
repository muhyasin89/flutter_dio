import 'package:dio_rest_api/service/http_service';
import 'package:dio/dio.dart';

const BASE_URL = "https://newsapi.org/";
const API_KEY = "13dc73eab3314361b6ad1465fc3b28d0";

class HttpServiceImpl implements HttpService{

  initializeInterceptors(){
    _dio.interceptors.add(InterceptorsWrapper(
      onError: (error){
        print(error.message);
      },

      onRequest: (request){
        print("${request.method}| ${request.path}");
      },

      onResponse: (response){
        print("${response.statusCode} ${response.statusMessage} ${response.data}");
      }
    ))
  }

  @override
  void init(){
    _dio = Dio(BaseOptions(
      baseUrl: BASE_URL,
      headers: {"Authorization": "Bearer $API_KEY"}
    ));

    initializeInterceptors();
  }

  @override
  Future<Response> getRequest(String url) async {
    Response response;

    try{
      response = await _dio.get(url);
    } on DioError catch (e){
      print(e.message);
      throw Exception(e.message);
    }
   
   return response;
  }


  
}