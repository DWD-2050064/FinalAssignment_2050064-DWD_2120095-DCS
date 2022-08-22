final String tableNotes = 'cart';

/// add all the fields and to store in our database
/// new class ???Fields in which we define our field name
class CartFields{
  static final List<String> values = [
    cartID, product_id, picture,price,stock,
  ];
  static final String cartID= 'cartID';
  static final String product_id= 'product_id';
  static final String picture= 'picture';
  static final String price= 'price';
  static final String stock= 'stock';
}

class Cart{
  final int? cartID;
  final int product_id;
  final int picture;
  final int price;
  final int stock;
  const Cart({
    this.cartID,
    required this.product_id,
    required this.picture,
    required this.price,
    required this.stock,
  });

  Cart copy({
    int? cartID,
    int? product_id,
    int? picture,
    int? price,
    int? stock,
  }) =>
      Cart(
          cartID: cartID ?? this.cartID,
          product_id: product_id ?? this.product_id,
          picture: picture ?? this.picture,
          price:  price ?? this.price,
          stock:  price ?? this.stock,
      );
  static Cart fromJson(Map<String, Object?> json) => Cart(
      cartID: json[CartFields.cartID] as int?,
      product_id: json[CartFields.product_id] as int,
      picture: json[CartFields.picture] as int,
      price: json[CartFields.price] as int,
      stock: json[CartFields.stock] as int,
  );
  Map<String, Object?> toJson() =>{
    CartFields.cartID: cartID,
    CartFields.product_id: product_id,
    CartFields.picture: picture,
    CartFields.price: price,
    CartFields.stock: stock,
  };
}