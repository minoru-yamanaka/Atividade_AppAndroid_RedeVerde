import 'package:flutter/material.dart';
import 'package:foto/providers/greate_places.dart';
import 'package:foto/screens/place_form_screen.dart';
import 'package:foto/screens/places_list_screen.dart';
import 'package:foto/utils/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GreatePlaces(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Lugares',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          hintColor: Colors.amber,
          visualDensity: VisualDensity.adaptivePlatformDensity, //Deixa a aplicação responsiva. 
        ),
        home:  PlacesListScreen(),
        routes: {
        AppRoutes.placeForm: (ctx) =>  PlaceFormScreen(),
        },
      ),
    );
  }
}