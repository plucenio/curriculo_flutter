import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'app_widget.dart';
import 'features/profile/data/datasources_interface/profile_datasource_interface.dart';
import 'features/profile/external/profile_datasource.dart';
import 'features/profile/profile_module.dart';
import 'package:http/http.dart' as http;

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind<http.Client>((i) => http.Client()),
        Bind<IProfileDatasource>((i) => ProfileDatasource()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.initialRoute,
          module: ProfileModule(),
        )
      ];
}
