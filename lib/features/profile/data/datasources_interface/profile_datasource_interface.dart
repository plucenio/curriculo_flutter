import 'package:curriculo_flutter/features/profile/data/models/profile_model.dart';

abstract class IProfileDatasource {
  Future<ProfileModel> getProfileByLocalJson();
}
