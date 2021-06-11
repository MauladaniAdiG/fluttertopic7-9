import 'package:flutter/material.dart';
import 'package:app/util/textdesign.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app/ui/login/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sizer = MediaQuery.of(context).size;
    return Scaffold(
        appBar: PreferredSize(preferredSize: Size.fromHeight(0), child: AppBar()),
        body: Stack(
          children: [
            _skipText(sizer, context),
            _detailOnboarding(sizer),
            Positioned(top: (sizer.height / 1.12) - 25, left: 40, right: 40, child: _buttonOnboarding(sizer)),
          ],
        ));
  }

  Widget _detailOnboarding(
    Size size,
  ) {
    return Container(
        width: size.width,
        height: size.height / 1.12,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
          color: Color(0xfff2ece6),
        ),
        child: PageView.builder(
          itemCount: 3,
          onPageChanged: (val) {
            setState(() {
              _currentIndex = val;
            });
          },
          itemBuilder: (context, index) {
            return Column(
              children: [
                const SizedBox(height: 20),
                Container(
                    width: 250,
                    height: 320,
                    child: FittedBox(
                        fit: BoxFit.fill,
                        child: Image.network(
                          'https://wallpapercave.com/wp/wp3268619.jpg',
                        ))),
                const SizedBox(height: 20),
                TextDesign(
                  data: 'Picture',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                TextDesign(
                  data: 'Ini adalah sample photo',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 80),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        3,
                        (val) => Container(
                              width: 10,
                              height: 20,
                              margin: const EdgeInsets.only(right: 5),
                              decoration: BoxDecoration(shape: BoxShape.circle, color: _currentIndex == val ? Color(0xfff58e6c) : Colors.transparent, border: Border.all(color: Color(0xfff58e6c))),
                            )))
              ],
            );
          },
        ));
  }

  Widget _buttonOnboarding(Size size) {
    return Container(
        child: RaisedButton(
            elevation: 8,
            color: Color(0xfff58e6c),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            onPressed: (){},
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextDesign(data: 'Daftar Sekarang', color: Color(0xffffffff)),
            )));
  }

  Widget _skipText(Size size, BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      alignment: Alignment.bottomCenter,
      color: Color(0xff10107d),
      padding: const EdgeInsets.only(bottom: 15),
      child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
          },
          child: TextDesign(data: 'Skip Saja', color: Color(0xffffffff))),
    );
  }
}
