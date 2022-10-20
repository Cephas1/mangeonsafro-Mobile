import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mangeonsafro/models/product.dart';
import 'package:mangeonsafro/models/shop.dart';
import 'package:mangeonsafro/pages/product_details_page.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class ProductItem extends StatelessWidget {
  final Product? product;
  final Shop? shop;
  final Function(List<Product> newItemsList)? updateFavoriteProductsList;

  const ProductItem({
    Key? key,
    @required this.product,
    @required this.shop,
    this.updateFavoriteProductsList
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 112.0,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ProductDetailsPage(product: product, shop: shop, updateFavoriteProductsList: updateFavoriteProductsList,))
            );
          },
          child: Container(
            margin: const EdgeInsets.only(left: 16.0, top: 8.0, right: 16.0),
            child: Row(
              children: [
                Container(
                  width: 96.0,
                  height: 96.0,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                    image: DecorationImage(
                        image: ExtendedNetworkImageProvider('https://firebasestorage.googleapis.com/v0/b/cerello-81465.appspot.com/o/Congo-Moambe-Chicken-3.jpg?alt=media&token=5f3385df-d89f-47ad-98f2-bb97b41b4e11', cache: true),
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
                        Text(product!.name.toString(),
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
                        Text(shop!.name.toString(),
                          style: GoogleFonts.sen(
                            textStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 13.0,
                            )
                          ),
                        ),

                        RatingStars(
                          value: 4,
                          onValueChanged: (value) {},
                          starBuilder: (index, color) => Icon(
                            Icons.star_rate,
                            color: color,
                          ),
                          starCount: 5,
                          starSize: 18.0,
                          valueLabelColor: const Color(0xff9b9b9b),
                          valueLabelTextStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 12.0
                          ),
                          valueLabelRadius: 10,
                          maxValue: 5,
                          starSpacing: 2,
                          maxValueVisibility: false,
                          valueLabelVisibility: false,
                          animationDuration: const Duration(milliseconds: 1000),
                          valueLabelPadding:
                          const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                          valueLabelMargin: const EdgeInsets.only(right: 8),
                          starOffColor: const Color(0xffe7e8ea),
                          starColor: Colors.yellow,
                        )

                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 16.0),
                  child: Text('${product!.price} XAF',
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
