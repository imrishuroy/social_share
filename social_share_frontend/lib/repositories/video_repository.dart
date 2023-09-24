import 'package:dio/dio.dart';
import 'package:social_share/models/insta_video.dart';
import 'package:social_share/models/video.dart';

const videosUrl = 'http://social-share.ap-south-1.elasticbeanstalk.com/videos';
const reelScrapUrl =
    'https://instagram-downloader-download-instagram-videos-stories.p.rapidapi.com/index';

class VideoRepository {
  final Dio _dio;

  VideoRepository({required Dio dio}) : _dio = dio;

  Future<InstaVideo?> getVideoDataFromUrl(String url) async {
    try {
      final response = await _dio.get(
        reelScrapUrl,
        queryParameters: {
          'url': url,
        },
        options: Options(
          headers: {
            Headers.contentTypeHeader: 'application/json',
            'X-RapidAPI-Key':
                '04c102c259msh683dfd45ec51965p1ada23jsnf00d1063ddbf',
            'X-RapidAPI-Host':
                'instagram-downloader-download-instagram-videos-stories.p.rapidapi.com'
          },
        ),
      );
      if (response.statusCode == 200) {
        return InstaVideo.fromJson(response.data);
      }
    } on DioException {
      rethrow;
    }
    return null;
  }

  Future<void> uploadVideo(Video video) async {
    try {
      final response = await _dio.post(
        videosUrl,
        data: video.toJson(),
      );
      if (response.statusCode == 200) {
        return;
      }
    } on DioException {
      rethrow;
    }
  }

  Future<List<Video>> fetchVideos() async {
    try {
      final response = await _dio.get(
        videosUrl,
        options: Options(
          headers: {
            Headers.contentTypeHeader: 'application/json',
          },
        ),
      );
      if (response.statusCode == 200) {
        final videos = response.data as List;
        return videos.map((video) => Video.fromJson(video)).toList();
      }
      return [];
    } on DioException {
      rethrow;
    }
  }
}
