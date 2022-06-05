class Product {
   int? _id;
   String? _productName;
   String? _productDescription;
   String? _productPrice;

  Product(dynamic obj) {
    _id = obj['id'];
    _productName = obj['productName'];
    _productDescription = obj['productDescription'];
    _productPrice = obj['productPrice'];
  }

  Product.fromMap(Map<String, dynamic> data) {
    _id = data['id'];
    _productName = data['productName'];
    _productDescription = data['productDescription'];
    _productPrice = data['productPrice'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'productName': _productName,
      'productDescription': _productDescription,
      'productPrice': _productPrice
    };
  }

  int? get id => _id;

  String? get productName => _productName;

  String? get productDescription => _productDescription;

  String? get productPrice => _productPrice;
}
