
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:test_app/screens/splash_screen/third_splash.dart';
import 'package:test_app/widgets/test_button.dart';

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * FEATURES NO. 1 B * * * * * * * * * * * * * * * * * * * * */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

class SecondSplash extends StatefulWidget {
  const SecondSplash({super.key});
  static const routeName = "secondSplash";
  @override
  State<SecondSplash> createState() => _SecondSplash();
}

class _SecondSplash extends State<SecondSplash> {
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
                    image: AssetImage("assets/images/image_2.jpeg"),
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
                            Navigator.of(context).pushNamed(ThirdSplash.routeName);
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
