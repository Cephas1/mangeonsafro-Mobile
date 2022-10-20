import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShoppingCartItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;
  final String quantity;
  final String imageURL;

  const ShoppingCartItem({Key? key, required this.title, required this.subtitle, required this.quantity, required this.imageURL, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16.0, top: 8.0, right: 16.0),
      height: 88.0,
      child: Row(
        children: [
          Text('$quantity x',
            style: const TextStyle(
                fontWeight: FontWeight.w700
            ),
          ),
          Container(
            width: 64.0,
            height: 64.0,
            margin: const EdgeInsets.only(left: 16.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(4.0)),
              image: DecorationImage(
                  image: ExtendedNetworkImageProvider(imageURL, cache: true),
                  fit: BoxFit.cover),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: const Offset(0, 4), // changes position of shadow
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.sen(
                      textStyle: const TextStyle(
                        color: Color.fromARGB(255, 11, 18, 42),
                        fontWeight: FontWeight.w700
                      )
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 4.0),
                    child: Text(subtitle,
                      style: GoogleFonts.sen(
                        textStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 13.0,
                        )
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 8.0),
            child: Text('$price F CFA',
              style: GoogleFonts.sen(
                textStyle: const TextStyle(
                  color: Color.fromARGB(255, 214, 0, 27),
                  fontWeight: FontWeight.w700
                )
              ),
            ),
          ),
        ],
      ),
    );
  }
}
