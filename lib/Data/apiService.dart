
import 'dart:convert';

import 'package:bloc_assign/Data/local.dart';
import 'package:dio/dio.dart';

class ApiServices{
  late Dio _dio;
  ApiServices(){
    _dio = Dio(BaseOptions(
        baseUrl:''
    ));
    initializeInterceptors();
  }

  get requestOptions => null;
  Future<Response> response(int n)  async {
    Response response;
      response = await Dio().get('https://networkcalc.com/api/binary/$n?from=10&to=2') ;

       return response;


  }
  static String binary=LocalStorageService().readBinary();
  Future<void> getBinary(int n)async{
    Response response;
    response = await this.response(n);
     binary = response.data.toString();
    List<String> temp = binary.split(',');
    binary =temp[2].substring(11,temp[2].length);
    print(binary);
  }
  initializeInterceptors(){
    _dio.interceptors.add(InterceptorsWrapper(
        onError: (error,e){
          print(error.message);
        },
        onRequest: (request,r){
          // print("${request.method} ${request.path}");
        },
        onResponse: (response,r){
          print(response.data);
        }
    ));
  }
}



