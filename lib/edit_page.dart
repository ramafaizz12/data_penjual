import 'package:data_penjualan/container_input.dart';
import 'package:data_penjualan/container_spalsh.dart';
import 'package:data_penjualan/controllers/book_controller.dart';
import 'package:data_penjualan/models/item_model.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataInput extends StatefulWidget {
  final Item item;
  DataInput({
    super.key,
    required this.item,
  });

  @override
  State<DataInput> createState() => _DataInputState();
}

class _DataInputState extends State<DataInput> {
  TextEditingController namamakanan = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController harga = TextEditingController();
  final BookController bookController = Get.find(tag: "books");

  String? filename;
  String? category;
  @override
  void initState() {
    namamakanan.text = widget.item.nama_makanan;
    description.text = widget.item.description;
    harga.text = widget.item.harga.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: Text("Edit Data Penjualan"),
      ),
      body: LayoutBuilder(
        builder: (context, p1) => Padding(
          padding: EdgeInsets.only(
              left: p1.maxWidth * 0.03,
              right: p1.maxWidth * 0.03,
              top: p1.maxHeight * 0.03),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ContainerInput(
                    width: p1.maxWidth,
                    height: p1.maxHeight * 0.15,
                    nama: "Nama Makanan",
                    hint: "Masukkan Nama",
                    control: namamakanan),
                ContainerInput(
                    width: p1.maxWidth,
                    height: p1.maxHeight * 0.15,
                    nama: "Description",
                    hint: "Masukkan deskripsi",
                    control: description),
                ContainerInput(
                    width: p1.maxWidth,
                    height: p1.maxHeight * 0.15,
                    nama: "Harga",
                    hint: "Masukkan Harga",
                    control: harga),
                SizedBox(
                  height: 12,
                ),
                SizedBox(
                  width: p1.maxWidth,
                  height: p1.maxHeight * 0.1,
                  child: DropdownSearch<String>(
                    onChanged: (value) {
                      setState(() {
                        category = value;
                      });
                    },
                    dropdownDecoratorProps: DropDownDecoratorProps(),
                    asyncItems: (_) => bookController.getCategoryListName(),
                    popupProps: const PopupProps.menu(
                      showSelectedItems: true,
                      showSearchBox: true,
                    ),
                  ),
                ),
                SizedBox(
                  height: p1.maxHeight * 0.04,
                ),
                ContainerSplash(
                    width: p1.maxWidth,
                    height: p1.maxHeight * 0.1,
                    fungsi: () {
                      bookController.editPenjualan(
                          id: widget.item.id.toString(),
                          nama_makanan: namamakanan.text,
                          description: description.text,
                          harga: int.parse(harga.text),
                          category_id: category!);
                    },
                    nama: "Edit Penjualan")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
