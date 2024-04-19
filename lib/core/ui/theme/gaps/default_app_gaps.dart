import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:injectable/injectable.dart';
import 'i_app_gaps.dart';

@Singleton(as: IAppGaps)
class DefaultAppGaps extends IAppGaps {
  @override
  Gap get large => Gap(44.sp);

  @override
  Gap get medium => Gap(23.sp);

  @override
  Gap get small => Gap(12.sp);
}
