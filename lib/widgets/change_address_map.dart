import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class ChangeAddressMap extends StatelessWidget {
  final double latitude;
  final double longitude;

  const ChangeAddressMap({
    super.key,
    required this.latitude,
    required this.longitude,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: FlutterMap(
          options: MapOptions(
            initialCenter: LatLng(latitude, longitude),
            initialZoom: 15,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.delivery_app',
            ),

            MarkerLayer(
              markers: [
                Marker(
                  point: LatLng(latitude, longitude),
                  width: 50,
                  height: 50,
                  child: const Icon(
                    Icons.location_pin,
                    color: Colors.red,
                    size: 45,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
