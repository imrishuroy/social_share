import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:social_share/blocs/blocs.dart';
import 'package:social_share/repositories/video_repository.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerLazySingleton(
    () => VideoRepository(
      dio: Dio(),
    ),
  );

  getIt.registerLazySingleton(
    () => VideoBloc(
      videoRepository: getIt(),
    ),
  );
}
