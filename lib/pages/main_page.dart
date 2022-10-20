import 'dart:convert';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mangeonsafro/models/shop.dart';
import 'package:mangeonsafro/models/shop_category.dart';
import 'package:mangeonsafro/pages/home_page.dart';
import 'package:mangeonsafro/pages/settings_page.dart';
import 'package:mangeonsafro/pages/shopping_cart_page.dart';
import 'package:mangeonsafro/pages/wish_list_page.dart';
import 'package:http/http.dart' as http;

//class needs to extend StatefulWidget since we need to make changes to the bottom app bar according to the user clicks
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  bool isLoading = true;

  bool clickedCentreFAB = false; //boolean used to handle container animation which expands from the FAB
  int selectedIndex = 0; //to handle which item is currently selected in the bottom app bar
  String text = "Home";

  //call this method on click of each bottom app bar item to update the screen
  void updateTabSelection(int index, String buttonText) {
    setState(() {
      selectedIndex = index;
      text = buttonText;
    });
  }

  List<Widget>? pages;

  List<ShopCategory>? shopsCategories = [];
  List<Shop>? shops = [];

  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });

    // Fetch shops categories
    await http.get(Uri.parse('https://test.mangeonsafro.com/api/v1/categories-shops')).then((response) {
      if (response.statusCode == 200) {
        jsonDecode(response.body)[1].forEach((data) {
          ShopCategory category = ShopCategory.fromJson(data);
          shopsCategories!.add(category);
        });
      }
    });

    // Fetch shops
    await http.get(Uri.parse('https://test.mangeonsafro.com/api/v1/shops')).then((response) {
      if (response.statusCode == 200) {
        jsonDecode(response.body)['data'].forEach((data) {
          Shop shop = Shop.fromJson(data);
          print(shop.name);
          shops!.add(shop);
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
    fetchData();

    pages = [
      HomePage(
        shopsCategories: shopsCategories,
        shops: shops,
      ),
      WishListPage(
        shops: shops,
      ),
      const SettingsPage()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading ? const Center(
        child: SpinKitFadingCircle(color: Color.fromARGB(255, 216, 14, 39), size: 40.0),
      ) : pages![selectedIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked, //specify the location of the FAB
      floatingActionButton: isLoading ? null : FloatingActionButton(
        onPressed: () {
          setState(() {
            clickedCentreFAB = !clickedCentreFAB; //to update the animated container
          });
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ShoppingCartPage()));
        },
        tooltip: "Voir mon panier",
        backgroundColor: const Color.fromARGB(255, 216, 14, 39),
        elevation: 4.0,
        child: Container(
          margin: const EdgeInsets.all(15.0),
          child: const Icon(Icons.shopping_bag_outlined),
        ),
      ),
      bottomNavigationBar: isLoading ? null : BottomAppBar(
        elevation: 15.0,
        //to add a space between the FAB and BottomAppBar
        shape: const CircularNotchedRectangle(),
        //color of the BottomAppBar
        color: Colors.white,
        child: Container(
          margin: const EdgeInsets.only(left: 12.0, right: 12.0),
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  updateTabSelection(0, "Home");
                },
                iconSize: 24.0,
                icon: Icon(
                  Icons.storefront_outlined,
                  color: selectedIndex == 0
                      ? const Color.fromARGB(255, 216, 14, 39)
                      : Colors.grey.shade400,
                ),
              ),
              //to leave space in between the bottom app bar items and below the FAB
              const SizedBox(
                width: 64.0,
              ),
              IconButton(
                onPressed: () {
                  updateTabSelection(1, "Favorites");
                },
                iconSize: 24.0,
                icon: Icon(
                  Icons.favorite_border_outlined,
                  color: selectedIndex == 1
                      ? const Color.fromARGB(255, 216, 14, 39)
                      : Colors.grey.shade400,
                ),
              ),
              const SizedBox(
                width: 64.0,
              ),
              Container(
                width: 32.0,
                height: 32.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: ExtendedNetworkImageProvider('https://firebasestorage.googleapis.com/v0/b/cerello-81465.appspot.com/o/pexels-jayro-cerqueira-da-silva-10507114.jpg?alt=media&token=522d4d4f-8453-4978-af3b-0f137141ec86',
                      cache: true
                    ),
                    fit: BoxFit.cover
                  ),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => updateTabSelection(2, 'Settings'),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}