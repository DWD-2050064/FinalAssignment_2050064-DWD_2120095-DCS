import 'package:http/http.dart' as http;

String uriDomain = 'https://androidAPI.bitesbytesnetwork.com/ecomm/';

class VRecipient{
  static Future<String> vr() async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${uriDomain}webServices-3.php'));
    request.fields.addAll({
      'appID': '1r6B5G3v9w0D6W4L5z1B4H1b9V',
      'action': 'viewRecipient',

    });



    http.StreamedResponse response = await request.send();
    if(response.statusCode == 200){
      return await response.stream.bytesToString();
    }else{
      return "";
    }
  }
}

class VRecipientDetail{
  static Future<String> vrdetail(recipient_id) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${uriDomain}webServices-3.php'));
    request.fields.addAll({
      'appID': '1r6B5G3v9w0D6W4L5z1B4H1b9V',
      'action': 'viewRecipientDetail',
      'recipient_id': recipient_id,

    });



    http.StreamedResponse response = await request.send();
    if(response.statusCode == 200){
      return await response.stream.bytesToString();
    }else{
      return "";
    }
  }
}

class ARecipient{
  static Future<String> ar(address,phone_number,full_name) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${uriDomain}webServices-3.php'));
    request.fields.addAll({
      'appID': '1r6B5G3v9w0D6W4L5z1B4H1b9V',
      'action': 'addRecipient',
      'address': address,
      'phone_number': phone_number,
      'full_name': full_name,

    });



    http.StreamedResponse response = await request.send();
    if(response.statusCode == 200){
      return await response.stream.bytesToString();
    }else{
      return "";
    }
  }
}

class RRecipient{
  static Future<String> rr(recipient_id) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${uriDomain}webServices-3.php'));
    request.fields.addAll({
      'appID': '1r6B5G3v9w0D6W4L5z1B4H1b9V',
      'action': 'removeRecipient',
      'recipient_id': recipient_id,

    });



    http.StreamedResponse response = await request.send();
    if(response.statusCode == 200){
      return await response.stream.bytesToString();
    }else{
      return "";
    }
  }
}

class ERecipient{
  static Future<String> er(address,phone_number,full_name,recipient_id) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${uriDomain}webServices-3.php'));
    request.fields.addAll({
      'appID': '1r6B5G3v9w0D6W4L5z1B4H1b9V',
      'action': 'editRecipient',
      'address': address,
      'phone_number': phone_number,
      'full_name': full_name,
      'recipient_id': recipient_id,

    });



    http.StreamedResponse response = await request.send();
    if(response.statusCode == 200){
      return await response.stream.bytesToString();
    }else{
      return "";
    }
  }
}

class AOrder{
  static Future<String> ao(product_id,quantity,recipient_id,payment_id) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${uriDomain}webServices-3.php'));
    request.fields.addAll({
      'appID': '1r6B5G3v9w0D6W4L5z1B4H1b9V',
      'action': 'addOrder',
      'product_id': product_id,
      'quantity': quantity,
      'recipient_id': recipient_id,
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

class VOrder{
  static Future<String> vo() async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${uriDomain}webServices-3.php'));
    request.fields.addAll({
      'appID': '1r6B5G3v9w0D6W4L5z1B4H1b9V',
      'action': 'viewOrder',

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
        'POST', Uri.parse('${uriDomain}webServices-3.php'));
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

class APayment{
  static Future<String> apayment(bank,total_payment) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${uriDomain}webServices-3.php'));
    request.fields.addAll({
      'appID': '1r6B5G3v9w0D6W4L5z1B4H1b9V',
      'action': 'addPayment',
      'bank': bank,
      'total_payment': total_payment,

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
        'POST', Uri.parse('${uriDomain}webServices-3.php'));
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
        'POST', Uri.parse('${uriDomain}webServices-3.php'));
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