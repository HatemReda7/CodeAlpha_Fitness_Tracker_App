import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../Provider/my_provider.dart';
import '../FireBase/firebase_functions.dart';

class DeleteAllInfoButton extends StatelessWidget {
  const DeleteAllInfoButton({super.key});

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return ElevatedButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return Scaffold(
                backgroundColor: Colors.transparent,
                body: Center(
                  child: Container(
                    height: 90.h,
                    width: 250.w,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(16.0.r),
                          child: Text(
                            "Are you sure you want to delete all Info?",
                            textAlign: TextAlign.center,style: GoogleFonts.poppins(
                              fontSize: 12.sp, fontWeight: FontWeight.w500),),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  FirebaseFunctions.deleteWorkoutHistory();
                                  FirebaseFunctions.deleteMealHistory();
                                  pro.stepsCounter = "6000";
                                  Navigator.pop(context);
                                },
                                child: Container(
                                    height: 25.815.h,
                                    alignment: Alignment.center,
                                    color: Colors.blue,
                                    child: Text(
                                      "Yes!",
                                      style:  GoogleFonts.poppins(fontWeight: FontWeight.w500),
                                    )),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                    height: 25.815.h,
                                    alignment: Alignment.center,
                                    color: Colors.red,
                                    child: Text(
                                        "No!",
                                        style: GoogleFonts.poppins(fontWeight: FontWeight.w500)
                                    )),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
        style: ButtonStyle(
            backgroundColor:
            const MaterialStatePropertyAll(Colors.red),
            fixedSize: MaterialStatePropertyAll(Size(200.w, 50.h)),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r)))),
        child: Text(
          "Delete All Info!",
          style: TextStyle(fontSize: 18.sp, color: Colors.black),
        ));
  }
}
