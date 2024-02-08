import 'dart:ui';

import 'package:injectable/injectable.dart';

import 'i_app_colors.dart';

@Singleton(as: IAppColors)
class DefaultAppColors extends IAppColors {
  @override
  Color get black => const Color.fromARGB(20, 0, 0, 0);

  @override
  Color get white => const Color(0x00f5e9e9);

  @override
  Color get red => const Color(0x00ec6969);

  @override
  Color get blue => const Color(0x0025d1d5);
}
