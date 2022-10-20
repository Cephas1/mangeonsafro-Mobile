import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scale_button/scale_button.dart';

class AddModifyShippingAddressPage extends StatefulWidget {
  const AddModifyShippingAddressPage({Key? key}) : super(key: key);

  @override
  State<AddModifyShippingAddressPage> createState() => _AddModifyShippingAddressPageState();
}

class _AddModifyShippingAddressPageState extends State<AddModifyShippingAddressPage> with WidgetsBindingObserver {

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
            icon: const Icon(FlutterIcons.chevron_left_ent)
          ),
          title: Text('AJOUTER UNE ADRESSE',
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
                            margin: const EdgeInsets.only(left: 16.0, top: 24.0),
                            child: Text('Nom de l\'adresse',
                              style: GoogleFonts.sen(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w600
                                )
                              ),
                            ),
                          ),

                          Container(
                            margin: const EdgeInsets.only(left: 16.0, top: 8.0, right: 16.0),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                              child: TextField(
                                                onChanged: (value) {
                                                  setState(() {
                                                  });
                                                },
                                                cursorColor: Colors.black,
                                                decoration: const InputDecoration(
                                                  border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(
                                                      Radius.circular(0.0),
                                                    ),
                                                    borderSide: BorderSide(
                                                      color: Colors.black,
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                ),
                                                keyboardType: TextInputType.name,
                                                maxLines: null,
                                                style: GoogleFonts.roboto(
                                                    textStyle: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14.0
                                                    )
                                                ),
                                              )
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),

                          Container(
                            margin: const EdgeInsets.only(left: 16.0, top: 24.0),
                            child: Text('Adresse',
                              style: GoogleFonts.sen(
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.w600
                                  )
                              ),
                            ),
                          ),

                          Container(
                            margin: const EdgeInsets.only(left: 16.0, top: 8.0, right: 16.0),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                              child: TextField(
                                                onChanged: (value) {
                                                  setState(() {
                                                  });
                                                },
                                                cursorColor: Colors.black,
                                                decoration: const InputDecoration(
                                                  border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(
                                                      Radius.circular(0.0),
                                                    ),
                                                    borderSide: BorderSide(
                                                      color: Colors.black,
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                ),
                                                keyboardType: TextInputType.name,
                                                maxLines: null,
                                                style: GoogleFonts.roboto(
                                                  textStyle: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14.0
                                                  )
                                                ),
                                              )
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),

                          Container(
                            margin: const EdgeInsets.only(left: 16.0, top: 24.0),
                            child: Text('Complément d\'adresse',
                              style: GoogleFonts.sen(
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.w600
                                  )
                              ),
                            ),
                          ),

                          Container(
                            margin: const EdgeInsets.only(left: 16.0, top: 8.0, right: 16.0),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                              child: TextField(
                                                onChanged: (value) {
                                                  setState(() {
                                                  });
                                                },
                                                cursorColor: Colors.black,
                                                decoration: const InputDecoration(
                                                  border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(
                                                      Radius.circular(0.0),
                                                    ),
                                                    borderSide: BorderSide(
                                                      color: Colors.black,
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                ),
                                                keyboardType: TextInputType.name,
                                                maxLines: null,
                                                style: GoogleFonts.roboto(
                                                  textStyle: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14.0
                                                  )
                                                ),
                                              )
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),

                          Row(
                            children: [
                              SizedBox(
                                width: 104.0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(left: 16.0, top: 24.0),
                                      child: Text('Code Postal',
                                        style: GoogleFonts.sen(
                                            textStyle: const TextStyle(
                                                fontWeight: FontWeight.w600
                                            )
                                        ),
                                      ),
                                    ),

                                    Container(
                                      margin: const EdgeInsets.only(left: 16.0, top: 8.0, right: 8.0),
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Column(
                                              children: <Widget>[
                                                Row(
                                                  children: <Widget>[
                                                    Expanded(
                                                        child: TextField(
                                                          onChanged: (value) {
                                                            setState(() {
                                                            });
                                                          },
                                                          cursorColor: Colors.black,
                                                          decoration: const InputDecoration(
                                                            border: OutlineInputBorder(
                                                              borderRadius: BorderRadius.all(
                                                                Radius.circular(0.0),
                                                              ),
                                                              borderSide: BorderSide(
                                                                color: Colors.black,
                                                                width: 1.0,
                                                              ),
                                                            ),
                                                          ),
                                                          keyboardType: TextInputType.name,
                                                          maxLines: null,
                                                          style: GoogleFonts.roboto(
                                                              textStyle: const TextStyle(
                                                                  color: Colors.black,
                                                                  fontSize: 14.0
                                                              )
                                                          ),
                                                        )
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(left: 8.0, top: 24.0),
                                      child: Text('Ville',
                                        style: GoogleFonts.sen(
                                            textStyle: const TextStyle(
                                                fontWeight: FontWeight.w600
                                            )
                                        ),
                                      ),
                                    ),

                                    Container(
                                      margin: const EdgeInsets.only(left: 8.0, top: 8.0, right: 16.0),
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Column(
                                              children: <Widget>[
                                                Row(
                                                  children: <Widget>[
                                                    Expanded(
                                                        child: TextField(
                                                          onChanged: (value) {
                                                            setState(() {
                                                            });
                                                          },
                                                          cursorColor: Colors.black,
                                                          decoration: const InputDecoration(
                                                            border: OutlineInputBorder(
                                                              borderRadius: BorderRadius.all(
                                                                Radius.circular(0.0),
                                                              ),
                                                              borderSide: BorderSide(
                                                                color: Colors.black,
                                                                width: 1.0,
                                                              ),
                                                            ),
                                                          ),
                                                          keyboardType: TextInputType.name,
                                                          maxLines: null,
                                                          style: GoogleFonts.roboto(
                                                              textStyle: const TextStyle(
                                                                  color: Colors.black,
                                                                  fontSize: 14.0
                                                              )
                                                          ),
                                                        )
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          Container(
                            margin: const EdgeInsets.only(left: 16.0, top: 24.0),
                            child: Text('Pays',
                              style: GoogleFonts.sen(
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.w600
                                  )
                              ),
                            ),
                          ),

                          Container(
                            margin: const EdgeInsets.only(left: 16.0, top: 8.0, right: 16.0),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                              child: TextField(
                                                onChanged: (value) {
                                                  setState(() {
                                                  });
                                                },
                                                cursorColor: Colors.black,
                                                decoration: const InputDecoration(
                                                  border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(
                                                      Radius.circular(0.0),
                                                    ),
                                                    borderSide: BorderSide(
                                                      color: Colors.black,
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                ),
                                                keyboardType: TextInputType.name,
                                                maxLines: null,
                                                style: GoogleFonts.roboto(
                                                    textStyle: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14.0
                                                    )
                                                ),
                                              )
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),

            ScaleButton(
              onTap: () {} ,
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
                child: Text('AJOUTER',
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