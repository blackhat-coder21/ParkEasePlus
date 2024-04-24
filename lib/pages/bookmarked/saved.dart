import 'package:flutter/material.dart';

class ParkingSpot {
  final String title;
  final String address;
  final String imageUrl;
  bool isBookmarked;

  ParkingSpot({
    required this.title,
    required this.address,
    required this.imageUrl,
    this.isBookmarked = false,
  });
}

class Saved {
  List<ParkingSpot> _bookmarkedSpots = [];

  List<ParkingSpot> get bookmarkedSpots => _bookmarkedSpots;

  void addBookmark(ParkingSpot spot) {
    if (!_bookmarkedSpots.contains(spot)) {
      _bookmarkedSpots.add(spot);
    }
  }

  void removeBookmark(ParkingSpot spot) {
    _bookmarkedSpots.remove(spot);
  }

  bool isSpotBookmarked(ParkingSpot spot) {
    return _bookmarkedSpots.contains(spot);
  }
}

class BookmarkedSpotsScreen extends StatefulWidget {
  @override
  _BookmarkedSpotsScreenState createState() => _BookmarkedSpotsScreenState();
}

class _BookmarkedSpotsScreenState extends State<BookmarkedSpotsScreen> {
  Saved saved = Saved();

  @override
  void initState() {
    super.initState();
    // Adding dummy data
    saved.addBookmark(ParkingSpot(
      title: 'Parking Spot 1',
      address: '123 Street, City',
      imageUrl: 'https://via.placeholder.com/150',
    ));
    saved.addBookmark(ParkingSpot(
      title: 'Parking Spot 2',
      address: '456 Avenue, Town',
      imageUrl: 'https://via.placeholder.com/150',
    ));
    saved.addBookmark(ParkingSpot(
      title: 'Parking Spot 3',
      address: '518 Cape, Town',
      imageUrl: 'https://via.placeholder.com/150',
    ));
    saved.addBookmark(ParkingSpot(
      title: 'Parking Spot 4',
      address: '678 Park, Avenue',
      imageUrl: 'https://via.placeholder.com/150',
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookmarked Spots'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: saved.bookmarkedSpots.map((spot) {
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
    );
  }

  Future<void> _confirm(spot) async {
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(18),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Remove from Bookmark?',
                style: TextStyle(fontSize: 24, color: Colors.red, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Divider(
                color: Colors.grey,
                height: 20,
                thickness: 1,
                indent: 0,
                endIndent: 0,
              ),
              SizedBox(height: 16),
              Center(
                child: Text(
                  'Are you sure you want to remove from Bookmark?',
                  style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        saved.removeBookmark(spot);
                      });
                      Navigator.pop(context); // Close modal
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.blue,
                      side: BorderSide(color: Colors.blue), // Border color
                    ),
                    child: Text('Yes, Remove'),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context); // Close modal
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.blue),
                    ),
                    child: Text('Cancel'),
                  ),
                ],
              ),
              SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}
