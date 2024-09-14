import 'package:flutter/material.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class AnimatedText extends StatelessWidget {
  const AnimatedText({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextAnimator(
      incomingEffect: WidgetTransitionEffects.incomingSlideInFromBottom(),
      atRestEffect: WidgetRestingEffects.fidget(),
      maxLines: 1,
      text,
      style: const TextStyle(
        color: Colors.cyanAccent,
        fontSize: 32,
        fontWeight: FontWeight.bold,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
