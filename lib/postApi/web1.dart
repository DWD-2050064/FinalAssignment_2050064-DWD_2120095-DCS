import 'package:http/http.dart' as http;

String uriDomain = 'https://androidAPI.bitesbytesnetwork.com/ecomm/';

class VProductDetail{
  static Future<String> vpdetail(product_id) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${uriDomain}webServices-1.php'));
    request.fields.addAll({
      'appID': '1r6B5G3v9w0D6W4L5z1B4H1b9V',
      'action': 'viewProductDetail',
      'product_id': product_id ,

    });



    http.StreamedResponse response = await request.send();
    if(response.statusCode == 200){
      return await response.stream.bytesToString();
    }else{
      return "";
    }
  }
}

class VCategory {
  static Future<String> vc() async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${uriDomain}webServices-1.php'));
    request.fields.addAll({
      'appID': '1r6B5G3v9w0D6W4L5z1B4H1b9V',
      'action': 'viewCategory',

    });


    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      return await response.stream.bytesToString();
    } else {
      return "";
    }
  }
}

class VProduct {
  static Future<String> vp(category) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${uriDomain}webServices-1.php'));
    request.fields.addAll({
      'appID': '1r6B5G3v9w0D6W4L5z1B4H1b9V',
      'action': 'viewProduct',
      'category': category ,


    });


    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      return await response.stream.bytesToString();
    } else {
      return "";
    }
  }
}

class LMerchant {
  static Future<String> lmerchant(username,password) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${uriDomain}webServices-1.php'));
    request.fields.addAll({
      'appID': '1r6B5G3v9w0D6W4L5z1B4H1b9V',
      'action': 'loginMerchant',
      'username': username,
      'password': password


    });


    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      return await response.stream.bytesToString();
    } else {
      return "";
    }
  }
}

class RMerchant {
  static Future<String> rm(username,password,companyName,email,phoneNumber,description,image,imageExt) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${uriDomain}webServices-1.php'));
    request.fields.addAll({
      'appID': '1r6B5G3v9w0D6W4L5z1B4H1b9V',
      'action': 'registerMerchant',
      'username': username,
      'password': password,
      'companyName' : companyName,
      'email': email,
      'phoneNumber': phoneNumber,
      'description' : description,
      'image' : image,
      'imageExt' : imageExt,

    });


    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      return await response.stream.bytesToString();
    } else {
      return "";
    }
  }
}

class LCustomer {
  static Future<String> lc(username,password) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${uriDomain}webServices-1.php'));
    request.fields.addAll({
      'appID': '1r6B5G3v9w0D6W4L5z1B4H1b9V',
      'action': 'loginCustomer',
      'username': username,
      'password': password,

    });


    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      return await response.stream.bytesToString();
    } else {
      return "";
    }
  }
}

class RCustomer {
  static Future<String> rc(username,password,email,ic,regdate) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${uriDomain}webServices-1.php'));
    request.fields.addAll({
      'appID': '1r6B5G3v9w0D6W4L5z1B4H1b9V',
      'action': 'registerCustomer',
      'username': username,
      'password': password,
      'email': email,
      'ic': ic,
      'regdate' : regdate,

    });


    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      return await response.stream.bytesToString();
    } else {
      return "";
    }
  }
}
