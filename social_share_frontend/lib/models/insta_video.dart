import 'package:equatable/equatable.dart';

class InstaVideo extends Equatable {
  final String? media;
  final String? thumbnail;
  final String? type;
  final String? api;
  final String? title;

  const InstaVideo({
    this.media,
    this.thumbnail,
    this.type,
    this.api,
    this.title,
  });

  InstaVideo copyWith({
    String? media,
    String? thumbnail,
    String? type,
    String? api,
    String? title,
  }) {
    return InstaVideo(
      media: media ?? this.media,
      thumbnail: thumbnail ?? this.thumbnail,
      type: type ?? this.type,
      api: api ?? this.api,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'media': media,
      'thumbnail': thumbnail,
      'type': type,
      'api': api,
      'title': title,
    };
  }

  factory InstaVideo.fromJson(Map<String, dynamic> map) {
    return InstaVideo(
      media: map['media'] != null ? map['media'] as String : null,
      thumbnail: map['thumbnail'] != null ? map['thumbnail'] as String : null,
      type: map['Type'] != null ? map['Type'] as String : null,
      api: map['API'] != null ? map['API'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      media,
      thumbnail,
      type,
      api,
      title,
    ];
  }
}
