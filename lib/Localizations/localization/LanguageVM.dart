
// import 'package:shared_preferences/shared_preferences.dart';

class LanguageVM {
  String value_Txt ;
  int value_int ;
  LanguageVM({this.value_Txt, this.value_int});

  factory LanguageVM.fromJson(Map<dynamic, dynamic> json) {
    return LanguageVM(
      // code: json['code'],
      value_Txt: json['value_Txt'],
      value_int: json['value_int'],
    );
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['code'] = this.code;
    data['value_int'] = this.value_int;
    data['value_Txt'] = this.value_Txt;

    return data;
  }
}

// Future<bool> saveLanguage(LanguageVM user) async {
//   try {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setInt("value_int", user.value_int);
//     await prefs.setString("value_Txt", user.value_Txt);
//
//     return true ;
//   }catch(Excption){
//     print("save to shared faild   :  $Excption");
//     return false ;
//   }
// }
//
// Future< LanguageVM > getLanguage () async{
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   return new LanguageVM(
//       value_int: prefs.getInt("value_int"),
//       value_Txt: prefs.getString("value_Txt")
//   );
// }