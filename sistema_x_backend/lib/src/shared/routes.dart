import 'package:angel3_static/angel3_static.dart' as static_file_server;
import 'package:angel3_framework/angel3_framework.dart';
import 'package:file/file.dart' as file;
import 'package:sistema_x/src/controllers/pessoa_controller.dart';

AngelConfigurer configureRoutes(file.FileSystem fileSystem) {
  return (Angel app) async {
    app.get('/', (req, res) => res.write('hello'));
    app.get('/pessoas', (req, res) => PessoaController.listar);

    if (!app.environment.isProduction) {
      var vDir = static_file_server.VirtualDirectory(
        app,
        fileSystem,
        source: fileSystem.directory('web'),
      );
      app.fallback(vDir.handleRequest);
    }

    app.fallback((req, res) => res.write('não existe'));

    var oldErrorHandler = app.errorHandler;
    app.errorHandler = (e, req, res) async {
      if (req.accepts('text/html', strict: true)) {
        if (e.statusCode == 404 && req.accepts('text/html', strict: true)) {
          await res
              .render('error', {'message': 'No file exists at ${req.uri}.'});
        } else {
          await res.render('error', {'message': e.message});
        }
      } else {
        return await oldErrorHandler(e, req, res);
      }
    };
  };
}
