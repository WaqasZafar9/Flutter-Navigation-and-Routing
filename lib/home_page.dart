import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, String>> items = [
    {'name': 'Apple', 'country': 'USA', 'category': 'Fruit'},
    {'name': 'Banana', 'country': 'Ecuador', 'category': 'Fruit'},
    {'name': 'Cherry', 'country': 'Turkey', 'category': 'Fruit'},
    {'name': 'Date', 'country': 'Saudi Arabia', 'category': 'Fruit'},
    {'name': 'Elderberry', 'country': 'UK', 'category': 'Berry'},
    {'name': 'Fig', 'country': 'Egypt', 'category': 'Fruit'},
    {'name': 'Grape', 'country': 'Italy', 'category': 'Fruit'},
    {'name': 'Mango', 'country': 'Pakistan', 'category': 'Fruit'},
    {'name': 'Kiwi', 'country': 'New Zealand', 'category': 'Fruit'},
    {'name': 'Lemon', 'country': 'India', 'category': 'Citrus'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: AppBar(
        shadowColor: Colors.grey,
        title: Text(
          'Fruit List',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.yellow,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/${item['name']!.toLowerCase()}.png',
                ),
                backgroundColor: Colors.grey, // Fallback color
              ),
              title: Text(
                item['name']!,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text('${item['country']} - ${item['category']}'),
              tileColor: Colors.blue[50],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/details',
                  arguments: items[index],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
