import 'package:flutter/material.dart';
import 'components.dart';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:etma2n/models/motivation_models.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';


class SessionCard extends StatefulWidget {
  //static String id = 'SessionCard';

  static Color? color1;
  //final Function onClick;
  final String sessionTitle;
  final String sespath;

  const SessionCard({Key? key, required this.sessionTitle, required this.sespath })
      : super(key: key);

  @override
  _SessionCardState createState() => _SessionCardState();
}


//AnimationController? _animationIconController1;
bool issongplaying = false;
bool isplaying = false;
bool isColor = false;
bool isFav = false;
bool isPlay = false;

class _SessionCardState extends State<SessionCard>
    with TickerProviderStateMixin {

  final audioPlayer = AudioPlayer();
  bool isPlaying=false;
  Duration duration=Duration.zero;
  Duration position=Duration.zero;


  @override
  void initState() {
    super.initState();

    // listen to states (playing , paused , stopped )
   /* audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    // listen to audio duration
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration=newDuration;
      });
    });

    // listen to audio position
    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position=newPosition;
      });
    });*/

  }

  Future setAudio() async{
    //Repeat audio when finished
    audioPlayer.setReleaseMode(ReleaseMode.loop);

    //load audio from file
    final result = await FilePicker.platform.pickFiles();

    if (result !=null) {
      final file =File('moty_mp3/mot2.mp3');
      audioPlayer.setSourceUrl(file.path);
    }
  }

  @override
  void dispose() {
    audioPlayer.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Padding(
            padding:
                const EdgeInsets.only(right: 15, left: 20, bottom: 5, top: 5),
            child: Row(
              children: [
                // fav icon
                IconButton(
                    iconSize: 30,
                    color: isColor != true ? Colors.white : Colors.red,
                    icon: Icon(
                      isFav != true
                          ? Icons.favorite_border_rounded
                          : Icons.favorite,
                    ),
                    onPressed: () {
                      setState(() {
                        isFav = !isFav;
                        isColor = !isColor;
                      });
                    }),

                const SizedBox(width: 5,),

                // title of session
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.sessionTitle,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

                // play icon
                IconButton(
                 onPressed: ()  async{
                   setState(() {
                     isPlay = !isPlay;
                   });

                   /*  if (isPlay == false) {
                      //await audioCache.play(widget.sespath,
                        //  volume: 99, mode: PlayerMode.MEDIA_PLAYER);
                      setState(() {
                        isPlay = true;
                      });
                    }
                    else {
                      advancedPlayer!.pause();
                      setState(() {
                        isPlay = false;
                      });
                    }*/

                    },
                  icon: Icon(
                    isPlay != true
                        ? Icons.play_circle_outline_rounded
                        : Icons.pause_circle_outline_rounded,
                  ),
                  color: Colors.white,
                  iconSize: 44,
                  //onPressed: () {  },
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12,),
        myLine(SessionCard.color1 = Colors.white54),
        const SizedBox(height: 12,),
      ],
    );
  }
}
