import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:save/screens/authenticate/authenticate.dart';
import 'animated_indicator.dart';

const kTitleStyle = TextStyle(
    fontSize: 30, color: Color(0xFF01002f), fontWeight: FontWeight.bold);
const kSubtitleStyle = TextStyle(fontSize: 22, color: Color(0xFF88869f));

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController pageController = new PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
            child: PageView(
                controller: pageController,
                physics: NeverScrollableScrollPhysics(),
                children: [
              Slide(
                  hero: Image.asset("./assets/dream.jpg"),
                  title: "Have a Dream?",
                  subtitle: "With the beginning of any journey is a goal",
                  onNext: nextPage),
              Slide(
                  hero: Image.asset("./assets/img1.jpg"),
                  title: "Feeling Undecided?",
                  subtitle: "Wondering where to start?",
                  onNext: nextPage),
              Slide(
                  hero: Image.asset("./assets/consulting.jpg"),
                  title: "Introducing SAVEya",
                  subtitle: "We will help you create achievable saving goals",
                  onNext: nextPage),
              Slide(
                  hero: Image.asset("./assets/pencil.jpg"),
                  title: "Invite a Friend",
                  subtitle: "Let them help you hit your target",
                  onNext: nextPage),
              Slide(
                  hero: Image.asset("./assets/hands.jpg"),
                  title: "Come as a Team",
                  subtitle: "Be acountable to each other about your goals",
                  onNext: nextPage),
              Slide(
                  hero: Image.asset("./assets/pic3.jpg"),
                  title: "Little by Little",
                  subtitle: "Watch your money grow",
                  onNext: nextPage),
              Slide(
                  hero: Image.asset("./assets/img3.jpg"),
                  title: "Like a Dream",
                  subtitle: "Own your financial journey and acheive your goals",
                  onNext: nextPage),
                  Authenticate(),
              // Scaffold(
              //   backgroundColor: Colors.white,
              //   body: Center(
              //     child: Text(
              //       'LINK TO SIGN UP PAGE!',
              //       style: kTitleStyle,
              //     ),
              //   ),
              // )
            ])),
      ),
    );
  }

  void nextPage() {
    pageController.nextPage(
        duration: const Duration(milliseconds: 200), curve: Curves.ease);
  }
}

class Slide extends StatelessWidget {
  final Widget hero;
  final String title;
  final String subtitle;
  final VoidCallback onNext;

  const Slide({Key key, this.hero, this.title, this.subtitle, this.onNext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: hero),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  title,
                  style: kTitleStyle,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  subtitle,
                  style: kSubtitleStyle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 35,
                ),
                ProgressButton(onNext: onNext),
              ],
            ),
          ),
          GestureDetector(
            onTap: onNext,
            child: Text(
              "Skip",
              style: kSubtitleStyle,
            ),
          ),
          SizedBox(
            height: 4,
          )
        ],
      ),
    );
  }
}

class ProgressButton extends StatelessWidget {
  final VoidCallback onNext;
  const ProgressButton({Key key, this.onNext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 75,
      height: 75,
      child: Stack(children: [
        AnimatedIndicator(
          duration: const Duration(seconds: 10),
          size: 75,
          callback: onNext,
        ),
        Center(
          child: GestureDetector(
            child: Container(
              height: 60,
              width: 60,
              child: Center(
                child: SvgPicture.asset(
                  "./assets/arrow.svg",
                  width: 10,
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(99), color: Colors.black),
            ),
            onTap: onNext,
          ),
        )
      ]),
    );
  }
}
