import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinlist_mobile/bloc/lists/list_repository.dart';
import 'package:sinlist_mobile/core/bloc/result_state.dart';
import 'package:sinlist_mobile/core/http/api_result.dart';
import 'package:sinlist_mobile/core/http/network_exceptions.dart';
import 'package:sinlist_mobile/data/lists/listItem.dart';

class ListBloc extends Cubit<ResultState<List<ListItem>>> {
  ListBloc({this.repository})
      : assert(repository != null),
        super(Idle());
  final ListRepository repository;

  loadListItems(int listId) async {
    emit(ResultState.loading());
    ApiResult<List<ListItem>> apiResult = await repository.getListWithItems(listId);
    apiResult.when(
      success: (List<ListItem> datas) => emit(ResultState.data(data: datas)),
      failure: (NetworkExceptions error) => emit(ResultState.error(error: error)),
    );
  }

}
