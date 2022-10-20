import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mangeonsafro/pages/checkout_pages/select_shipping_address_page.dart';
import 'package:scale_button/scale_button.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> with WidgetsBindingObserver {
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
    await FlutterStatusbarcolor.setStatusBarColor(const Color.fromARGB(255, 216, 14, 39));
    FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
  }

  @override
  Widget build(BuildContext context) {
    changeStatusBarColor();

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Color.fromARGB(255, 216, 14, 39),
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 216, 14, 39),
          systemOverlayStyle: SystemUiOverlayStyle.light,
          automaticallyImplyLeading: false,
          title: Text('PARAMÈTRES',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.sen(
              textStyle: const TextStyle(
                color: Colors.white,
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
                        margin: const EdgeInsets.only(left: 16.0, right: 16.0),
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
                            ),

                            ScaleButton(
                              child: Container(
                                height: 40.0,
                                width: 168.0,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border.all(),
                                  borderRadius: const BorderRadius.all(Radius.circular(32.0)),
                                ),
                                child: Text(
                                  "MODIFIER LE PROFIL",
                                  style: GoogleFonts.sen(
                                    textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w700
                                    )
                                  ),
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

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Card(
                  elevation: 8.0,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(FlutterIcons.list_sli, color: Colors.grey[700]),
                        title: Text('Toutes mes commandes',
                          style: GoogleFonts.sen(
                              textStyle: TextStyle(
                                color: Colors.grey[700],
                              )
                          ),
                        ),
                        trailing: Icon(FlutterIcons.chevron_right_circle_mco, color: Colors.grey[700]),
                      ),
                      ListTile(
                        onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SelectShippingAddressPage())),
                        leading: Icon(FlutterIcons.location_ent, color: Colors.grey[700]),
                        title: Text('Mes adresses de livraisons',
                          style: GoogleFonts.sen(
                              textStyle: TextStyle(
                                color: Colors.grey[700],
                              )
                          ),
                        ),
                        trailing: Icon(FlutterIcons.chevron_right_circle_mco, color: Colors.grey[700]),
                      ),
                      ListTile(
                        leading: Icon(FlutterIcons.hourglass_ant, color: Colors.grey[700]),
                        title: Text('Paiements en attente',
                          style: GoogleFonts.sen(
                              textStyle: TextStyle(
                                color: Colors.grey[700],
                              )
                          ),
                        ),
                        trailing: Icon(FlutterIcons.chevron_right_circle_mco, color: Colors.grey[700]),
                      ),
                      ListTile(
                        leading: Icon(FlutterIcons.checkcircleo_ant, color: Colors.grey[700]),
                        title: Text('Commandes terminées',
                          style: GoogleFonts.sen(
                              textStyle: TextStyle(
                                color: Colors.grey[700],
                              )
                          ),
                        ),
                        trailing: Icon(FlutterIcons.chevron_right_circle_mco, color: Colors.grey[700]),
                      )
                    ],
                  ),
                ),
              ),

              Container(
                margin: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
                child: Card(
                  elevation: 8.0,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(FlutterIcons.notifications_none_mdi, color: Colors.grey[700]),
                        title: Text('Notifications',
                          style: GoogleFonts.sen(
                              textStyle: TextStyle(
                                color: Colors.grey[700],
                              )
                          ),
                        ),
                        trailing: Icon(FlutterIcons.chevron_right_circle_mco, color: Colors.grey[700]),
                      ),
                      ListTile(
                        leading: Icon(FlutterIcons.creditcard_ant, color: Colors.grey[700]),
                        title: Text('Modes de paiement',
                          style: GoogleFonts.sen(
                              textStyle: TextStyle(
                                color: Colors.grey[700],
                              )
                          ),
                        ),
                        trailing: Icon(FlutterIcons.chevron_right_circle_mco, color: Colors.grey[700]),
                      ),
                      ListTile(
                        leading: Icon(FlutterIcons.attach_money_mdi, color: Colors.grey[700]),
                        title: Text('Devises',
                          style: GoogleFonts.sen(
                              textStyle: TextStyle(
                                color: Colors.grey[700],
                              )
                          ),
                        ),
                        trailing: Icon(FlutterIcons.chevron_right_circle_mco, color: Colors.grey[700]),
                      ),
                      ListTile(
                        leading: Icon(FlutterIcons.language_mdi, color: Colors.grey[700]),
                        title: Text('Langues',
                          style: GoogleFonts.sen(
                              textStyle: TextStyle(
                                color: Colors.grey[700],
                              )
                          ),
                        ),
                        trailing: Icon(FlutterIcons.chevron_right_circle_mco, color: Colors.grey[700]),
                      )
                    ],
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
