// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:test_2/audio_page/audio_stlye.dart';
import 'package:test_2/audio_page/audio_view_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:test_2/utils/common.dart';
import 'package:test_2/widgets/control_buttons.dart';

class AudioView extends StatefulWidget {
  AudioStyle style;
  AudioViewModel viewModel;
  AudioView({
    Key? key,
    required this.style,
    required this.viewModel,
  }) : super(key: key);

  @override
  State<AudioView> createState() => _AudioViewState();
}

class _AudioViewState extends State<AudioView> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.initPlayer();
  }

  @override
  void dispose() {
    widget.viewModel.disposePlayer();
    super.dispose();
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: widget.style.backgroundEndColor,
      selectedItemColor: Colors.white,
      currentIndex: 0,
      onTap: (value) {
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.volume_up), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.volume_up), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.volume_up), label: ''),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildBottomNavigationBar(),
      appBar: AppBar(
        backgroundColor: widget.style.backgroundBeginColor,
        elevation: 0,
        title: const Text('Popular'),
        // leading: const Icon(Icons.keyboard_arrow_down_rounded),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.settings,
            ),
          ),
        ],
      ),
      body: Observer(
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                widget.style.backgroundBeginColor,
                widget.style.backgroundEndColor,
              ],
            )),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(),
                  Column(
                    children: [
                      Text(
                        'Old  Town Road',
                        style: widget.style.musicTextStyle,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Lil Nas X',
                        style: widget.style.musicOwnerTextStyle,
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                  const SizedBox(height: 50),
                  StreamBuilder<PositionData>(
                    stream: widget.viewModel.positionDataStream,
                    builder: (context, snapshot) {
                      final positionData = snapshot.data;
                      return SeekBar(
                        duration: positionData?.duration ?? Duration.zero,
                        position: positionData?.position ?? Duration.zero,
                        bufferedPosition:
                            positionData?.bufferedPosition ?? Duration.zero,
                        onChangeEnd: widget.viewModel.player.seek,
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  ControlButtons(widget.viewModel.player),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
