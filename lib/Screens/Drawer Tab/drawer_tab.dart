import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Shared/Constants/delete_all_info_button.dart';

class DrawerTab extends StatelessWidget {
  const DrawerTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .8,
      height: double.infinity,
      color: Colors.white,
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 50.h),
        child: const DeleteAllInfoButton(),
      ),
    );
  }
}
