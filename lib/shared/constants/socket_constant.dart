class SocketConstants {
  static const String socketUrl = "https://dev.iroidsolutions.com:3003";
  static const String createStream = "create_stream"; // when user create stream
  static const String newStream = "new_stream"; // Audeince join stream
  static const String joinStream = "join_stream"; // when user join stream
  static const String joinStreamListener =
      "join_stream_listener"; // when user join stream

  static const String closeStream = "close_stream"; // when user close stream
  static const String streamClosedListener =
      "stream_closed_by_host"; // when stream is closed

  //like
  static const String likeStream = "like";
  static const String likeStreamListener = "new_like";

  //message
  static const String comment = "comment";
  static const String commentListener = "new_comment";

  //payment
  static const String payment = "payment";
}
