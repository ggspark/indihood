import 'package:flutter/material.dart';
import 'package:indihood/services/api_service.dart';
import 'package:indihood/widget_types.dart';

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
      home: _MyHomePage(),
    );
  }
}

///Widget that fetches the data from remote and renders the widgets according to schema
class _MyHomePage extends StatefulWidget {
  _MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  Map<String, dynamic> loan;

  @override
  void initState() {
    _fetchData();
    super.initState();
  }

  void _fetchData() async {
    fullSchema = await ApiService.get(
        "https://ui-test-dot-indihood-dev-in.appspot.com/schema");
    loan = await ApiService.get(
        "https://ui-test-dot-indihood-dev-in.appspot.com/records");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (loan != null) {
      return getWidgetType(
        "loan1",
        loan["loan1"],
        loan["loan1"],
      );
    }
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
