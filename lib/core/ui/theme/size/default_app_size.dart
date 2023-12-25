import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:injectable/injectable.dart';
import 'package:streage/core/ui/theme/size/i_app_size.dart';

@Singleton(as: IAppSize)
class DefaultAppSize extends IAppSize {
  @override
  Gap get extra => Gap(12.sp);

  @override
  Gap get large => Gap(16.sp);

  @override
  Gap get small => Gap(24.sp);
}
