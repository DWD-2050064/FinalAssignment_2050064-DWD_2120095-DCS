final String tableNotes = 'cart';

/// add all the fields and to store in our database
/// new class ???Fields in which we define our field name
class CartFields{
  static final List<String> values = [
    cartID, pID, cID,quantity
  ];
  static final String cartID= 'cartID';
  static final String pID= 'pID';
  static final String cID= 'cID';
  static final String quantity= 'quantity';
}

class Cart{
  final int? cartID;
  final int pID;
  final int cID;
  final int quantity;
  const Cart({
    this.cartID,
    required this.pID,
    required this.cID,
    required this.quantity,
  });

  Cart copy({
    int? cartID,
    int? pID,
    int? cID,
    int? quantity,
  }) =>
      Cart(
          cartID: cartID ?? this.cartID,
          pID: pID ?? this.pID,
          cID: cID ?? this.cID,
          quantity:  quantity ?? this.quantity
      );
  static Cart fromJson(Map<String, Object?> json) => Cart(
      cartID: json[CartFields.cartID] as int?,
      pID: json[CartFields.pID] as int,
      cID: json[CartFields.cID] as int,
      quantity: json[CartFields.quantity] as int
  );
  Map<String, Object?> toJson() =>{
    CartFields.cartID: cartID,
    CartFields.pID: pID,
    CartFields.cID: cID,
    CartFields.quantity: quantity
  };
}