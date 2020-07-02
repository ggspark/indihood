import 'package:flutter/material.dart';
import 'package:indihood/models/schema_data_model.dart';
import 'package:indihood/services/api_service.dart';
import 'package:indihood/widget_types.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

/// Main Widget which sets the theme and initialises the app
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Indihood Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color(0xFF122D49),
        scaffoldBackgroundColor: Color(0xFFF1F5F5),
        textTheme: Theme.of(context).textTheme.copyWith(
              headline6: Theme.of(context).textTheme.headline6.copyWith(
                  color: Color(0xFF3A474E), fontWeight: FontWeight.w700),
              bodyText1: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(color: Color(0xFF3A474E), fontSize: 16),
              bodyText2: Theme.of(context).textTheme.bodyText2.copyWith(
                  color: Color(0xFF3A474E), fontWeight: FontWeight.w500),
              caption: Theme.of(context)
                  .textTheme
                  .caption
                  .copyWith(color: Color(0xFF3A474E)),
            ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FutureProvider<SchemaDataModel>(
        create: (_) => _fetchData(),
        initialData: null,
        child: _MyHome(),
      ),
    );
  }
}

///Widget that fetches the data from remote and renders the widgets according to schema
class _MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SchemaDataModel schemaDataModel = context.watch<SchemaDataModel>();
    if (schemaDataModel == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return getWidgetType(
      "loan1",
      schemaDataModel.fullData["loan1"],
      schemaDataModel.fullData["loan1"],
    );
  }
}

///Fetch data from remote and populate model
Future<SchemaDataModel> _fetchData() async {
  var fullSchema = await ApiService.get(
      "https://ui-test-dot-indihood-dev-in.appspot.com/schema");
  var fullData = await ApiService.get(
      "https://ui-test-dot-indihood-dev-in.appspot.com/records");
  return SchemaDataModel(fullSchema: fullSchema, fullData: fullData);
}
