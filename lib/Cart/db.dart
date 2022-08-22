import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'Cart_Model.dart';

class CartDatabase{
  static final CartDatabase instance = CartDatabase._init();

  static Database? _database;

  CartDatabase._init();

  /// Connection ('cart.db' is for store database)
  Future<Database> get database async {
    if(_database != null) return _database!;
    _database = await _initDB('cart.db');
    return _database!;

  }

  /// initialize database and store the new database to in file storage system
  Future<Database> _initDB(String filePath) async{
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);

  }

  ///Database Method means create our data table
  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $tableNotes(
    ${CartFields.cartID} INTEGER PRIMARY KEY AUTOINCREMENT,
    ${CartFields.product_id} INTEGER NOT NULL,
    ${CartFields.picture} INTEGER NOT NULL,
    ${CartFields.price} INTEGER NOT NULL,
    ${CartFields.stock} INTEGER NOT NULL,
    )
    ''');
  }

  /// CURD Operations = create,insert,read,delete
  /// call with rawsql queries or table name and a map
  Future<Cart> create(Cart cart) async {
    final db = await instance.database;

    final cartID = await db.insert(tableNotes, cart.toJson());
    return cart.copy(cartID: cartID);
  }
  Future<Cart> readCart(int cartID) async{
    final db = await instance.database;

    final maps = await db.query(tableNotes,
      columns: CartFields.values,
      where: '${CartFields.cartID} = ?',
      whereArgs: [cartID],

    );

    if(maps.isNotEmpty){
      return Cart.fromJson(maps.first);
    } else{
      throw Exception('ID $cartID not found');
    }
  }
  Future<List<Cart>> readAllCart() async {
    final db = await instance.database;
    final result = await db.query(tableNotes);
    return result.map((json) => Cart.fromJson(json)).toList();
  }
  Future<int> update(Cart cart) async{
    final db = await instance.database;

    return db.update(
      tableNotes,
      cart.toJson(),
      where: '${CartFields.cartID} =?',
      whereArgs: [cart.cartID],
    );
  }

  Future<int> delete(int cartID) async{
    final db = await instance.database;
    return await db.delete(
      tableNotes,
      where: '${CartFields.cartID} = ?',
      whereArgs: [cartID],
    );

  }
  Future close() async{
    final db = await instance.database;

    db.close();
  }
}