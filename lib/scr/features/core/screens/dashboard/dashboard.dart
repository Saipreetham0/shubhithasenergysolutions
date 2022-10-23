import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

import 'package:shubhithasenergysolutions/scr/constants/colors.dart';
import 'package:shubhithasenergysolutions/scr/constants/image_strings.dart';
import 'package:shubhithasenergysolutions/scr/constants/text_strings.dart';
import 'package:shubhithasenergysolutions/scr/features/authentication/controllers/auth_controller.dart';
import 'package:shubhithasenergysolutions/scr/features/core/screens/Data_Form/Data_form_page.dart';
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

    final List<Widget> _pages = [
      home_fragment(
        media: media,
      ),
      pdfFile(),
      chatScreen(),
      ProfileScreen()
    ];

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          color: Theme.of(context).primaryColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
            child: GNav(
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              backgroundColor: Theme.of(context).primaryColor,
              color: Theme.of(context).textTheme.bodyText1!.color,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.grey.shade800,
              padding: EdgeInsets.all(16),
              gap: 8,
              tabs: const [
                GButton(
                  icon: LineIcons.home,
                  text: 'Home',
                ),
                GButton(
                  //icon: Icons.inventory_outlined,
                  icon: LineIcons.fileInvoice,
                  text: 'Quotations',
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
