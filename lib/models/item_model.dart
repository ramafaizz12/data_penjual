import 'package:data_penjualan/models/category.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Item {
  final int? id;
  final String nama_makanan;
  final String description;
  final int harga;
  final Category category;

  Item(
      {this.id,
      required this.nama_makanan,
      required this.description,
      required this.harga,
      required this.category});

  factory Item.fromJson(Map<String, dynamic> data) => _$ItemFromJson(data);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
