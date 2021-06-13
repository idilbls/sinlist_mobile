import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinlist_mobile/bloc/lists/list_bloc.dart';
import 'package:sinlist_mobile/bloc/lists/list_repository.dart';
import 'package:sinlist_mobile/core/http/api_provider.dart';
import 'package:sinlist_mobile/main.dart';

class BlocProviders {
  static List<BlocProvider> get({ApiProvider apiProvider}) {
    return [
      BlocProvider<ListBloc>(
       create: (BuildContext context) {
         return ListBloc(repository: new ListRepository(apiProvider: apiProvider));
       },
        child: Sinlist(),
     ),
    ];
  }
}
