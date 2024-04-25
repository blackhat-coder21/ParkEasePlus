import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

import '../config/colors.dart';
import 'MarkerDetailsBottomSheet.dart';


class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  LatLng _center = const LatLng(45.521563, -122.677433);
  late GoogleMapController mapController;
  bool _loading = true;
  MarkerId? _selectedMarkerId;

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  void _getUserLocation() async {
    // Fetch user's location and set it as the center
    setState(() {
      _loading = true;
    });
    // Simulated user location for demonstration purposes
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      _center = LatLng(25.43189481661589, 81.77100976715644);
      _loading = false;
    });
    mapController.animateCamera(CameraUpdate.newLatLngZoom(_center, 15));
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _openMarkerDetails(MarkerId markerId) {
    // Set the selected marker ID to show details
    setState(() {
      _selectedMarkerId = markerId;
    });
  }

  void _closeMarkerDetails() {
    // Clear the selected marker ID to hide details
    setState(() {
      _selectedMarkerId = null;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueColor,
        title: Text(
          "CAR PARKING",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
            markers: {
              Marker(
                markerId: MarkerId('parking_2'),
                position: LatLng(25.43189481661589, 81.77100976715644),
                onTap: () {
                  _openMarkerDetails(MarkerId('parking_2'));
                },
              ),
              Marker(
                markerId: MarkerId('parking_3'),
                position: LatLng(25.430154274957776, 81.77214426349292),
                onTap: () {
                  _openMarkerDetails(MarkerId('parking_3'));
                },
              ),
              Marker(
                markerId: MarkerId('parking_4'),
                position: LatLng(25.428372733724473, 81.77286038756941),
                onTap: () {
                  _openMarkerDetails(MarkerId('parking_4'));
                },
              ),
            },
            myLocationButtonEnabled: true,
          ),
          if (_loading)
            Center(
              child: CircularProgressIndicator(),
            ),
          if (_selectedMarkerId != null)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.white,
                child: MarkerDetailsBottomSheet(
                  markerId: _selectedMarkerId!,
                  onClose: _closeMarkerDetails,
                ),
              ),
            ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _getUserLocation,
      //   child: Icon(Icons.my_location),
      //   backgroundColor: blueColor,
      // ),
    );
  }
}
