import 'package:ealamuni/constants.dart';
import 'package:ealamuni/screens/splash_screen/components/animated_text.dart';
import 'package:ealamuni/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({super.key});

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody> {
  @override
  void initState() {
    navigate();
    super.initState();
  }

  Future<void> navigate() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {
      context.go(AppRouter.homePath);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Image.asset(
            'assets/images/splash_screen.png',
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            fit: BoxFit.fill,
          ).image,
          fit: BoxFit.cover,
        ),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: AnimatedText(
              text: splashText,
            ),
          ),
        ],
      ),
    );
  }
}
