import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:awesome_card/awesome_card.dart';

class AddNewCreditCardPage extends StatefulWidget {
  const AddNewCreditCardPage({Key? key}) : super(key: key);

  @override
  _AddNewCreditCardPageState createState() {
    return _AddNewCreditCardPageState();
  }
}

class _AddNewCreditCardPageState extends State<AddNewCreditCardPage> with WidgetsBindingObserver {
  String cardNumber = '';
  String cardHolderName = '';
  String expiryDate = '';
  String cvv = '';
  bool showBack = false;

  late FocusNode _focusNode;

  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _focusNode.hasFocus ? showBack = true : showBack = false;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    _focusNode.dispose();
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
          leadingWidth: 56.0,
          leading: Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(32.0))
            ),
            child: Material(
              color: Colors.transparent,
              borderRadius: const BorderRadius.all(Radius.circular(32.0)),
              child: InkWell(
                onTap: () => Navigator.of(context).pop(),
                borderRadius: const BorderRadius.all(Radius.circular(32.0)),
                child: const Icon(FlutterIcons.chevron_left_ent, color: Colors.black, size: 32.0),
              ),
            ),
          ),
          title: Text('AJOUTER UNE CARTE DE CRÉDIT',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.sen(
              textStyle: const TextStyle(
                color: Color.fromARGB(255, 11, 18, 42),
                fontSize: 15.0,
                fontWeight: FontWeight.w700
              )
            ),
          ),
          actions: const [],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 40,
              ),
              CreditCard(
                cardNumber: cardNumber,
                cardExpiry: expiryDate,
                cardHolderName: cardHolderName,
                cvv: cvv,
                bankName: 'Axis Bank',
                showBackSide: showBack,
                frontBackground: CardBackgrounds.black,
                backBackground: CardBackgrounds.white,
                showShadow: true,
                // mask: getCardTypeMask(cardType: CardType.americanExpress),
              ),
              const SizedBox(
                height: 40,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: TextFormField(
                      onChanged: (value) {
                        setState(() {
                          cardNumber = value;
                        });
                      },
                      style: GoogleFonts.sen(
                        textStyle: const TextStyle(
                          color: Color.fromARGB(255, 11, 18, 42),
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700
                        )
                      ),
                      decoration: InputDecoration(
                        labelText: 'Card Number',
                        labelStyle: GoogleFonts.sen(
                          textStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w700
                          )
                        ),
                        border: InputBorder.none
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 12,
                  ),

                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: TextFormField(
                      onChanged: (value) {
                        setState(() {
                          cardHolderName = value;
                        });
                      },
                      style: GoogleFonts.sen(
                        textStyle: const TextStyle(
                          color: Color.fromARGB(255, 11, 18, 42),
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700
                        )
                      ),
                      decoration: InputDecoration(
                        labelText: 'Cardholder name',
                        labelStyle: GoogleFonts.sen(
                          textStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w700
                          )
                        ),
                        border: InputBorder.none
                      ),
                    ),
                  ),


                  const SizedBox(
                    height: 12,
                  ),

                  Row(
                    children: [

                      Container(
                        width: 144.0,
                        margin: const EdgeInsets.only(left: 20, right: 12.0),
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: TextFormField(
                          onChanged: (value) {
                            setState(() {
                              expiryDate = value;
                            });
                          },
                          style: GoogleFonts.sen(
                            textStyle: const TextStyle(
                              color: Color.fromARGB(255, 11, 18, 42),
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700
                            )
                          ),
                          decoration: InputDecoration(
                              labelText: 'Expiration Date',
                              labelStyle: GoogleFonts.sen(
                                textStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w700
                                )
                              ),
                              border: InputBorder.none
                          ),
                        ),
                      ),

                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(right: 20.0),
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: TextFormField(
                            onChanged: (value) {
                              setState(() {
                                cvv = value;
                              });
                            },
                            style: GoogleFonts.sen(
                                textStyle: const TextStyle(
                                    color: Color.fromARGB(255, 11, 18, 42),
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700
                                )
                            ),
                            decoration: InputDecoration(
                                labelText: 'Security code (CVV/CVC)',
                                labelStyle: GoogleFonts.sen(
                                  textStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w700
                                  )
                                ),
                                border: InputBorder.none
                            ),
                            focusNode: _focusNode
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}