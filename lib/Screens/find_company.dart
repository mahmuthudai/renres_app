import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class FindCompany extends StatefulWidget {
  const FindCompany({Key? key}) : super(key: key);

  @override
  State<FindCompany> createState() => _FindCompanyState();
}

class _FindCompanyState extends State<FindCompany> {
  String selectedValue = 'Seçim Yapınız'; // Başlangıç değeri
  List<String> companies = [
    "Firma 1",
    "Firma 2",
    "Firma 3",
    "Firma 4",
    "Firma 5",
    "Firma 6",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(left: 10, right: 10),
            color: Colors.black,
            child: const Center(
              child: Text(
                'Firma Seçimi',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold, // Metni kalınlaştırır
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: DropdownSearch<String>(
              popupProps: PopupProps.menu(
                showSelectedItems: true,
                showSearchBox: true,
                searchFieldProps: TextFieldProps(
                  decoration: InputDecoration(
                    hintText: "",
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: Icon(
                      Icons.search, // Arama simgesi
                      color: Colors.blue, // Simge rengi
                    ),
                  ),
                ),
              ),
              items: companies,
              onChanged: print,
              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  hintText: "Bir Firma Seçiniz",
                  hintStyle: TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
