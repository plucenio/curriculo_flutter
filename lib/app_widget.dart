import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.amber,
        textTheme: TextTheme(
          headline5: TextStyle(color: Colors.black54),
          headline6: TextStyle(color: Colors.black45, fontSize: 18),
          subtitle1: TextStyle(color: Colors.grey),
          subtitle2: TextStyle(color: Colors.grey),
          bodyText1: TextStyle(color: Colors.grey),
          bodyText2: TextStyle(color: Colors.grey),
        ),
      ),
      navigatorKey: Modular.navigatorKey,
      onGenerateRoute: Modular.generateRoute,
      initialRoute: Modular.initialRoute,
    );
  }
}
