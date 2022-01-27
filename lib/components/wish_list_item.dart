import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mangeonsafro/pages/product_details_page.dart';

class WishListItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;
  final String productImageURL;

  const WishListItem({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.productImageURL,
    required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 112.0,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const ProductDetailsPage())
            );
          },
          child: Container(
            margin: const EdgeInsets.only(left: 24.0, top: 8.0, right: 24.0),
            child: Row(
              children: [
                Container(
                  width: 96.0,
                  height: 96.0,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                    image: DecorationImage(
                        image: ExtendedNetworkImageProvider(productImageURL, cache: true),
                        fit: BoxFit.cover
                    ),
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
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w700
                              )
                          ),
                        ),
                        Text(subtitle,
                          style: GoogleFonts.sen(
                              textStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 13.0,
                              )
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 16.0),
                  child: Text('$price XAF',
                    style: GoogleFonts.sen(
                      textStyle: const TextStyle(
                        color: Color.fromARGB(255, 214, 0, 27),
                        fontWeight: FontWeight.w700
                      )
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
