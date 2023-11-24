// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:renres_app/Screens/checkout_form.dart';
import 'package:renres_app/Screens/cost_calculation.dart';

import 'find_company.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? _slide = 0;

  final List<Widget> tabContents = [
    CheckoutForm(),// İlk sekme içeriği
    const Calculations(), // İkinci sekme içeriği
    const FindCompany(), // Üçüncü sekme içeriği
    const Text("Content 4"), // Dördüncü sekme içeriği
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(244, 243, 243, 1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Checkout Form"),
        elevation: 0,
        leading: IconButton(
          icon: Image.asset(
            'assets/icons/home.png',
          ),
          onPressed: () {
            // İkon tıklandığında yapılacak işlemler buraya yazılabilir.
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Image.asset(
              'assets/icons/menu.png',
            ),
            onPressed: () {
              // İkon tıklandığında yapılacak işlemler buraya yazılabilir.
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4), // Çizgi yüksekliği
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            // Yatay boşluk ekleyerek uçları kesik yapar
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.black, // Çizgi rengi
                  width: 2, // Çizgi kalınlığı artırıldı
                ),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(color: Colors.white),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Container(
                      width: double.infinity,
                      height: 50,
                      alignment: Alignment.center,
                      child: CupertinoSlidingSegmentedControl(
                        children: {
                          0: SizedBox(
                            width: 100,
                            height: 40,
                            child: Center(
                              child: Text(
                                "YES",
                                style: TextStyle(
                                  fontSize: 22,
                                  color: _slide == 0
                                      ? CupertinoColors.white
                                      : CupertinoColors.black,
                                ),
                              ),
                            ),
                          ),
                          1: SizedBox(
                            width: 100,
                            height: 40,
                            child: Center(
                              child: Text(
                                "Maliyet",
                                style: TextStyle(
                                  fontSize: 22,
                                  color: _slide == 1
                                      ? CupertinoColors.white
                                      : CupertinoColors.black,
                                ),
                              ),
                            ),
                          ),
                          2: SizedBox(
                            width: 100,
                            height: 40,
                            child: Center(
                              child: Text(
                                "Firma",
                                style: TextStyle(
                                  fontSize: 22,
                                  color: _slide == 2
                                      ? CupertinoColors.white
                                      : CupertinoColors.black,
                                ),
                              ),
                            ),
                          ),
                          3: SizedBox(
                            width: 100,
                            height: 40,
                            child: Center(
                              child: Text(
                                "Mağaza",
                                style: TextStyle(
                                  fontSize: 22,
                                  color: _slide == 3
                                      ? CupertinoColors.white
                                      : CupertinoColors.black,
                                ),
                              ),
                            ),
                          ),
                        },
                        groupValue: _slide,
                        onValueChanged: (int? newValue) {
                          setState(() {
                            _slide = newValue;
                          });
                        },
                        thumbColor: CupertinoColors.black,
                      )),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child:
                  tabContents[_slide!], // Seçilen sekmenin içeriğini gösterir
            ),
          ],
        ),
      ),
    );
  }
}
