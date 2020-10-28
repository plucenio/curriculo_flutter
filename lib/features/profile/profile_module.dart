import 'package:curriculo_flutter/features/profile/presentation/pages/profile_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProfileModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.initialRoute,
          child: (context, args) => ProfilePage(),
        ),
      ];
}
