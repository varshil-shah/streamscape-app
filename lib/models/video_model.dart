class VideoModel {
  final VideoResolutions videoResolutions;
  final String id;
  final String title;
  final String description;
  final String fileName;
  final String objectKey;
  final String type;
  final String owner;
  final String progress;
  final int views;
  final bool isPublished;
  final DateTime createdAt;
  final String subtitleUrl;
  final String thumbnailUrl;

  VideoModel({
    required this.videoResolutions,
    required this.id,
    required this.title,
    required this.description,
    required this.fileName,
    required this.objectKey,
    required this.type,
    required this.owner,
    required this.progress,
    required this.views,
    required this.isPublished,
    required this.createdAt,
    required this.subtitleUrl,
    required this.thumbnailUrl,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      videoResolutions: VideoResolutions.fromJson(json['videoResolutions']),
      id: json['_id'],
      title: json['title'],
      description: json['description'] ?? '',
      fileName: json['fileName'],
      objectKey: json['objectKey'],
      type: json['type'],
      owner: json['owner'],
      progress: json['progress'],
      views: json['views'],
      isPublished: json['isPublished'],
      createdAt: DateTime.parse(json['createdAt']),
      subtitleUrl: json['subtitleUrl'] ?? '',
      thumbnailUrl: json['thumbnailUrl'] ?? '',
    );
  }
}

class VideoResolutions {
  final String r360p;
  final String r480p;
  final String r720p;
  final String r1080p;
  final String playlist;

  VideoResolutions({
    required this.r360p,
    required this.r480p,
    required this.r720p,
    required this.r1080p,
    required this.playlist,
  });

  factory VideoResolutions.fromJson(Map<String, dynamic> json) {
    return VideoResolutions(
      r360p: json['360p'] ?? '',
      r480p: json['480p'] ?? '',
      r720p: json['720p'] ?? '',
      r1080p: json['1080p'] ?? '',
      playlist: json['playlist'] ?? '',
    );
  }
}
