import 'package:fluent_query_builder/fluent_query_builder.dart';

import 'db_config.dart';

DbLayer db;

Future<void> connect() async {
  db = await DbLayer().connect(pgsqlCom);
}
