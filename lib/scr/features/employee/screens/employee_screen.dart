import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shubhithasenergysolutions/scr/constants/colors.dart';
import 'package:shubhithasenergysolutions/scr/features/core/screens/dashboard/fragments/home_fragment.dart';
import 'package:shubhithasenergysolutions/scr/features/core/screens/dashboard/fragments/pdf_files_fragment.dart';
import 'package:shubhithasenergysolutions/scr/features/core/screens/dashboard/fragments/profile_screen.dart';
import 'package:shubhithasenergysolutions/scr/features/employee/screens/fragments/client_data_upload.dart';

class employeeScreen extends StatefulWidget {
  const employeeScreen({super.key});

  @override
  State<employeeScreen> createState() => _employeeScreenState();
}

class _employeeScreenState extends State<employeeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
  
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final List<Widget> _pages = [
      const ClientDataUploadScreen(),
      const home_fragment(),
      const pdfFile(),
      const ProfileScreen()
    ];

    return SafeArea(
      child: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: Container(
          // color: Theme.of(context).primaryColor,
          color: isDark ? Theme.of(context).primaryColor : Colors.white,

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
            child: GNav(
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              hoverColor: tSecondaryColor150,

              color: Theme.of(context).textTheme.bodyText1!.color,
              activeColor: tSecondaryColor150,
              // tabBackgroundColor: Colors.grey.shade800,
              tabBackgroundColor: isDark
                  ? Theme.of(context).scaffoldBackgroundColor
                  : Colors.grey.shade200,

              // tabBorder: Border.all(color: Colors.grey.shade800, width: 1),
              tabActiveBorder: Border.all(
                  color: isDark ? Colors.grey.shade800 : Colors.white,
                  width: 1),

              // tabBorder: Border.all(color: Colors.grey.shade800, width: 0.5),
              rippleColor: tSecondaryLightColor,

              // hoverColor: Theme.of(context).primaryColor,
              duration: const Duration(milliseconds: 400),
              padding: const EdgeInsets.all(16),
              gap: 8,
              // duration: Duration(milliseconds: 400),
              tabs: const [
                GButton(
                  icon: LineIcons.home,
                  text: 'Employee',
                ),
                GButton(
                  //icon: Icons.inventory_outlined,
                  icon: LineIcons.fileContract,
                  text: 'Estimation',
                ),
                GButton(
                  //icon: Icons.inventory_outlined,
                  icon: LineIcons.alternateListAlt,
                  text: 'My Proposals',
                ),
                GButton(
                  icon: LineIcons.user,
                  text: 'Profile',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
