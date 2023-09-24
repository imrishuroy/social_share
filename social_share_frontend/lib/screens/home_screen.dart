import 'package:flutter/material.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'package:social_share/blocs/blocs.dart';
import 'package:social_share/injection_container.dart';
import 'package:social_share/screens/videos_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _videoBloc = getIt<VideoBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _videoBloc.add(const VideoScraped(
              url:
                  'https://www.instagram.com/reel/Cu09Jmtu48P/?igshid=MTc4MmM1YmI2Ng=='));
        },
      ),
      body: Center(
        child: FutureBuilder<Uri?>(
          future: ReceiveSharingIntent.getInitialTextAsUri(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            if (snapshot.data
                .toString()
                .contains('https://www.instagram.com/reel')) {
              final url = snapshot.data.toString();

              _videoBloc.add(VideoScraped(url: url));

              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (_) => const VideosScreen(),
                ),
              );
            }

            return Text('Shared Text: ${snapshot.data.toString()}');
          },
        ),
      ),
    );
  }
}
