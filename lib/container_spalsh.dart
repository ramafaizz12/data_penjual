import 'package:flutter/material.dart';

class ContainerSplash extends StatefulWidget {
  final double width;
  final double height;
  final String nama;

  final void Function()? fungsi;
  const ContainerSplash(
      {super.key,
      required this.width,
      required this.height,
      required this.fungsi,
      required this.nama});

  @override
  State<ContainerSplash> createState() => _ContainerSplashState();
}

class _ContainerSplashState extends State<ContainerSplash> {
  bool warna = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.fungsi,
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blueGrey,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 0.5,
                blurRadius: 5,
                offset: const Offset(2, 4))
          ],
        ),
        child: LayoutBuilder(
          builder: (p0, p1) => Center(
            child: Text(
              widget.nama,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
