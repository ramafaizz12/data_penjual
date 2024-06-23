import 'package:data_penjualan/models/category.dart';
import 'package:data_penjualan/models/item_model.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class BookService {
  String baseUrl = "http://10.163.10.206:8000/api/";

  Future<List<Item>?> getdatapenjualan(String url) async {
    final response = await http.get(Uri.parse('${url}penjualan'));

    final Iterable data = json.decode(response.body);

    List<Item> alluser = data.map((e) => Item.fromJson(e)).toList();
    return alluser;
  }

  Future<List<Category>?> getdataCategory(String url) async {
    final response = await http.get(Uri.parse('${url}category'));
    final Iterable data = json.decode(response.body);

    List<Category> alluser = data.map((e) => Category.fromJson(e)).toList();
    return alluser;
  }

  Future<List<Item>?> getBookbyCategory(String id, String url) async {
    final response = await http.get(Uri.parse('${url}categories/$id/books'));

    final Iterable data = json.decode(response.body);

    List<Item> alluser = data.map((e) => Item.fromJson(e)).toList();

    return alluser;
  }

  Future<void> createdatapenjualan(
      {required String namamakanan,
      required String description,
      required int harga,
      required String url,
      required String category_id}) async {
    var category = await getdataCategory(url);
    var item = category!.firstWhere((e) => e.name.toString() == category_id).id;
    final response = await http.post(Uri.parse('${url}penjualan'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          'nama_makanan': namamakanan,
          'description': description,
          'harga': harga,
          'category_id': item
        }));

    if (response.statusCode == 201) {
    } else {
      throw Exception('Failed to post data');
    }
  }

  Future<void> createdatacategories({
    required String name,
    required String url,
  }) async {
    final response = await http.post(Uri.parse('${url}category'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          'name': name,
        }));

    if (response.statusCode == 201) {
    } else {
      throw Exception('Failed to post data');
    }
  }

  Future<void> editdatapenjualan(
      {required String id,
      required String namamakanan,
      required String description,
      required int harga,
      required String url,
      required String category_id}) async {
    var category = await getdataCategory(url);
    var item = category!.firstWhere((e) => e.name.toString() == category_id).id;

    await http.put(Uri.parse('${url}penjualan/$id'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          'nama_makanan': namamakanan,
          'description': description,
          'harga': harga,
          'category_id': item
        }));
  }

  Future<void> deletedatapenjualan({
    required String id,
    required String url,
  }) async {
    await http.delete(
      Uri.parse('${url}penjualan/$id'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      },
    );
  }

  Future<List<String>> getcategoryListName({required String url}) async {
    final response = await http.get(Uri.parse('${url}category'));
    final Iterable data = json.decode(response.body);

    List<String> alluser = data.map((e) => Category.fromJson(e).name!).toList();

    return alluser;
  }
}
