import 'package:data_penjualan/controllers/book_controller.dart';
import 'package:data_penjualan/edit_page.dart';
import 'package:data_penjualan/models/item_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ContainerApps extends StatelessWidget {
  final Item item;

  const ContainerApps({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    final BookController bookController = Get.find(tag: "books");
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nama: ${item.nama_makanan}',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              Text(
                'Deskripsi: ${item.description}',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              SizedBox(
                height: 12,
              ),
              Center(
                child: Text(
                  'Harga: ${item.harga}',
                  style: TextStyle(color: Colors.redAccent, fontSize: 15),
                ),
              ),
              Center(
                  child: Row(
                children: [
                  IconButton(
                      onPressed: () => Get.to(() => DataInput(
                            item: item,
                          )),
                      icon: Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: mq.width * 0.07,
                      )),
                  IconButton(
                      onPressed: () {
                        bookController.deletePenjualan(item.id.toString());
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: mq.width * 0.07,
                      )),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
