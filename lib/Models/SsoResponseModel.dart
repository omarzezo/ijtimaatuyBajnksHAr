/// message : "success"
/// redirect : "https://login.microsoftonline.com/7f446a78-12c2-4f8c-8c2e-70f0f5a07a42/saml2?SAMLRequest=fVPLrtowFNzzFSj7PDCBBAuQKPSBRAEB7aKbyjjH97py7NTHuY%2B%2Fr5NwC61avLF0fGY8Mz6eIitVRRe1e9QH%2BFkDul7fr5dSaaTt4SyoraaGoUSqWQlIHafHxecNJVFCK2uc4UYFf8HuoxgiWCeN7mDr1SzYbd9vdh%2FX2%2B9sDKOs4CxNJ8V4MhKTcy4EyZMsH2dcpJN0OBydkyTtoF%2FBoueZBZ426HVsiDWsNTqmna8nhITJKCTDEyF0kNMk%2B9ZBV96s1My18EfnKqRxrMyD1FEpuTVohDNaSQ0RN2WciTQdsywPB4STMBU5D3NOIMwSkYgRSzKWkrixTjr6%2FSWZd1IXUj%2FcD%2BTcNSH9dDrtw%2F3ueOpIFm9BLY3GugR7BPskOXw5bK6anTcSsaqK5A8nS%2BYdtYJZJWNEEz8xJQvmIJi3lNNGI21DsvP7FNP4tveKrujWO1iv9kZJ%2FtrWm%2FXB2JK5%2FxsdRIO2IotQtK0USibVoigsIAa%2FeRZKmeelBa95FjhbQ9CP%2F7j9MqlQtHPro3Hw4vpLU1bMSmyeE14YdxfDV9O37Uvlh%2FAAYn53TjnlTZ8v7%2F32bGzRPCtwf%2FfJMo2Vse6S0j%2FJO9XxHdnz3tvx7Sec%2FwI%3D&RelayState=http%3A%2F%2Ftest.app.ijtimaati.com%2Fapi%2Fsso%2Fcheck"

class SsoResponseModel {
  SsoResponseModel({
      String message, 
      String redirect,}){
    _message = message;
    _redirect = redirect;
}

  SsoResponseModel.fromJson(dynamic json) {
    _message = json['message'];
    _redirect = json['redirect'];
  }
  String _message;
  String _redirect;

  String get message => _message;
  String get redirect => _redirect;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['redirect'] = _redirect;
    return map;
  }

}