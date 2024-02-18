import 'dart:ui';

import 'package:injectable/injectable.dart';

import 'i_app_colors.dart';

@Singleton(as: IAppColors)
class DefaultAppColors extends IAppColors {
  @override
  Color get black => const Color.fromARGB(255, 0, 0, 0);

  @override
  Color get white => const Color.fromARGB(255, 245, 233, 233);

  @override
  Color get red => const Color.fromARGB(255, 236, 105, 105);

  @override
  Color get blue => const Color.fromARGB(255, 37, 210, 213);
}
