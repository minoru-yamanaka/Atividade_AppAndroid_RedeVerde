import 'package:flutter/material.dart';
import 'package:foto/providers/greate_places.dart';
import 'package:foto/utils/app_routes.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Lugares'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.placeForm);
            },
          ),
        ],
      ),
      body: Consumer<GreatePlaces>(
        child: const Center(child: Text('Nenhum local cadastrado!')),
        builder: (context, greatePlaces, ch) => greatePlaces.itemsCount == 0
            ? ch!
            : ListView.builder(
                itemCount: greatePlaces.itemsCount,
                itemBuilder: (context, i) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(
                      greatePlaces.itemByIndex(i).image,
                    ),
                  ),
                  title: Text(greatePlaces.itemByIndex(i).title),
                  onTap: () {},
                ),
              ),
      ),
    );
  }
}
