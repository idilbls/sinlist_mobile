import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinlist_mobile/bloc/lists/list_repository.dart';
import 'package:sinlist_mobile/core/bloc/result_state.dart';
import 'package:sinlist_mobile/core/http/api_result.dart';
import 'package:sinlist_mobile/core/http/network_exceptions.dart';
import 'package:sinlist_mobile/data/lists/listItem.dart';

class ListBloc extends Cubit<ResultState<ListItem>> {
  ListBloc({this.repository})
      : assert(repository != null),
        super(Idle());
  final ListRepository repository;


}
