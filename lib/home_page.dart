import 'package:data_penjualan/add_categories.dart';
import 'package:data_penjualan/add_url.dart';
import 'package:data_penjualan/card.dart';
import 'package:data_penjualan/controllers/book_controller.dart';
import 'package:data_penjualan/tambah_buku.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final BookController bookController = Get.put(BookController(), tag: "books");
  @override
  void initState() {
    bookController.getPenjualan();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.yellowAccent,
      appBar: AppBar(
        title: Text(
          ("Semua Makanan"),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.restore,
            color: Colors.black,
          ),
          onPressed: () {
            bookController.getPenjualan();
          },
        ),
        actions: [
          IconButton(
              onPressed: () => Get.to(() => const AddCategories()),
              icon: Icon(
                Icons.add_box,
                color: Colors.black,
              )),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.black,
              ),
              onPressed: () => Get.to(() => const DataInput()),
            ),
          ),
          IconButton(
              onPressed: () => Get.to(() => const AddUrl()),
              icon: Icon(
                Icons.add_card,
                color: Colors.black,
              )),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(
            top: mq.height * .016, left: mq.width * .04, right: mq.width * .04),
        child: Obx(
          () => GridView.builder(
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns
              crossAxisSpacing: 10.0, // Spacing between columns
              mainAxisSpacing: 10.0, // Spacing between rows
            ),
            itemCount: bookController.book.length,
            itemBuilder: (context, index) {
              return ContainerApps(
                item: bookController.book[index],
              );
            },
          ),
        ),
      ),
    );
  }
}
