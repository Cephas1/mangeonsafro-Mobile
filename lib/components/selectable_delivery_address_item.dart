import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectableDeliveryAddressItem extends StatefulWidget {
  final String title;
  final String address;

  const SelectableDeliveryAddressItem({Key? key, required this.title, required this.address}) : super(key: key);

  @override
  _SelectableDeliveryAddressItemState createState() {
    return _SelectableDeliveryAddressItemState();
  }
}

class _SelectableDeliveryAddressItemState extends State<SelectableDeliveryAddressItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: 0.0, right: 0.0),

        leading: Radio<bool>(
          value: true,
          groupValue: null,
          onChanged: (value) {}
        ),

        title: Text(widget.title,
          style: GoogleFonts.sen(
            textStyle: const TextStyle(
              fontSize: 13.0,
              fontWeight: FontWeight.w600
            )
          ),
        ),

        subtitle: Container(
          margin: const EdgeInsets.only(top: 4.0),
          child: Text(widget.address,
            style: GoogleFonts.sen(
              textStyle: TextStyle(
                color: Colors.grey,
                fontSize: 12.0,
              )
            ),
          ),
        ),

        trailing: Container(
          width: 40.0,
          height: 40.0,
          margin: const EdgeInsets.only(left: 8.0),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(64.0))
          ),
          child: Material(
            borderRadius: const BorderRadius.all(Radius.circular(64.0)),
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
              },
              borderRadius: const BorderRadius.all(Radius.circular(64.0)),
              child: const Center(
                child: Icon(FlutterIcons.pencil_outline_mco, color: Colors.black,),
              ),
            ),
          ),
        ),

      ),
    );
  }
}