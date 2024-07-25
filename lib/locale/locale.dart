import 'package:get/get.dart';

class MyLocale implements Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        "ar": {
          "ProductName": 'عميص فيتامين',
          'Stock': 'الكمية = 2003',
          'About': 'معلومات عن المنتج',
          'Desc':
              'شوية كلام شد زبون شوية كلام شد زبونشوية كلام شد زبونشوية كلام شد زبونشوية كلام شد زبونشوية كلام شد زبونشوية كلام شد زبونشوية كلام شد زبونشوية كلام شد زبونشوية كلام شد زبونشوية كلام شد زبونشوية كلام شد زبون',
          'AddToCart': 'أضف إلى السلة',
        },
        'en': {
          "ProductName": 'Ammis Vitamin ',
          'Stock': 'Stock = 2003',
          'About': 'About This Product',
          'Desc':
              'Hello Iam Mohamad Ammis Here you Can Find Alot of Informations About Product u select it from the last screeen i wish this data will help u to find all answers of your questions\n\nScientific Name : test\nBrand Name : test\nCategory : test\nManufacture : test\nStock : test\nExpiration Date : test ',
          'AddToCart': 'Add To Cart',
        }
      };
}
