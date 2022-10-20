import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mangeonsafro/components/product_item.dart';
import 'package:mangeonsafro/models/product.dart';
import 'package:mangeonsafro/models/shop.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WishListPage extends StatefulWidget {
  final List<Shop>? shops;

  const WishListPage({
    Key? key,
    @required this.shops
  }) : super(key: key);

  @override
  State<WishListPage> createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> with WidgetsBindingObserver {
  bool isLoading = false;

  List<Product> favoriteProducts = [];

  void updateFavoriteProductsList(List<Product> newItemsList) {
    setState(() {
      favoriteProducts = newItemsList;
    });
  }

  void fetchFavoriteProducts() async {
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

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    fetchFavoriteProducts();
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
          title: Text('MA LISTE DE SOUHAITS',
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
        body: isLoading ? const Center(
          child: SpinKitFadingCircle(color: Color.fromARGB(255, 216, 14, 39), size: 40.0),
        ) : favoriteProducts.isEmpty ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 304.0,
                height: 304.0,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/empty_wish_list.png')
                    )
                ),
              ),
              const Text('Votre liste de souhaits est vide',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700
                ),
              ),
              const SizedBox(height: 8.0),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: const Text('Vous pouvez enregistrer des produits dans cette liste et les commander plus tard.',
                    textAlign: TextAlign.center,
                  )
              )
            ]
        ) : ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: favoriteProducts.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 16.0),
                child: ProductItem(
                  product: favoriteProducts[index],
                  shop: widget.shops!.firstWhere((shop) => shop.id.toString() == favoriteProducts[index].shop_id),
                  updateFavoriteProductsList: updateFavoriteProductsList,
                ),
              );
            }
        ),
      ),
    );
  }
}