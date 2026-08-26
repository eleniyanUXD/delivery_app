import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/address_model.dart';

class AddressService {
  static Future<List<AddressModel>> searchAddress(String query) async {
    final url = Uri.parse(
      'https://nominatim.openstreetmap.org/search'
      '?q=${Uri.encodeComponent(query)}'
      '&format=json'
      '&addressdetails=1'
      '&limit=5',
    );

    final response = await http.get(
      url,
      headers: {'User-Agent': 'ExpressFeast/1.0'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      return data.map((item) => AddressModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to search address: ${response.statusCode}');
    }
  }
}
