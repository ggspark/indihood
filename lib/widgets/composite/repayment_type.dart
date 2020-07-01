import 'package:flutter/cupertino.dart';
import 'package:indihood/widgets/base_type.dart';
import 'package:indihood/widgets/common.dart';

///A widget to render the data with following schema
/// {
///    "type": "SCHEMA",
///    "Date": {
///      "type": "string",
///      "num": "1"
///    },
///    "Amount": {
///      "type": "int",
///      "num": "1"
///    }
///  }
class RepaymentType extends BaseType {
  ///Constructor to initialise the fields
  const RepaymentType(
    String title,
    Map<String, dynamic> schema,
    dynamic data, {
    Key key,
  }) : super(title, schema, data, key: key);

  @override
  Widget requiredRepeated(
      BuildContext context, List<Map<String, Widget>> widgetList) {
    List<Widget> list = [];
    widgetList.forEach((widgetMap) {
      list.add(widgetMap["Date"]);
      list.add(widgetMap["Amount"]);
    });
    return CommonCard(
      title: title,
      children: list,
      collapsedRows: 3,
      expandButtonTitle: "SEE FULL SCHEDULE",
    );
  }
}
