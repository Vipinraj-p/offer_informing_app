import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:offer_informing_app/presentation/login_screen.dart';

import 'sell_screen.dart';

class BusinessUserScreen extends StatefulWidget {
  const BusinessUserScreen({super.key});

  @override
  State<BusinessUserScreen> createState() => _BusinessUserScreenState();
}

class _BusinessUserScreenState extends State<BusinessUserScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 164, 152, 190),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 58, 27, 131),
        foregroundColor: Colors.white,
        leading: const Icon(Icons.admin_panel_settings_rounded),
        title: const Text("Admin"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            SizedBox(
              height: size.height * 0.1,
            ),
            SizedBox(
              height: size.height * 0.07,
            ),
            SizedBox(
              height: size.height * 0.07,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SellScreen(),
                      ));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 61, 65, 119),
                    shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    fixedSize: Size(size.width - 50, 50)),
                child: Text(
                  'Sell your product',
                  style: GoogleFonts.ubuntu(color: Colors.white, fontSize: 18),
                ))
          ],
        ),
      ),
      endDrawer: NavigationDrawer(children: [
        const DrawerHeader(
            child: CircleAvatar(
          child: Icon(
            Icons.admin_panel_settings,
            color: Color.fromARGB(190, 244, 67, 54),
            size: 50,
          ),
        )),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text("Logout"),
          onTap: () {
            FirebaseAuth.instance.signOut().then(
              (value) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ));
              },
            );
          },
        )
      ]),
    );
  }
}
