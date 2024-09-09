import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week_two_task_one_a/provider/item_provider.dart';

import 'model/item_model.dart';


class ItemScreen extends StatefulWidget {
  const ItemScreen({super.key});

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title:const Text('Shopping Items'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Consumer<ItemProvider>(builder: (context,value,child){
            return Expanded(
                child: ListView.builder(
                    itemCount: value.items.length,
                    itemBuilder: (context,index){
                      return Dismissible(
                        key: Key(value.items[index].id.toString()),
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding:const  EdgeInsets.symmetric(horizontal: 20),
                          child: const Icon(Icons.delete, color: Colors.white),
                        ),
                        direction: DismissDirection.endToStart, // Swipe from right to left
                        onDismissed: (direction) {
                          value.removeItems(index);

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Item removed")),
                          );
                        },
                        child: Card(
                          child: ListTile(
                            title: Text(value.items[index].itemName.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                            subtitle: Text('RS ${value.items[index].price.toString()}'),
                          ),
                        ),
                      );
                    }));
          })
        ],
      ),
    );
  }
}
