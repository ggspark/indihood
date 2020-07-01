import 'package:flutter/material.dart';
import 'package:indihood/widgets/base_type.dart';
import 'package:intl/intl.dart';

///A widget to render the data with following schema
/// {
///    "type": "int",
///    "num": "1"
/// }
class IntType extends BaseType {
  ///Constructor to initialise the fields
  const IntType(
    String title,
    Map<String, dynamic> schema,
    dynamic data, {
    Key key,
  }) : super(title, schema, data, key: key);

  @override
  Widget requiredSingle(BuildContext context, Map<String, Widget> widgetMap) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(title, style: Theme.of(context).textTheme.caption),
        Text(
          title.contains("Amount") ? "Rs ${_getAmount(data)}" : data.toString(),
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }

  String _getAmount(int amount) {
    return NumberFormat("##,##,##0").format(amount);
  }
}
