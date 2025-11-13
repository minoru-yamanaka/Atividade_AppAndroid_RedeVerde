import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:foto/models/place.dart'; // Precisamos disso para o PlaceLocation

class LocationInput extends StatefulWidget {
  final Function(PlaceLocation) onSelectLocation;

  const LocationInput(this.onSelectLocation, {Key? key}) : super(key: key);

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImageUrl;
  bool _isLoading = false;

  Future<void> _getCurrentUserLocation() async {
    setState(() {
      _isLoading = true;
    });

    try {
      Location location = Location();
      bool serviceEnabled;
      PermissionStatus permissionGranted;
      LocationData locationData;

      serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          return;
        }
      }

      permissionGranted = await location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) {
          return;
        }
      }

      locationData = await location.getLocation();

      if (locationData.latitude == null || locationData.longitude == null)
        return;

      final selectedLocation = PlaceLocation(
        latitude: locationData.latitude!,
        longitude: locationData.longitude!,
      );

      // Simplesmente mostra o Lat/Lng.
      // Você poderia usar uma API como Google Static Maps aqui para mostrar uma imagem.
      setState(() {
        _previewImageUrl =
            'Lat: ${locationData.latitude}, Lng: ${locationData.longitude}';
      });

      widget.onSelectLocation(selectedLocation);
    } catch (e) {
      // Tratar erro
      print("Erro ao pegar localização: $e");
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: _isLoading
              ? const CircularProgressIndicator()
              : _previewImageUrl == null
              ? const Text(
                  'Localização não informada!',
                  textAlign: TextAlign.center,
                )
              : Text(_previewImageUrl!),
        ),
        const SizedBox(height: 10),
        ElevatedButton.icon(
          icon: const Icon(Icons.location_on),
          label: const Text('Localização Atual'),
          onPressed: _getCurrentUserLocation,
        ),
      ],
    );
  }
}
