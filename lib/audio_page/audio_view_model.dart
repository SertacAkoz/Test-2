// ignore_for_file: library_private_types_in_public_api, depend_on_referenced_packages, avoid_print

import 'package:just_audio/just_audio.dart';
import 'package:mobx/mobx.dart';
import 'package:audio_session/audio_session.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:test_2/utils/common.dart';

part 'audio_view_model.g.dart';

class AudioViewModel = _AudioViewModelBase with _$AudioViewModel;

abstract class _AudioViewModelBase with Store, WidgetsBindingObserver {
  final player = AudioPlayer();

  Future<void> initPlayer() async {
    ambiguate(WidgetsBinding.instance)!.addObserver(this);
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());
    // Listen to errors during playback.
    player.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace stackTrace) {
      print('A stream error occurred: $e');
    });
    // Try to load audio from a source and catch any errors.
    try {
      // AAC example: https://dl.espressif.com/dl/audio/ff-16b-2c-44100hz.aac
      await player.setAudioSource(AudioSource.uri(Uri.parse(
          "https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3")));
    } catch (e) {
      print("Error loading audio source: $e");
    }
  }

  void disposePlayer() {
    ambiguate(WidgetsBinding.instance)!.removeObserver(this);
    player.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // Release the player's resources when not in use. We use "stop" so that
      // if the app resumes later, it will still remember what position to
      // resume from.
      player.stop();
    }
  }

  Stream<PositionData> get positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
        player.positionStream,
        player.bufferedPositionStream,
        player.durationStream,
        (position, bufferedPosition, duration) => PositionData(
          position,
          bufferedPosition,
          duration ?? Duration.zero,
        ),
      );
}
