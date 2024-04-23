import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:park_ease/pages/profile_page/section_heading.dart';
import 'package:park_ease/pages/profile_page/settings_menu_tile.dart';
import 'Profile_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 20),
            color: Colors.blue, // Replace with your primary color
            child: Column(
              children: [
                SizedBox(height: 12,),

                // User profile card
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: CircleAvatar(
                        radius: MediaQuery.of(context).size.height * 0.05,
                        backgroundImage: const AssetImage("assets/images/profile.jpg"),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Ankit Kumar",
                            style: Theme.of(context).textTheme.headlineMedium!.apply(color: Colors.white),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "ankit@gmail.com",
                            style: Theme.of(context).textTheme.bodySmall!.apply(color: Colors.white.withOpacity(0.8)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Profile_screen()),
                          );
                        },
                        icon: const Icon(Iconsax.edit, color: Colors.white, size: 28),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),

          // Body
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Column(
                  children: [
                    // Account settings
                    const Custom_section_heading(title: "Account Settings", showActionButton: true),
                    const SizedBox(height: 8),
                    const Settings_menu_tile(icon: Iconsax.safe_home, title: "My Addresses", sub_title: "Set delivery addresses",),
                    const Settings_menu_tile(icon: Iconsax.heart , title: "Saved Spot", sub_title: "Add remove products and move to checkout"),
                    const Settings_menu_tile(icon: Iconsax.bag_tick , title: "My Bookings", sub_title: "In progress and completed orders"),
                    const Settings_menu_tile(icon: Iconsax.discount_shape , title: "My Coupons", sub_title: "List of all the discounted coupons"),
                    const Settings_menu_tile(icon: Iconsax.notification , title: "Notification", sub_title: "Set any kind of notification message"),
                    const Settings_menu_tile(icon: Iconsax.security_card , title: "Account Privacy", sub_title: "Manage data usage and connected accounts"),
                    // Add other settings menu tiles here

                    const SizedBox(height: 32),

                    // App settings
                    const Custom_section_heading(title: "App Settings", showActionButton: false),
                    const SizedBox(height: 8),
                    Settings_menu_tile(
                      icon: Iconsax.location,
                      title: 'Geolocation',
                      sub_title: "Set recommendations based on location",
                      trailing: Switch(value: true, onChanged: (value) {}),
                    ),

                    const SizedBox(height: 32),

                    // Logout
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () => _logout(context),
                          style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.red, width: 2)),
                          child: Text(
                            "Logout",
                            style: Theme.of(context).textTheme.headlineSmall!.apply(color: Colors.red),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _logout(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(18),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Logout',
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
              Text(
                'Are you sure you want to logout?',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context); // Close the bottom sheet
                      // Perform logout action
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.blue),
                    ),
                    child: Text('Yes, Logout'),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context); // Close the bottom sheet
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
