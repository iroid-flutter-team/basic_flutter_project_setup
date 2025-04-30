import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static var baseUrl = dotenv.env['BASE_URL']!;
  static const login = 'auth/login';
  static const signUp = 'auth/register';
  static const sendOtp = 'otp/send';
  static const verifyOtp = 'otp/verify';
  static const getGenres = 'genres';
  static const getArtists = 'artists';
  static const updateUserInfo = 'user/info/update';
  static const getProfile = 'user/profile';
  static const logout = 'auth/logout';
  static const forgotPassword = 'auth/forgot-password';
  static const deleteAccount = 'user/account/delete';
  static const updateProfile = 'user/profile/update';
  static const passwordChange = 'user/password/change';
  static const uploadDj = 'dj/store';
  static const getDashboard = 'home';
  static const getDjList = 'dj/list';
  static const djDetail = 'dj/detail/';
  static const followArtist = 'favorite/store';
  static const reportCommentList = 'report-comment-list';
  static const reportDj = 'report-dj';
  static const djNextPrevious = '/dj/next-previous';
  static const artistsList = 'favorite/list';
  static const blockArtist = 'block-user';
  static const followersList = 'followers/list';
  static const followerRemove = 'follower/remove';
  static const blockList = 'blocked-list';
  static const defaultSerch = 'default/search';
  static const search = 'search';
  static const socialLogin = 'auth/social/login';
  static const notificationList = 'notification';
  static const paymentAccountRemove = 'payment/account/remove';
  static const paymentAccountAdd = 'payment/account/add';
  static const walletHistory = 'wallet/history';
  static const walletWithdraw = 'wallet/withdraw';
  // static const payment = 'payment';
  static const markAsRead = 'notification/mark-as-read/';
  static const deleteDj = 'dj/delete/';

  //live streaming
  static const createLiveStreaming = 'streaming/create';
  static const createStreamToken = 'create-stream-token';
  static const registerForPush = 'register-for-push';
  static const liveStreamingList = 'streaming/list';
  static const reportComment = 'report-comment';
  static const paymentAccount = 'payment/account';
}
