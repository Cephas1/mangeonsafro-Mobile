import 'dart:convert';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mangeonsafro/models/product.dart';
import 'package:mangeonsafro/models/shop.dart';
import 'package:mangeonsafro/models/shopping_cart_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditableShoppingCartItem extends StatefulWidget {
  final int? quantity;
  final Product? product;
  final Shop? shop;
  final Function(List<ShoppingCartItem> newItemsList) updateShoppingCartItemsList;

  const EditableShoppingCartItem({
    Key? key,
    required this.quantity,
    required this.product,
    required this.shop,
    required this.updateShoppingCartItemsList
  }) : super(key: key);

  @override
  State<EditableShoppingCartItem> createState() => _EditableShoppingCartItemState();
}

class _EditableShoppingCartItemState extends State<EditableShoppingCartItem> {
  late int? quantity;
  late double? price;

  @override
  void initState() {
    super.initState();
    quantity = widget.quantity;
    price = double.parse(widget.product!.price.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24.0),
      height: 96.0,
      child: Row(
        children: [

          Container(
            width: 96.0,
            height: 96.0,
            margin: const EdgeInsets.only(left: 16.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(4.0)),
              image: DecorationImage(
                image: ExtendedNetworkImageProvider('https://firebasestorage.googleapis.com/v0/b/cerello-81465.appspot.com/o/Congo-Moambe-Chicken-3.jpg?alt=media&token=5f3385df-d89f-47ad-98f2-bb97b41b4e11', cache: true),
                fit: BoxFit.cover
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: const Offset(0, 4), // changes position of shadow
                ),
              ],
            ),
          ),

          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(widget.product!.name.toString(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.sen(
                      textStyle: const TextStyle(
                        color: Color.fromARGB(255, 11, 18, 42),
                        fontWeight: FontWeight.w700
                      )
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(top: 4.0),
                    child: Text(widget.shop!.name.toString(),
                      style: GoogleFonts.sen(
                        textStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 13.0,
                        )
                      ),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(top: 8.0),
                    child: Text('${quantity! * price!} F CFA',
                      style: GoogleFonts.sen(
                        textStyle: const TextStyle(
                          color: Color.fromARGB(255, 214, 0, 27),
                          fontWeight: FontWeight.w700
                        )
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(
            width: 120.0,
            child: Column(
              children: [

                Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    shape: BoxShape.circle
                  ),
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: const BorderRadius.all(Radius.circular(64.0)),
                    child: InkWell(
                      onTap: () async {
                        setState(() {
                          quantity = (quantity! + 1);
                        });

                        // Mets à jour la quantité du produit dans le panier de l'utilisateur.
                        List<ShoppingCartItem> items = [];
                        List<String> encodedShoppingCartItems = [];

                        int index;

                        final prefs = await SharedPreferences.getInstance();

                        if (prefs.getStringList('SHOPPING_CART') != null) {
                          for (var element in prefs.getStringList('SHOPPING_CART')!) {
                            ShoppingCartItem item = ShoppingCartItem.fromJson(jsonDecode(element));
                            items.add(item);
                          }
                        }

                        ShoppingCartItem item = ShoppingCartItem(quantity: quantity, product: widget.product, shop: widget.shop);

                        index = items.indexWhere((element) => element.product!.id == widget.product!.id);
                        items[index] = item;

                        for (var element in items) {
                          encodedShoppingCartItems.add(jsonEncode(element));
                        }

                        prefs.setStringList('SHOPPING_CART', encodedShoppingCartItems);
                      },
                      borderRadius: const BorderRadius.all(Radius.circular(64.0)),
                      child: const Icon(FlutterIcons.plus_ent, size: 16.0,),
                    ),
                  ),
                ),

                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('$quantity',
                        style: GoogleFonts.sen(
                          textStyle: const TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w700
                          )
                        ),
                      )
                    ],
                  ),
                ),

                Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    shape: BoxShape.circle
                  ),
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: const BorderRadius.all(Radius.circular(64.0)),
                    child: InkWell(
                      onTap: () async {
                        if (quantity != 1) {
                          setState(() {
                            quantity = (quantity! - 1);
                          });

                          // Mets à jour la quantité du produit dans le panier de l'utilisateur.
                          List<ShoppingCartItem> items = [];
                          List<String> encodedShoppingCartItems = [];

                          int index;

                          final prefs = await SharedPreferences.getInstance();

                          if (prefs.getStringList('SHOPPING_CART') != null) {
                            for (var element in prefs.getStringList('SHOPPING_CART')!) {
                              ShoppingCartItem item = ShoppingCartItem.fromJson(jsonDecode(element));
                              items.add(item);
                            }
                          }

                          ShoppingCartItem item = ShoppingCartItem(quantity: quantity, product: widget.product, shop: widget.shop);

                          index = items.indexWhere((element) => element.product!.id == widget.product!.id);
                          items[index] = item;

                          for (var element in items) {
                            encodedShoppingCartItems.add(jsonEncode(element));
                          }

                          prefs.setStringList('SHOPPING_CART', encodedShoppingCartItems);
                        } else if (quantity == 1) {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Retirer du panier',
                                  style: GoogleFonts.sen(
                                    textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w700
                                    )
                                  ),
                                ),
                                content: Text('Le produit va être retiré de votre panier. Voulez-vous poursuivre ?',
                                  style: GoogleFonts.sen(
                                    textStyle: TextStyle(
                                      color: Colors.grey[700],
                                      fontSize: 16.0
                                    )
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Non",
                                      style: GoogleFonts.sen(
                                        textStyle: const TextStyle(
                                          color: Colors.red,
                                          fontSize: 16.0
                                        )
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      // Retire le produit du panier de l'utilisateur.
                                      List<ShoppingCartItem> items = [];
                                      List<String> encodedShoppingCartItems = [];

                                      int index;

                                      final prefs = await SharedPreferences.getInstance();

                                      if (prefs.getStringList('SHOPPING_CART') != null) {
                                        for (var element in prefs.getStringList('SHOPPING_CART')!) {
                                          ShoppingCartItem item = ShoppingCartItem.fromJson(jsonDecode(element));
                                          items.add(item);
                                        }
                                      }

                                      items.removeWhere((element) => element.product!.id == widget.product!.id);

                                      for (var element in items) {
                                        encodedShoppingCartItems.add(jsonEncode(element));
                                      }

                                      prefs.setStringList('SHOPPING_CART', encodedShoppingCartItems);

                                      widget.updateShoppingCartItemsList(items);

                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Oui",
                                      style: GoogleFonts.sen(
                                        textStyle: const TextStyle(
                                          color: Colors.red,
                                          fontSize: 16.0
                                        )
                                      ),
                                    ),
                                  ),
                                ],
                              )
                          );
                        }
                      },
                      borderRadius: const BorderRadius.all(Radius.circular(64.0)),
                      child: const Icon(FlutterIcons.minus_ent, size: 16.0,),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
