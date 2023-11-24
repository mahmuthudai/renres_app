import 'package:flutter/material.dart';

class Calculations extends StatefulWidget {
  const Calculations({Key? key}) : super(key: key);

  @override
  State<Calculations> createState() => _CalculationsState();
}

class _CalculationsState extends State<Calculations> {
  TextEditingController alanController = TextEditingController();
  TextEditingController tuketimController = TextEditingController();
  double total = 0;
  double kuruluGuc = 0;
  double uretim = 0;
  double onlenenEmisyon = 0;
  String formattedValue = "";
  bool showGES = false; // GES butonunun tıklanma durumunu takip eden değişken
  bool showRES = false; // RES butonunun tıklanma durumunu takip eden değişken

  @override
  void dispose() {
    alanController.dispose();
    tuketimController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: buildTextField("Alan (m²)", alanController),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 2,
                  child: buildTextField("Tüketim (kWh)", tuketimController),
                ),
              ],
            ),
            Container(
              decoration: const BoxDecoration(color: Colors.white),
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        double alan = double.parse(alanController.text);
                        double tuketim = double.parse(tuketimController.text);
                        total = alan / 2;
                        kuruluGuc = (total * 400) / 1000;
                        uretim = 0.4*7*365*total;
                        onlenenEmisyon = ((tuketim*0.492)-((tuketim - uretim)*0.492))/1000;
                        formattedValue = onlenenEmisyon.toStringAsFixed(1);
                        showGES = true; // GES butonuna basıldığında göster
                        showRES = false; // Diğerini gizle
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black,
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    child: const Text("GES İçin Hesapla"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        // Diğer butona tıklandığında
                        // İlgili hesaplamaları yapabilirsiniz.
                        showRES = true; // RES butonuna basıldığında göster
                        showGES = false; // Diğerini gizle
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    child: const Text("RES İçin Hesapla"),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            if (showGES || showRES) // Eğer herhangi bir butona tıklandıysa
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // İçerikler arasında boşluk bırakarak hizalama
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Colors.black, Colors.black45],
                              stops: [0.0, 1.0],
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  "assets/icons/solar-panel.png",
                                  height: 50,
                                  width: 50,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '${total.toInt()} Adet\nGüneş Paneli',
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Colors.black, Colors.black45],
                              stops: [0.0, 1.0],
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  "assets/icons/sun.png",
                                  height: 50,
                                  width: 50,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '$kuruluGuc kWp\nKurulu Güç',
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // İçerikler arasında boşluk bırakarak hizalama
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Colors.black, Colors.black45],
                              stops: [0.0, 1.0],
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  "assets/icons/flash.png",
                                  height: 50,
                                  width: 50,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '${uretim.toInt()} kWh\nOrtalama Üretim',
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Colors.black, Colors.black45],
                              stops: [0.0, 1.0],
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  "assets/icons/co2.png",
                                  height: 50,
                                  width: 50,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '$formattedValue Ton CO2/yıl\nÖnlenen Emisyon',
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
