import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinlist_mobile/bloc/lists/list_bloc.dart';
import 'package:sinlist_mobile/core/bloc/result_state.dart';
import 'package:sinlist_mobile/core/http/network_exceptions.dart';
import 'package:sinlist_mobile/data/lists/list.dart';
import 'package:sinlist_mobile/data/lists/listItem.dart';

class HomePage extends StatefulWidget {
  TodoList todoList;
  ListItem listItem;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  new GlobalKey<RefreshIndicatorState>();
  List<ListItem> listItems;

  @override
  void didChangeDependencies() {
    var listt = context
        .bloc<ListBloc>()
        .loadListItems(1);
    super.didChangeDependencies();
  }

  void _loadListItemsById(BuildContext buildContext, int listId) async {
    listItems = context.bloc<ListBloc>().loadListItems(listId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sinlist Demo"),
      ),
      body: BlocBuilder<ListBloc, ResultState<List<ListItem>>>(
        builder: (BuildContext bodyContext, ResultState<List<ListItem>> state) {
          return state.when(
            loading: () {
              return Center(child: CircularProgressIndicator());
            },
            idle: () {
              return Container();
            },
            data: (List<ListItem> datas) {
              return RefreshIndicator(
                  key: _refreshIndicatorKey,
                  child: dataWidget(datas, bodyContext),
                  onRefresh: () async {
                    setState(() {
                      _loadListItemsById(bodyContext, 1);
                    });
                  });
            },
            error: (NetworkExceptions error) {
              return Center(
                  child: Text(NetworkExceptions.getErrorMessage(error)));
            },
          );
        },
      ),
    );
  }

  Widget dataWidget(List<ListItem> data, BuildContext buildContext) {
    return Container(
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 2,
            itemBuilder: (BuildContext itemBuilderContext, int index) {
              return Container(
                child: _getListItemView(buildContext, listItems[index], index),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _getListItemView(
      BuildContext buildContext, ListItem listItem, int itemIndex) {
    return new Scaffold(
      body: Container(
        child: Column(
          children: [
            Text("${listItem.name}"),
            Text("${listItem.description}"),
            Text("${listItem.creationTime}"),
          ],
        ),
      ),
    );
  }


}
