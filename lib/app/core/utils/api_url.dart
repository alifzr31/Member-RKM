class ApiUrl {
  static const String baseUrl = 'http://10.1.1.152/api';
  static const String baseStorageUrl = 'http://10.1.1.152/storage';
  static EndPoint endPoint = EndPoint();
  static StorageUrl storageUrl = StorageUrl();
}

class EndPoint {
  static const String fcmToken = '/fcm_token';
  
  static const String login = '/login';
  static const String register = '/register';
  static const String sendEmail = '/register/send-email';
  static const String logout = '/logout';
  
  static const String account = '/account';
  static const String content = '/contents';
  static const String detailContent = '/content';
  static const String store = '/store';

  static const shoppingHistory = '/account/shoping';

  static const String village = '/location';
  static const String editProfile = '/account/update';
  static const String changePassword = '/account/password/update';
  static const String pinUpdate = '/account/pin/update';
  static const String pinCheck = '/account/pin/check';
}   

class StorageUrl {
  static const String qr = '/qr/member';
}