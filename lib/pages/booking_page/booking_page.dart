// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:lottie/lottie.dart';
// import '../../config/colors.dart';
// import '../../controller/PakingController.dart';
//
// class BookingPage extends StatelessWidget {
//   final String slotName;
//   final String slotId;
//   const BookingPage({super.key, required this.slotId, required this.slotName});
//
//   @override
//   Widget build(BuildContext context) {
//     ParkingController parkingController = Get.put(ParkingController());
//     // WithoutFirebase withoutFirebase = Get.put(WithoutFirebase());
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: blueColor,
//         title: const Text(
//           "BOOK SLOT",
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         iconTheme: const IconThemeData(
//           color: Colors.white,
//         ),
//         centerTitle: true,
//       ),
//       body: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.all(10),
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Lottie.asset(
//                         'assets/animation/running_car.json',
//                         width: 300,
//                         height: 200,
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 20),
//                   const Row(
//                     children: [
//                       Text(
//                         "Book Now 😊",
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       )
//                     ],
//                   ),
//                   Divider(
//                     thickness: 1,
//                     color: blueColor,
//                   ),
//                   SizedBox(height: 30),
//                   const Row(
//                     children: [
//                       Text(
//                         "Enter your name ",
//                       )
//                     ],
//                   ),
//                   SizedBox(height: 10),
//                   Row(
//                     children: [
//                       Expanded(
//                         child: TextFormField(
//                           controller: parkingController.name,
//                           decoration: const InputDecoration(
//                             fillColor: lightBg,
//                             filled: true,
//                             border: InputBorder.none,
//                             prefixIcon: Icon(
//                               Icons.person,
//                               color: blueColor,
//                             ),
//                             hintText: "ZYX Kumar",
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                   SizedBox(height: 30),
//                   const Row(
//                     children: [
//                       Text(
//                         "Enter Vehical Number ",
//                       )
//                     ],
//                   ),
//                   SizedBox(height: 10),
//                   Row(
//                     children: [
//                       Expanded(
//                         child: TextFormField(
//                           controller: parkingController.vehicalNumber,
//                           decoration: const InputDecoration(
//                             fillColor: lightBg,
//                             filled: true,
//                             border: InputBorder.none,
//                             prefixIcon: Icon(
//                               Icons.car_rental,
//                               color: blueColor,
//                             ),
//                             hintText: "WB 04 ED 0987",
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                   SizedBox(height: 20),
//                   const Row(
//                     children: [
//                       Text(
//                         "Choose Slot Time (in Minuits)",
//                       )
//                     ],
//                   ),
//                   SizedBox(height: 10),
//                   Obx(() => Slider(
//                     mouseCursor: MouseCursor.defer,
//                     thumbColor: blueColor,
//                     activeColor: blueColor,
//                     inactiveColor: lightBg,
//                     label: "${parkingController.parkingTimeInMin.value} min",
//                     value: parkingController.parkingTimeInMin.value,
//                     onChanged: (v) {
//                       parkingController.parkingTimeInMin.value = v;
//                       if(v<=30)
//                       {
//                         parkingController.parkingAmount.value=30;
//                       }
//                       else{
//                         parkingController.parkingAmount.value = 60;
//                       }
//                       //  parkingController.parkingAmount.value = (parkingController.parkingTimeInMin.value * 10).round();
//                     },
//                     divisions: 5,
//                     min: 10,
//                     max: 60,
//                   ),),
//                   const   Padding(
//                     padding: const EdgeInsets.only(left: 10, right: 20),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children:  [
//                         Text("10"),
//                         Text("20"),
//                         Text("30"),
//                         Text("40"),
//                         Text("50"),
//                         Text("60"),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: const [
//                       Text(
//                         "Your Slot Name",
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 10),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Container(
//                         width: 100,
//                         height: 80,
//                         decoration: BoxDecoration(
//                           color: blueColor,
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Center(
//                           child: Text(
//                             slotName,
//                             style: TextStyle(
//                               fontSize: 30,
//                               fontWeight: FontWeight.w700,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 80),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         children: [
//                           Row(
//                             children: [
//                               Text("Amount to Be Pay"),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               Icon(
//                                 Icons.currency_rupee,
//                                 size: 30,
//                                 color: blueColor,
//                               ),
//                               Obx(() => Text(
//                                 "${parkingController.parkingAmount.value}",
//                                 style: TextStyle(
//                                   fontSize: 40,
//                                   fontWeight: FontWeight.w700,
//                                   color: blueColor,
//                                 ),
//                               ),)
//                             ],
//                           ),
//                         ],
//                       ),
//                       InkWell(
//                         onTap: () {
//                           // withoutFirebase.makePayment(slotId);
//                           //  withoutFirebase.slot1.value = true;
//                         },
//                         child: Container(
//                           padding:
//                           EdgeInsets.symmetric(horizontal: 60, vertical: 20),
//                           decoration: BoxDecoration(
//                             color: blueColor,
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: Text(
//                             "PAY NOW",
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.w500,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       )
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           )),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../config/colors.dart';
import '../../controller/PakingController.dart';

