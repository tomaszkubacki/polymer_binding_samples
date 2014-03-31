import 'package:polymer/polymer.dart';


@CustomTag('tbody-repeat')
class TbodyRepeat extends PolymerElement {
  
  TbodyRepeat.created() : super.created() {
  }
  
  @observable List<Item> items = toObservable([new Item("A item","A item description"),
                                               new Item("B item","B item description"),
                                               new Item("C item","C item description"),
                                               new Item("D item","D item description")]);
}

class Item extends Observable {
  
  @observable String name;
  
  @observable String description;
  
  Item(this.name,this.description);
  
}

