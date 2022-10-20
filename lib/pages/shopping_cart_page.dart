import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mangeonsafro/components/editable_shopping_cart_item.dart';
import 'package:mangeonsafro/models/shopping_cart_item.dart';
import 'package:mangeonsafro/pages/checkout_pages/select_shipping_address_page.dart';
import 'package:scale_button/scale_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({Key? key}) : super(key: key);

  @override
    State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> with WidgetsBindingObserver {

  bool isLoading = false;

  List<ShoppingCartItem> items = [];

  updateShoppingCartItemsList(List<ShoppingCartItem> newItemsList) {
    setState(() {
      items = newItemsList;
    });
  }

  void fetchShoppingCartItems() async {
    setState(() {
      isLoading = true;
    });

    final prefs = await SharedPreferences.getInstance();

    if (prefs.getStringList('SHOPPING_CART') != null) {
      for (var element in prefs.getStringList('SHOPPING_CART')!) {
        ShoppingCartItem item = ShoppingCartItem.fromJson(jsonDecode(element));
        items.add(item);
      }
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    fetchShoppingCartItems();
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
        appBar: isLoading ? null : AppBar(
          backgroundColor: const Color.fromARGB(255, 216, 14, 39),
          systemOverlayStyle: SystemUiOverlayStyle.light,
          automaticallyImplyLeading: false,
          leadingWidth: 56.0,
          leading: Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(32.0))),
            child: Material(
              color: Colors.transparent,
              borderRadius: const BorderRadius.all(Radius.circular(32.0)),
              child: InkWell(
                onTap: () => Navigator.of(context).pop(),
                borderRadius: const BorderRadius.all(Radius.circular(32.0)),
                child: const Icon(FlutterIcons.chevron_left_ent, color: Colors.white, size: 32.0),
              ),
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('MON PANIER',
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
              Text('${items.length} articles',
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 12.0
                  )
                ),
              )
            ],
          ),
          actions: const [],
        ),
        body: isLoading ? const Center(
          child: SpinKitFadingCircle(color: Color.fromARGB(255, 216, 14, 39), size: 40.0),
        ) : items.isEmpty ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 304.0,
              height: 304.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/empty_shopping_cart.png')
                )
              ),
            ),
            const Text('Votre panier est vide',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w700
              ),
            ),
            const SizedBox(height: 8.0),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 32.0),
              child: const Text('Veuillez ajouter des produits à votre panier afin de passer une commande.',
                textAlign: TextAlign.center,
              )
            )
          ]
        ) : Column(
          children: [

            Expanded(
              child: Column(
                children: [

                  Expanded(
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      removeBottom: true,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 16.0),
                            child: EditableShoppingCartItem(
                              quantity: items[index].quantity,
                              product: items[index].product,
                              shop: items[index].shop,
                              updateShoppingCartItemsList: updateShoppingCartItemsList,
                            ),
                          );
                        }
                      ),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(left: 24.0, top: 4.0, right: 24.0),
                    child: const Divider(),
                  ),

                  Container(
                    margin: const EdgeInsets.only(bottom: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 24.0, top: 4.0),
                          child: Text('Panier:',
                            style: GoogleFonts.sen(
                              textStyle: TextStyle(
                                color: Colors.grey[700],
                              )
                            ),
                          ),
                        ),

                        Container(
                          margin: const EdgeInsets.only(top: 4.0, right: 24.0),
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
                          margin: const EdgeInsets.only(left: 24.0, top: 4.0),
                          child: Text('Frais de livraison:',
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                color: Colors.grey[700],
                              )
                            ),
                          ),
                        ),

                        Container(
                          margin: const EdgeInsets.only(top: 4.0, right: 24.0),
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
                        margin: const EdgeInsets.only(left: 24.0, top: 4.0),
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
                        margin: const EdgeInsets.only(top: 4.0, right: 24.0),
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
                    margin: const EdgeInsets.only(left: 24.0, top: 4.0, right: 24.0, bottom: 8.0),
                    child: const Divider(),
                  ),

                ],
              ),
            ),

            ScaleButton(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SelectShippingAddressPage())),
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
                child: Text('COMMANDER MAINTENANT',
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