import 'package:avatar_glow/avatar_glow.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';

import 'package:flutter/gestures.dart';
import 'package:video_player/video_player.dart';
import 'package:pixedio_works/components/container_designed.dart';
import 'package:pixedio_works/components/header_nav.dart';

import 'sections/footer.dart';
import 'sections/welcome_section.dart';
import 'sections/second_section.dart';
import 'sections/third_section.dart';

class MyHomePage extends StatefulWidget {
  static const String id = 'home_page';
  final orientation;

  const MyHomePage({Key key, this.orientation}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool clickDelay = false;
  bool showcase = true;
  bool hideHint = false;
  bool hideNav = false;
  int pageNumber = 0;

  final ScrollController _controller = ScrollController();

  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;

  Future<void> initializeVideoPlayer(orientation) async {
    switch (orientation) {
      case Orientation.landscape:
        _videoPlayerController =
            VideoPlayerController.asset('web/assets/ball_vid.mp4');
        break;
      case Orientation.portrait:
        _videoPlayerController =
            VideoPlayerController.asset('web/assets/ball_mobile.mp4');
        break;
    }

    await _videoPlayerController.initialize();

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: false,
      looping: false,
      showControls: false,
      showControlsOnInitialize: false,
      fullScreenByDefault: false,
      startAt: Duration(seconds: 0),
    );

    _chewieController.setVolume(0.0);

    setState(() {});
  }

  @override
  void initState() {
    initializeVideoPlayer(widget.orientation);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //This container acts as a bg for the homepage
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xffD0D9E7), Color(0xffEFF3F9)],
                tileMode:
                    TileMode.repeated, // repeats the gradient over the canvas
              ),
            ),
          ),
          AnimatedOpacity(
            duration: Duration(milliseconds: 3000),
            curve: Curves.linear,
            opacity: pageNumber >= 3 ? 0.0 : 1.0,
            child: SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.contain,
                child: _chewieController != null &&
                        _chewieController
                            .videoPlayerController.value.initialized
                    ? Chewie(
                        controller: _chewieController,
                      )
                    : SizedBox.shrink(),
              ),
            ),
          ),
          AnimatedOpacity(
              duration: Duration(milliseconds: 4000),
              curve: Curves.linear,
              opacity: showcase ? 0 : 1,
              child: ContainerDesigned()),
          _getMyListener(
            size: MediaQuery.of(context).size,
            child: SingleChildScrollView(
              controller: _controller,
              physics:
                  showcase ? NeverScrollableScrollPhysics() : ScrollPhysics(),
              child: Column(
                children: [
                  WelcomeSection(),
                  SecondSection(),
                  ThirdSection(),
                  Footer(),
                ],
              ),
            ),
          ),
          !hideHint
              ? Positioned(
                  right: MediaQuery.of(context).size.width / 20,
                  bottom: MediaQuery.of(context).size.height / 16,
                  child: Column(
                    children: [
                      AvatarGlow(
                        repeatPauseDuration: Duration(milliseconds: 1500),
                        duration: Duration(milliseconds: 750),
                        endRadius: MediaQuery.of(context).size.width <= 800
                            ? 50
                            : 80.0,
                        glowColor: Colors.grey,
                        child: Container(
                          child: MediaQuery.of(context).size.width <= 1024
                              ? Icon(
                                  Icons.expand_less,
                                )
                              : Image.asset(
                                  'web/assets/images/Scroll.png',
                                  height:
                                      MediaQuery.of(context).size.width <= 800
                                          ? 45
                                          : 75.0,
                                ),
                        ),
                      ),
                      Text(
                        MediaQuery.of(context).size.width <= 1024
                            ? 'Swipe Up to Animate'
                            : 'Scroll Down to animate',
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width <= 800
                                ? 8
                                : 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                )
              : Container(),
          HeaderNav(),
        ],
      ),
    );
  }

  _getMyListener({size, child}) {
    if (size.width <= 1024) {
      return _mobileListener(child);
    }
    return _desktopListener(child);
  }

  _desktopListener(child) {
    return Listener(
        child: child,
        onPointerSignal: (PointerSignalEvent event) {
          if (event is PointerScrollEvent) {
            if (clickDelay == true) {
              return;
            } else if (showcase) {
              // This works as a switch
              clickDelay = true;
              if (pageNumber == 1) {
                Future.delayed(const Duration(milliseconds: 10000), () {
                  clickDelay = false;
                  setState(() {
                    showcase = false;
                  });
                  setState(() {
                    hideNav = false;
                  });
                });
              } else {
                Future.delayed(const Duration(milliseconds: 4500), () {
                  clickDelay = false;
                });
              }
              if (event.scrollDelta.dy.isNegative) {
                // Scrolled up
                _chewieController.pause();
                if (pageNumber == 1) {
                  _chewieController.seekTo(Duration(seconds: 0));
                } else if (pageNumber == 2) {
                  _chewieController.seekTo(Duration(seconds: 4));
                }

                if (pageNumber - 1 <= 0)
                  pageNumber = 0;
                else
                  pageNumber--;
              } else {
                if (pageNumber == 3) {
                  pageNumber++;
                }

                if (pageNumber == 2) {
                  pageNumber++;
                }

                // Scrolled down
                if (pageNumber == 0) {
                  pageNumber++;
                  setState(() {
                    hideNav = true;
                  });
                  _chewieController.play();

                  // The first stop on the video is after 4 and a half seconds
                  Future.delayed(Duration(milliseconds: 4500), () {
                    _chewieController.pause();
                  });
                } else if (pageNumber == 1) {
                  pageNumber++;
                  setState(() {
                    hideHint = true;
                  });
                  _chewieController.play();
                }

                print(pageNumber);

                setState(() {
                  _controller.animateTo(
                      _controller.position.extentBefore +
                          MediaQuery.of(context).size.height,
                      duration: Duration(milliseconds: 3000),
                      curve: Curves.linear);
                });
              }
            }
          }
        });
  }

  _mobileListener(child) {
    return GestureDetector(
      child: child,
      onPanDown: (drag) {
        if (clickDelay == true) {
          return;
        } else if (showcase) {
          // This works as a switch
          clickDelay = true;
          if (pageNumber == 1) {
            Future.delayed(const Duration(milliseconds: 10000), () {
              clickDelay = false;
              setState(() {
                showcase = false;
              });
              setState(() {
                hideNav = false;
              });
            });
          } else {
            Future.delayed(const Duration(milliseconds: 4500), () {
              clickDelay = false;
            });
          }
          if (pageNumber == 3) {
            pageNumber++;
          }

          if (pageNumber == 2) {
            pageNumber++;
          }

          // Scrolled down
          if (pageNumber == 0) {
            pageNumber++;
            setState(() {
              hideNav = true;
            });
            _chewieController.play();
            // The first stop on the video is after 4 and a half seconds
            Future.delayed(Duration(milliseconds: 4500), () {
              _chewieController.pause();
            });
          } else if (pageNumber == 1) {
            pageNumber++;
            setState(() {
              hideHint = true;
            });
            _chewieController.play();
          }
          setState(() {
            _controller.animateTo(
                _controller.position.extentBefore +
                    MediaQuery.of(context).size.height,
                duration: Duration(milliseconds: 3000),
                curve: Curves.linear);
          });
        }
      },
    );
  }
}
