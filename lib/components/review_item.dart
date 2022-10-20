import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [

          Container(
            margin: const EdgeInsets.only(bottom: 16.0),
            child: Row(
              children: [

                Container(
                  width: 40.0,
                  height: 40.0,
                  margin: const EdgeInsets.only(right: 16.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: ExtendedNetworkImageProvider('https://firebasestorage.googleapis.com/v0/b/cerello-81465.appspot.com/o/pexels-jayro-cerqueira-da-silva-10507114.jpg?alt=media&token=522d4d4f-8453-4978-af3b-0f137141ec86',
                            cache: true
                        ),
                        fit: BoxFit.cover
                    ),
                  ),
                ),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Emilia Dorego',
                        style: GoogleFonts.sen(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w700
                          )
                        ),
                      ),

                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            RatingStars(
                              value: 4,
                              onValueChanged: (value) {},
                              starBuilder: (index, color) => Icon(
                                Icons.star_rate,
                                color: color,
                              ),
                              starCount: 5,
                              starSize: 14.0,
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
                            ),

                            Text('Il y a 1 jour',
                              style: GoogleFonts.sen(
                                textStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12.0,
                                )
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )

              ],
            ),
          ),

          ReadMoreText(
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

        ],
      ),
    );
  }
}
