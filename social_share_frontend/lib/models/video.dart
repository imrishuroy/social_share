import 'package:equatable/equatable.dart';

class Video extends Equatable {
  final String? videoId;
  final String? videoUrl;
  final String? videoToken;
  final String? thumbnailUrl;
  final String? thumbnailToken;

  const Video({
    this.videoId,
    this.videoUrl,
    this.videoToken,
    this.thumbnailUrl,
    this.thumbnailToken,
  });

  Video copyWith({
    String? videoId,
    String? videoUrl,
    String? videoToken,
    String? thumbnailUrl,
    String? thumbnailToken,
  }) {
    return Video(
      videoId: videoId ?? this.videoId,
      videoUrl: videoUrl ?? this.videoUrl,
      videoToken: videoToken ?? this.videoToken,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      thumbnailToken: thumbnailToken ?? this.thumbnailToken,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      //  'videoId': videoId,
      'videoUrl': videoUrl,
      'videoToken': videoToken,
      'thumbnailUrl': thumbnailUrl,
      'thumbnailToken': thumbnailToken,
    };
  }

  factory Video.fromJson(Map<String, dynamic> map) {
    return Video(
      videoId: map['videoId'] != null ? map['videoId'] as String : null,
      videoUrl: map['videoUrl'] != null ? map['videoUrl'] as String : null,
      videoToken:
          map['videoToken'] != null ? map['videoToken'] as String : null,
      thumbnailUrl:
          map['thumbnailUrl'] != null ? map['thumbnailUrl'] as String : null,
      thumbnailToken: map['thumbnailToken'] != null
          ? map['thumbnailToken'] as String
          : null,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      videoId,
      videoUrl,
      videoToken,
      thumbnailUrl,
      thumbnailToken,
    ];
  }
}
