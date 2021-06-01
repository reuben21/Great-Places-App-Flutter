import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:great_places_app/colors.dart';
import 'package:great_places_app/providers/great_places.dart';
import 'package:great_places_app/screens/add_place_screen.dart';
import 'package:great_places_app/screens/place_list_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
        title: 'Flutter Demo',debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryIconTheme:
          IconThemeData(color: kSecondaryColor),


          primaryColorLight: kPrimaryColor,
          primaryColor: kPrimaryColor,
          accentColor: kPrimaryColorAccent,
          textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: GoogleFonts.roboto(fontSize: 15,color:kPrimaryColorAccent ),
            headline5:  GoogleFonts.roboto(fontSize: 12,color:kPrimaryColorAccent ),
            headline4:  GoogleFonts.roboto(fontSize: 14,color:kPrimaryColorAccent ),
            headline3:  GoogleFonts.roboto(fontSize: 16,color:kSecondaryColor ),
            headline2:  GoogleFonts.roboto(fontSize: 18,color:kPrimaryColorAccent ),
            headline1:  GoogleFonts.lato(fontSize: 25,color:kPrimaryColorAccent ),
          ),
        ),

        home: PlacesListScreen(),
        routes: {
          AddPlaceScreen.routeName: (ctx)=>AddPlaceScreen(),
        },
      ),
    );
  }
}