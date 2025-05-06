import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/localization_service.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: Text('appTitle'.tr, style: const TextStyle(color: Colors.white)),
        actions: [_buildLanguageDropdown()],
      ),
      body: const ProductList(),
    );
  }

  Widget _buildLanguageDropdown() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButton<String>(
        value: '${Get.locale?.languageCode}_${Get.locale?.countryCode}',
        underline: Container(),
        icon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.language, color: Colors.white),
        ),
        items: [
          DropdownMenuItem(value: 'en_US', child: Text('english'.tr)),
          DropdownMenuItem(value: 'ar_SA', child: Text('arabic'.tr)),
          DropdownMenuItem(value: 'fr_FR', child: Text('french'.tr)),
        ],
        onChanged: (String? newValue) {
          if (newValue != null) {
            LocalizationService.changeLocale(newValue);
          }
        },
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.blue[300],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: const Icon(
                        Icons.shopping_bag,
                        size: 50,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'productName'.trParams({
                              '@index': (index + 1).toString(),
                            }),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'productDescription'.trParams({
                              '@index': (index + 1).toString(),
                            }),
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                Align(
                  alignment:
                      Get.locale?.languageCode == 'ar'
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      _showProductDetails(index + 1);
                    },
                    child: Text('viewMore'.tr),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showProductDetails(int index) {
    Get.dialog(
      Directionality(
        textDirection:
            Get.locale?.languageCode == 'ar'
                ? TextDirection.rtl
                : TextDirection.ltr,
        child: AlertDialog(
          title: Text('productName'.trParams({'@index': index.toString()})),
          content: SingleChildScrollView(
            child: Text(
              'productDescription'.trParams({'@index': index.toString()}),
            ),
          ),
          actions: [
            TextButton(onPressed: () => Get.back(), child: Text('close'.tr)),
          ],
        ),
      ),
    );
  }
}
