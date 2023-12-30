class Product {
  final int? id;
  final int? categoryID;
  final String? scientificName;
  final String? scientificNameAr;
  final String? brandName;
  final String? brandNameAr;
  final String? category;
  final String? manufacturer;
  final String? manufacturerAr;
  final int? stock;
  final int? sales;
  final int? quantity;
  final double? price;
  final String? expirationDate;
  final String? description;
  final String? descriptionAr;
  final dynamic image;
  final DateTime? createdAt;
  final DateTime? updatedAt;
   bool? isFavorite;
  int counter = 0;

  Product(  {

    this.id,
    this.scientificName,
    this.scientificNameAr,
    this.brandName,
    this.brandNameAr,
    this.category,
    this.categoryID,
    this.manufacturer,
    this.manufacturerAr,
    this.stock,
    this.sales,
    this.quantity,
    this.price,
    this.expirationDate,
    this.description,
    this.descriptionAr,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.isFavorite,
  });

  @override
  String toString() {
    return 'Product(id: $id, scientificName: $scientificName, scientificNameAr: $scientificNameAr, brandName: $brandName, brandNameAr: $brandNameAr, category: $category, manufacturer: $manufacturer, manufacturerAr: $manufacturerAr, stock: $stock, sales: $sales, price: $price, expirationDate: $expirationDate, description: $description, descriptionAr: $descriptionAr, image: $image, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  factory Product.fromJson(Map<String, dynamic> data) {
    return Product(
      id: data['id'] as int?,
      scientificName: data['scientific_name'] as String?,
      scientificNameAr: data['scientific_name_ar'] as String?,
      brandName: data['brand_name'] as String?,
      brandNameAr: data['brand_name_ar'] as String?,
      category: data['category']['category_name'] ?? 'other',
      categoryID: data['category']['id'] as int? ,
      manufacturer: data['manufacturer'] as String?,
      manufacturerAr: data['manufacturer_ar'] as String?,
      stock: data['stock'] as int?,
      sales: data['sales'] as int?,
      price: (data['price'] as num?)?.toDouble(),
      expirationDate: data['expiration_date'] as String?,
      description: data['description'] as String?,
      descriptionAr: data['description_ar'] as String?,
      image: data['image'] as dynamic,
      createdAt: data['created_at'] == null
          ? null
          : DateTime.parse(data['created_at'] as String),
      updatedAt: data['updated_at'] == null
          ? null
          : DateTime.parse(data['updated_at'] as String),
      isFavorite: data['isfavorite'] as bool?
    );
  }

  factory Product.fromJsonFav(Map<String, dynamic> data) {
    return Product(
      id: data['id'] as int?,
      scientificName: data['scientific_name'] as String?,
      scientificNameAr: data['scientific_name_ar'] as String?,
      brandName: data['brand_name'] as String?,
      brandNameAr: data['brand_name_ar'] as String?,
      //category: data['category']['category_name'] ?? 'other',
      categoryID: data['category_id']as int? ,
      manufacturer: data['manufacturer'] as String?,
      manufacturerAr: data['manufacturer_ar'] as String?,
      stock: data['stock'] as int?,
      sales: data['sales'] as int?,
      price: (data['price'] as num?)?.toDouble(),
      expirationDate: data['expiration_date'] as String?,
      description: data['description'] as String?,
      descriptionAr: data['description_ar'] as String?,
      image: data['image'] as dynamic,
      createdAt: data['created_at'] == null
          ? null
          : DateTime.parse(data['created_at'] as String),
      updatedAt: data['updated_at'] == null
          ? null
          : DateTime.parse(data['updated_at'] as String),
      isFavorite: data['isfavorite'] as bool?
    );
  }
  factory Product.fromJsonOrder(Map<String, dynamic> data){
    return Product(
      id: data['id'],
      brandName: data['brand_name'],
      brandNameAr: data['brand_name_ar'],
      price: data['price'],
      quantity: data['quantity']
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'scientific_name': scientificName,
      'scientific_name_ar': scientificNameAr,
      'brand_name': brandName,
      'brand_name_ar': brandNameAr,
      'category': category,
      'manufacturer': manufacturer,
      'manufacturer_ar': manufacturerAr,
      'stock': stock,
      'sales': sales,
      'price': price,
      'expiration_date': expirationDate,
      'description': description,
      'description_ar': descriptionAr,
      'image': image,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}
