import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mangeonsafro/models/shop.dart';
import 'package:mangeonsafro/pages/shop_main_page.dart';

class ShopItem extends StatelessWidget {
  final Shop? shop;

  const ShopItem({
    Key? key,
    @required this.shop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExtendedNetworkImageProvider('https://firebasestorage.googleapis.com/v0/b/cerello-81465.appspot.com/o/pexels-volkan-vardar-3887985.jpg?alt=media&token=0a063127-2304-4a15-a36e-cac927921894', cache: true),
                    fit: BoxFit.cover
                  ),
                ),
              ),

              Container(
                height: 40.0,
                width: 148.0,
                color: Colors.white,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ShopMainPage(shop: shop)));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('Visiter la boutique'),
                        Icon(FlutterIcons.arrow_right_sli, size: 12.0,)
                      ],
                    ),
                  ),
                ),
              )

            ],
          ),

          const SizedBox(height: 8.0,),

          Row(
            children: [
              const Icon(FlutterIcons.star_ant, size: 12.0, color: Color.fromARGB(255, 224, 43, 26)),

              const SizedBox(width: 4.0),

              Text('4.8 | 134 avis',
                style: GoogleFonts.sen(
                  textStyle: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w700
                  )
                ),
              )
            ],
          ),

          const SizedBox(height: 4.0,),

          Text(shop!.name.toString(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.sen(
              textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.w700
              )
            ),
          )

        ],
      ),
    );
  }
}
