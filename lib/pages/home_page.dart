import 'package:badges/badges.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mangeonsafro/components/shop_item.dart';
import 'package:mangeonsafro/models/shop.dart';
import 'package:mangeonsafro/models/shop_category.dart';

class HomePage extends StatefulWidget {
  final List<ShopCategory>? shopsCategories;
  final List<Shop>? shops;

  const HomePage({
    Key? key,
    @required this.shopsCategories,
    @required this.shops,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
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
      child: DefaultTabController(
          length: 4,
          child: Scaffold(
            backgroundColor: Colors.white,
            body: ListView(
              children: [

                const SizedBox(height: 32.0),

                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Qu\'est-ce qui\nvous ferait plaisir ?',
                        style: GoogleFonts.sen(
                            textStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 24.0,
                                fontWeight: FontWeight.w700
                            )
                        ),
                      ),
                      Row(
                        children: [
                          Badge(
                            position: BadgePosition.topEnd(top: 12.0, end: 12),
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(FlutterIcons.notifications_none_mdi)
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(FlutterIcons.search1_ant)
                          )
                        ],
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 8.0),

                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('Découvrez un univers infini des meilleures recettes africaines à vous faire livrer chez vous !',
                    style: GoogleFonts.sen(
                        textStyle: const TextStyle(
                          color: Colors.black,
                        )
                    ),
                  ),
                ),

                const SizedBox(height: 24.0),

                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TabBar(
                    isScrollable: true,
                    indicator: const BubbleTabIndicator(
                      indicatorHeight: 32.0,
                      indicatorColor: Color.fromARGB(255, 224, 43, 26),
                      tabBarIndicatorSize: TabBarIndicatorSize.tab,
                    ),
                    tabs: widget.shopsCategories!.map((category) => Tab(child: Text(category.name.toString()))).toList(),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.grey,
                    labelStyle: GoogleFonts.sen(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w700
                      )
                    ),
                    unselectedLabelStyle: GoogleFonts.sen(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w700
                        )
                    ),
                  ),
                ),

                const SizedBox(height: 32.0),
                
                ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: widget.shops!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 16.0),
                      child: ShopItem(
                        shop: widget.shops![index],
                      ),
                    );
                  }
                ),
                const SizedBox(height: 32.0),
              ],
            ),
          )
      )
    );
  }
}