import 'package:polymer/polymer.dart';
import 'dart:async';

@CustomTag('tbody-repeat')
class TbodyRepeat extends PolymerElement {

   TbodyRepeat.created() : super.created() {
   }

   @observable List<List<Item>> items =
     toObservable([
       toObservable([new Item("A item","A item description"), new Item("A1 item","A1 item description"), new Item("A2 item","A2 item description")]),
       toObservable([new Item("B item","B item description"), new Item("B2 item","B2 item description"), new Item("B2 item","B2 item description")]),
       toObservable([new Item("C item","C item description")]),
       toObservable([new Item("D item","D item description")])
    ]);

   var timer = null;

   @override
      enteredView() {
         if( timer == null ) {
            timer = new Timer.periodic(new Duration(seconds: 3), updateList);
         }
      }

   void updateList(Timer _) {
      DateTime today = new DateTime.now();
      String time = today.hour.toString() + ":" + today.minute.toString() + "." + today.second.toString();
      items.add( [new Item(time, today.millisecondsSinceEpoch.toString() + today.hour.toString() + ":" + today.minute.toString() + "." + today.second.toString() )] );
      items.first.first.description = today.millisecondsSinceEpoch.toString();
   }
}

class Item extends Observable {

   @observable String name;

   @observable String description;

   Item(this.name,this.description);
}

