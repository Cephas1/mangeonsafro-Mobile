import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scale_button/scale_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() {
    return _SignUpPageState();
  }
}

class _SignUpPageState extends State<SignUpPage> with WidgetsBindingObserver {
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
    await FlutterStatusbarcolor.setStatusBarColor(const Color.fromARGB(255, 224, 43, 26));
    FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
  }

  @override
  Widget build(BuildContext context) {
    changeStatusBarColor();

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
          statusBarColor: Color.fromARGB(255, 224, 43, 26),
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light
      ),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 224, 43, 26),
        body: Column(
          children: [

            Container(
              margin: const EdgeInsets.only(left: 16.0, top: 40.0, bottom: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Container(
                          width: 32.0,
                          height: 32.0,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () => Navigator.of(context).pop(),
                              child: const Icon(FlutterIcons.arrowleft_ant, color: Colors.white),
                            ),
                          ),
                        ),

                        Container(
                          margin: const EdgeInsets.only(right: 16.0),
                          child: TextButton(
                              onPressed: () {},
                              child: Text('Se connecter',
                                style: GoogleFonts.sen(
                                  textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w700
                                  )
                                ),
                              )
                          ),
                        )

                      ],
                    ),
                  ),

                  Text('S\'inscrire',
                    style: GoogleFonts.sen(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700
                      )
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(top: 8.0, right: 16.0),
                    child: Text('Veuillez renseigner vos identifiants de connexion ou utiliser l\'une des options ci-dessous pour vous inscrire et accéder à un monde de saveurs infinies',
                      style: GoogleFonts.sen(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 12.0
                        )
                      ),
                    ),
                  )
                ],
              ),
            ),

            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(32.0), topRight: Radius.circular(32.0))
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [

                    Container(
                      margin: const EdgeInsets.only(left: 16.0, top: 40.0, right: 16.0),
                      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 24.0),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 245, 245, 245),
                        borderRadius: BorderRadius.all(Radius.circular(64.0),),
                      ),
                      child: TextFormField(
                        onChanged: (value) {},
                        style: GoogleFonts.sen(
                          textStyle: const TextStyle(
                            color: Colors.black,
                          )
                        ),
                        decoration: InputDecoration(
                          hintText: 'Nom *',
                          hintStyle: GoogleFonts.sen(
                            textStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14.0,
                            )
                          ),
                          border: InputBorder.none
                        ),
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.only(left: 16.0, top: 8.0, right: 16.0),
                      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 24.0),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 245, 245, 245),
                        borderRadius: BorderRadius.all(Radius.circular(64.0),),
                      ),
                      child: TextFormField(
                        onChanged: (value) {},
                        style: GoogleFonts.sen(
                            textStyle: const TextStyle(
                              color: Colors.black,
                            )
                        ),
                        decoration: InputDecoration(
                            hintText: 'Adresse de messagerie *',
                            hintStyle: GoogleFonts.sen(
                                textStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14.0,
                                )
                            ),
                            border: InputBorder.none
                        ),
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.only(left: 16.0, top: 8.0, right: 16.0),
                      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 24.0),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 245, 245, 245),
                        borderRadius: BorderRadius.all(Radius.circular(64.0),),
                      ),
                      child: TextFormField(
                        onChanged: (value) {},
                        style: GoogleFonts.sen(
                            textStyle: const TextStyle(
                              color: Colors.black,
                            )
                        ),
                        decoration: InputDecoration(
                            hintText: 'Mot de passe *',
                            hintStyle: GoogleFonts.sen(
                                textStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14.0,
                                )
                            ),
                            border: InputBorder.none
                        ),
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.only(right: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: Text('Mot de passe oublié ?',
                                style: GoogleFonts.sen(
                                    textStyle: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.w700
                                    )
                                ),
                              )
                          )
                        ],
                      ),
                    ),

                    ScaleButton(
                      child: Container(
                        height: 56.0,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 16.0),
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        child: Text('S\'INSCRIRE',
                          style: GoogleFonts.sen(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700
                              )
                          ),
                        ),
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
                      child: const Divider(),
                    ),

                    ScaleButton(
                      child: Container(
                        height: 56.0,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 16.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(Radius.circular(32.0)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: const Offset(2, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(
                          children: [

                            Container(
                              width: 24.0,
                              height: 24.0,
                              margin: const EdgeInsets.symmetric(horizontal: 16.0),
                              decoration: const BoxDecoration(
                                  image: DecorationImage(image: AssetImage('assets/images/google_transparent_icon.png'))
                              ),
                            ),

                            Expanded(
                              child: Text('S\'inscrire avec Google',
                                style: GoogleFonts.sen(
                                    textStyle: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700
                                    )
                                ),
                              ),
                            ),

                            Container(
                                margin: const EdgeInsets.only(right: 16.0),
                                child: const Icon(FlutterIcons.arrowright_ant, color: Colors.black)
                            )
                          ],
                        ),
                      ),
                    ),

                    ScaleButton(
                      child: Container(
                        height: 56.0,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(Radius.circular(32.0)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: const Offset(2, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(
                          children: [

                            Container(
                              width: 24.0,
                              height: 24.0,
                              margin: const EdgeInsets.symmetric(horizontal: 16.0),
                              decoration: const BoxDecoration(
                                  image: DecorationImage(image: AssetImage('assets/images/facebook_transparent_icon.png'))
                              ),
                            ),

                            Expanded(
                              child: Text('S\'inscrire avec Facebook',
                                style: GoogleFonts.sen(
                                    textStyle: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700
                                    )
                                ),
                              ),
                            ),

                            Container(
                                margin: const EdgeInsets.only(right: 16.0),
                                child: const Icon(FlutterIcons.arrowright_ant, color: Colors.black)
                            )
                          ],
                        ),
                      ),
                    ),


                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}