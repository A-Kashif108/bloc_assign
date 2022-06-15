
import 'package:bloc_assign/Data/apiService.dart';
import 'package:bloc_assign/Data/local.dart';
import 'package:get_it/get_it.dart';
GetIt locator  = GetIt.instance;

void setupLocator(){
  locator.registerFactory(() =>LocalStorageService() );
  locator.registerFactory(() =>ApiServices() );
}