import 'package:demo_1/comman%20/get_stroge.dart';
import 'package:demo_1/modules/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';


class IntroScrren extends StatelessWidget {
  const IntroScrren({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );
    return Scaffold(
      body: IntroductionScreen(
        globalBackgroundColor: Colors.white,
        globalHeader: const Align(
          alignment: Alignment.topRight,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: 16, right: 16),
              child: FlutterLogo(),
            ),
          ),
        ),
        pages: [
          PageViewModel(
            title: "Fractional shares",
            body:
            "Instead of having to buy an entire share, invest any amount you want.",
            image: Image.asset('images/intro1.jfif'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Learn as you go",
            body:
            "Download the Stockpile app and master the market with our mini-lesson.",
            image: Image.asset('images/imag1.png'),
            decoration: pageDecoration,
          ),
        ],
        onDone: () {
          AppPref().introScrData = "getx";
          Get.off(LogInScreen());
        },
        showSkipButton: true,
        skipFlex: 0,
        nextFlex: 0,
        skip: const Text('Skip'),
        next: const Icon(Icons.arrow_forward),
        done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
        curve: Curves.fastLinearToSlowEaseIn,
      ),
    );
  }
}
