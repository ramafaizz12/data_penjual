import 'package:data_penjualan/container_input.dart';
import 'package:data_penjualan/container_spalsh.dart';
import 'package:data_penjualan/controllers/book_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddUrl extends StatelessWidget {
  const AddUrl({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController title = TextEditingController();
    final BookController bookController =
        Get.put(BookController(), tag: "books");
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: Text("Ganti Url"),
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
                    nama: "Ganti Url",
                    hint: "Masukkan Url",
                    control: title),
                ContainerSplash(
                    width: p1.maxWidth,
                    height: p1.maxHeight * 0.1,
                    fungsi: () {
                      bookController.updateBaseUrl(title.text);
                      Get.back();
                    },
                    nama: "Ganti Url")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
