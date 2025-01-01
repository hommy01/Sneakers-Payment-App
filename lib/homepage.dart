import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
// import 'package:share/share.dart';
import 'package:share_plus/share_plus.dart';

class SneakersPaymentApp extends StatefulWidget {
  const SneakersPaymentApp({super.key});

  @override
  State<SneakersPaymentApp> createState() => _SneakersPaymentAppState();
}

class _SneakersPaymentAppState extends State<SneakersPaymentApp> {
  final Map<String, List<Map<String, dynamic>>> _catalog = {
    'Sneakers': [
      {
        'name': 'Airforce Blue',
        'price': 40.0,
        'selected': false,
        'image': 'images/airforceblue.jpg',
      },
      {
        'name': 'Airforce White',
        'price': 45.0,
        'selected': false,
        'image': 'images/airforcewhite.jpg',
      },
      {
        'name': 'Balanciaga',
        'price': 85.0,
        'selected': false,
        'image': 'images/balansiaga.jpg',
      },
      {
        'name': 'Brooklyn',
        'price': 47.0,
        'selected': false,
        'image': 'images/brooklyn.jpg',
      },
      {
        'name': 'CasualWare',
        'price': 49.99,
        'selected': false,
        'image': 'images/casualware.jpg',
      },
      {
        'name': 'Converse',
        'price': 45.99,
        'selected': false,
        'image': 'images/converse.jpg',
      },
      {
        'name': 'LadiesOut',
        'price': 20.99,
        'selected': false,
        'image': 'images/ladies1.jpg',
      },
      {
        'name': 'Ladies Out',
        'price': 35.99,
        'selected': false,
        'image': 'images/ladies.jpg',
      },
      {
        'name': 'Men Out',
        'price': 25.99,
        'selected': false,
        'image': 'images/men.jpg',
      },
      {
        'name': 'New Balance',
        'price': 34.0,
        'selected': false,
        'image': 'images/newbalace1.jpg',
      },
      {
        'name': 'New Balance',
        'price': 36.99,
        'selected': false,
        'image': 'images/newbalance1000.jpg',
      },
      {
        'name': 'Nike',
        'price': 18.0,
        'selected': false,
        'image': 'images/nike.jpg',
      },
      {
        'name': 'One Degree',
        'price': 27.0,
        'selected': false,
        'image': 'images/onedegree.jpg',
      },
      {
        'name': 'Sports Ware',
        'price': 45.0,
        'selected': false,
        'image': 'images/spoert.jpg',
      },
      {
        'name': 'Brooklyn Museum',
        'price': 45.0,
        'selected': false,
        'image': 'images/brooklynmuseum.jpg',
      },
      {
        'name': 'Sannax',
        'price': 45.0,
        'selected': false,
        'image': 'images/sannax.jpg',
      },
    ],
  };

  String _selectedCategory = 'Sneakers';

  double get _totalPrice {
    return _catalog.values
        .expand((items) => items)
        .where((item) => item['selected'])
        .fold(0, (sum, item) => sum + item['price']);
  }

  void _shareReceipt() {
    final selectedItems = _catalog.values
        .expand((items) => items)
        .where((item) => item['selected'])
        .toList();

    if (selectedItems.isNotEmpty) {
      final receiptDetails = StringBuffer();
      receiptDetails.writeln("Receipt:");
      receiptDetails.writeln("--------");
      for (var item in selectedItems) {
        receiptDetails.writeln("${item['name']}: \$${item['price']}");
      }
      receiptDetails.writeln("--------");
      receiptDetails.writeln("Total Payment: \$${_totalPrice.toStringAsFixed(2)}");

      Share.share(receiptDetails.toString(), subject: "Your Receipt");
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Select items to generate a receipt.')),
      );
    }
  }

  void _proceedToPayment() {
    final selectedItems = _catalog.values
        .expand((items) => items)
        .where((item) => item['selected'])
        .toList();

    if (selectedItems.isNotEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Order Summary'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...selectedItems.map(
                  (item) => Text('${item['name']}: \$${item['price']}'),
                ),
                const SizedBox(height: 10),
                Text('Total Payment: \$${_totalPrice.toStringAsFixed(2)}'),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _shareReceipt();
                  setState(() {
                    for (var category in _catalog.values) {
                      for (var item in category) {
                        item['selected'] = false;
                      }
                    }
                  });
                },
                child: const Text('Share Receipt'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    for (var category in _catalog.values) {
                      for (var item in category) {
                        item['selected'] = false;
                      }
                    }
                  });
                },
                child: const Text('Confirm'),
              ),
            ],
          );
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Select items to proceed.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sneakers Selection App'),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              value: _selectedCategory,
              isExpanded: true,
              onChanged: (value) {
                setState(() {
                  _selectedCategory = value!;
                });
              },
              items: _catalog.keys
                  .map(
                    (category) => DropdownMenuItem<String>(
                      value: category,
                      child: Text(
                        category,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _catalog[_selectedCategory]!.length,
              itemBuilder: (context, index) {
                final item = _catalog[_selectedCategory]![index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: ListTile(
                    leading: Image.asset(
                      item['image'],
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      item['name'],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Price: \$${item['price']}'),
                    trailing: Checkbox(
                      value: item['selected'],
                      onChanged: (value) {
                        setState(() {
                          item['selected'] = value!;
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  'Total: \$${_totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _proceedToPayment,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: Colors.teal,
                  ),
                  child: const Text(
                    'Proceed to Payment',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SneakersPaymentApp(),
  ));
}
