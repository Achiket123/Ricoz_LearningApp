class DatabaseApi {
  static const baseUrl = "http://192.168.1.5:8000/api/v1";
  static const auth = "$baseUrl/auth";
  static const login = "$auth/login/";
  static const signUp = "$auth/signup";
  static const sendOtp = "$auth/sendotp";
  static const verifyOtp = "$auth/verifyotp";
  static const updateProfile = "$auth/updateProfile";
}
