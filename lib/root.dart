import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poll_power/di.dart';
import 'package:poll_power/presentation/state_management/bloc/auth/auth_bloc.dart';
import 'package:poll_power/presentation/state_management/bloc/user/user_bloc.dart';
import 'package:poll_power/router.dart';

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: _getProvider(),
        child: ScreenUtilInit(
          designSize: const Size(360, 800),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, child) => MaterialApp.router(
            routerConfig: AppRouter().router,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
          ),
        ));
  }

  List<BlocProvider> _getProvider() {
    return [
      BlocProvider<AuthBloc>(
        create: (context) => locator.get<AuthBloc>(),
      ),
      BlocProvider<UserBloc>(
        create: (context) => locator.get<UserBloc>(),
      )
    ];
  }
}
