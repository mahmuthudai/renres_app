// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({ Key? key }) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  dynamic _selectedIndex = {};

  final CarouselController _carouselController = CarouselController();

  final List<dynamic> _products = [
    {
      'title': 'OFF-GRID SOLAR SYSTEMS',
      'image': 'assets/image/Off-grid-solar-kits.png',
    },
    {
      'title': 'SMALL SOLAR PANELS',
      'image': 'assets/image/smallpanels.jpg',
    },
    {
      'title': 'LARGE SOLAR PANELS',
      'image': 'assets/image/largepanels.jpg',
    },
    {
      'title': 'TOP-OF-POLE MOUNTS',
      'image': 'assets/image/SR-TPR10-T21.jpg',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _selectedIndex.length > 0 ? FloatingActionButton(
        backgroundColor: Colors.black54,
        onPressed: () {},
        child: const Icon(Icons.arrow_forward_ios),
      ) : null,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: CarouselSlider(
            carouselController: _carouselController,
            options: CarouselOptions(
                height: 450.0,
                aspectRatio: 16/9,
                viewportFraction: 0.70,
                enlargeCenterPage: true,
                pageSnapping: true,
                onPageChanged: (index, reason) {
                  setState(() {
                  });
                }
            ),
            items: _products.map((movie) {
              return Builder(
                builder: (BuildContext context) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (_selectedIndex == movie) {
                          _selectedIndex = {};
                        } else {
                          _selectedIndex = movie;
                        }
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: _selectedIndex == movie ? Border.all(color: Colors.black, width: 3) : null,
                          boxShadow: _selectedIndex == movie ? [
                            const BoxShadow(
                                color: Colors.black38,
                                blurRadius: 30,
                                offset: Offset(0, 10)
                            )
                          ] : [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 20,
                                offset: const Offset(0, 5)
                            )
                          ]
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              height: 350,
                              margin: const EdgeInsets.only(top: 10),
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Image.asset(movie['image'], fit: BoxFit.cover),
                            ),
                            const SizedBox(height: 30,),
                            Text(movie['title'], style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }).toList()
        ),
      ),
    );
  }
}