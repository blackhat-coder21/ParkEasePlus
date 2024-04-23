import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import '../../utils/constants/colors.dart';



class Profile_screen extends StatelessWidget {
  static const String route_name = "/profile";
  Profile_screen({super.key});

  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color.fromRGBO(230, 240, 248, 1.0),
      // Color.fromRGBO(220, 240, 248, 1.0),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade200,
        title: Text("Profile"),
        centerTitle: true,
      ),

      /// ---> body
      body: SingleChildScrollView(
        child: Column(

          children: [
            const SizedBox(height: 10,),

            ClipPath(
              clipper: profile_clipper(),
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color:Colors.white,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 14,),
                    Stack(
                        children : [
                          const CircleAvatar(
                            radius: 60,
                            backgroundImage: AssetImage('assets/images/profile.jpg'), // Image asset
                            backgroundColor: Colors.white,
                          ),

                          // /// edit profile option
                          // Positioned(
                          //     right: 0,
                          //     bottom: 0,
                          //     child: Container(
                          //       decoration: BoxDecoration(
                          //           borderRadius: BorderRadius.circular(100),
                          //           color: Custom_colors.soft_grey,
                          //           border: Border.all(color: Custom_colors.grey)
                          //       ),
                          //       child: Padding(
                          //         padding: const EdgeInsets.all(4.0),
                          //         child: Center(child: Icon(Iconsax.edit,color: Custom_colors.dark_grey,)),
                          //       ),)
                          // )
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: GestureDetector(
                              onTap: () {
                                _selectImage(context);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Custom_colors.soft_grey,
                                  border: Border.all(color: Custom_colors.grey),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                    child: Icon(
                                      Iconsax.edit,
                                      color: Custom_colors.dark_grey,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]
                    ),

                    const SizedBox(height: 16,),

                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Name',
                                contentPadding: EdgeInsets.symmetric(vertical: 12.0,horizontal: 12),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value == null) {
                                  return 'Please enter your name';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20.0),
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Email',
                                contentPadding: EdgeInsets.symmetric(vertical: 12.0,horizontal: 12),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value == null) {
                                  return 'Please enter your email';
                                }
                                // Additional email validation logic can be added here
                                return null;
                              },
                            ),
                            const SizedBox(height: 20.0),
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Phone Number',
                                contentPadding: EdgeInsets.symmetric(vertical: 12.0,horizontal: 12),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value == null) {
                                  return 'Please enter your phone number';
                                }
                                // Additional phone number validation logic can be added here
                                return null;
                              },
                            ),
                            const SizedBox(height: 20.0),
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Address',
                                contentPadding: EdgeInsets.symmetric(vertical: 12.0,horizontal: 12),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value == null) {
                                  return 'Please enter your address';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20.0),
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Gender',
                                contentPadding: EdgeInsets.symmetric(vertical: 12.0,horizontal: 12),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              obscureText: true,
                              validator: (value) {
                                if (value == null) {
                                  return 'Select your gender';
                                }
                                return null;
                              },
                            ),

                            const SizedBox(height: 48.0),


                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: SizedBox(
                                width: double.infinity,
                                child:
                                ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      // Perform action when the button is pressed
                                    }
                                  },
                                  child: Text('Save changes'),
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white, backgroundColor: Colors.deepPurple,
                                    elevation: 2, // Elevation
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: EdgeInsets.symmetric(vertical: 14),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16,)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _selectImage(BuildContext context) async {
  final picker = ImagePicker();
  final pickedImage = await picker.pickImage(source: ImageSource.gallery);

  if (pickedImage != null) {
    // Now you can use pickedImage.path to set the profile image
    // For demonstration, let's just print the path
    print(pickedImage.path);
  }
}



class profile_clipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, 90);
    path.lineTo(size.width*1.5/5 - 30 , 90);

    path.quadraticBezierTo(size.width *1.5/5 - 5 , 80 , size.width *1.5/5, 70);

    path.quadraticBezierTo(size.width *1/2 , - 15 , size.width * 3.5/5, 70);

    path.quadraticBezierTo(size.width *3.5/5 + 5 , 80 , size.width *3.5/5+ 30, 90);
    path.lineTo(size.width, 90);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }

}