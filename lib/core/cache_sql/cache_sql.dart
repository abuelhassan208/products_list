import 'package:path/path.dart';
import 'package:products_list/core/models/products_model.dart';
import 'package:sqflite/sqflite.dart';

class CacheSQl {
  static Future<Database?> createDatabase() async {
    Database? dataBase;
    String path = join(await getDatabasesPath(), 'product.db');
    dataBase = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int v) {
        db.execute(
            'CREATE TABLE products(id INTEGER PRIMARY KEY AUTOINCREMENT, productName VARCHAR(500), productDescription VARCHAR(1500), productPrice VARCHAR(100))');
      },
      onOpen: (data) {
        dataBase = data;
      },
    );
    return dataBase;
  }

  static void createProduct(Product product) {
    createDatabase()
        .then((value) => value!.insert('products', product.toMap()));
  }

  static void updateProduct(Product product) {
    createDatabase().then((value) => value!.update('products', product.toMap(),
        where: 'id = ?', whereArgs: [product.id]));
  }

  static Future<List<Map<String, dynamic>>> allProducts() {
    return createDatabase().then((value) => value!.query('products'));
  }

  static void deleteProduct(int id) {
    createDatabase().then(
        (value) => value!.delete('products', where: 'id = ?', whereArgs: [id]));
  }
}
