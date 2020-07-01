import 'package:flutter/cupertino.dart';
import 'package:indihood/widgets/base_type.dart';
import 'package:indihood/widgets/common.dart';

///A widget to render the data with following schema
/// {
///    "type": "SCHEMA",
///    "Duration": {
///      "type": "string",
///      "num": "1"
///    },
///    "Interest Rate": {
///      "type": "string",
///      "num": "1"
///    },
///    "Loan Amount": {
///      "type": "int",
///      "num": "1"
///    },
///    "Loan Product": {
///      "type": "string",
///      "num": "1"
///    }
///  },
class LoanTermsType extends BaseType {
  ///Constructor to initialise the fields
  const LoanTermsType(
    String title,
    Map<String, dynamic> schema,
    dynamic data, {
    Key key,
  }) : super(title, schema, data, key: key);

  @override
  Widget requiredSingle(BuildContext context, Map<String, Widget> widgetMap) {
    return CommonCard(
      title: title,
      children: <Widget>[
        widgetMap["Duration"],
        widgetMap["Interest Rate"],
        widgetMap["Loan Amount"],
        widgetMap["Loan Product"],
      ],
    );
  }
}
