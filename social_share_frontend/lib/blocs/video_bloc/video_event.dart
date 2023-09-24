part of 'video_bloc.dart';

sealed class VideoEvent extends Equatable {
  const VideoEvent();

  @override
  List<Object> get props => [];
}

class VideoFetched extends VideoEvent {
  const VideoFetched();

  @override
  String toString() => 'VideoFetched';
}

class VideoScraped extends VideoEvent {
  final String url;
  const VideoScraped({required this.url});

  @override
  String toString() => 'VideoScraped';
}
