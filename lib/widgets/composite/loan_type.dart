import 'package:flutter/material.dart';
import 'package:indihood/widgets/base_type.dart';

///A widget to render the data with following schema
/// {
///    "type": "SCHEMA",
///    "title": {
///      "type": "string",
///      "num": "1"
///    },
///    "image": {
///      "type": "image_type",
///      "num": "1"
///    },
///    "Borrower Location": {
///      "type": "address_type",
///      "num": "1"
///    },
///    "Applicant Details": {
///      "type": "loan_applicant_type",
///      "num": "1"
///    },
///    "Loan Terms": {
///      "type": "loan_terms_type",
///      "num": "1"
///    },
///    "Repayment Schedule": {
///      "type": "repayment_type",
///      "num": "1+"
///    }
///  }
class LoanType extends BaseType {
  ///Constructor to initialise the fields
  const LoanType(
    String title,
    Map<String, dynamic> schema,
    dynamic data, {
    Key key,
  }) : super(title, schema, data, key: key);

  @override
  Widget requiredSingle(BuildContext context, Map<String, Widget> widgetMap) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          data["title"],
          style: Theme.of(context)
              .textTheme
              .subtitle1
              .copyWith(color: Colors.white),
        ),
      ),
      body: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  widgetMap["image"],
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
              Positioned(
                child: Text(
                  data["image"]["label"],
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                      fontWeight: FontWeight.w700, color: Colors.white),
                ),
                bottom: 64,
                left: 104,
              ),
              widgetMap["Borrower Location"]
            ],
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                SizedBox(height: 6.0),
                widgetMap["Applicant Details"],
                widgetMap["Loan Terms"],
                widgetMap["Repayment Schedule"],
                SizedBox(height: 6.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
