import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mangeonsafro/components/review_item.dart';

class ShopReviewsPage extends StatefulWidget {
  const ShopReviewsPage({Key? key}) : super(key: key);

  @override
  _ShopReviewsPageState createState() {
    return _ShopReviewsPageState();
  }
}

class _ShopReviewsPageState extends State<ShopReviewsPage> with WidgetsBindingObserver {

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
          title: Text('AVIS',
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
        body: ListView(
          shrinkWrap: true,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child:  const ReviewItem(),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: const ReviewItem(),
            ),
          ],
        ),
      ),
    );
  }
}