import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:offer_informing_app/presentation/login_screen.dart';

import 'product_details_screen.dart';
import 'widgets/product_tile.dart';

class CustomerUsersScreen extends StatefulWidget {
  const CustomerUsersScreen({super.key});
  @override
  State<CustomerUsersScreen> createState() => _CustomerUsersScreenState();
}

class _CustomerUsersScreenState extends State<CustomerUsersScreen> {
  final Stream<QuerySnapshot> _locationStream =
      FirebaseFirestore.instance.collection('Products').snapshots();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 234, 251, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 50, 153, 73),
        foregroundColor: const Color.fromARGB(255, 23, 23, 24),
        leading: const Icon(
          Icons.account_circle_rounded,
          color: Colors.white,
        ),
        title: const Text(
          "User",
          style: TextStyle(color: Colors.white),
        ),
      ),

//body  ==========================================
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: size.width * 0.1, vertical: 20),
        child: StreamBuilder<QuerySnapshot>(
            stream: _locationStream,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              return ListView(
                  children: snapshot.data!.docs
                      .map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetailScreen(
                                      name: data['productName'],
                                      description: data['Description'],
                                      imgUrl: data['image']),
                                ));
                          },
                          child: ProductTile(
                              imageUrl: data['image'],
                              description: data['Description'],
                              name: data['productName']),
                        );
                      })
                      .toList()
                      .cast());
            }),
      ),

//end drawer  ==========================================
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
        ),
      ]),
    );
  }
}
