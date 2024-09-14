part of 'audio_cubit.dart';

abstract class AudioState extends Equatable {
  @override
  List<Object> get props => [];
}

class AudioInitial extends AudioState {}

class AudioPlaying extends AudioState {
  final String soundPath;

  AudioPlaying(this.soundPath);

  @override
  List<Object> get props => [soundPath];
}

class AudioPaused extends AudioState {
  final String soundPath;

  AudioPaused(this.soundPath);

  @override
  List<Object> get props => [soundPath];
}

class AudioStopped extends AudioState {}
