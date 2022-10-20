import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mangeonsafro/components/product_item.dart';
import 'package:mangeonsafro/models/product.dart';
import 'package:mangeonsafro/models/product_category.dart';
import 'package:mangeonsafro/models/shop.dart';

class ShopProductsPage extends StatefulWidget {
  final List<ProductCategory>? productsCategories;
  final List<Product>? products;
  final Shop? shop;

  const ShopProductsPage({
    Key? key,
    @required this.productsCategories,
    @required this.products,
    @required this.shop,
  }) : super(key: key);

  @override
  State<ShopProductsPage> createState() => _ShopProductsPageState();
}

class _ShopProductsPageState extends State<ShopProductsPage> with WidgetsBindingObserver {

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
      child: DefaultTabController(
        length: widget.productsCategories!.length,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
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
            bottom: TabBar(
              isScrollable: true,
              indicatorColor: Colors.white,
              tabs: widget.productsCategories!.map((category) => Tab(child: Text(category.name.toString()))).toList(),
              labelColor: Colors.white,
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
            title: Text('PRODUITS',
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
          body: ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: widget.products!.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 16.0),
                child: ProductItem(
                  product: widget.products![index],
                  shop: widget.shop,
                ),
              );
            }
          ),
        )
      ),
    );
  }
}