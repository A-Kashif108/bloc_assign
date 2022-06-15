import 'package:shared_preferences/shared_preferences.dart';

// import '../../domain/models/user_model.dart';
// import '../../globals.dart';

class LocalStorageService {
  static late LocalStorageService _instance;
  static late SharedPreferences _preferences;

  static Future<void> getInstance() async {
    _instance = LocalStorageService();
    _preferences = await SharedPreferences.getInstance();
  }

  static LocalStorageService get instance => _instance;


  // dynamic _getFromDisk(String key) {
  //   final Object? value = _preferences.get(key);
  //   return value;
  // }

  // List<String>? _getList(String key) {
  //   return _preferences.getStringList(key);
  // }
    _saveCounter(int n) async {
      await _preferences.setInt('counter', n);
      print("saved");
    }
    _saveBinary(String s) async {
      await _preferences.setString('binary', s);

    }
    Function get save=>(int n)=>{_saveCounter(n)};
    int? counter;
    String? s;
    int readCounter(){
      counter = _preferences.getInt('counter');
      return counter??0;
    }
    String readBinary(){
      s = _preferences.getString('binary');
      return s??"0";
    }
  Function get saveBin=>(String s)=>{_saveBinary(s)};
   int get count => readCounter();

}