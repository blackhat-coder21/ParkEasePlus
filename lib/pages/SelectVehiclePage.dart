import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:park_ease/pages/homepage/homepage.dart';

class SelectVehiclePage extends StatefulWidget {
  @override
  _SelectVehiclePageState createState() => _SelectVehiclePageState();
}

class _SelectVehiclePageState extends State<SelectVehiclePage> {
  String? selectedVehicle;
  String user = "himanshurajhr8";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Choose a Vehicle'),
    ),
    body: StreamBuilder
      (
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(user)
          .collection('vehicles')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData) {
          return Center(child: Text('No vehicles found.'));
        }
        // Now you have the list of vehicles for the user
        final vehicles =
        snapshot.data!.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();

        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: vehicles.length + 1,
                itemBuilder: (context, index) {
                  if (index == vehicles.length) {
                    return ListTile(
                      title: ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              String newVehicleName = '';
                              String newVehicleNumber = '';

                              return AlertDialog(
                                title: Text('Add New Vehicle'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextField(
                                      onChanged: (value) {
                                        newVehicleName = value;
                                      },
                                      decoration: InputDecoration(
                                        labelText: 'Vehicle Name',
                                      ),
                                    ),
                                    TextField(
                                      onChanged: (value) {
                                        newVehicleNumber = value;
                                      },
                                      decoration: InputDecoration(
                                        labelText: 'Vehicle Number',
                                      ),
                                    ),
                                  ],
                                ),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      // Validate input fields
                                      if (newVehicleName.isNotEmpty &&
                                          newVehicleNumber.isNotEmpty) {
                                        // Add the new vehicle to Firestore
                                        FirebaseFirestore.instance
                                            .collection('users')
                                            .doc(user)
                                            .collection('vehicles')
                                            .add({
                                          'vehicleName': newVehicleName,
                                          'vehicleId': newVehicleNumber,
                                        }).then((value) {
                                          // Close the dialog
                                          Navigator.pop(context);
                                        }).catchError((error) {
                                          // Handle errors if any
                                          print("Failed to add vehicle: $error");
                                        });
                                      }
                                    },
                                    child: Text('Add'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      // Close the dialog
                                      Navigator.pop(context);
                                    },
                                    child: Text('Cancel'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Text('Add New Vehicle'),
                      ),
                    );
                  }
                  else {
                    final vehicle = vehicles[index];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedVehicle = vehicle['vehicleId'];
                        });
                      },
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color(0xFFe3f2fd),
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: selectedVehicle ==
                                vehicle['vehicleId']
                                ? Colors.red
                                : Colors.transparent,
                          ),
                        ),
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Center(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 12,
                              ),
                              Image.asset(
                                'assets/images/car.png',
                                height: 48.0,
                                width: 48.0,
                              ),
                              SizedBox(width: 20.0),
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  Text(
                                    vehicle['vehicleName']!,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  SizedBox(height: 4.0),
                                  Text(
                                    '${vehicle['vehicleId']}',
                                    style: TextStyle(
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              selectedVehicle ==
                                  vehicle['vehicleId']
                                  ? Icon(Icons.circle_rounded,
                                  color: Colors.red)
                                  : Icon(Icons.circle_outlined,
                                  color: Colors.black),
                              SizedBox(width: 12),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomePage()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: Text('Continue'),
            ),
          ],
        );
      },
    ),
    );
  }
}
