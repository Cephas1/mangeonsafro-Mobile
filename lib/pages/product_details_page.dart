import 'dart:convert';

import 'package:badges/badges.dart';
import 'package:extended_image/extended_image.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mangeonsafro/models/product.dart';
import 'package:mangeonsafro/models/shop.dart';
import 'package:mangeonsafro/models/shopping_cart_item.dart';
import 'package:mangeonsafro/pages/shopping_cart_page.dart';
import 'package:readmore/readmore.dart';
import 'package:scale_button/scale_button.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductDetailsPage extends StatefulWidget {
  final Product? product;
  final Shop? shop;
  final Function(List<Product> newItemsList)? updateFavoriteProductsList;

  const ProductDetailsPage({
    Key? key,
    @required this.product,
    @required this.shop,
    this.updateFavoriteProductsList
  }) : super(key: key);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  bool isLoading = false;

  bool isFavorite = false;
  List<Product> favoriteProducts = [];

  void checkIfTheProductIsInFavoriteProductsList() async {
    setState(() {
      isLoading = true;
    });

    final prefs = await SharedPreferences.getInstance();

    if (prefs.getStringList('FAVORITE_PRODUCTS') != null) {
      for (var element in prefs.getStringList('FAVORITE_PRODUCTS')!) {
        Product product = Product.fromJson(jsonDecode(element));
        favoriteProducts.add(product);
      }
    }

    for (var product in favoriteProducts) {
      if (product.id == widget.product!.id) {
        setState(() {
          isFavorite = true;
        });
      }
    }

    setState(() {
      isLoading = false;
    });
  }

  int quantity = 1;
  late double price;

  @override
  void initState() {
    super.initState();
    price = double.parse(widget.product!.price.toString());

    checkIfTheProductIsInFavoriteProductsList();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: isLoading ? const Center(
          child: SpinKitFadingCircle(color: Color.fromARGB(255, 216, 14, 39), size: 40.0),
        ) : Column(
          children: [

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Stack(
                    children: [

                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 320.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: ExtendedNetworkImageProvider('https://firebasestorage.googleapis.com/v0/b/cerello-81465.appspot.com/o/Congo-Moambe-Chicken-3.jpg?alt=media&token=5f3385df-d89f-47ad-98f2-bb97b41b4e11',
                              cache: true
                            ),
                            fit: BoxFit.cover
                          ),
                        ),
                      ),

                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment
                              .spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Container(
                              width: 32.0,
                              height: 32.0,
                              margin: const EdgeInsets.only(top: 40.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.4),
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    offset: const Offset(0, 4), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () => Navigator.of(context).pop(),
                                  child: const Icon(
                                      FlutterIcons.chevron_left_ent,
                                      color: Colors.black
                                  ),
                                ),
                              ),
                            ),

                            Container(
                              margin: const EdgeInsets.only(top: 32.0),
                              child: Column(
                                children: [

                                  Container(
                                    width: 32.0,
                                    height: 32.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.4),
                                          spreadRadius: 2,
                                          blurRadius: 10,
                                          offset: const Offset(0, 4), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(builder: (context) => const ShoppingCartPage())
                                          );
                                        },
                                        child: Badge(
                                          badgeContent: Text('0',
                                            style: GoogleFonts.montserrat(
                                              textStyle: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 12.0
                                              )
                                            ),
                                          ),
                                          child: const Icon(FlutterIcons.shopping_bag_fea, color: Colors.black, size: 18.0),
                                        ),
                                      ),
                                    ),
                                  ),

                                  Container(
                                    width: 32.0,
                                    height: 32.0,
                                    margin: const EdgeInsets.only(top: 12.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(
                                              0.4),
                                          spreadRadius: 2,
                                          blurRadius: 10,
                                          offset: const Offset(0, 4), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: FavoriteButton(
                                      iconSize: 26.0,
                                      isFavorite: isFavorite,
                                      valueChanged: (value) async {
                                        SharedPreferences prefs = await SharedPreferences.getInstance();
                                        List<String>? encodedFavoriteProducts = [];

                                        setState(() {
                                          isFavorite = value;

                                          if (isFavorite) {

                                            favoriteProducts.add(widget.product!);
                                            for (var product in favoriteProducts) {
                                              encodedFavoriteProducts.add(jsonEncode(product.toJson()));
                                            }

                                            prefs.setStringList('FAVORITE_PRODUCTS', encodedFavoriteProducts);

                                            widget.updateFavoriteProductsList!(favoriteProducts);

                                            const snackBar = SnackBar(
                                              content: Text('Le produit a été ajouté à vos favoris.'),
                                            );

                                            ScaffoldMessenger.of(context).showSnackBar(snackBar);

                                          } else {

                                            favoriteProducts.removeWhere((element) => element.id == widget.product!.id);
                                            for (var product in favoriteProducts) {
                                              encodedFavoriteProducts.add(jsonEncode(product.toJson()));
                                            }

                                            prefs.setStringList('FAVORITE_PRODUCTS', encodedFavoriteProducts);

                                            widget.updateFavoriteProductsList!(favoriteProducts);

                                            const snackBar = SnackBar(
                                              content: Text('Le produit a été retiré de vos favoris.'),
                                            );

                                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                          }
                                        });
                                      },
                                    ),
                                  ),

                                  Container(
                                    width: 32.0,
                                    height: 32.0,
                                    margin: const EdgeInsets.only(top: 12.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(
                                              0.4),
                                          spreadRadius: 2,
                                          blurRadius: 10,
                                          offset: const Offset(0, 4), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: () {
                                          Share.share(
                                              'check out my website https://example.com');
                                        },
                                        child: const Icon(
                                            FlutterIcons.share_fea,
                                            color: Colors.black,
                                            size: 18.0),
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            )

                          ],
                        ),
                      )
                    ],
                  ),

                  Container(
                    margin: const EdgeInsets.only(
                        left: 24.0, top: 24.0, right: 24.0),
                    child: Text(widget.product!.name.toString(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.sen(
                        textStyle: const TextStyle(
                          color: Color.fromARGB(255, 11, 18, 42),
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700
                        )
                      ),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(left: 24.0, top: 4.0),
                    child: Text(widget.shop!.name.toString(),
                      style: GoogleFonts.sen(
                        textStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12.0
                        )
                      ),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Container(
                          width: 120.0,
                          margin: const EdgeInsets.only(top: 24.0),
                          child: Row(
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
                                    onTap: () => setState(() {
                                      if (quantity != 1) {
                                        quantity--;
                                      }
                                    }),
                                    borderRadius: const BorderRadius.all(Radius.circular(64.0)),
                                    child: const Icon(
                                      FlutterIcons.minus_ent, size: 16.0,),
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
                                          fontSize: 20.0,
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
                                    onTap: () => setState(() {
                                      quantity++;
                                    }),
                                    borderRadius: const BorderRadius.all(Radius.circular(64.0)),
                                    child: const Icon(
                                      FlutterIcons.plus_ent, size: 16.0,),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          margin: const EdgeInsets.only(top: 24.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('${quantity * price} FCFA',
                                style: GoogleFonts.sen(
                                  textStyle: const TextStyle(
                                    color: Color.fromARGB(255, 214, 0, 27),
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600
                                  )
                                ),
                              )
                            ],
                          ),
                        )

                      ],
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(left: 24.0, top: 24.0),
                    child: Text('Description',
                      style: GoogleFonts.sen(
                        textStyle: const TextStyle(
                          fontSize: 13.0,
                        )
                      ),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(
                        left: 24.0, top: 6.0, right: 24.0),
                    child: ReadMoreText(widget.product!.description.toString(),
                      trimLines: 5,
                      colorClickableText: const Color.fromARGB(255, 214, 0, 27),
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Lire plus',
                      trimExpandedText: 'moins',
                      style: GoogleFonts.sen(
                        textStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12.0,
                        )
                      ),
                    ),
                  ),

                ],
              ),
            ),

            ScaleButton(
              onTap: () async {
                // Ajoute le produit dans le panier de l'utilisateur.
                List<ShoppingCartItem> items = [];
                List<String> encodedShoppingCartItems = [];

                bool alreadyInShoppingCart = false;

                final prefs = await SharedPreferences.getInstance();

                if (prefs.getStringList('SHOPPING_CART') != null) {
                  for (var element in prefs.getStringList('SHOPPING_CART')!) {
                    ShoppingCartItem item = ShoppingCartItem.fromJson(jsonDecode(element));
                    items.add(item);
                  }
                }

                ShoppingCartItem item = ShoppingCartItem(quantity: quantity, product: widget.product, shop: widget.shop);

                for (var element in items) {
                  if (element.product!.id == widget.product!.id) {
                    setState(() {
                      alreadyInShoppingCart = true;
                    });
                  }
                }

                if (!alreadyInShoppingCart) {
                  items.add(item);

                  for (var element in items) {
                    encodedShoppingCartItems.add(jsonEncode(element));
                  }

                  prefs.setStringList('SHOPPING_CART', encodedShoppingCartItems);

                  var snackBar = SnackBar(
                    content: const Text('Le produit a été ajouté à votre panier.'),
                    action: SnackBarAction(
                      label: 'Annuler',
                      onPressed: () async {
                        // Retire le produit du panier de l'utilisateur.
                        List<ShoppingCartItem> items = [];
                        List<String> encodedShoppingCartItems = [];

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
                      }
                    ),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else {
                  var snackBar = SnackBar(
                    content: const Text('Ce produit est déjà présent dans votre panier. Accédez à votre panier pour modifier sa quantité ou le retirer.'),
                    action: SnackBarAction(
                      label: 'Voir le panier',
                      onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ShoppingCartPage()))
                    ),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
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
                child: Text('AJOUTER AU PANIER',
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