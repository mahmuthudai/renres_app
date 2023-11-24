import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'LoginAndRegister/sign_in_screen.dart';
import 'Screens/entry_point.dart';

class Konum extends StatefulWidget {
  const Konum({super.key});

  @override
  State<Konum> createState() => _KonumState();
}

class _KonumState extends State<Konum> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade200,
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20),
          width: double.infinity, // To take the full width
          height: 150, // Set the desired height
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(35),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "Konuma erişim izni verilsin mi ?",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              requestLocationPermission();
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade400), // Change the background color here
                            ),
                            child: Text(
                              "  Evet  ",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          ElevatedButton(
                            onPressed: () {
                              redirectToLogin();
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade400), // Change the background color here
                            ),
                            child: Text(
                              "  Hayır  ",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void redirectToLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignInScreen()),
    );
  }

  void redirectToHomePage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => EntryPoint()),
    );
  }

  void requestLocationPermission() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Konum erişim izni verildi.'),
          duration: Duration(seconds: 5),
        ),
      );

      // SnackBar'ın gösterilme süresi kadar bekleyip sonra yönlendirme yap
      Future.delayed(Duration(seconds: 5), () {
        redirectToHomePage();
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Konum erişim izni verilmedi !!!'),
          duration: Duration(seconds: 5),
        ),
      );
    }
  }

}