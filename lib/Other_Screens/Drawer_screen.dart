import 'package:emma_ui_project/Utils/App_Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Get bottom navigation height
          double bottomNavHeight = kBottomNavigationBarHeight;

          return SingleChildScrollView(
            // Wrap content in SingleChildScrollView
            child: Container(
              padding: EdgeInsets.only(
                  bottom: bottomNavHeight), // Leave space for bottom nav
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Align to start
                  children: [
                    SizedBox(height: 18.h),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Hi, Emma",
                        style: TextStyle(
                          color: AppColors.purple,
                          fontSize: 30.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Profile Section
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Add back button functionality here
                        InkWell(
                          onTap: () {
                            Navigator.pop(
                                context); // This will take you back to the previous screen
                          },
                          child: IconButton(
                            icon: Icon(Icons.arrow_back, size: 24.sp),
                            onPressed: () {
                              Navigator.pop(
                                  context); // This will also take you back to the previous screen
                            },
                          ),
                        ),
                        Row(
                          children: [
                            // Profile Image
                            CircleAvatar(
                              radius: 30.r,
                              backgroundImage:
                                  const AssetImage("Assets/Profile_Pic.png"),
                            ),
                            SizedBox(width: 16.w),
                            // User Info (Name and Email)
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Claudia Alves",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    "Claudia_Alves23@gmail.com",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12.sp,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    Divider(thickness: 1, indent: 15.w, endIndent: 15.w),

                    // Information Section
                    _buildSectionHeader("Information"),
                    _buildListTile(Icons.edit_outlined, 'Edit Profile'),
                    _buildListTile(Icons.person_outline, 'Username'),
                    _buildListTile(Icons.email_outlined, 'E-mail'),
                    _buildListTile(Icons.lock_outline, 'Password'),

                    Divider(thickness: 1, indent: 15.w, endIndent: 15.w),

                    // Preferences Section
                    _buildSectionHeader("Preferences"),
                    _buildListTile(
                        Icons.notifications_outlined, 'Notification'),
                    _buildListTile(Icons.language_outlined, 'Language'),
                    _buildListTile(Icons.shortcut_outlined, 'Shortcuts'),
                    _buildListTile(Icons.color_lens_outlined, 'Theme'),

                    Divider(thickness: 1, indent: 15.w, endIndent: 15.w),

                    // Account Section
                    _buildSectionHeader("Account"),
                    _buildListTile(Icons.add_outlined, 'Add Account'),
                    _buildListTile(
                        Icons.switch_account_outlined, 'Switch Account'),
                    _buildListTile(Icons.logout_outlined, 'Log Out'),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildListTile(IconData icon, String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: ListTile(
        leading: Icon(icon, size: 20.sp),
        title: Text(
          title,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
        ),
        onTap: () {},
        visualDensity: VisualDensity(vertical: -4), // Minimum allowed density
        minVerticalPadding: 0, // Removes additional padding
        contentPadding: EdgeInsets.zero, // Tightens overall padding
      ),
    );
  }
}
