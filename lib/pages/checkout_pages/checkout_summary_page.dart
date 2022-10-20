import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mangeonsafro/components/shopping_cart_item.dart';
import 'package:scale_button/scale_button.dart';

class CheckoutSummaryPage extends StatefulWidget {
  const CheckoutSummaryPage({Key? key}) : super(key: key);

  @override
  _CheckoutSummaryPageState createState() {
    return _CheckoutSummaryPageState();
  }
}

class _CheckoutSummaryPageState extends State<CheckoutSummaryPage> with WidgetsBindingObserver {
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
          leadingWidth: 56.0,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(FlutterIcons.chevron_left_ent)),
          title: Text('RECAPITULATIF',
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
        body: Column(
          children: [

            Expanded(
              child: Container(
                child: Column(
                  children: [

                    Expanded(
                      child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        removeBottom: true,
                        child: ListView(
                          shrinkWrap: true,
                          children: [

                            MediaQuery.removePadding(
                              context: context,
                              removeTop: true,
                              removeBottom: true,
                              child: ListView(
                                shrinkWrap: true,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 24.0),
                                    child: const ShoppingCartItem(
                                      title: 'Mossaka (poulet à la Moambe)',
                                      subtitle: 'La Brasserie de la mer',
                                      price: '2000',
                                      quantity: '1',
                                      imageURL: 'https://firebasestorage.googleapis.com/v0/b/cerello-81465.appspot.com/o/Congo-Moambe-Chicken-3.jpg?alt=media&token=5f3385df-d89f-47ad-98f2-bb97b41b4e11',
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 8.0),
                                    child: const ShoppingCartItem(
                                      title: 'Liboké',
                                      subtitle: 'La Brasserie de la mer',
                                      price: '1000',
                                      quantity: '1',
                                      imageURL: 'https://firebasestorage.googleapis.com/v0/b/cerello-81465.appspot.com/o/liboke.jpg?alt=media&token=42112041-d328-4657-a924-4ddb3848d860',
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              margin: const EdgeInsets.only(left: 16.0, top: 4.0, right: 16.0, bottom: 8.0),
                              child: const Divider(),
                            ),

                            Container(
                              margin: const EdgeInsets.only(bottom: 4.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(left: 16.0, top: 4.0),
                                    child: Text('Panier:',
                                      style: GoogleFonts.sen(
                                          textStyle: TextStyle(
                                            color: Colors.grey[700],
                                          )
                                      ),
                                    ),
                                  ),

                                  Container(
                                    margin: const EdgeInsets.only(top: 4.0, right: 16.0),
                                    child: Text('3000 FCFA:',
                                      style: GoogleFonts.sen(
                                          textStyle: TextStyle(
                                            color: Colors.grey[700],
                                          )
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),

                            Container(
                              margin: const EdgeInsets.only(bottom: 4.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(left: 16.0, top: 4.0),
                                    child: Text('Frais de livraison:',
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                            color: Colors.grey[700],
                                          )
                                      ),
                                    ),
                                  ),

                                  Container(
                                    margin: const EdgeInsets.only(top: 4.0, right: 16.0),
                                    child: Text('500 FCFA:',
                                      style: GoogleFonts.sen(
                                          textStyle: TextStyle(
                                            color: Colors.grey[700],
                                          )
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 16.0, top: 4.0),
                                  child: Text('Total:',
                                    style: GoogleFonts.sen(
                                        textStyle: const TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w700
                                        )
                                    ),
                                  ),
                                ),

                                Container(
                                  margin: const EdgeInsets.only(top: 4.0, right: 16.0),
                                  child: Text('3500 FCFA:',
                                    style: GoogleFonts.sen(
                                      textStyle: const TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w700
                                      )
                                    ),
                                  ),
                                )
                              ],
                            ),

                            Container(
                              margin: const EdgeInsets.only(left: 16.0, top: 4.0, right: 16.0, bottom: 8.0),
                              child: const Divider(),
                            ),

                            Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 16.0, right: 24.0, bottom: 8.0),
                                  child: Text('Adresse de livraison',
                                    style: GoogleFonts.sen(
                                      textStyle: const TextStyle(
                                        fontWeight: FontWeight.w700
                                      )
                                    ),
                                  ),
                                )
                              ],
                            ),

                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: ListTile(
                                contentPadding: const EdgeInsets.only(left: 0.0, right: 0.0),

                                title: Text('Bureau',
                                  style: GoogleFonts.sen(
                                    textStyle: const TextStyle(
                                    )
                                  ),
                                ),

                                subtitle: Container(
                                  margin: const EdgeInsets.only(top: 4.0),
                                  child: Text('148, Avenue Charles de Gaulle, Pointe Noire, République du Congo',
                                    style: GoogleFonts.sen(
                                      textStyle: TextStyle(
                                        color: Colors.grey[600],
                                      )
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            Container(
                              margin: const EdgeInsets.only(left: 24.0, top: 4.0, right: 24.0, bottom: 8.0),
                              child: const Divider(),
                            ),

                            Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 2.0),
                                  child: Text('Payement',
                                    style: GoogleFonts.montserrat(
                                      textStyle: const TextStyle(
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.w600
                                      )
                                    ),
                                  ),
                                )
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 24.0),
                                    child: Text('+242 06 523 71 56 (MTN Mobile Money)',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                            color: Colors.grey[400],
                                            fontSize: 12.0,
                                          )
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            ScaleButton(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CheckoutSummaryPage())),
              child: Container(
                height: 56.0,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 216, 14, 39),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(100, 216, 14, 39),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: Text('CONFIRMER',
                  style: GoogleFonts.sen(
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700
                      )
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}