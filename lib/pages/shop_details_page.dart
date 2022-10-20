import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mangeonsafro/models/shop.dart';
import 'package:readmore/readmore.dart';

class ShopDetailsPage extends StatefulWidget {
  final Shop? shop;
  const ShopDetailsPage({
    Key? key,
    @required this.shop
  }) : super(key: key);

  @override
  State<ShopDetailsPage> createState() => _ShopDetailsPageState();
}

class _ShopDetailsPageState extends State<ShopDetailsPage> {
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
                        width: MediaQuery.of(context).size.width,
                        height: 320.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: ExtendedNetworkImageProvider('https://firebasestorage.googleapis.com/v0/b/cerello-81465.appspot.com/o/pexels-rene-asmussen-1581384.jpg?alt=media&token=d457c2d8-ff47-4c3a-acc3-b8398e5ac0f5',
                                  cache: true
                              ),
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
                                  onTap: () => Navigator.of(context).pop(),
                                  child: const Icon(FlutterIcons.chevron_left_ent, color: Colors.black
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      )
                    ],
                  ),

                  Container(
                    margin: const EdgeInsets.only(
                        left: 24.0, top: 24.0, right: 24.0),
                    child: Text(widget.shop!.name.toString(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.sen(
                          textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700
                          )
                      ),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(left: 24.0, top: 4.0),
                    child: Text(widget.shop!.name.toString(),
                      style: GoogleFonts.sen(
                          textStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12.0
                          )
                      ),
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
                    child: ReadMoreText(widget.shop!.description.toString(),
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