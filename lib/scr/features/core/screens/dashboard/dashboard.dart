import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shubhithasenergysolutions/scr/constants/colors.dart';

import 'package:shubhithasenergysolutions/scr/features/core/screens/dashboard/fragments/chat_screen.dart';
import 'package:shubhithasenergysolutions/scr/features/core/screens/dashboard/fragments/home_fragment.dart';
import 'package:shubhithasenergysolutions/scr/features/core/screens/dashboard/fragments/pdf_files_fragment.dart';
import 'package:shubhithasenergysolutions/scr/features/core/screens/dashboard/fragments/profile_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var isDark = false;
  int _selectedIndex = 0;

  //dark mode
  void chngeTheme() {
    setState(() {
      isDark = !isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final List<Widget> _pages = [
      home_fragment(
        media: media,
      ),
      const pdfFile(),
      const chatScreen(),
      const ProfileScreen()
    ];

    return SafeArea(
      child: Scaffold(
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
              // backgroundColor: Theme.of(context).primaryColor,
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
              color: Theme.of(context).textTheme.bodyText1!.color,
              // activeColor: Colors.white,
              // tabBackgroundColor: Colors.grey.shade800,
              padding: const EdgeInsets.all(16),
              gap: 8,
              tabs: const [
                GButton(
                  icon: LineIcons.home,
                  text: 'Home',
                ),
                GButton(
                  //icon: Icons.inventory_outlined,
                  icon: LineIcons.fileInvoice,
                  text: 'My Proposals',
                ),
                GButton(
                  icon: LineIcons.comment,
                  text: 'Chat',
                ),
                GButton(
                  icon: LineIcons.user,
                  text: 'Profile',
                )
              ],
            ),
          ),
        ),
        body: _pages[_selectedIndex],
      ),
    );
  }
}
