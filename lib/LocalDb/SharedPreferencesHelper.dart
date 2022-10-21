import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {

  static final String _kLanguageCode = "language";

  static Future<String> getLoggedToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return  prefs.getString("LoggedToken") ;
  }

  static Future<bool> setLoggedToken(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("LoggedToken", value);
  }

  static Future<String> getLoggedUserName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return  prefs.getString("LoggedUserName") ;
  }

  static Future<bool> setLoggedUserName(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("LoggedUserName", value);
  }

  static Future<String> getUserImageUrl() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return  prefs.getString("UserImageUrl") ;
  }

  static Future<bool> setUserImageUrl(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("UserImageUrl", value);
  }






  /// ------------------------------------------------------------
  /// Method that returns the user language code, 'en' if not set
  /// ------------------------------------------------------------
  static Future<String> getLanguageCode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_kLanguageCode);
  }

  /// ----------------------------------------------------------
  /// Method that saves the user language code
  /// ----------------------------------------------------------

  static Future<bool> setLanguageCode(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_kLanguageCode, value);
  }

//____________________

  static Future<String> getInitialPage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return  prefs.getString("InitialPage") ;
  }

  static Future<bool> setInitialPage(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("InitialPage", value);
  }

  //____________________

  static Future<int> getIdOfDataBase() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getInt("IdDb") ;
  }
  static Future<bool> setIdOfDataBase(int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setInt("IdDb", value);
  }

  //____________________

  static Future<bool> isUserLoged() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool("UserLoged") ;
  }
  static Future<bool> setUserLoged(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool("UserLoged", value);
  }

  static Future<String> getOtpNumber() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return  prefs.getString("OtpNumber") ;
  }
  static Future<bool> setOtpNumber(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString("OtpNumber", value);
  }

  static Future<String> getInquireEmployee() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return  prefs.getString("InquireEmployee") ;
  }
  static Future<bool> setInquireEmployee(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString("InquireEmployee", value);
  }

  static Future<int> getInquireEmployeeEmpCode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return  prefs.getInt("InquireEmployeeEmpCode") ;
  }
  static Future<bool> setInquireEmployeeEmpCode(int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setInt("InquireEmployeeEmpCode", value);
  }

  static Future<int> getInquireEmployeeUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return  prefs.getInt("InquireEmployeeUserId") ;
  }
  static Future<bool> setInquireEmployeeUserId(int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setInt("InquireEmployeeUserId", value);
  }


  static Future<String> getInitialColor() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return  prefs.getString("InitialColor") ;
  }
  static Future<bool> setInitialColor(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString("InitialColor", value);
  }

  static Future<String> getInitialLogo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return  prefs.getString("InitialLogo") ;
  }
  static Future<bool> setInitialLogo(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString("InitialLogo", value);
  }

//____________________

  static Future<bool> getTowFactor() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool("TowFactor") ;
  }
  static Future<bool> setTowFactor(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool("TowFactor", value);
  }

  // ________________________________________________


  static Future<String> getDashboardData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return  prefs.getString("DashboardData") ;
  }
  static Future<bool> setDashboardData(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("DashboardData", value);
  }

  // _______________________________________________________________


  static Future<List<String>> getALlMeetingData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return  prefs.getStringList("ALlMeetingData") ;
  }
  static Future<bool> setALlMeetingData(List<String> value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setStringList("ALlMeetingData", value);
  }

  // _______________________________________________________________

  static Future<List<String>> getALlMeetingDataWithKey() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return  prefs.getStringList("ALlMeetingDataKey") ;
  }
  static Future<bool> setALlMeetingDataWithKey(List<String> value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setStringList("ALlMeetingDataKey", value);
  }

  static Future<String> getToday() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return  prefs.getString("Today") ;
  }
  static Future<bool> setToday(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("Today", value);
  }

  // ________________________________________________________________

  static Future<List<String>> getALlNews() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return  prefs.getStringList("ALlNews") ;
  }
  static Future<bool> setALlNews(List<String> value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setStringList("ALlNews", value);
  }
  // ________________________________________________________________

  static Future<List<String>> getNewsDetails() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return  prefs.getStringList("NewsDetails") ;
  }
  static Future<bool> setNewsDetails(List<String> value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setStringList("NewsDetails", value);
  }
// ________________________________________________________________

  static Future<bool> getAlreadySignInOrganization() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool("AlreadySignInOrganization") ;
  }
  static Future<bool> setAlreadySignInOrganization(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool("AlreadySignInOrganization", value);
  }

// ________________________________________________

  static Future<String> getOrg() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return  prefs.getString("org") ;
  }
  static Future<bool> setOrg(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("org", value);
  }
// ________________________________________________________________

  static Future<String> getDomainName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return  prefs.getString("DomainName") ;
  }
  static Future<bool> setDomainName(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("DomainName", value);
  }
// ________________________________________________________________

  static Future<String> getOrgLogo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return  prefs.getString("OrgLogo") ;
  }
  static Future<bool> setOrgLogo(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("OrgLogo", value);
  }
// ________________________________________________________________


  static Future<String> getAllCommite() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return  prefs.getString("AllCommite") ;
  }

  static Future<bool> setAllCommite(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("AllCommite", value);
  }

}