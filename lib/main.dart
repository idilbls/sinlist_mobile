import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinlist_mobile/pages/home_page.dart';
import 'bloc/bloc_providers.dart';
import 'core/http/api_provider.dart';


void main() => runApp(Sinlist());

class Sinlist extends StatelessWidget {
  Sinlist({this.apiProvider});
  final ApiProvider apiProvider;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: BlocProviders.get(apiProvider: apiProvider),
      child: _initMaterialApp(context),
    );
  }
  Widget _initMaterialApp(BuildContext context) {
    return MaterialApp(
      title: 'Sinlist',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'OpenSans',
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}



