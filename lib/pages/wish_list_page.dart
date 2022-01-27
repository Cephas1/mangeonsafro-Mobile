import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mangeonsafro/components/wish_list_item.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({Key? key}) : super(key: key);

  @override
  _WishListPageState createState() {
    return _WishListPageState();
  }
}

class _WishListPageState extends State<WishListPage> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      changeStatusBarColor();
    }
  }

  Future<void> changeStatusBarColor() async {
    await FlutterStatusbarcolor.setStatusBarColor(Colors.white);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
  }

  @override
  Widget build(BuildContext context) {
    changeStatusBarColor();

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark
      ),
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          automaticallyImplyLeading: false,
          title: Text('MA LISTE DE SOUHAITS',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.sen(
              textStyle: const TextStyle(
                color: Color.fromARGB(255, 11, 18, 42),
                fontSize: 18.0,
                fontWeight: FontWeight.w700
              )
            ),
          ),
          actions: const [],
        ),
        body: ListView(
          shrinkWrap: true,
          children: const [
            WishListItem(
              title: 'Mossaka (poulet à la Moambe)',
              subtitle: 'La Brasserie de la mer',
              price: '2000',
              productImageURL: 'https://firebasestorage.googleapis.com/v0/b/cerello-81465.appspot.com/o/Congo-Moambe-Chicken-3.jpg?alt=media&token=5f3385df-d89f-47ad-98f2-bb97b41b4e11',
            ),
            WishListItem(
              title: 'Liboké',
              subtitle: 'La Brasserie de la mer',
              price: '1000',
              productImageURL: 'https://firebasestorage.googleapis.com/v0/b/cerello-81465.appspot.com/o/liboke.jpg?alt=media&token=42112041-d328-4657-a924-4ddb3848d860',
            ),
          ],
        ),
      ),
    );
  }
}