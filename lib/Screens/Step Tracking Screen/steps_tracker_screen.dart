import 'package:codealpha_fitness_tracker_app/Shared/Constants/arrow_back_item.dart';
import 'package:codealpha_fitness_tracker_app/Shared/Styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../Provider/my_provider.dart';

class StepsDetailsScreen extends StatefulWidget {
  const StepsDetailsScreen({super.key});

  @override
  State<StepsDetailsScreen> createState() => _StepsDetailsScreenState();
}

class _StepsDetailsScreenState extends State<StepsDetailsScreen> {
  TextEditingController stepController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Steps Tracker"),
        leading: const ArrowBackItem()
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(16),
              ),
              alignment: Alignment.center,
              height: 80.h,
              width: 200.w,
              child: Text(
                "2064 / ${pro.stepsCounter} steps",
                style: mediumText,
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Enter your target steps",
                      style: smallText,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    TextFormField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      onFieldSubmitted: (value) {
                        pro.changeSteps(stepController.text);
                        stepController = TextEditingController();
                      },
                      style: textFormFieldLabelStyle,
                      controller: stepController,
                      decoration: InputDecoration(
                        constraints:
                            BoxConstraints(maxHeight: 30.h, maxWidth: 150.w),
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black38,width: 2)),
                        errorBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black38,width: 2))
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(16),
              ),
              alignment: Alignment.center,
              height: 40.h,
              width: 250.w,
              child: Text(
                "Reset Steps",
                style: mediumText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
