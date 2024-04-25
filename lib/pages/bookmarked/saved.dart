import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ParkingSpot {
  final String spotId;
  final String title;
  final String address;
  final String imageUrl;
  bool isBookmarked;

  ParkingSpot({
    required this.spotId,
    required this.title,
    required this.address,
    required this.imageUrl,
    this.isBookmarked = false,
  });
}

class BookmarkedSpotsScreen extends StatefulWidget {
  @override
  _BookmarkedSpotsScreenState createState() => _BookmarkedSpotsScreenState();
}

class _BookmarkedSpotsScreenState extends State<BookmarkedSpotsScreen> {
  List<ParkingSpot> savedSpots = [];
  String user = "himanshurajhr8";

  @override
  void initState() {
    super.initState();
    _fetchSavedSpots();
  }

  Future<void> _fetchSavedSpots() async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(user)
          .collection('savedSpots')
          .get();

      List<ParkingSpot?> parkingSpots = await Future.wait(snapshot.docs.map((doc) async {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        // Get the value of the 'spot_id' field
        String spotId = data['spot_id'];
        print("spotId: $spotId");

        // Fetch details of the spot from the 'parkSpot' collection
        DocumentSnapshot spotSnapshot = await FirebaseFirestore.instance
            .collection('parkSpot')
            .doc(spotId)
            .get();

        // Check if the spot exists
        if (spotSnapshot.exists) {
          Map<String, dynamic> spotData = spotSnapshot.data() as Map<String, dynamic>;
          // Create a ParkingSpot object using the fetched details
          return ParkingSpot(
            spotId: spotId,
            title: spotData['name'],
            address: spotData['add'],
            imageUrl: spotData['imgPath'],
          );
        } else {
          // If the spot does not exist, return null or handle it accordingly
          return null;
        }
      }).toList());

      // Remove any null values from the list
      parkingSpots.removeWhere((spot) => spot == null);

      // Set the state with the filtered list of ParkingSpot objects
      setState(() {
        savedSpots = parkingSpots.cast<ParkingSpot>();
      });
    } catch (error) {
      print('Error fetching saved spots: $error');
    }
  }

  Future<void> _refresh() async {
    await _fetchSavedSpots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookmarked Spots'),
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(), // Ensure that scrolling is always enabled
          child: Column(
            children: savedSpots.map((spot) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                child: Container(
                  height: 140, // Adjusted height
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 10,),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          spot.imageUrl,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                spot.title,
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              SizedBox(height: 4),
                              Text(
                                spot.address,
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.bookmark,
                          color: Colors.blue,
                        ),
                        onPressed: () => _confirm(spot),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Future<void> _confirm(ParkingSpot spot) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Remove from Bookmarks?'),
          content: Text('Are you sure you want to remove this spot from bookmarks?'),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                   savedSpots.remove(spot);
                });
                Navigator.pop(context);
              },
              child: Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('No'),
            ),
          ],
        );
      },
    );
  }
}
