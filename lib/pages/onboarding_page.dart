import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mangeonsafro/pages/login_page.dart';
import 'package:mangeonsafro/pages/sign_up_page.dart';
import 'package:scale_button/scale_button.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  _OnboardingPageState createState() {
    return _OnboardingPageState();
  }
}

class _OnboardingPageState extends State<OnboardingPage> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      changeStatusBarColor();
    }
  }

  Future<void> changeStatusBarColor() async {
    await FlutterStatusbarcolor.setStatusBarColor(Colors.white);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
  }

  @override
  Widget build(BuildContext context) {
    changeStatusBarColor();

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [

            Expanded(
              child: Center(
                child: Container(
                  width: 160.0,
                  height: 160.0,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/mangeonsafro_icon.png')
                    )
                  ),
                ),
              ),
            ),


            Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 224, 43, 26),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(32.0), topRight: Radius.circular(32.0))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [

                  Container(
                    margin: const EdgeInsets.only(left: 16.0, top: 64.0),
                    child: Text('Bienvenue',
                      style: GoogleFonts.sen(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700
                        )
                      ),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(left: 16.0, top: 8.0, right: 16.0, bottom: 32.0),
                    child: Text('Veuillez renseigner vos identifiants de connexion ou utiliser l\'une des options ci-dessous pour accéder à un monde de saveurs infinies',
                      style: GoogleFonts.sen(
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 12.0
                          )
                      ),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 64.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Expanded(
                          flex: 5,
                          child: ScaleButton(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => const LoginPage())
                            ),
                            child: Container(
                              height: 56.0,
                              width: 160.0,
                              margin: const EdgeInsets.only(right: 8.0),
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.all(Radius.circular(32.0)),
                              ),
                              child: Text('Se connecter',
                                style: GoogleFonts.sen(
                                  textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700
                                  )
                                ),
                              ),
                            ),
                          ),
                        ),

                        Expanded(
                          flex: 5,
                          child: ScaleButton(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => const SignUpPage())
                            ),
                            child: Container(
                              height: 56.0,
                              width: 160.0,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(32.0)),
                              ),
                              child: Text('S\'inscrire',
                                style: GoogleFonts.sen(
                                  textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700
                                  )
                                ),
                              ),
                            ),
                          ),
                        )

                      ],
                    ),
                  )

                ],
              ),
            )


          ],
        ),
      ),
    );
  }
}