import 'package:flutter/material.dart';
import '../../../config/colors.dart';
import '../../../utils/devices_utils/device_util.dart';


// Class to represent parking spot data
class ParkingSpot {
  final String title;
  final String address;
  final String imageUrl;
  final double cost;
  final String paymentStatus;

  ParkingSpot({
    required this.title,
    required this.address,
    required this.imageUrl,
    required this.cost,
    required this.paymentStatus,
  });
}

class OngoingTab extends StatelessWidget {
  final List<ParkingSpot> parkingSpots = [
    ParkingSpot(
      title: 'Parking Spot 1',
      address: '123 Street, City',
      imageUrl: 'https://tse4.mm.bing.net/th?id=OIP.4h2aHn4eNs4qAVk5P9sO1QHaEO&pid=Api&P=0&h=180',
      cost: 10.0,
      paymentStatus: 'Pending',
    ),
    ParkingSpot(
      title: 'Parking Spot 2',
      address: '456 Avenue, Town',
      imageUrl: 'https://tse3.mm.bing.net/th?id=OIP.6B7ofsyutpZYMY1hZF8iTQHaFj&pid=Api&P=0&h=180',
      cost: 15.0,
      paymentStatus: 'Failed',
    ),
    ParkingSpot(
      title: 'Parking Spot 3',
      address: '985 Cape, Town',
      imageUrl: 'https://tse1.mm.bing.net/th?id=OIP.L2DC3-xxRAg2r69F8DYfEwHaFj&pid=Api&P=0&h=180',
      cost: 15.0,
      paymentStatus: 'Paid',
    ),
    // Add more parking spots as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: parkingSpots.map((spot) {
            return Container(
              margin: EdgeInsets.only(top: 25, left: 5, right: 5),
              padding: EdgeInsets.all(10), // Add padding for content
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey), // Add grey border
                borderRadius: BorderRadius.circular(8), // Add border radius
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          spot.imageUrl,
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: Device_util.get_width(context)*0.05),
                      Column(
                        children: [
                          Text(
                            spot.title,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          SizedBox(height: 5),
                          Text(spot.address),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Text('Cost: '),
                              Text('₹${spot.cost.toString()}', style: TextStyle(color: blueColor, fontWeight: FontWeight.bold),),
                              Text('/hrs'),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              // Text('Payment Status: ${spot.paymentStatus}',),
                              Text('Payment Status: '),
                              if (spot.paymentStatus == 'Paid')
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.green, width: 2),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                    spot.paymentStatus,
                                    style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                                  ),
                                )
                              else if (spot.paymentStatus == 'Pending')
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                    // color: Colors.yellow,
                                      border: Border.all(color: Colors.yellow, width: 2),
                                    borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Text(
                                    spot.paymentStatus,
                                    style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),
                                    ),
                                  )
                              else
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                    spot.paymentStatus,
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                  SizedBox(height: 25),
                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: ()=> _confirm(context),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: blueColor, backgroundColor: Colors.white,
                          side: BorderSide(color: blueColor), // Border color
                        ),
                        child: Text('Cancel Booking'),
                      ),
                      SizedBox(width: Device_util.get_width(context)*0.15,),
                      ElevatedButton(
                        onPressed: () => _viewTicket(context, spot),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white, backgroundColor: blueColor,
                          side: BorderSide(color: blueColor), // Border color
                        ),
                        child: Text('View Ticket'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Future<void> _confirm(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(18),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Cancel Parking',
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
                  'Are you sure you want to cancel your Parking Reservation?',
                  style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10,),
              Center(
                child: Text(
                  'No refund will be made for your payment according to our policy',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      // Implement view ticket action
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: blueColor,
                      side: BorderSide(color: blueColor), // Border color
                    ),
                    child: Text('Yes, Continue'),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context); // Close the bottom sheet
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: blueColor),
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

  Future<void> _viewTicket(BuildContext context, ParkingSpot spot) async {
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(18),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Parking Ticket',
                style: TextStyle(fontSize: 24, color: blueColor, fontWeight: FontWeight.bold),
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
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(spot.imageUrl),
                ),
                title: Text(spot.title),
                subtitle: Text(spot.address),
                trailing: Text(
                  'Cost: \$${spot.cost.toString()} /hrs\nPayment Status: ${spot.paymentStatus}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Close the bottom sheet
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: blueColor,
                  side: BorderSide(color: blueColor),
                ),
                child: Text('Close'),
              ),
              SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}
