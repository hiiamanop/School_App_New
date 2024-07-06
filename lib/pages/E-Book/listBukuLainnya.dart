import 'package:flutter/material.dart';

class ListBukuLainnya extends StatefulWidget {
  const ListBukuLainnya({super.key});

  @override
  State<ListBukuLainnya> createState() => _ListBukuLainnyaState();
}

class _ListBukuLainnyaState extends State<ListBukuLainnya> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('List Buku Lainnya'),),
    );
  }
}