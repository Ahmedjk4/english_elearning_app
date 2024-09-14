import 'package:ealamuni/utils/app_router.dart';
import 'constants.dart';
import 'controllers/audio_cubit/audio_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const EnglishApp());
}

class EnglishApp extends StatelessWidget {
  const EnglishApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AudioCubit(),
      child: MaterialApp.router(
        title: appName,
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
