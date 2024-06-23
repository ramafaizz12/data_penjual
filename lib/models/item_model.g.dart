// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      id: (json['id'] as num?)?.toInt(),
      nama_makanan: json['nama_makanan'] as String,
      description: json['description'] as String,
      harga: (json['harga'] as num).toInt(),
      category: Category.fromJson(json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'id': instance.id,
      'nama_makanan': instance.nama_makanan,
      'description': instance.description,
      'harga': instance.harga,
      'category': instance.category.toJson(),
    };
