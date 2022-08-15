import 'package:http/http.dart' as http;

String uriDomain = 'https://androidAPI.bitesbytesnetwork.com/ecomm/';

class VCategoryDetail{
  static Future<String> vcdetail(category_id) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${uriDomain}webServices-2.php'));
    request.fields.addAll({
      'appID': '1r6B5G3v9w0D6W4L5z1B4H1b9V',
      'action': 'viewCategoryDetail',
      'category_id': category_id ,

    });



    http.StreamedResponse response = await request.send();
    if(response.statusCode == 200){
      return await response.stream.bytesToString();
    }else{
      return "";
    }
  }
}

class ACategory{
  static Future<String> ac(name,description,thumbnail,thumbnailExt) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${uriDomain}webServices-2.php'));
    request.fields.addAll({
      'appID': '1r6B5G3v9w0D6W4L5z1B4H1b9V',
      'action': 'addCategory',
      'name': name ,
      'description': description ,
      'thumbnail': thumbnail ,
      'thumbnailExt': thumbnailExt,

    });



    http.StreamedResponse response = await request.send();
    if(response.statusCode == 200){
      return await response.stream.bytesToString();
    }else{
      return "";
    }
  }
}

class RCategory{
  static Future<String> rc(category_id) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${uriDomain}webServices-2.php'));
    request.fields.addAll({
      'appID': '1r6B5G3v9w0D6W4L5z1B4H1b9V',
      'action': 'removeCategory',
      'category_id': category_id ,

    });



    http.StreamedResponse response = await request.send();
    if(response.statusCode == 200){
      return await response.stream.bytesToString();
    }else{
      return "";
    }
  }
}

class ECategory{
  static Future<String> ec(name,description,category_id,thumbnail,thumbnailExt) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${uriDomain}webServices-2.php'));
    request.fields.addAll({
      'appID': '1r6B5G3v9w0D6W4L5z1B4H1b9V',
      'action': 'editCategory',
      'name': name ,
      'description': description ,
      'category_id': category_id ,
      'thumbnail': thumbnail ,
      'thumbnailExt': thumbnailExt ,

    });



    http.StreamedResponse response = await request.send();
    if(response.statusCode == 200){
      return await response.stream.bytesToString();
    }else{
      return "";
    }
  }
}

class AProduct{
  static Future<String> ap(product_name,category,price,stock,variation,description,picture,pictureExt) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${uriDomain}webServices-2.php'));
    request.fields.addAll({
      'appID': '1r6B5G3v9w0D6W4L5z1B4H1b9V',
      'action': 'addProduct',
      'product_name': product_name ,
      'category': category ,
      'price': price ,
      'stock': stock ,
      'variation': variation ,
      'description': description ,
      'picture': picture ,
      'pictureExt': pictureExt ,

    });



    http.StreamedResponse response = await request.send();
    if(response.statusCode == 200){
      return await response.stream.bytesToString();
    }else{
      return "";
    }
  }
}

class EProduct{
  static Future<String> ep(product_id,product_name,category,price,stock,variation,description,picture,pictureExt) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${uriDomain}webServices-2.php'));
    request.fields.addAll({
      'appID': '1r6B5G3v9w0D6W4L5z1B4H1b9V',
      'action': 'editProduct',
      'product_id': product_id,
      'product_name': product_name ,
      'category': category ,
      'price': price ,
      'stock': stock ,
      'variation': variation ,
      'description': description ,
      'picture': picture ,
      'pictureExt': pictureExt ,

    });



    http.StreamedResponse response = await request.send();
    if(response.statusCode == 200){
      return await response.stream.bytesToString();
    }else{
      return "";
    }
  }
}

class RProduct{
  static Future<String> ep(product_id) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${uriDomain}webServices-2.php'));
    request.fields.addAll({
      'appID': '1r6B5G3v9w0D6W4L5z1B4H1b9V',
      'action': 'removeProduct',
      'product_id': product_id,

    });



    http.StreamedResponse response = await request.send();
    if(response.statusCode == 200){
      return await response.stream.bytesToString();
    }else{
      return "";
    }
  }
}

class VOrderDetail{
  static Future<String> vodetail(payment_id) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${uriDomain}webServices-2.php'));
    request.fields.addAll({
      'appID': '1r6B5G3v9w0D6W4L5z1B4H1b9V',
      'action': 'viewOrderDetail',
      'payment_id': payment_id,

    });



    http.StreamedResponse response = await request.send();
    if(response.statusCode == 200){
      return await response.stream.bytesToString();
    }else{
      return "";
    }
  }
}

class UOrderStatus{
  static Future<String> uostatus(order_id,order_status) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${uriDomain}webServices-2.php'));
    request.fields.addAll({
      'appID': '1r6B5G3v9w0D6W4L5z1B4H1b9V',
      'action': 'updateOrderStatus',
      'order_id': order_id,
      'order_status': order_status,

    });



    http.StreamedResponse response = await request.send();
    if(response.statusCode == 200){
      return await response.stream.bytesToString();
    }else{
      return "";
    }
  }
}

class VPayment{
  static Future<String> vp() async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${uriDomain}webServices-2.php'));
    request.fields.addAll({
      'appID': '1r6B5G3v9w0D6W4L5z1B4H1b9V',
      'action': 'viewPayment',

    });



    http.StreamedResponse response = await request.send();
    if(response.statusCode == 200){
      return await response.stream.bytesToString();
    }else{
      return "";
    }
  }
}

class VPaymentDetail{
  static Future<String> vpdetail(payment_id) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${uriDomain}webServices-2.php'));
    request.fields.addAll({
      'appID': '1r6B5G3v9w0D6W4L5z1B4H1b9V',

      'action': 'viewPaymentDetail',
      'payment_id': payment_id,

    });



    http.StreamedResponse response = await request.send();
    if(response.statusCode == 200){
      return await response.stream.bytesToString();
    }else{
      return "";
    }
  }
}