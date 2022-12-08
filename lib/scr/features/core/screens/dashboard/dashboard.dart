import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shubhithasenergysolutions/scr/constants/colors.dart';
import 'package:shubhithasenergysolutions/scr/features/authentication/controllers/auth_controller.dart';
import 'package:shubhithasenergysolutions/scr/features/core/screens/dashboard/fragments/chat_screen.dart';
import 'package:shubhithasenergysolutions/scr/features/core/screens/dashboard/fragments/home_fragment.dart';
import 'package:shubhithasenergysolutions/scr/features/core/screens/dashboard/fragments/pdf_files_fragment.dart';
import 'package:shubhithasenergysolutions/scr/features/core/screens/dashboard/fragments/profile_screen.dart';
import 'package:shubhithasenergysolutions/scr/features/employee/screens/employee_screen.dart';

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

  final user = AuthController.instance.user;
  final localData = GetStorage();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // if (localData.read('employeeLogin') == 'True') {
    // } else {
    //   screenChange();
    // }
  }

  void screenChange() {
    FirebaseFirestore.instance
        .collection('users')
        .doc(user?.uid)
        .get()
        .then((DocumentSnapshot doc) {
      final data = doc.data() as Map<String, dynamic>;
      final role = data['role'];

      if (role == 'employee') {
        localData.write('employeeLogin', 'True');
        Get.offAll(() => const employeeScreen(), transition: Transition.fade);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final List<Widget> _pages = [
      const home_fragment(),
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
              activeColor: tSecondaryColor150,
              tabBackgroundColor: isDark
                  ? Theme.of(context).scaffoldBackgroundColor
                  : Colors.grey.shade200,
              tabActiveBorder: Border.all(
                  color: isDark ? Colors.grey.shade800 : Colors.white,
                  width: 1),
              rippleColor: tSecondaryLightColor,
              duration: const Duration(milliseconds: 400),
              color: Theme.of(context).textTheme.bodyText1!.color,
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
