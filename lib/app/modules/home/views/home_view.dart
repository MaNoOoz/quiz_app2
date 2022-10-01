import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/app/modules/utili/Constants.dart';

import '../../../routes/app_pages.dart';
import '../../Profile/controllers/profile_controller.dart';
import '../../Widgets/Common/SharedWidgets.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  static const String routeName = Routes.HOME;

  @override
  Widget build(BuildContext context) {
    var c = Get.put(HomeController());
    var cc = Get.put(ProfileController());

    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                  height: 120, child: Container(color: Colors.white, child: Lottie.asset("assets/images/quiz.json"))),
              Obx(() {
                return Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SharedWidgets().buildTextRight(" 👋  هلا ", mainTitleBlack, align: TextAlign.center),
                    SPACEH10,
                    SharedWidgets().buildTextLeft(cc.name.value.toUpperCase(), mainTitleBlue, align: TextAlign.center),
                  ],
                );
              }),
              SPACEV10,
              Container(
                color: Colors.white,
                child: SizedBox(
                  width: Get.width,
                  height: 200,
                  child: DefaultTextStyle(
                    // maxLines: 2,
                    textAlign: TextAlign.center,
                    style: mainTitleBlack,
                    child: Center(
                      child: AnimatedTextKit(
                        animatedTexts: [
                          // TyperAnimatedText('👋  Hey , ', textAlign: TextAlign.center),
                          TyperAnimatedText('جاهز لتحدي معلوماتك ؟؟ 🤔', textAlign: TextAlign.center),
                          TyperAnimatedText('جاهز للتغلب على الخصوم ؟! 💪', textAlign: TextAlign.center),
                          TyperAnimatedText('أجب على أكثر عدد ممكن من الأسئلة خلال 120 ثانية ',
                              textAlign: TextAlign.center),
                          ScaleAnimatedText('إنطلق 🟢', textAlign: TextAlign.center),
                        ],
                        onTap: () {
                          print("Tap Event");
                        },
                        totalRepeatCount: 1,
                        pause: const Duration(seconds: 2),
                        repeatForever: true,
                        stopPauseOnTap: true,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 70,
                child: SharedWidgets().buildRequestBtn("Quiz Me !", mainStyleTWM, onPressed: () async {
                  c.startGame();
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
