import 'package:curriculo_flutter/app_module.dart';
import 'package:curriculo_flutter/features/profile/data/datasources_interface/profile_datasource_interface.dart';
import 'package:curriculo_flutter/features/profile/profile_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {
    WidgetsFlutterBinding.ensureInitialized();
    initModules([
      AppModule(),
      ProfileModule(),
    ], changeBinds: []);
  });
  group('main test', () {
    test(
      'should ',
      () async {
        // Arrange

        // Act
        var profile =
            await Modular.get<IProfileDatasource>().getProfileByLocalJson();

        //Assert
      },
    );
  });
}
