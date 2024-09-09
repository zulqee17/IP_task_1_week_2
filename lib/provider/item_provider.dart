
import 'package:flutter/foundation.dart';

import '../model/item_model.dart';

class ItemProvider extends ChangeNotifier{
  final List<ItemModel> _items=[];

  List<ItemModel> get items=>_items;


  void addItems(String itemsName,String itemPrice,int uId){
    _items.add(ItemModel(itemName: itemsName, price: itemPrice,id: uId));
    notifyListeners();
  }

  void removeItems(int index){
    _items.removeAt(index);
    notifyListeners();
  }
}