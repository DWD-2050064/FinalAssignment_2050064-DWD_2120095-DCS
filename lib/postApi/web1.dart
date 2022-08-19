import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

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
  static Future<String> rm(filePath,imageExt,username,password,email,phoneNumber,description,companyName) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${uriDomain}webServices-1.php'));
    request.fields.addAll({
      'appID': '1r6B5G3v9w0D6W4L5z1B4H1b9V',
      'action': 'registerMerchant',
      'imageExt' : imageExt,
      'username': username,
      'password': password,
      'email': email,
      'phoneNumber': phoneNumber,
      'description' : description,
      'companyName' : companyName,
    });

    PickedFile imageFile =PickedFile(filePath);
    Uint8List length = await imageFile.readAsBytes();
    int intLength = length.length;
    var stream = http.ByteStream(imageFile.openRead());
    var multipartFile = http.MultipartFile('image',stream.cast(),intLength,
        filename: basename(imageFile.path));
        request.files.add(multipartFile);

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
