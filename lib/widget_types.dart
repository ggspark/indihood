import 'package:flutter/material.dart';
import 'package:indihood/widgets/basic/int_type.dart';
import 'package:indihood/widgets/basic/string_type.dart';
import 'package:indihood/widgets/composite/address_type.dart';
import 'package:indihood/widgets/composite/image_type.dart';
import 'package:indihood/widgets/composite/loan_applicant_type.dart';
import 'package:indihood/widgets/composite/loan_terms_type.dart';
import 'package:indihood/widgets/composite/loan_type.dart';
import 'package:indihood/widgets/composite/repayment_type.dart';

///A global variable to hold the full schema;
///this can also be provided by an app wide provider
Map<String, dynamic> fullSchema;

///Common function to get instances of widgets based on widget type
///specified by their schema
Widget getWidgetType(String title, Map<String, dynamic> schema, dynamic data) {
  switch (schema["type"]) {
    case "string":
      return StringType(title, schema, data);
    case "int":
      return IntType(title, schema, data);
    case "image_type":
      return ImageType(title, schema, data);
    case "address_type":
      return AddressType(title, schema, data);
    case "loan_terms_type":
      return LoanTermsType(title, schema, data);
    case "loan_applicant_type":
      return LoanApplicantType(title, schema, data);
    case "repayment_type":
      return RepaymentType(title, schema, data);
    case "loan_type":
      return LoanType(title, schema, data);
    default:
      return Container();
  }
}
