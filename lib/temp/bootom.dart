import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm/temp/switch.dart';
import 'controller.dart';

Future<void> showBottomSheewt(BuildContext context, {required Widget widget}) {
  return showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return widget;
    },
  );
}

class BottomSheetExample extends StatefulWidget {
  const BottomSheetExample({super.key});

  @override
  State<BottomSheetExample> createState() => _BottomSheetExampleState();
}

class _BottomSheetExampleState extends State<BottomSheetExample> {
  final ListController listController = Get.put(ListController());

  final List<int> first = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];
  final List<int> second = [1, 2, 3, 4, 5, 6];

  int? st;
  int? nd;

  @override
  void initState() {
    super.initState();
    listController.filterList(false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Sheet Example'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async{
               final selected = await  showModalBottomSheet(
                 context: context,
                 builder: (BuildContext context) {
                   return layout(first);
                 },
               );

               ScaffoldMessenger.of(context)
                 ..removeCurrentSnackBar()
                 ..showSnackBar(SnackBar(content: Text('$selected')));
              },
              child: Text('Bottom value $st'),
            ),
            ElevatedButton(
              onPressed: () => showBottomSheewt(
                context,
                widget: layout(second),
              ),
              child: Text(' Bottom value '),
            ),
          ],
        ),
      ),
    );
  }

  Widget layout(List item) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: item.length,
          itemBuilder: (context, index) {
            final data = item[index];
            return ListTile(
              title: Text('$data'),
              onTap: () {
                Navigator.pop(context, data);
              },
            );
          },
        ),
      ),
    );
  }
}

class Layout extends StatelessWidget {
  final List item;
  const Layout({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: item.length,
          itemBuilder: (context, index) {
            final data = item[index];
            return ListTile(
              title: Text('$data'),
              onTap: () {
                Navigator.pop(context, data);
              },
            );
          },
        ),
      ),
    );
  }
}
