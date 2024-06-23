import 'package:data_penjualan/container_input.dart';
import 'package:data_penjualan/container_spalsh.dart';
import 'package:data_penjualan/controllers/book_controller.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataInput extends StatefulWidget {
  const DataInput({
    super.key,
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
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: Text("Buat Data Makanan"),
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
                    hint: "Masukkan harga",
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
                    dropdownDecoratorProps: const DropDownDecoratorProps(),
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
                      bookController.createPenjualan(
                          nama_makanan: namamakanan.text,
                          description: description.text,
                          harga: int.parse(harga.text),
                          category_id: category!);
                    },
                    nama: "Tambah Makanan")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
