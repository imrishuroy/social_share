import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_share/blocs/video_bloc/video_bloc.dart';
import 'package:social_share/injection_container.dart';
import 'package:social_share/screens/video_player.dart';

class VideosScreen extends StatefulWidget {
  const VideosScreen({super.key});

  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
  final _videoBloc = getIt<VideoBloc>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sigma Boys 😎 ',
          style: GoogleFonts.kalam(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: BlocConsumer<VideoBloc, VideoState>(
        bloc: _videoBloc..add(const VideoFetched()),
        listener: (context, state) {},
        builder: (context, state) {
          // if (state.status == VideoStatus.uploading) {
          //   return const Center(
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Text(
          //           'Uploading...',
          //           style: TextStyle(
          //             color: Colors.white,
          //             fontSize: 14.0,
          //           ),
          //         ),
          //         SizedBox(height: 8.0),
          //         CircularProgressIndicator(),
          //       ],
          //     ),
          //   );
          // }
          if (state.status == VideoStatus.success) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 14.0,
              ),
              child: AnimationLimiter(
                child: GridView.builder(
                  padding: const EdgeInsets.all(8.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                    childAspectRatio: 1 / 1.3,
                  ),
                  itemCount: state.videos.length,
                  itemBuilder: (context, index) {
                    final video = state.videos[index];
                    return AnimationConfiguration.staggeredGrid(
                      position: index,
                      duration: const Duration(milliseconds: 375),
                      columnCount: state.videos.length,
                      child: ScaleAnimation(
                        child: FadeInAnimation(
                          child: InkWell(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => VideoPlayer(
                                    '${video.videoUrl}?${video.videoToken}'),
                              ),
                            ),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16.0),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      '${video.thumbnailUrl}?${video.thumbnailToken}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
