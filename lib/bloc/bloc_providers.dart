import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinlist_mobile/core/http/api_provider.dart';

class BlocProviders {
  static List<BlocProvider> get({ApiProvider apiProvider}) {
    return [
      //BlocProvider<OrderListBloc>(
       // create: (BuildContext context) {
       //   return OrderListBloc(repository: new OrderRepository(apiProvider: apiProvider));
       // },
        //child: OrderListPage(),
    //  ),
    ];
  }
}
