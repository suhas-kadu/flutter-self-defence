import 'package:flutter/material.dart';
import 'package:self_defence/constants.dart';
import 'package:self_defence/model/technique_model.dart';
import 'package:video_player/video_player.dart';

class TechniqueDemo extends StatefulWidget {
  static const String id = "TechniqueDemo";

  final Technique technique;

  const TechniqueDemo({Key key, this.technique}) : super(key: key);

  @override
  _TechniqueDemoState createState() => _TechniqueDemoState();
}

class _TechniqueDemoState extends State<TechniqueDemo> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _controller = VideoPlayerController.network(
      widget.technique.videoUrl,
    );

    _initializeVideoPlayerFuture = _controller.initialize();

    _controller.setLooping(true);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(widget.technique.title.toString()),
      ),
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Card(
              margin: EdgeInsets.all(16),
              elevation: 5.0,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                child: Column(
                  children: [
                    AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    ),
                    SizedBox(height: 20),
                    Text(
                      widget.technique.description,
                      textAlign: TextAlign.justify,
                      style: kTextStyle,
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
