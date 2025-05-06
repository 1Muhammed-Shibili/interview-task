import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalizationService extends Translations {
  // Supported locales
  static const locales = [
    Locale('en', 'US'), // English
    Locale('ar', 'SA'), // Arabic
    Locale('fr', 'FR'), // French
  ];

  // Keys for translations
  static const Map<String, Map<String, String>> translations = {
    'en_US': {
      'appTitle': 'Product List',
      'productName': 'Product @index',
      'productDescription':
          'This is a detailed description of product @index. It contains multiple lines of text to demonstrate how the product list would look with longer descriptions.\n\nLine 1: Product features\nLine 2: Material information\nLine 3: Size options\nLine 4: Color variations\nLine 5: Care instructions\nLine 6: Manufacturer details\nLine 7: Warranty information\nLine 8: Shipping options\nLine 9: Return policy\nLine 10: Customer reviews\nLine 11: Technical specifications\nLine 12: Compatibility info\nLine 13: Accessories included\nLine 14: Environmental impact\nLine 15: Safety warnings\nLine 16: Maintenance tips\nLine 17: Frequently bought with\nLine 18: Similar products\nLine 19: Price breakdown\nLine 20: Availability status',
      'language': 'Language',
      'english': 'English',
      'arabic': 'Arabic',
      'french': 'French',
      'viewMore': 'View More',
      'close': 'Close',
    },
    'ar_SA': {
      'appTitle': 'قائمة المنتجات',
      'productName': 'المنتج @index',
      'productDescription':
          'هذا وصف مفصل للمنتج @index. يحتوي على عدة أسطر من النص لتوضيح كيف تبدو قائمة المنتجات مع أوصاف أطول.\n\nالسطر 1: ميزات المنتج\nالسطر 2: معلومات المواد\nالسطر 3: خيارات الحجم\nالسطر 4: اختلافات اللون\nالسطر 5: تعليمات العناية\nالسطر 6: تفاصيل الشركة المصنعة\nالسطر 7: معلومات الضمان\nالسطر 8: خيارات الشحن\nالسطر 9: سياسة الإرجاع\nالسطر 10: آراء العملاء\nالسطر 11: المواصفات الفنية\nالسطر 12: معلومات التوافق\nالسطر 13: الملحقات المضمنة\nالسطر 14: الأثر البيئي\nالسطر 15: تحذيرات السلامة\nالسطر 16: نصائح الصيانة\nالسطر 17: اشترى كثيرا مع\nالسطر 18: منتجات مماثلة\nالسطر 19: تفصيل السعر\nالسطر 20: حالة التوفر',
      'language': 'اللغة',
      'english': 'الإنجليزية',
      'arabic': 'العربية',
      'french': 'الفرنسية',
      'viewMore': 'عرض المزيد',
      'close': 'إغلاق',
    },
    'fr_FR': {
      'appTitle': 'Liste de produits',
      'productName': 'Produit @index',
      'productDescription':
          'Ceci est une description détaillée du produit @index. Il contient plusieurs lignes de texte pour démontrer à quoi ressemblerait la liste de produits avec des descriptions plus longues.\n\nLigne 1: Caractéristiques du produit\nLigne 2: Informations sur les matériaux\nLigne 3: Options de taille\nLigne 4: Variations de couleur\nLigne 5: Instructions d\'entretien\nLigne 6: Détails du fabricant\nLigne 7: Informations sur la garantie\nLigne 8: Options d\'expédition\nLigne 9: Politique de retour\nLigne 10: Avis des clients\nLigne 11: Spécifications techniques\nLigne 12: Informations de compatibilité\nLigne 13: Accessoires inclus\nLigne 14: Impact environnemental\nLigne 15: Avertissements de sécurité\nLigne 16: Conseils d\'entretien\nLigne 17: Souvent acheté avec\nLigne 18: Produits similaires\nLigne 19: Détail des prix\nLigne 20: Statut de disponibilité',
      'language': 'Langue',
      'english': 'Anglais',
      'arabic': 'Arabe',
      'french': 'Français',
      'viewMore': 'Voir plus',
      'close': 'Fermer',
    },
  };

  @override
  Map<String, Map<String, String>> get keys => translations;

  // Get the current locale
  static Locale get currentLocale => Get.locale ?? locales.first;

  // Change locale and save to storage
  static Future<void> changeLocale(String locale) async {
    final selectedLocale = Locale(locale.split('_')[0], locale.split('_')[1]);
    await Get.updateLocale(selectedLocale);
  }

  // Helper method to get translated text with parameters
  static String translate(String key, {List<String>? params}) {
    String translation = key.tr;
    if (params != null) {
      for (int i = 0; i < params.length; i++) {
        translation = translation.replaceAll('@index', params[i]);
      }
    }
    return translation;
  }
}
