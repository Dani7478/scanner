import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import '../Model/product_model.dart';
import '../Model/user_model.dart';

class DBHelper {
  //______________________________private constructor
  DBHelper._privateConstructor();

  //______________________________instance of private constructor
  static final DBHelper instance = DBHelper._privateConstructor();

  //______________________________instance of database
  static Database? _database;

  //______________________________checking database
  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

//___________________________________initilialization database
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "Note.db");
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  _onCreate(Database db, int version) {
    db.execute('''
        Create table product(
        id integer primary key,
        branch text not null, 
        srNumber text not null,
        qrNumber text not null,
        assetCategory text not null,
        assetSubCategory text not null,
        assetDescription text not null,
        assetQRBarCode text not null
      )
      ''');

    db.execute('''
        Create table user(
        id integer primary key,
        username text not null, 
        password text not null
      )
      ''');
  }

  //C__R__U__D
  //____________________________CREATE (insert notes)
  Future<int?> insertUser(User user) async {
    print('Inserting New Uer');
    //insert
    var newuser = {
      'username': user.userName,
      'password': user.passwrord,
    };
    var db = await instance.database;
    int? id = await db?.insert('user', newuser);
    print('User Add SuccessFully $id');
    return id;
  }

  Future<int?> insertProduct(Product newProduct) async {
    var data = {
      'branch': newProduct.branch,
      'srNumber': newProduct.srNumber,
      'qrNumber': newProduct.qrNumber,
      'assetCategory': newProduct.assetCategory,
      'assetSubCategory': newProduct.assetSubCategory,
      'assetDescription': newProduct.assetDescription,
      'assetQRBarCode': newProduct.assetQRBarCode
    };

    var db = await instance.database;
    int? id = await db?.insert('product', data);
    print('Product Added Successfully $id');
    return id;
  }

  Future<bool> checkUser(String userName, String password) async {
    Database? db = await instance.database;
    var result = await db!.rawQuery(
        'SELECT * FROM user WHERE username=? AND password=?',
        [userName, password]);
    print(result);
    if (result.length < 1) {
      return false;
    } else {
      return true;
    }
  }

    getAllProduct() async {
      Database? db = await instance.database;
      return db?.query('product');
    }

}
