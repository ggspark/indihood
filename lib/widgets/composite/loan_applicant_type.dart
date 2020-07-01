import 'package:flutter/cupertino.dart';
import 'package:indihood/widgets/base_type.dart';
import 'package:indihood/widgets/common.dart';

///A widget to render the data with following schema
/// {
///    "type": "SCHEMA",
///    "Name": {
///      "type": "string",
///      "num": "1"
///    },
///    "Date of Birth": {
///      "type": "string",
///      "num": "1"
///    },
///    "Phone Number": {
///      "type": "string",
///      "num": "1+"
///    },
///    "Marital Status": {
///      "type": "string",
///      "num": "1"
///    },
///    "No of Dependents": {
///      "type": "int",
///      "num": "1"
///    }
///  }
class LoanApplicantType extends BaseType {
  ///Constructor to initialise the fields
  const LoanApplicantType(
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
        widgetMap["Name"],
        Container(),
        widgetMap["Date of Birth"],
        widgetMap["Phone Number"],
        widgetMap["Marital Status"],
        widgetMap["No of Dependents"],
      ],
    );
  }
}
