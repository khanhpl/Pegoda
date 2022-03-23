class PCCImage {
  var imageLink;

  PCCImage({required this.imageLink});

  factory PCCImage.fromJson(Map<String, dynamic> json) {
    return PCCImage(
      imageLink: json['urlImage'],
    );
  }
}
