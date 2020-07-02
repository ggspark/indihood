///A model class to hold the schema and data fetched from API
class SchemaDataModel {
  ///Holds schema
  final Map<String, dynamic> fullSchema;

  ///Holds data
  final Map<String, dynamic> fullData;

  ///Constructor to initialise the fields
  SchemaDataModel({this.fullSchema, this.fullData});
}
