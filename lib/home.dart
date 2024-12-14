import 'package:flutter/material.dart';
import 'conversion_logic.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ConversionLogic c = ConversionLogic();
  String selectedCategory = 'Length';
  String selectedUnittoconvertfrom = 'Meters';
  String selectedUnittoconvertto = 'Meters';
  String v = "";
  double resultValue = 0;
  bool showResult = false;
  List<String> category = ["Length", "Weight", "Temperature"];
  List<String> units = ['Meters', 'Kilometers', 'Miles', 'Feet'];

  // Get units based on category
  void getUnitsForCategory(String category) {
    if (category == 'Length') {
      units = ['Meters', 'Kilometers', 'Miles', 'Feet'];
    } else if (category == 'Weight') {
      units = ['Kilograms', 'Pounds', 'Grams'];
    } else if (category == 'Temperature') {
      units = ['Celsius', 'Fahrenheit', 'Kelvin'];
    }
    // Reset selections for new category
    selectedUnittoconvertfrom = units[0];
    selectedUnittoconvertto = units[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Unit Converter',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.orangeAccent,
      ),
      //i added the safe area and the Single child scroll view bc when i run this on my phone the pixels overflow
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Text(
                'Enter a number:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueGrey),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 300.0,
                height: 50.0,
                child: TextField(
                  keyboardType: TextInputType.number,
                  style: const TextStyle(fontSize: 18.0),
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: "Number to be converted",
                  ),
                  onChanged: (text) {
                    setState(() {
                      v = text;
                    });
                  },
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Choose a Category:',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blueGrey),
              ),
              const SizedBox(height: 10),
              DropdownMenu(
                width: 230,
                initialSelection: category[0],
                onSelected: (cat) {
                  setState(() {
                    selectedCategory = cat as String;
                    getUnitsForCategory(cat);
                    showResult = false;
                  });
                },
                dropdownMenuEntries: category
                    .map((cat) => DropdownMenuEntry(value: cat, label: cat.toString()))
                    .toList(),
              ),
              const SizedBox(height: 10),
              const Text(
                'Choose a unit to convert from:',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blueGrey),
              ),
              const SizedBox(height: 10),
              DropdownMenu(
                width: 230,
                initialSelection: units[0],
                onSelected: (u) {
                  setState(() {
                    selectedUnittoconvertfrom = u as String;
                    showResult = false;
                  });
                },
                dropdownMenuEntries: units
                    .map((u) => DropdownMenuEntry(value: u, label: u.toString()))
                    .toList(),
              ),
              const SizedBox(height: 10),
              const Text(
                'Choose a unit to convert to:',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blueGrey),
              ),
              const SizedBox(height: 10),
              DropdownMenu(
                width: 230,
                initialSelection: units[0],
                onSelected: (u) {
                  setState(() {
                    selectedUnittoconvertto = u as String;
                    showResult = false;
                  });
                },
                dropdownMenuEntries: units
                    .map((u) => DropdownMenuEntry(value: u, label: u.toString()))
                    .toList(),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    double value = double.parse(v);
                    if (selectedCategory == 'Length')
                      resultValue = c.convertLength(value, selectedUnittoconvertfrom, selectedUnittoconvertto);
                    else if (selectedCategory == 'Weight')
                      resultValue = c.convertWeight(value, selectedUnittoconvertfrom, selectedUnittoconvertto);
                    else
                      resultValue = c.convertTemperature(value, selectedUnittoconvertfrom, selectedUnittoconvertto);
                  });
                  showResult = true;
                },
                child: Text('Convert', style: TextStyle(fontSize: 24, color: Colors.blueGrey)),
              ),
              const SizedBox(height: 10),
              if (showResult)
                Text(
                  'Category: $selectedCategory\n$v $selectedUnittoconvertfrom is $resultValue $selectedUnittoconvertto ',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blueGrey),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
