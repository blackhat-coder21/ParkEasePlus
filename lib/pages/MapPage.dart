import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../config/colors.dart';
import 'MarkerDetailsBottomSheet.dart';

class ParkingSpot {
  final String name;
  final String address;
  final String imagePath;
  final double latitude;
  final double longitude;
  final double price;
  final double rating;
  final String timing;
  final String desc;
  final String id;

  ParkingSpot({
    required this.name,
    required this.address,
    required this.imagePath,
    required this.latitude,
    required this.longitude,
    required this.price,
    required this.rating,
    required this.timing,
    required this.desc,
    required this.id,
  });
}

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;
  bool _loading = true;
  MarkerId? _selectedMarkerId;
  List<ParkingSpot> _parkingSpots = [];

  @override
  void initState() {
    super.initState();
    _getUserLocation();
    _fetchMarkersData();
  }

  void _getUserLocation() async {
    // Fetch user's location and set it as the center
    setState(() {
      _loading = true;
    });
    // Simulated user location for demonstration purposes
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      _loading = false;
    });
  }

  void _fetchMarkersData() async {
    // Fetch marker data from Firestore
    final QuerySnapshot allPlacesSnapshot =
    await FirebaseFirestore.instance.collection('allplace').get();

    final List spotIds =
    allPlacesSnapshot.docs.map((doc) => doc['spot_id']).toList();

    final List<DocumentSnapshot<Map<String, dynamic>>> parkSpotsSnapshot =
    await Future.wait(
      spotIds.map((spotId) =>
          FirebaseFirestore.instance.collection('parkSpot').doc(spotId).get()),
    );

    final List<ParkingSpot> parkingSpots = parkSpotsSnapshot.map((doc) {
      final data = doc.data() ?? {};
      return ParkingSpot(
        name: data['name'] ?? '',
        address: data['add'] ?? '',
        imagePath: data['imgPath'] ?? '',
        latitude: double.parse(data['lat'] ?? '0'),
        longitude: double.parse(data['long'] ?? '0'),
        price: double.parse(data['price'] ?? '0'),
        rating: double.parse(data['rating'] ?? '0'),
        timing: data['timing'] ?? '',
        desc: data['desc'] ?? '',
        id: data['id'] ?? ''
      );
    }).toList();

    setState(() {
      _parkingSpots = parkingSpots;
    });
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
              target: LatLng(25.43189481661589, 81.77100976715644),
              zoom: 11.0,
            ),
            markers: _parkingSpots.map((spot) {
              final MarkerId markerId = MarkerId(spot.name);
              final LatLng position = LatLng(spot.latitude, spot.longitude);
              print("IMG "+spot.imagePath);
              return Marker(
                markerId: markerId,
                position: position,
                onTap: () {
                  _openMarkerDetails(markerId);
                },
                // infoWindow: InfoWindow(
                //   title: spot.name,
                //   snippet: 'Lat: ${spot.latitude}, Long: ${spot.longitude}',
                // ),
              );
            }).toSet(),
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
                  spot: _parkingSpots.firstWhere((spot) => spot.name == _selectedMarkerId!.value),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
