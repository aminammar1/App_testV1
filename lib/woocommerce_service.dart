import 'package:http/http.dart' as http;
import 'dart:convert';

class WooCommerceService {
  static const String baseURL = 'http://testmyapp.amine'; //  domain
  static const String consumerKey =
      'ck_24bbb19fb59b8a2c50842cafd0d33108f087c60b';
  static const String consumerSecret =
      'cs_9630616838713d93fffa710dc05af93813db6da7'; // Consumer Secret

  static Future<String> getAccessToken() async {
    try {
      final response = await http.post(
        Uri.parse('$baseURL/wp-json/jwt-auth/v1/token'),
        headers: {
          'Authorization':
              'Basic ${base64Encode(utf8.encode('$consumerKey:$consumerSecret'))}',
        },
        body: {}, // Add any required parameters for authentication
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        if (data.containsKey('token')) {
          return data['token'];
        } else {
          throw Exception('Token not found in the response');
        }
      } else {
        throw Exception('Failed to authenticate');
      }
    } catch (error) {
      throw Exception('Error during authentication: $error');
    }
  }

  static Future<List<dynamic>> fetchProducts(String accessToken) async {
    final response = await http.get(
      Uri.parse('$baseURL/wp-json/wc/v3/products'),
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load products');
    }
  }
}
