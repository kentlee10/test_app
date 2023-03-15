import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:test_app/screens/main/home_screen.dart';
import 'package:test_app/widgets/test_button.dart';

class ThirdSplash extends StatefulWidget {
  const ThirdSplash({super.key});
  static const routeName = "thirdSplash";
  @override
  State<ThirdSplash> createState() => _ThirdSplash();
}

class _ThirdSplash extends State<ThirdSplash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
        body: Container(
              decoration:  const BoxDecoration(
                image:  DecorationImage(
                    image: AssetImage("assets/images/image_3.jpeg"),
                    fit: BoxFit.fill
                ),
              ),
              child: Center(
                  child: Padding(padding: const EdgeInsets.only(top: 70),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TestButton(
                          height: 50,
                          text: 'Back',
                          onClick: (){
                            Navigator.of(context).pop();
                          },
                        ),
                        const SizedBox(width: 20,),
                        TestButton(
                          height: 50,
                          text: 'Next',
                          onClick: (){
                            Navigator.of(context).pushNamedAndRemoveUntil(HomeScreen.routeName, (Route<dynamic> route) => false);
                          },
                        )
                      ],
                    ),
                  )
              ),
            )
    );
  }

}