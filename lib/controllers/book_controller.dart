import 'package:data_penjualan/models/category.dart';
import 'package:data_penjualan/models/item_model.dart';
import 'package:data_penjualan/services/books_service.dart';
import 'package:get/get.dart';

class BookController extends GetxController {
  var baseUrl = 'https://jsonplaceholder.typicode.com'.obs;
  var book = <Item>[].obs;
  var categories = <Category>[].obs;
  final BookService books = BookService();

  Future<void> getPenjualan() async {
    var data = await books.getdatapenjualan(
      baseUrl.value,
    );
    book.value = data!;
  }

  Future<void> getDataCategories() async {
    try {
      var data = await books.getdataCategory(baseUrl.value);
      categories.value = data!;
    } catch (e) {
      throw Exception('Failed to get data');
    }
  }

  Future<void> getBookByCategory(String id) async {
    try {
      var data = await books.getBookbyCategory(id, baseUrl.value);
      book.value = data!;
    } catch (e) {
      throw Exception('Failed to get data');
    }
  }

  Future<void> editPenjualan(
      {required String id,
      required String nama_makanan,
      required String description,
      required int harga,
      required String category_id}) async {
    try {
      await books.editdatapenjualan(
          url: baseUrl.value,
          id: id,
          namamakanan: nama_makanan,
          description: description,
          harga: harga,
          category_id: category_id);
      getPenjualan();
      Get.back();
    } catch (e) {
      throw Exception('Failed to update data');
    }
  }

  Future<void> deletePenjualan(String id) async {
    try {
      await books.deletedatapenjualan(
        id: id,
        url: baseUrl.value,
      );
      getPenjualan();
    } catch (e) {
      throw Exception('Failed to update data');
    }
  }

  Future<void> createPenjualan(
      {required String nama_makanan,
      required String description,
      required int harga,
      required String category_id}) async {
    try {
      await books.createdatapenjualan(
          url: baseUrl.value,
          namamakanan: nama_makanan,
          description: description,
          harga: harga,
          category_id: category_id);
      getPenjualan();
      getDataCategories();
      Get.back();
    } catch (e) {
      throw Exception('Failed to create data');
    }
  }

  Future<void> createDataCategories({
    required String name,
  }) async {
    try {
      await books.createdatacategories(name: name, url: baseUrl.value);
      getPenjualan();
      getDataCategories();
      Get.back();
    } catch (e) {
      throw Exception('Failed to create data');
    }
  }

  Future<List<String>> getCategoryListName() async {
    try {
      var category = await books.getcategoryListName(url: baseUrl.value);
      return category;
    } catch (e) {
      throw Exception('Failed to create data');
    }
  }

  void updateBaseUrl(String newUrl) {
    baseUrl.value = "http://$newUrl:8000/api/";
    getPenjualan();
    getDataCategories();
  }
}
