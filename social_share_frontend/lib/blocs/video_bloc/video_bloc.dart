import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'package:social_share/models/video.dart';
import 'package:social_share/repositories/video_repository.dart';

part 'video_event.dart';
part 'video_state.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  final VideoRepository _videoRepository;

  VideoBloc({required VideoRepository videoRepository})
      : _videoRepository = videoRepository,
        super(VideoState.initial()) {
    on<VideoScraped>(_onVideoScraped);
    on<VideoFetched>(_onVideoFetched);
  }

  Future<void> _onVideoScraped(
    VideoScraped event,
    Emitter<VideoState> emit,
  ) async {
    emit(state.copyWith(status: VideoStatus.loading));
    try {
      await _videoRepository.getVideoDataFromUrl(event.url);
    } on Exception {
      emit(state.copyWith(status: VideoStatus.failure));
    }
  }

  Future<void> _onVideoFetched(
    VideoFetched event,
    Emitter<VideoState> emit,
  ) async {
    emit(state.copyWith(status: VideoStatus.loading));
    try {
      final uri = await ReceiveSharingIntent.getInitialTextAsUri();

      final url = uri.toString();

      print('url: $url');

      if (url.contains('https://www.instagram.com/reel')) {
        emit(state.copyWith(status: VideoStatus.uploading));
        String? videoUrl;
        String? videoToken;
        String? thumbnailUrl;
        String? thumbnailToken;
        final instaVideo =
            await _videoRepository.getVideoDataFromUrl(uri.toString());

        if (instaVideo != null) {
          final media = instaVideo.media;
          final thumbnail = instaVideo.thumbnail;

          final spittedVideo = media?.split('?') ?? [];
          final spittedThumbnail = thumbnail?.split('?') ?? [];

          if (spittedVideo.length > 1) {
            videoUrl = spittedVideo[0];
            videoToken = spittedVideo[1];
          }

          if (spittedThumbnail.length > 1) {
            thumbnailUrl = spittedThumbnail[0];
            thumbnailToken = spittedThumbnail[1];
          }
        }

        final video = Video(
          videoUrl: videoUrl,
          videoToken: videoToken,
          thumbnailUrl: thumbnailUrl,
          thumbnailToken: thumbnailToken,
        );

        print('video: $video');

        //await _videoRepository.uploadVideo(video);
      }

      final videos = await _videoRepository.fetchVideos();
      emit(state.copyWith(videos: videos, status: VideoStatus.success));
      ReceiveSharingIntent.reset();
    } on Exception {
      emit(state.copyWith(status: VideoStatus.failure));
    }
  }
}
