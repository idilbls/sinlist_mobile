import 'package:flutter/cupertino.dart';
import 'package:sinlist_mobile/core/bloc/base_repository.dart';
import 'package:sinlist_mobile/core/http/api_provider.dart';
import 'package:sinlist_mobile/core/http/api_response.dart';
import 'package:sinlist_mobile/core/http/api_result.dart';
import 'package:sinlist_mobile/core/http/network_exceptions.dart';
import 'package:sinlist_mobile/data/lists/list.dart';
import 'package:sinlist_mobile/data/lists/listItem.dart';

class ListRepository implements BaseRepository {
  ListRepository({@required this.apiProvider});
  ApiProvider apiProvider;

  Future<ApiResult<TodoList>> addList(TodoList todoList) async {
    try {
      final json = await apiProvider.post(
        "list/add_list",
        data: todoList.toJson(),
      );
      var apiResponse = ApiResponse.fromJson(json);
      if (apiResponse.success) {
        var response = TodoList.fromJson(apiResponse.result);
        return ApiResult.success(data: response);
      } else {
        throw new Exception(apiResponse.error);
      }
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<ListItem>> addListItem(ListItem listItem) async {
    try {
      final json = await apiProvider.post(
        "list/add_list_item",
        data: listItem.toJson(),
      );
      var apiResponse = ApiResponse.fromJson(json);
      if (apiResponse.success) {
        var response = ListItem.fromJson(apiResponse.result);
        return ApiResult.success(data: response);
      } else {
        throw new Exception(apiResponse.error);
      }
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<List<ListItem>>> getListWithItems(int listId) async {
    try {
      final json = await apiProvider.post(
        "list/get_list_with_item",
        data: listId,
      );
      ApiResponse apiResponse = ApiResponse.fromJson(json);
      if (apiResponse.success) {
        List<ListItem> listItemList = List<ListItem>.from((apiResponse.result as List).map((e) => ListItem.fromJson(e)));
        return ApiResult.success(data: listItemList);
      } else {
        throw new Exception(apiResponse.error);
      }
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<TodoList>> updateList(TodoList todoList) async {
    try {
      final json = await apiProvider.post(
        "list/update_list",
        data: todoList.toJson(),
      );
      var apiResponse = ApiResponse.fromJson(json);
      if (apiResponse.success) {
        var response = TodoList.fromJson(apiResponse.result);
        return ApiResult.success(data: response);
      } else {
        throw new Exception(apiResponse.error);
      }
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<ListItem>> updateListItem(ListItem listItem) async {
    try {
      final json = await apiProvider.post(
        "list/update_item",
        data: listItem.toJson(),
      );
      var apiResponse = ApiResponse.fromJson(json);
      if (apiResponse.success) {
        var response = ListItem.fromJson(apiResponse.result);
        return ApiResult.success(data: response);
      } else {
        throw new Exception(apiResponse.error);
      }
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  //deleteler kaldı

  Future<ApiResult<bool>> deleteListWithItem(int listId) async {
    try {
      final json = await apiProvider.post(
        "list/delete_list_with_item",
        data: listId,
      );
      return ApiResult.success(data: true);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<bool>> deleteListItem(int itemId) async {
    try {
      final json = await apiProvider.post(
        "list/delete_list_item",
        data: itemId,
      );
      return ApiResult.success(data: true);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
