import 'package:flutter/material.dart';

class CheckoutForm extends StatefulWidget {
  @override
  _CheckoutFormState createState() => _CheckoutFormState();
}

class _CheckoutFormState extends State<CheckoutForm> {
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
                "Checkout Form",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: buildTextField("First Name"),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: buildTextField("Last Name"),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: buildTextField("Card Number"),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    flex: 2,
                    child: buildTextField("Expiration Date"),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              buildTextField("Address Line 1"),
              const SizedBox(height: 20),
              buildTextField("Address Line 2"),
              const SizedBox(height: 20),
              buildTextField("Phone Number"),
              const SizedBox(height: 20),
              buildTextField("State"),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
    );
  }
}