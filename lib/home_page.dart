import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'currency_result.dart'; // Import the result page

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var firstController = TextEditingController();

  void convertCurrency(String usdAmount) {
    double currency = double.parse(usdAmount);
    double bdCurrency = currency * 120;
    String result = bdCurrency.toStringAsFixed(2);

    // Navigate to the result page with the converted amount
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CurrencyResult(convertedAmount: result),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Currency Converter",
          style: GoogleFonts.acme(color: Colors.white),
        ),
        backgroundColor: Colors.indigo,
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Enter Amount in USD Currency",
              style: GoogleFonts.acme(
                color: Color(0xFF30638E),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20),

          // Input Field
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: firstController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(color: Colors.indigo, width: 2.0),
                ),
                labelText: "(Enter Amount in USD )",
                labelStyle: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold),
                hintText: "0",
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(Icons.currency_bitcoin, color: Colors.indigo),
                filled: true,
                fillColor: Colors.orange[50],
                contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
              ),
            ),
          ),

          // Convert Button
          ElevatedButton(
            onPressed: () {
              String usdAmount = firstController.text;
              if (usdAmount.isNotEmpty) {
                convertCurrency(usdAmount);
              } else {
                Get.snackbar(
                  "Error",
                  "Please enter an amount",
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.redAccent,
                  colorText: Colors.white,
                  borderRadius: 10,
                  margin: EdgeInsets.all(10),
                  icon: Icon(Icons.warning, color: Colors.white, size: 30),
                );
              }
            },
            child: Text(
              "Convert",
              style: GoogleFonts.aclonica(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.indigo,
              shadowColor: Color(0xFFB8C5EE),
              elevation: 10,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ],
      ),
    );
  }
}
