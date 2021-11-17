import 'package:fluent_query_builder/fluent_query_builder.dart';

final pgsqlCom = DBConnectionInfo(
    host: '192.168.133.13',
    database: 'sistemas',
    driver: ConnectionDriver.pgsql,
    username: 'sisadmin',
    password: 's1sadm1n',
    schemes: ['pmro_padrao']);