class BookingPage extends StatelessWidget {
  final String slotName;
  final String slotId;
  const BookingPage({Key? key, required this.slotId, required this.slotName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ParkingController parkingController = Get.put(ParkingController());

    void _bookSlot() {
      // Perform booking logic here
      // For now, let's just print a message
      print("Slot booked!");
    }

    void _showPaymentDialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Confirm Payment"),
            content: Text("Do you want to proceed with the payment?"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                  _bookSlot(); // Book the slot
                },
                child: Text("Yes"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text("No"),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueColor,
        title: const Text(
          "BOOK SLOT",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      'assets/animation/running_car.json',
                      width: 300,
                      height: 200,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                const Row(
                  children: [
                    Text(
                      "Book Now 😊",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                Divider(
                  thickness: 1,
                  color: blueColor,
                ),
                SizedBox(height: 30),
                const Row(
                  children: [
                    Text(
                      "Enter your name ",
                    )
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: parkingController.name,
                        decoration: const InputDecoration(
                          fillColor: lightBg,
                          filled: true,
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.person,
                            color: blueColor,
                          ),
                          hintText: "ZYX Kumar",
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 30),
                const Row(
                  children: [
                    Text(
                      "Enter Vehicle Number ",
                    )
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: parkingController.vehicalNumber,
                        decoration: const InputDecoration(
                          fillColor: lightBg,
                          filled: true,
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.car_rental,
                            color: blueColor,
                          ),
                          hintText: "WB 04 ED 0987",
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                const Row(
                  children: [
                    Text(
                      "Choose Slot Time (in Minutes)",
                    )
                  ],
                ),
                SizedBox(height: 10),
                Obx(
                      () => Slider(
                    mouseCursor: MouseCursor.defer,
                    thumbColor: blueColor,
                    activeColor: blueColor,
                    inactiveColor: lightBg,
                    label: "${parkingController.parkingTimeInMin.value} min",
                    value: parkingController.parkingTimeInMin.value,
                    onChanged: (v) {
                      parkingController.parkingTimeInMin.value = v;
                      if (v <= 30) {
                        parkingController.parkingAmount.value = 30;
                      } else {
                        parkingController.parkingAmount.value = 60;
                      }
                      //  parkingController.parkingAmount.value = (parkingController.parkingTimeInMin.value * 10).round();
                    },
                    divisions: 5,
                    min: 10,
                    max: 60,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("10"),
                      Text("20"),
                      Text("30"),
                      Text("40"),
                      Text("50"),
                      Text("60"),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Your Slot Name",
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 100,
                      height: 80,
                      decoration: BoxDecoration(
                        color: blueColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          slotName,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Text("Amount to Be Paid"),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.currency_rupee,
                              size: 30,
                              color: blueColor,
                            ),
                            Obx(
                                  () => Text(
                                "${parkingController.parkingAmount.value}",
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w700,
                                  color: blueColor,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        _showPaymentDialog(); // Show payment confirmation dialog
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 60, vertical: 20),
                        decoration: BoxDecoration(
                          color: blueColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "PAY NOW",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
