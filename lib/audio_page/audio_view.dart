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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (context) {
          return SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ControlButtons(widget.viewModel.player),
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
              ],
            ),
          );
        },
      ),
    );
  }
}
