import '../../../controllers/audio_cubit/audio_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/item.dart';

class ItemInfo extends StatelessWidget {
  const ItemInfo({Key? key, required this.item}) : super(key: key);

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                item.enName!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                ),
              ),
            ],
          ),
        ),
        const Spacer(
          flex: 1,
        ),
        PlayIconButton(item: item),
      ],
    );
  }
}

class PlayIconButton extends StatelessWidget {
  const PlayIconButton({
    super.key,
    required this.item,
  });

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioCubit, AudioState>(
      builder: (context, state) {
        IconData icon;
        if (state is AudioPlaying && state.soundPath == item.sound) {
          icon = Icons.pause;
        } else if (state is AudioStopped) {
          icon = Icons.play_arrow;
        } else {
          icon = Icons.play_arrow;
        }
        return IconButton(
          onPressed: () {
            BlocProvider.of<AudioCubit>(context).playSound(item.sound!);
          },
          icon: Icon(
            icon,
            color: Colors.white,
            size: 28,
          ),
        );
      },
    );
  }
}
