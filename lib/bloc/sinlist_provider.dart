import 'dart:async' show Future;
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:sinlist_mobile/data/lists/list.dart';
import 'package:sinlist_mobile/data/lists/listItem.dart';

class SinlistProvider {
  static String url = "http://a1d141503ab9.ngrok.io/api/";

  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  // POST: api/List/add_list
  static Future<List<TodoList>> AddList(TodoList list) async {
    print(jsonEncode(list));
    var todoUrl = Uri.encodeFull(url + "List/add_list" + list.toString());
    var response = await http.post(
      todoUrl,
      body: jsonEncode(list),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      List<TodoList> todoList = List<TodoList>.from(json.decode(response.body));
      return todoList;
    } else {
      print("Request failed with status: ${response.statusCode}.");
    }
  }

  // POST: api/List/add_list_item
  static Future<ListItem> AddListItem(ListItem listItem) async {
    print(jsonEncode(listItem));
    var todoUrl =
        Uri.encodeFull(url + "List/add_list_item" + listItem.toString());
    var response = await http.post(
      todoUrl,
      body: jsonEncode(listItem),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      ListItem listItem = ListItem.fromJson(json.decode(response.body));
      return listItem;
    } else {
      print("Request failed with status: ${response.statusCode}.");
    }
  }

  // POST: api/List/delete_list_item
  static Future DeleteListItem(int itemId) async {
    print(jsonEncode(itemId));
    var todoUrl =
        Uri.encodeFull(url + "List/delete_list_item" + itemId.toString());
    var response = await http.post(
      todoUrl,
      body: jsonEncode(itemId),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      return;
    } else {
      print("Request failed with status: ${response.statusCode}.");
    }
  }

  // POST: api/List/delete_list_with_item
  static Future DeleteListWithItem(int listId) async {
    print(jsonEncode(listId));
    var todoUrl =
        Uri.encodeFull(url + "List/delete_list_item" + listId.toString());
    var response = await http.post(
      todoUrl,
      body: jsonEncode(listId),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      return;
    } else {
      print("Request failed with status: ${response.statusCode}.");
    }
  }

  // POST: api/List/get_list_with_item
  static Future<List<ListItem>> GetListWithItems(int listId) async {
    print(jsonEncode(listId));
    var todoUrl =
        Uri.encodeFull(url + "List/get_list_with_item" + listId.toString());
    var response = await http.post(
      todoUrl,
      body: jsonEncode(listId),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      List<ListItem> listItems =
          List<ListItem>.from(json.decode(response.body));
      return listItems;
    } else {
      print("Request failed with status: ${response.statusCode}.");
    }
  }

  // POST: api/List/update_list
  static Future<TodoList> UpdateList(TodoList todoList) async{
    print(jsonEncode(todoList));
    var todoUrl =
    Uri.encodeFull(url + "List/update_list" + todoList.toString());
    var response = await http.post(
      todoUrl,
      body: jsonEncode(todoList),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      TodoList todoList = TodoList.fromJson(json.decode(response.body));
      return todoList;
    } else {
      print("Request failed with status: ${response.statusCode}.");
    }
  }

  // POST: api/List/update_item
  static Future<ListItem> UpdateListItem (ListItem listItem) async{
    print(jsonEncode(listItem));
    var todoUrl =
    Uri.encodeFull(url + "List/update_item" + listItem.toString());
    var response = await http.post(
      todoUrl,
      body: jsonEncode(listItem),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      ListItem listItem = ListItem.fromJson(json.decode(response.body));
      return listItem;
    } else {
      print("Request failed with status: ${response.statusCode}.");
    }
  }
}
