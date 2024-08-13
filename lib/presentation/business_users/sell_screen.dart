import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:offer_informing_app/services/details_provider.dart';
import 'package:offer_informing_app/services/file_provider.dart';
import 'package:offer_informing_app/services/sell_screen_provider.dart';
import 'package:provider/provider.dart';

class SellScreen extends StatelessWidget {
  SellScreen({super.key});

  TextEditingController productNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 164, 152, 190),
        appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 58, 27, 131),
            foregroundColor: Colors.white,
            title: const Text("Product Details")),
        body: Consumer<SellScreenProvider>(
            builder: (context, sellScreenProvider, child) {
          return Consumer<FileProvider>(
              builder: (context, fileProvider, child) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
              child: ListView(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        fileProvider.pickFile();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 75, 77, 105),
                          shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          fixedSize: Size(size.width, 50)),
                      child: Text(
                        'Choose an Image',
                        style: GoogleFonts.ubuntu(
                            color: Colors.white, fontSize: 18),
                      )),
                  Text(
                    fileProvider.fileName,
                    style:
                        GoogleFonts.ubuntu(color: Colors.white, fontSize: 14),
                  ),
                  SizedBox(height: size.height * 0.04),
                  Column(
                    children: [
                      TextFormField(
                        controller: productNameController,
                        style: GoogleFonts.adamina(
                            color: Colors.white, fontSize: 15),
                        decoration: textFormFileldDecoration(
                            'Product Name', Icons.category_rounded),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "This field cannot be empty";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          sellScreenProvider.productName = value!;
                        },
                      ),
                      SizedBox(height: size.height * 0.03),
                      TextFormField(
                        maxLines: null,
                        minLines: null,
                        maxLength: 5000,
                        controller: descriptionController,
                        style: GoogleFonts.adamina(
                            color: Colors.white, fontSize: 15),
                        enabled: true,
                        decoration: textFormFileldDecoration(
                            'Description', Icons.description),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "This field cannot be empty";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          sellScreenProvider.description = value!;
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.25),
                        child: Consumer<DetailsProvider>(
                            builder: (context, detailsProvider, child) {
                          return ElevatedButton(
                              onPressed: () {
                                log('clocked');
                                fileProvider.uploadFile(
                                    context,
                                    detailsProvider.email,
                                    productNameController.text,
                                    descriptionController.text);
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 61, 65, 119),
                                  shape: ContinuousRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  fixedSize: Size(size.width, 50)),
                              child: Text(
                                'Sell this product',
                                style: GoogleFonts.ubuntu(
                                    color: Colors.white, fontSize: 18),
                              ));
                        }),
                      ),
                    ],
                  ),
                ],
              ),
            );
          });
        }));
  }

  InputDecoration textFormFileldDecoration(String label, IconData icon) {
    return InputDecoration(
        enabled: true,
        labelText: label,
        floatingLabelStyle: GoogleFonts.ubuntu(
          color: Colors.white,
        ),
        labelStyle: GoogleFonts.ubuntu(
          color: Colors.white,
        ),
        prefixIcon: Icon(
          icon,
          color: Colors.white,
          size: 25,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(7)));
  }
}
