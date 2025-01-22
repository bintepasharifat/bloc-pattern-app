import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_10/main.dart';
import 'package:flutter_application_10/pages/welcome/bloc/welcome_blocs.dart';
import 'package:flutter_application_10/pages/welcome/bloc/welcome_events.dart';
import 'package:flutter_application_10/pages/welcome/bloc/welcome_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(body:
          BlocBuilder<WelcomeBlocs, WelcomeStates>(builder: (context, state) {
        return Container(
          margin: EdgeInsets.only(top: 34.h),
          width: 275.w,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              PageView(
                controller: pageController,
                onPageChanged: (indxe) {
                  state.page = indxe;
                  BlocProvider.of<WelcomeBlocs>(context).add(WelcomeEvents());
                },
                children: [
                  _page(
                      1,
                      context,
                      "next",
                      "First See Learning",
                      "Forget about a for of paper all knnowldget in on Learning",
                      "assets/images/reading.png"),
                  _page(
                      2,
                      context,
                      "next",
                      "Connect With Everyone",
                      " Always keep in touch with your tutor a friend.Let's get connected",
                      "assets/images/boy.png"),
                  _page(
                      3,
                      context,
                      "get started",
                      "Always Fascinated Learning",
                      "Anywhere,anytime.The tiem is at our discrtion so study whenver you want",
                      "assets/images/man.png"),
                ],
              ),
              Positioned(
                bottom: 100.h,
                child: DotsIndicator(
                  position: state.page.toInt(),
                  dotsCount: 3,
                  mainAxisAlignment: MainAxisAlignment.center,
                  decorator: DotsDecorator(
                    color: Colors.grey,
                    activeColor: Colors.blue,
                    size: const Size.square(8.0),
                    activeSize: Size(20.0, 8.0),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      })),
    );
  }

  Widget _page(int index, BuildContext context, String buttonName, String title,
      String subTitle, String imagePath) {
    return Column(
      children: [
        SizedBox(
          width: 100.w,
          height: 100.w,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        Container(
          width: 175.w,
          padding: EdgeInsets.only(left: 25.w, right: 25.w),
          child: Text(
            subTitle,
            style: TextStyle(
              color: Colors.black.withOpacity(0.5),
              fontSize: 10.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            //within 0-2 index

            if (index < 3) {
              // animation
              pageController.animateToPage(
                index,
                duration: const Duration(microseconds: 5000),
                curve: Curves.easeIn,
              );
            } else {
              //jump to a new page
              // Navigator.of(context)
              // .push(MaterialPageRoute(builder: (context) => MyHomePage()));
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("signIn", (rout) => false);
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 70.h, left: 30.w, right: 30),
            width: 150.w,
            height: 40.h,
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(15)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 1),
                  ),
                ]),
            child: Center(
              child: Text(
                buttonName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
