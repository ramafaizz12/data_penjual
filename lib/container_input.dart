import 'package:flutter/material.dart';

class ContainerInput extends StatelessWidget {
  double width;
  double height;
  String nama;
  TextEditingController control = TextEditingController();
  Function(String)? fungsi;

  String? hint;

  Color? warnaborder;
  VoidCallback? ontapfield;
  ContainerInput(
      {super.key,
      required this.nama,
      required this.control,
      this.fungsi,
      required this.width,
      required this.height,
      this.hint,
      this.warnaborder,
      this.ontapfield});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: LayoutBuilder(
        builder: (context, p1) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              nama,
              style: TextStyle(color: Colors.white),
            ),
            Container(
              width: p1.maxWidth,
              margin: EdgeInsets.only(top: p1.maxHeight * 0.03),
              height: p1.maxHeight * 0.7,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1.0, color: Colors.black),
                  borderRadius: BorderRadius.circular(12)),
              child: TextField(
                controller: control,
                onTap: ontapfield,
                minLines: 2,
                maxLines: 10,
                decoration: InputDecoration(
                    hintText: hint,
                    border: InputBorder.none,
                    filled: true,
                    isDense: true,
                    contentPadding: const EdgeInsets.only(top: 5, left: 5)),
                onChanged: fungsi,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
