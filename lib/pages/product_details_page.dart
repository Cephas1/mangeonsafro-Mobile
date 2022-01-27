import 'package:badges/badges.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';
import 'package:share_plus/share_plus.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({Key? key}) : super(key: key);

  @override
  _ProductDetailsPageState createState() {
    return _ProductDetailsPageState();
  }
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
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
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Stack(
                    children: [

                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        height: 320.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: ExtendedNetworkImageProvider(
                                  'https://firebasestorage.googleapis.com/v0/b/cerello-81465.appspot.com/o/Congo-Moambe-Chicken-3.jpg?alt=media&token=5f3385df-d89f-47ad-98f2-bb97b41b4e11',
                                  cache: true),
                              fit: BoxFit.cover
                          ),
                        ),
                      ),

                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment
                              .spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Container(
                              width: 32.0,
                              height: 32.0,
                              margin: const EdgeInsets.only(top: 40.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.4),
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    offset: const Offset(0, 4), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {},
                                  child: const Icon(
                                      FlutterIcons.chevron_left_ent,
                                      color: Colors.black
                                  ),
                                ),
                              ),
                            ),

                            Container(
                              margin: const EdgeInsets.only(top: 32.0),
                              child: Column(
                                children: [

                                  Container(
                                    width: 32.0,
                                    height: 32.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(
                                              0.4),
                                          spreadRadius: 2,
                                          blurRadius: 10,
                                          offset: const Offset(0, 4), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        child: Badge(
                                          badgeContent: Text('0',
                                            style: GoogleFonts.montserrat(
                                                textStyle: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12.0
                                                )
                                            ),
                                          ),
                                          child: const Icon(FlutterIcons
                                              .shopping_bag_fea,
                                              color: Colors.black,
                                              size: 18.0),
                                        ),
                                      ),
                                    ),
                                  ),

                                  Container(
                                    width: 32.0,
                                    height: 32.0,
                                    margin: const EdgeInsets.only(top: 12.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(
                                              0.4),
                                          spreadRadius: 2,
                                          blurRadius: 10,
                                          offset: const Offset(0, 4), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: () {},
                                        child: const Icon(
                                          FlutterIcons.shopping_bag_fea,
                                          color: Colors.black,
                                          size: 18.0,),
                                      ),
                                    ),
                                  ),

                                  Container(
                                    width: 32.0,
                                    height: 32.0,
                                    margin: const EdgeInsets.only(top: 12.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(
                                              0.4),
                                          spreadRadius: 2,
                                          blurRadius: 10,
                                          offset: const Offset(0, 4), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: () {
                                          Share.share(
                                              'check out my website https://example.com');
                                        },
                                        child: const Icon(
                                            FlutterIcons.share_fea,
                                            color: Colors.black,
                                            size: 18.0),
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            )

                          ],
                        ),
                      )
                    ],
                  ),

                  Container(
                    margin: const EdgeInsets.only(
                        left: 24.0, top: 24.0, right: 24.0),
                    child: Text('Mossaka (poulet à la Moambe)',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.sen(
                        textStyle: const TextStyle(
                          color: Color.fromARGB(255, 11, 18, 42),
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700
                        )
                      ),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(left: 24.0, top: 4.0),
                    child: Text('La Brasserie de la mer',
                      style: GoogleFonts.sen(
                        textStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12.0
                        )
                      ),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Container(
                          width: 64.0,
                          height: 18.0,
                          margin: const EdgeInsets.only(top: 24.0),
                          color: Colors.grey[200],
                          child: Row(
                            children: [

                              SizedBox(
                                width: 16.0,
                                height: 18.0,
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {},
                                    child: const Icon(
                                      FlutterIcons.minus_ent, size: 16.0,),
                                  ),
                                ),
                              ),

                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .center,
                                  children: [
                                    Text('1',
                                      style: GoogleFonts.sen(
                                        textStyle: const TextStyle(
                                          fontSize: 12.0
                                        )
                                      ),
                                    )
                                  ],
                                ),
                              ),

                              SizedBox(
                                width: 16.0,
                                height: 18.0,
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {},
                                    child: const Icon(
                                      FlutterIcons.plus_ent, size: 16.0,),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          margin: const EdgeInsets.only(top: 24.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('2 000 FCFA',
                                style: GoogleFonts.sen(
                                  textStyle: const TextStyle(
                                    color: Color.fromARGB(255, 214, 0, 27),
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600
                                  )
                                ),
                              )
                            ],
                          ),
                        )

                      ],
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(left: 24.0, top: 24.0),
                    child: Text('Description',
                      style: GoogleFonts.sen(
                        textStyle: const TextStyle(
                          fontSize: 13.0,
                        )
                      ),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(
                        left: 24.0, top: 6.0, right: 24.0),
                    child: ReadMoreText(
                      'C\'est un plat traditionnel congolais très connu à l\'étranger. Il se compose d\'un poulet rôti cuit dans une sauce épaisse à base d\'extraits de noix de palme. Moambe vient de «mwamba» qui désigne la purée de noix de palme qui va donner cette dauce onctueuse, à agrémenter d\'oignon, ail, tomate fraîche et piment. Il s\'accompagne des classiques: riz, manioc, banane plantin.',
                      trimLines: 5,
                      colorClickableText: const Color.fromARGB(255, 214, 0, 27),
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Lire plus',
                      trimExpandedText: 'moins',
                      style: GoogleFonts.sen(
                        textStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12.0,
                        )
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}