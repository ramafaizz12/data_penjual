import 'package:data_penjualan/container_input.dart';
import 'package:data_penjualan/container_spalsh.dart';
import 'package:data_penjualan/controllers/book_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCategories extends StatelessWidget {
  const AddCategories({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController title = TextEditingController();
    final BookController bookController =
        Get.put(BookController(), tag: "books");
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: Text("Tambah Jenis Makanan"),
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
                    nama: "Jenis Makanan",
                    hint: "Masukkan Jenis Makanan",
                    control: title),
                ContainerSplash(
                    width: p1.maxWidth,
                    height: p1.maxHeight * 0.1,
                    fungsi: () {
                      bookController.createDataCategories(name: title.text);
                      Get.back();
                    },
                    nama: "Tambah Categories")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
