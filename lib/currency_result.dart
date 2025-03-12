import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CurrencyResult extends StatelessWidget {
  final String convertedAmount;

  // Constructor to receive data from HomePage
  CurrencyResult({required this.convertedAmount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Conversion Result",
          style: GoogleFonts.acme(color: Colors.white),
        ),
        backgroundColor: Colors.indigo,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Converted Amount in BDT:",
              style: GoogleFonts.acme(
                color: Colors.indigo,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "৳ $convertedAmount",
              style: GoogleFonts.aclonica(
                color: Colors.green,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),

            // Back to Home Button
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Go back to HomePage
              },
              child: Text(
                "Go Back",
                style: GoogleFonts.aclonica(fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.orangeAccent,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
