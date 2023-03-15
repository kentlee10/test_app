import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:test_app/screens/splash_screen/second_splash.dart';
import 'package:test_app/widgets/test_button.dart';
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * FEATURES NO. 1 A * * * * * * * * * * * * * * * * * * * * */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
class FirstSplash extends StatefulWidget {
  const FirstSplash({super.key});
  static const routeName = "firstSplash";
  @override
  State<FirstSplash> createState() => _FirstSplash();
}

class _FirstSplash extends State<FirstSplash> {
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
                  image: AssetImage("assets/images/image_1.jpeg"),
                  fit: BoxFit.fill
              ),
            ),
            child: Center(
                child: Padding(padding: const EdgeInsets.only(top: 70),
                    child: TestButton(
                      height: 50,
                      text: 'GET STARTED',
                      onClick: (){
                        Navigator.of(context).pushNamed(SecondSplash.routeName);
                      },
                    )
                )
            )
        )
    );
  }

}
