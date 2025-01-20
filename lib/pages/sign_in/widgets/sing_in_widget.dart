import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar() {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        color: Colors.grey.withOpacity(0.5),
        // height defines the thickness of the line
        height: 1.0,
      ),
    ),
    title: Center(
      child: Text(
        "Log In",
        style: TextStyle(
          color: Colors.black,
          fontSize: 15.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
  );
}

// We need context for accessing bloc
Widget buildThirdPartyLogin(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(
      top: 30.h,
      bottom: 15.h,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _reusableTcons("google"),
        _reusableTcons("apple"),
        _reusableTcons("facebook"),
      ],
    ),
  );
}

Widget _reusableTcons(String iconName) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(
      width: 20.w,
      height: 20.w,
      child: Image.asset("assets/icons/$iconName.png"),
    ),
  );
}

Widget reusableText(String text) {
  return Container(
    margin: EdgeInsets.only(
      bottom: 5.h,
    ),
    child: Text(
      text,
      style: TextStyle(
        color: Colors.grey.withOpacity(0.40),
        fontWeight: FontWeight.normal,
        fontSize: 8.sp,
      ),
    ),
  );
}

Widget buildTextField(String text, String textType) {
  return Container(
      width: 140.w,
      height: 45.h,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.all(Radius.circular(15.w)),
        border: Border.all(color: Colors.black),
      ),
      child: Row(children: [
        Container(
          width: 11.w,
          margin: EdgeInsets.only(left: 13.w),
          height: 11.w,
          child: Image.asset("assets/icons/user.png"),
        ),
        SizedBox(
            width: 100.w,
            height: 40.h,
            child: TextField(
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                hintText: "Enter your email adress",
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
              ),
            )),
      ]));
}
