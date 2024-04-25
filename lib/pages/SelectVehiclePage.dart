import 'package:flutter/material.dart';
import 'package:park_ease/pages/homepage/homepage.dart';


class SelectVehiclePage extends StatefulWidget {
  @override
  _SelectVehiclePageState createState() => _SelectVehiclePageState();
}

class _SelectVehiclePageState extends State<SelectVehiclePage> {
  // Sample list of vehicles with name and vehicle number
  final List<Map<String, String>> vehicles = [
    {'name': 'BMW X7', 'number': 'BR46H031'},
    {'name': 'Truck', 'number': 'XYZ789'},
    {'name': 'Motorcycle', 'number': 'DEF456'},
    {'name': 'Bicycle', 'number': 'GHI789'},
    {'name': 'Bus', 'number': 'JKL012'},
  ];

  String? selectedVehicle;

  void _showAddVehicleDialog() {
    String vehicleName = '';
    String vehicleNumber = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add New Vehicle'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Vehicle Name'),
                onChanged: (value) {
                  vehicleName = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Vehicle Number'),
                onChanged: (value) {
                  vehicleNumber = value;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Add your logic to add the new vehicle
                setState(() {
                  vehicles.add({'name': vehicleName, 'number': vehicleNumber});
                });
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose a Vehicle'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: vehicles.length + 1, // Add 1 for the "Add New Vehicle" button
              itemBuilder: (context, index) {
                if (index == vehicles.length) {
                  // Render the "Add New Vehicle" button at the end
                  return ListTile(
                    title: ElevatedButton(
                      onPressed: () {
                        _showAddVehicleDialog();
                      },
                      child: Text('Add New Vehicle'),
                    ),
                  );
                } else {
                  final vehicle = vehicles[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedVehicle = vehicle['number'];
                      });
                    },
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0xFFe3f2fd),
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: selectedVehicle == vehicle['number']
                              ? Colors.red // Change border color to blue if selected
                              : Colors.transparent, // Otherwise, transparent border
                        ),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      child: Center(
                        child: Row(
                          children: [
                            SizedBox(width: 12,),
                            Image.asset(
                              'assets/images/car.png', // Car icon
                              height: 48.0, // Adjust height as needed
                              width: 48.0, // Adjust width as needed
                            ),
                            SizedBox(width: 20.0), // Add some space between image and text
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  vehicle['name']!, // Vehicle name
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                                SizedBox(height: 4.0),
                                Text(
                                  '${vehicle['number']}',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(), // Added spacer to push the icon to the right
                            selectedVehicle == vehicle['number']
                                ? Icon(Icons.circle_rounded, color: Colors.red) // Use red filled circle if selected
                                : Icon(Icons.circle_outlined, color: Colors.black,),
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
          SizedBox(height: 10), // Add some space between the buttons
          ElevatedButton(
            onPressed: () {
              // Add your logic for the "Continue" button
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage())); // Replace the current route with the homepage

            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // Set the background color to blue
            ),
            child: Text('Continue'),
          ),
        ],
      ),
    );
  }
}
