import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poll_power/core/common/app_texts.dart';
import 'package:poll_power/core/extensions/context_extension.dart';
import 'package:poll_power/core/extensions/string_extension.dart';
import 'package:poll_power/di.dart';
import 'package:poll_power/domain/entities/user/user.dart';
import 'package:poll_power/presentation/state_management/bloc/auth/auth_bloc.dart';
import 'package:poll_power/presentation/state_management/bloc/user/user_bloc.dart';
import 'package:poll_power/presentation/state_management/bloc/user/user_event.dart';
import 'package:poll_power/presentation/state_management/bloc/user/user_state.dart';

import '../../assets/assets.gen.dart';

class UserCardWidget extends StatelessWidget {
  final bool? isCandidate;
  const UserCardWidget({super.key, this.isCandidate});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => locator.get<UserBloc>().add(GetUserInfoEvent()),
    );

    return InkWell(
      onTap: () {
        _showLogoutButtonSheet(context);
      },
      child: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
        if (state is GetUserInfoIsProcessing || state is UserInitialState) {
          return Center(
            child: CircularProgressIndicator(
              color: context.colors.black,
            ),
          );
        } else if (state is UserInfoDone) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 20.sp, horizontal: 30.sp),
            decoration: BoxDecoration(
                color: context.colors.red,
                borderRadius: BorderRadius.circular(10.sp)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildLeft(context),
                _buildRight(context, state.user),
              ],
            ),
          );
        }
        return Container(
          child: "Hello".light(),
        );
      }),
    );
  }

  _showLogoutButtonSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          alignment: Alignment.center,
          child: "Logout".asPrimaryButton(
              padding: EdgeInsets.symmetric(vertical: 20.sp, horizontal: 40.sp),
              callback: () async => locator.get<AuthBloc>().logout()),
        );
      },
    );
  }

  Column _buildRight(BuildContext context, UserEntity user) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        context.gaps.medium,
        "${user.first_name} ${user.last_name}"
            .semiBold(color: context.colors.white, fontSize: 20.sp),
        context.gaps.large,
        if (isCandidate == null) _buildStatus(context, AppTexts.voter, false),
      ],
    );
  }

  Container _buildStatus(BuildContext context, String value, bool isSmall) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: 10.sp, horizontal: isSmall ? 20.sp : 50.sp),
      decoration: BoxDecoration(
          color: context.colors.black,
          borderRadius: BorderRadius.circular(10.sp)),
      child: value.light(color: context.colors.white, fontSize: 20.sp),
    );
  }

  Column _buildLeft(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 40.sp,
          backgroundImage: AssetImage(Assets.avatar.path),
        ),
        context.gaps.small,
        if (isCandidate == null) _buildStatus(context, "17%", true),
      ],
    );
  }
}
