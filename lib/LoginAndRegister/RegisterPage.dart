import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:renres_app/LoginAndRegister/sign_in_screen.dart';

import '../LoginPage.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> with SingleTickerProviderStateMixin {
  late TextEditingController _emailController = TextEditingController();
  late TextEditingController _passwordController = TextEditingController();
  late TextEditingController _confirmpasswordController = TextEditingController();
  late AnimationController _animatedController;
  late Animation<double> _animation;
  late TextEditingController _nameController = TextEditingController();
  late TextEditingController _ageController = TextEditingController();

  bool _isVisible = false;

  void updateStatus() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _animatedController.dispose();
    super.dispose();
  }

  late String _password;
  double _strength = 0;

  RegExp numReg = RegExp(r".*[0-9].*");
  RegExp letterReg = RegExp(r".*[A-Za-z].*");
  String _displayText = ' ';

  void _checkPassword(String value) {
    _password = value.trim();

    if (_password.isEmpty) {
      setState(() {
        _strength = 0;
        _displayText = '  ';
      });
    } else if (_password.length < 6) {
      setState(() {
        _strength = 1 / 4;
        _displayText = 'Your password is too short';
      });
    } else if (_password.length < 8) {
      setState(() {
        _strength = 2 / 4;
        _displayText = 'Your password is acceptable but not strong';
      });
    } else {
      if (!letterReg.hasMatch(_password) || !numReg.hasMatch(_password)) {
        setState(() {
          // Password length >= 8
          // But doesn't contain both letter and digit characters
          _strength = 3 / 4;
          _displayText = 'Your password is strong';
        });
      } else {
        // Password length >= 8
        // Password contains both letter and digit characters
        setState(() {
          _strength = 1;
          _displayText = 'Your password is great';
        });
      }
    }
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmpasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  bool _obsecuredText = true;
  int _selectedSegment = 0; // Varsayılan olarak bireysel seçili olsun

  @override
  void initState() {
    super.initState();
    _animatedController = AnimationController(vsync: this, duration: Duration(seconds: 50));
    _animation = CurvedAnimation(parent: _animatedController, curve: Curves.linear)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((animationStatus) {
        if (animationStatus == AnimationStatus.completed) {
          _animatedController.reset();
          _animatedController.forward();
        }
      });
    _animatedController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Stack(
        children: [
          CachedNetworkImage(
            imageUrl:
            "https://i.pinimg.com/564x/68/49/15/684915a07bcf7add4d0f69a36761b11c.jpg",
            errorWidget: (context, url, error) => Icon(Icons.error),
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
            alignment: FractionalOffset(_animation.value, 0),
          ),
          Center(
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 12),
                    Text(
                      "Hello There! ",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(height: 20),

                    // CupertinoSegmentedControl ekleyin
                    CupertinoSegmentedControl<int>(
                      groupValue: _selectedSegment,
                      onValueChanged: (value) {
                        setState(() {
                          _selectedSegment = value;
                        });
                      },
                      children: {
                        0: Container(
                          decoration: BoxDecoration(
                            color: _selectedSegment == 0 ? Colors.green : Colors.white, // Seçili olmayanı yeşil, seçili olanı beyaz yapar
                          ),
                          child: Center(
                            child: Text(
                              'Bireysel',
                              style: TextStyle(
                                color: _selectedSegment == 0 ? Colors.white : Colors.green, // Seçili olmayanı yeşil, seçili olanı beyaz yapar
                              ),
                            ),
                          ),
                        ),
                        1: Container(
                          decoration: BoxDecoration(
                            color: _selectedSegment == 1 ? Colors.green : Colors.white, // Seçili olmayanı yeşil, seçili olanı beyaz yapar
                          ),
                          child: Center(
                            child: Text(
                              ' Kurumsal ',
                              style: TextStyle(
                                color: _selectedSegment == 1 ? Colors.white : Colors.green, // Seçili olmayanı yeşil, seçili olanı beyaz yapar
                              ),
                            ),
                          ),
                        ),
                      },
                    ),
                    SizedBox(height: 20),
                    if (_selectedSegment == 0)
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25.0),
                            child: TextFormField(
                              controller: _ageController,
                              keyboardType: TextInputType.number,
                              style: TextStyle(color: Colors.black87),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "TC kimlik numarası",
                                hintStyle: TextStyle(color: Colors.black),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black87),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 12),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25.0),
                            child: TextFormField(
                              controller: _nameController,
                              style: TextStyle(color: Colors.black87),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "İsim ve Soyisim",
                                hintStyle: TextStyle(color: Colors.black),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black87),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 12),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25.0),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: _ageController,
                              style: TextStyle(color: Colors.black87),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "Kaç Yaşındasınız ?",
                                hintStyle: TextStyle(color: Colors.black),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black87),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 12)
                        ],

                      )
                    else if (_selectedSegment == 1)
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25.0),
                            child: TextFormField(
                              controller: _ageController,
                              keyboardType: TextInputType.number,
                              style: TextStyle(color: Colors.black87),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "Vergi Numarası",
                                hintStyle: TextStyle(color: Colors.black),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black87),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 12),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25.0),
                            child: TextFormField(
                              controller: _nameController,
                              style: TextStyle(color: Colors.black87),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "Kurum Adı",
                                hintStyle: TextStyle(color: Colors.black),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black87),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 12,)
                        ],
                      ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _ageController,
                        style: TextStyle(color: Colors.black87),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Cep Telefon Numarası",
                          hintStyle: TextStyle(color: Colors.black),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black87),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        style: TextStyle(color: Colors.black87),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Email",
                          hintStyle: TextStyle(color: Colors.black),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black87),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextFormField(
                        onChanged: (value) => _checkPassword(value),
                        obscureText: _isVisible ? false : true,
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s"))
                        ],
                        validator: (value) {
                          if (value!.isEmpty || value.length < 8) {
                            return 'Please Enter a valid password';
                          }
                        },
                        controller: _passwordController,
                        style: TextStyle(color: Colors.black87),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Şifre",
                          hintStyle: TextStyle(color: Colors.black),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black87),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          suffixIcon: IconButton(
                            color: Colors.blueGrey,
                            onPressed: () => updateStatus(),
                            icon: Icon(_isVisible
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: LinearProgressIndicator(
                        value: _strength,
                        backgroundColor: Colors.grey[300],
                        color: _strength <= 1 / 4
                            ? Colors.red
                            : _strength == 2 / 4
                            ? Colors.yellow
                            : _strength == 3 / 4
                            ? Colors.blue
                            : Colors.green,
                        minHeight: 15,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    // The message about the strength of the entered password
                    Text(
                      _displayText,
                      style: const TextStyle(fontSize: 18),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        width: 300,
                        height: 45,
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "You have already an",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return SignInScreen();
                                },
                              ),
                            );
                          },
                          child: Text(
                            "account? ",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
