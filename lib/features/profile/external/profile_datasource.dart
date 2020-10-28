import 'dart:convert';
import 'package:curriculo_flutter/utils/constants.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../data/datasources_interface/profile_datasource_interface.dart';
import '../data/models/profile_model.dart';
import 'package:http/http.dart' as http;

class ProfileDatasource extends IProfileDatasource {
  final http.Client clientHttp = Modular.get<http.Client>();

  @override
  Future<ProfileModel> getProfileByLocalJson() async {
    var json = await rootBundle.loadString("assets/file.json");
    if (json != null) {
      return ProfileModel.fromJson(jsonDecode(json));
    } else {
      throw Exception();
    }
  }
}
