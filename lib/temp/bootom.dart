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
        child: ElevatedButton(
          onPressed: () => showBottomSheewt(
            context,
            widget: layout(),
          ),
          child: const Text('Show Bottom Sheet'),
        ),
      ),
    );
  }

  Widget layout() {
    bool localSwitchValue = false;

    return StatefulBuilder(
      builder: (context, setState) {
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Bottom Sheet Title',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'This is the content of the bottom sheet. You can add any widget here.',
                ),
                const SizedBox(height: 16),
                CustomSwitch(
                  value: localSwitchValue,
                  onChanged: (value) {
                    setState(() {
                      localSwitchValue = value; // Update local state.
                    });
                    listController.filterList(value); // Update the controller.
                  },
                ),
                Obx(() {
                  final filteredList = listController.filteredList;
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: filteredList.length,
                    itemBuilder: (context, index) {
                      final data = filteredList[index];
                      return ListTile(
                        title: Text('$data'),
                      );
                    },
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }

}
