import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mangeonsafro/models/product.dart';
import 'package:mangeonsafro/models/product_category.dart';
import 'package:mangeonsafro/models/shop.dart';
import 'package:mangeonsafro/pages/shop_details_page.dart';
import 'package:mangeonsafro/pages/shop_products_page.dart';
import 'package:mangeonsafro/pages/shop_reviews_page.dart';
import 'package:http/http.dart' as http;

class ShopMainPage extends StatefulWidget {
  final Shop? shop;

  const ShopMainPage({
    Key? key,
    @required this.shop,
  }) : super(key: key);

  @override
  State<ShopMainPage> createState() => _ShopMainPageState();
}

class _ShopMainPageState extends State<ShopMainPage> {
  bool isLoading = true;
  List<Product>? products = [];
  List<ProductCategory>? productsCategories = [];

  Future<void> fetchShopData() async {
    setState(() {
      isLoading = true;
    });

    // fetch shop products
    await http.get(Uri.parse('http://test.mangeonsafro.com/api/v1/products')).then((response) {
      if (response.statusCode == 200) {
        jsonDecode(response.body)[1].forEach((data) {
          Product product = Product.fromJson(data);
          if (product.shop_id == widget.shop!.id.toString()) {
            products!.add(product);
          }
        });
      }
    });

    // Fetch products categories
    await http.get(Uri.parse('http://test.mangeonsafro.com/api/v1/products')).then((response) {
      if (response.statusCode == 200) {
        jsonDecode(response.body)[1].forEach((data) {
          ProductCategory category = ProductCategory.fromJson(data);
          productsCategories!.add(category);
        });
      }
    });

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchShopData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: isLoading ? const Center(
            child: SpinKitFadingCircle(color: Color.fromARGB(255, 216, 14, 39), size: 40.0),
          ) : TabBarView(
            children: [
              ShopProductsPage(
                products: products,
                productsCategories: productsCategories,
                shop: widget.shop,
              ),
              ShopDetailsPage(shop: widget.shop),
              // const ShopReviewsPage()
            ],
          ),

          bottomNavigationBar: isLoading ? null : Stack(
            children: [
              Container(
                height: 48.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
              ),

              TabBar(
                indicator: const BoxDecoration(
                    border: Border(
                        top: BorderSide(color: Color.fromARGB(255, 216, 14, 39), width: 3.0)
                    )
                ),
                tabs: const [
                  Tab(text: 'PRODUITS'),
                  Tab(text: 'DETAILS'),
                  // Tab(text: 'AVIS',),
                ],
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey[500],
                labelStyle: GoogleFonts.sen(
                    textStyle: const TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w700
                    )
                ),
                unselectedLabelStyle: GoogleFonts.sen(
                    textStyle: const TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w700
                    )
                ),
              )
            ],
          ),
        )
    );
  }
}