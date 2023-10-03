class ImageData {
  final String msg;
  final String url;

  ImageData({required this.msg, required this.url});

  factory ImageData.fromJson(Map<String, dynamic> json) {
    return ImageData(
      msg: json['msg'],
      url: json['url'],
    );
  }
}
