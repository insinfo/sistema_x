import 'package:angel3_framework/angel3_framework.dart';
import 'dart:async';
import 'package:file/local.dart';
import 'package:sistema_x/src/shared/routes.dart';

Future configureServer(Angel app) async {
  var fs = const LocalFileSystem();
  await app.configure(configureRoutes(fs));
}
