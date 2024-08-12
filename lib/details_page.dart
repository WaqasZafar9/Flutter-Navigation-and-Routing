import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, String>? item = ModalRoute.of(context)!.settings.arguments as Map<String, String>?;

    if (item == null || item['name'] == null || item['name']!.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text('No Details Available'),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: Text('No data found for the selected fruit.'),
        ),
      );
    }

    final String fruitName = item['name']!;

    final Map<String, Map<String, dynamic>> fruitDetails = {
      'Apple': {
        'season': 'Fall (August to November)',
        'calories': '95 calories per medium-sized apple',
        'benefits': 'Rich in fiber, vitamin C, and antioxidants; promotes heart health and aids digestion.',
        'importExport': 'The USA is one of the largest apple producers, exporting to over 100 countries including Mexico, Canada, and India.',
        'types': 'Fuji, Gala, Granny Smith, and Honeycrisp',
      },
      'Banana': {
        'season': 'Year-round, peak season is from January to April',
        'calories': '105 calories per medium banana',
        'benefits': 'High in potassium, vitamin B6, and fiber; supports heart health and aids digestion.',
        'importExport': 'Ecuador is the world\'s largest exporter of bananas, shipping mainly to the USA, Russia, and the European Union.',
        'types': 'Cavendish, Red Banana, and Plantain',
      },
      'Cherry': {
        'season': 'Late spring to mid-summer (May to July)',
        'calories': '50 calories per 100 grams',
        'benefits': 'Rich in antioxidants, vitamin C, and melatonin; helps reduce inflammation and improves sleep.',
        'importExport': 'Turkey is the leading exporter of cherries, supplying mainly to European countries, Russia, and the Middle East.',
        'types': 'Sweet Cherries (Bing, Rainier) and Sour Cherries (Montmorency)',
      },
      'Date': {
        'season': 'Harvested from August to December',
        'calories': '277 calories per 100 grams',
        'benefits': 'High in fiber, potassium, and magnesium; good for digestive health and provides a quick energy boost.',
        'importExport': 'Saudi Arabia is a major exporter of dates, sending them to the Middle East, North Africa, and Europe.',
        'types': 'Ajwa, Medjool, and Deglet Noor',
      },
      'Elderberry': {
        'season': 'Late summer to early fall (August to September)',
        'calories': '73 calories per 100 grams',
        'benefits': 'High in antioxidants and vitamins C and A; supports immune function and reduces cold and flu symptoms.',
        'importExport': 'Mostly consumed domestically, with some exports to European countries.',
        'types': 'Mainly European Elderberry (Sambucus nigra)',
      },
      'Fig': {
        'season': 'Summer to early fall (June to September)',
        'calories': '74 calories per 100 grams',
        'benefits': 'Rich in fiber, vitamins, and minerals; supports digestive health and helps regulate blood sugar levels.',
        'importExport': 'Egypt is a significant exporter of figs, mainly to the Middle East and Europe.',
        'types': 'Black Mission, Kadota, and Adriatic',
      },
      'Grape': {
        'season': 'Late summer to early fall (August to October)',
        'calories': '69 calories per 100 grams',
        'benefits': 'High in antioxidants, vitamin C, and K; promotes heart health and reduces the risk of chronic diseases.',
        'importExport': 'Italy is one of the leading exporters of grapes, sending them primarily to Germany, the UK, and the USA.',
        'types': 'Red Globe, Thompson Seedless, and Concord',
      },
      'Mango': {
        'season': 'Summer (May to September)',
        'calories': '60 calories per 100 grams',
        'benefits': 'Rich in vitamins A and C, fiber, and antioxidants; boosts immunity and improves digestive health.',
        'importExport': 'Pakistan is a major exporter of mangoes, with key markets in the Middle East, Europe, and the USA.',
        'types': 'Sindhri, Chaunsa, and Anwar Ratol',
      },
      'Kiwi': {
        'season': 'Fall to early winter (April to October)',
        'calories': '42 calories per medium kiwi',
        'benefits': 'High in vitamin C, fiber, and antioxidants; supports immune function and aids digestion.',
        'importExport': 'New Zealand is a top exporter of kiwis, exporting mainly to China, Japan, and Europe.',
        'types': 'Green (Hayward) and Gold (Zespri SunGold)',
      },
      'Lemon': {
        'season': 'Year-round, with a peak in winter (December to February)',
        'calories': '17 calories per 100 grams',
        'benefits': 'High in vitamin C and antioxidants; aids in digestion and boosts the immune system.',
        'importExport': 'India is a major producer and exporter of lemons, exporting mainly to the Middle East and Europe.',
        'types': 'Eureka, Lisbon, and Meyer',
      },
    };

    String getImagePath(String fruitName) {
      final String imageName = 'assets/${fruitName.toLowerCase()}_1.jpg';
      return imageName;
    }

    final String imagePath = getImagePath(fruitName);

    return Scaffold(
      appBar: AppBar(
        title: Text('${fruitName} Details'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/default_image.jpg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200,
                  );
                },
              ),
              SizedBox(height: 20),
              buildDropdownSection('Season', fruitDetails[fruitName]?['season'] ?? 'No data available'),
              buildDropdownSection('Calories', fruitDetails[fruitName]?['calories'] ?? 'No data available'),
              buildDropdownSection('Benefits', fruitDetails[fruitName]?['benefits'] ?? 'No data available'),
              buildDropdownSection('Import/Export', fruitDetails[fruitName]?['importExport'] ?? 'No data available'),
              buildDropdownSection('Types', fruitDetails[fruitName]?['types'] ?? 'No data available'),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Back to Home'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDropdownSection(String title, String content) {
    return ExpansionTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            content,
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          ),
        ),
      ],
    );
  }
}
