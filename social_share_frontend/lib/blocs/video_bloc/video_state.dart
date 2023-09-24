part of 'video_bloc.dart';

enum VideoStatus { initial, uploading, loading, success, failure }

class VideoState extends Equatable {
  final List<Video> videos;
  final VideoStatus status;

  const VideoState({
    required this.videos,
    required this.status,
  });

  factory VideoState.initial() {
    return const VideoState(
      videos: [],
      status: VideoStatus.initial,
    );
  }

  VideoState copyWith({
    List<Video>? videos,
    VideoStatus? status,
  }) {
    return VideoState(
      videos: videos ?? this.videos,
      status: status ?? this.status,
    );
  }

  @override
  bool? get stringify => true;

  @override
  List<Object> get props => [videos, status];
}
