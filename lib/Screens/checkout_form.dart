import 'package:flutter/material.dart';

class CheckoutForm extends StatefulWidget {
  @override
  _CheckoutFormState createState() => _CheckoutFormState();
}

class _CheckoutFormState extends State<CheckoutForm> {

  List<String> mekanTurleri = ["Ofis", "Ev"];
  List<String> kurulumAsamalari = ["Planlama", "Uygulama", "Tamamlandı"];
  List<String> sehirler = ["İstanbul", "Ankara", "İzmir"];

  String selectedMekanTuru = "Ev";
  String selectedKurulumAsamasi = "Planlama";
  String selectedSehir = "İstanbul";
  String? telefonNumarasi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Form",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: buildTextField("Ad"),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: buildTextField("Soyad"),
                  ),
                ],
              ),
              SizedBox(height: 20),
              buildTextField("E-posta adresi"),
              SizedBox(height: 20),
              buildPhoneNumberTextField("Telefon numarası"),
              SizedBox(height: 20),
              buildTextFieldDropdown(
                  "Mekan Türü", mekanTurleri, selectedMekanTuru,
                  (String? value) {
                setState(() {
                  selectedMekanTuru = value!;
                });
              }),
              SizedBox(height: 20),
              buildTextFieldDropdown(
                  "Kurulum Aşaması", kurulumAsamalari, selectedKurulumAsamasi,
                  (String? value) {
                setState(() {
                  selectedKurulumAsamasi = value!;
                });
              }),
              SizedBox(height: 20),
              buildTextFieldDropdown(
                  "Kurulum Yapılacak Şehir", sehirler, selectedSehir,
                  (String? value) {
                setState(() {
                  selectedSehir = value!;
                });
              }),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Kurulum yapılacak yerin açık adresi",
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget buildPhoneNumberTextField(String label) {
    return TextFormField(
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        prefixText: "05",
      ),
      onChanged: (String value) {
        setState(() {
          telefonNumarasi = value;
        });
      },
    );
  }
}

  Widget buildTextFieldDropdown(String label, List<String> items,
      String selectedValue, ValueChanged<String?> onChanged) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      value: selectedValue,
      items: items.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }

