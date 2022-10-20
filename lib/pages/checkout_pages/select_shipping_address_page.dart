import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mangeonsafro/components/selectable_delivery_address_item.dart';
import 'package:mangeonsafro/pages/add_modiify_shipping_address_page.dart';
import 'package:scale_button/scale_button.dart';

import 'checkout_summary_page.dart';

class SelectShippingAddressPage extends StatefulWidget {
  const SelectShippingAddressPage({Key? key}) : super(key: key);

  @override
  State<SelectShippingAddressPage> createState() => _SelectShippingAddressPageState();
}

class _SelectShippingAddressPageState extends State<SelectShippingAddressPage> with WidgetsBindingObserver {

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
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(FlutterIcons.chevron_left_ent)),
          title: Text('ADRESSE DE LIVRAISON',
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
          actions: [
            IconButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AddModifyShippingAddressPage())),
              icon: const Icon(FlutterIcons.plus_ent)
            )
          ],
        ),
        body: Column(
          children: [

            Expanded(
              child: Column(
                children: [

                  Expanded(
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      removeBottom: true,
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 24.0),
                            child: const SelectableDeliveryAddressItem(title: 'Bureau', address: '148, Avenue Charles de Gaulle, Pointe Noire, République du Congo')
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 24.0),
                            child: const SelectableDeliveryAddressItem(title: 'Maison', address: '33 Avenue Antoinette Sassou Nguesso, Pointe Noire, République du Congo'),
                          )
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),

            ScaleButton(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CheckoutSummaryPage())),
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
                child: Text('PROCEDER AU PAYEMENT',
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