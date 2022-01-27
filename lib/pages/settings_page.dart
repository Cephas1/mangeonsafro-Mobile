import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
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
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          automaticallyImplyLeading: false,
          title: Text('PARAMÈTRES',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.sen(
              textStyle: const TextStyle(
                color: Color.fromARGB(255, 11, 18, 42),
                fontSize: 18.0,
                fontWeight: FontWeight.w700
              )
            ),
          ),
          actions: const [],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [

              Container(
                margin: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
                child: Row(
                  children: [

                    Container(
                      width: 120.0,
                      height: 120.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: ExtendedNetworkImageProvider('https://firebasestorage.googleapis.com/v0/b/cerello-81465.appspot.com/o/pexels-jayro-cerqueira-da-silva-10507114.jpg?alt=media&token=522d4d4f-8453-4978-af3b-0f137141ec86',
                            cache: true
                          ),
                          fit: BoxFit.cover
                        ),
                      ),
                    ),

                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Emilia Dorego',
                              style: GoogleFonts.sen(
                                textStyle: const TextStyle(
                                  color: Color.fromARGB(255, 11, 18, 42),
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w700
                                )
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 6.0),
                              child: Text('emidorego@gmail.com',
                                style: GoogleFonts.sen(
                                  textStyle: const TextStyle(
                                    color: Colors.grey,
                                  )
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
