import 'package:bloc/bloc.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
part 'audio_state.dart';

class AudioCubit extends Cubit<AudioState> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  String? _currentSoundPath;

  AudioCubit() : super(AudioInitial()) {
    _audioPlayer.onPlayerStateChanged.listen((state) {
      if (state == PlayerState.completed) {
        emit(AudioStopped());
      }
    });
  }

  Future<void> playSound(String soundPath) async {
    if (_currentSoundPath == soundPath) {
      if (_audioPlayer.state == PlayerState.playing) {
        await _audioPlayer.pause();
        emit(AudioPaused(soundPath));
      } else {
        await _audioPlayer.play(AssetSource(soundPath));
        emit(AudioPlaying(soundPath));
      }
    } else {
      try {
        await _audioPlayer.stop();
        await _audioPlayer.play(AssetSource(soundPath));
        _currentSoundPath = soundPath;
        emit(AudioPlaying(soundPath));
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }
}
