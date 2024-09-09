import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week_two_task_one_a/item_screen.dart';
import 'package:week_two_task_one_a/provider/item_provider.dart';

import 'model/item_model.dart';

class AddDataScreen extends StatefulWidget {
  const AddDataScreen({Key? key}) : super(key: key);

  @override
  State<AddDataScreen> createState() => _AddDataScreenState();
}

class _AddDataScreenState extends State<AddDataScreen> {
  final itemController=TextEditingController();
  final priceController=TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    itemController.dispose();
    priceController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller=Provider.of<ItemProvider>(context);
    int id=DateTime.now().microsecondsSinceEpoch;
    return Scaffold(
      appBar: AppBar(
        title:const Text('Shopping List App'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TextFormField(
              controller: itemController,
              decoration: InputDecoration(
                hintText: 'Enter item name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
              ),
            ),
            const SizedBox(height: 10,),
            TextFormField(
              controller: priceController,
              decoration: InputDecoration(
                hintText: 'Enter item price',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
              ),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
                onPressed: (){
                  controller.addItems(itemController.text.toString(), priceController.text.toString(),id);
                  itemController.clear();
                  priceController.clear();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Item added")),
                  );
                },
                child: const Text('Add Item')),
            const SizedBox(height: 10,),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ItemScreen()));
                },
                child: const Text('See Items')),
          ],
        ),
      ),
    );
  }
}
