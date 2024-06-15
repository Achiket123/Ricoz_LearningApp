class DatabaseApi {
  static const baseUrl = "http://192.168.29.96:8000/api/v1";
  static const auth = "$baseUrl/auth";
  static const login = "$auth/login/";
  static const signUp = "$auth/signup";
  static const sendOtp = "$auth/sendotp";
  static const verifyOtp = "$auth/verifyotp";
  static const updateProfile = "$auth/updateProfile";
  static const books = "$auth/books";
  static const usersubject = "$auth/usersubject";
  //static const Gethistory= localhost/api/v1/getUserHistory;
  //static const Addwatchhistory- localhost/api/v1/addWatchHistory;
  static const Gethistory = "$auth/getUserHistory";
  static const Addwatchhistory = "$auth/addWatchHistory";
  static const giveRating="$auth/give/rating";
}
