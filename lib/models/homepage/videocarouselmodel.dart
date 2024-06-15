class Video {
  final String id;
  final String videoId;

  Video({required this.id, required this.videoId});

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json['id'],
      videoId: json['videoId'],
    );
  }
}
