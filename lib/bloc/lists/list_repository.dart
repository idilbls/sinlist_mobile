import 'dart:async';
import 'package:sinlist_mobile/data/lists/list.dart';
import 'package:sinlist_mobile/data/lists/listItem.dart';
import '../sinlist_provider.dart';

abstract class IListRepository {
  Future<List<TodoList>> AddList(TodoList list);
  Future<ListItem> AddListItem(ListItem listItem);
  Future DeleteListItem(int itemId);
  Future DeleteListWithItem(int listId);
  Future<List<ListItem>> GetListWithItems(int listId);
  Future<TodoList> UpdateList(TodoList todoList);
  Future<ListItem> UpdateListItem (ListItem listItem);
}

class ListRepository extends IListRepository {
  Future<List<TodoList>> AddList(TodoList list) async {
    return await SinlistProvider.AddList(list);
  }
  Future<ListItem> AddListItem(ListItem listItem) async{
    return await SinlistProvider.AddListItem(listItem);
  }
  Future DeleteListItem(int itemId) async{
    return await SinlistProvider.DeleteListItem(itemId);
  }
  Future DeleteListWithItem(int listId) async{
    return await SinlistProvider.DeleteListWithItem(listId);
  }
  Future<List<ListItem>> GetListWithItems(int listId) async{
    return await SinlistProvider.GetListWithItems(listId);
  }
  Future<TodoList> UpdateList(TodoList todoList) async{
    return await SinlistProvider.UpdateList(todoList);
  }
  Future<ListItem> UpdateListItem (ListItem listItem) async{
    return await SinlistProvider.UpdateListItem(listItem);
  }

}