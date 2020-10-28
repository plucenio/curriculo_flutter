import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:curriculo_flutter/features/profile/data/datasources_interface/profile_datasource_interface.dart';
import 'package:curriculo_flutter/features/profile/data/models/education_model.dart';
import 'package:curriculo_flutter/features/profile/data/models/language_model.dart';
import 'package:curriculo_flutter/features/profile/data/models/profile_model.dart';
import 'package:curriculo_flutter/features/profile/data/models/work_experience_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    Key key,
  }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ProfileModel model;

  Future<ProfileModel> getProfile() async {
    ProfileModel model =
        await Modular.get<IProfileDatasource>().getProfileByLocalJson();
    return model;
  }

  Column getWorkExperienceList(Iterable<WorkExperienceModel> list) {
    var column = Column(
      children: [],
    );

    list.forEach((element) {
      column.children.add(
        Text(
          element.company,
          style: Theme.of(context).textTheme.headline6,
        ),
      );
      column.children.add(
        Text(
          element.title,
          style: Theme.of(context).textTheme.headline6,
        ),
      );
      column.children.add(
        Text(
          "${element.startDate} - ${element.endDate}",
          style: Theme.of(context).textTheme.bodyText2,
        ),
      );
      column.children.add(
        Text(
          element.description,
          style: Theme.of(context).textTheme.bodyText2,
        ),
      );
      column.children.add(
        Divider(),
      );
    });

    return column;
  }

  Column getEducationList(Iterable<EducationModel> list) {
    var column = Column(
      children: [],
    );

    list.forEach((element) {
      column.children.add(
        Text(
          element.university,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      );
      column.children.add(
        Text(
          element.title,
          style: Theme.of(context).textTheme.headline6,
        ),
      );
      column.children.add(
        Text(
          "${element.startDate} - ${element.endDate}",
          style: Theme.of(context).textTheme.bodyText2,
        ),
      );
    });

    return column;
  }

  Column getLanguagesList(Iterable<LanguageModel> list) {
    var column = Column(
      children: [],
    );

    column.children.add(
      Container(
        height: 250,
        child: BarChart(
          BarChartData(
              alignment: BarChartAlignment.spaceEvenly,
              barGroups: [
                BarChartGroupData(
                  x: 1,
                  barsSpace: 50,
                  barRods: [
                    BarChartRodData(
                      colors: [
                        Colors.blue,
                        Colors.lightBlue[200],
                      ],
                      y: 10,
                      width: 50,
                      borderRadius: BorderRadius.zero,
                    ),
                    BarChartRodData(
                      colors: [
                        Colors.blue,
                        Colors.lightBlue[200],
                      ],
                      y: 4,
                      width: 50,
                      borderRadius: BorderRadius.zero,
                    ),
                  ],
                ),
              ],
              minY: 0,
              maxY: 10,
              gridData: FlGridData(
                show: true,
                drawVerticalLine: true,
                drawHorizontalLine: true,
              )),
        ),
      ),
    );

    return column;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getProfile(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Loading",
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            body: CircularProgressIndicator(),
          );
        } else {
          ProfileModel model = snapshot.data;
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "${model.name} - ${model.occupation}",
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            body: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 48,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Photo:',
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              Text(
                                '0',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ],
                          ),
                          Divider(),
                          Column(
                            children: [
                              Text(
                                'Contact Details:',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Email: ",
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                  Text(
                                    model.contactDetails.email,
                                    style:
                                        Theme.of(context).textTheme.subtitle2,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Linkedin: ",
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                  Text(
                                    model.contactDetails.linkedin,
                                    style:
                                        Theme.of(context).textTheme.subtitle2,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Phone: ",
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                  Text(
                                    model.contactDetails.phone,
                                    style:
                                        Theme.of(context).textTheme.subtitle2,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Divider(),
                          Column(
                            children: [
                              Text(
                                'Profile:',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              Text(
                                model.description,
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                            ],
                          ),
                          Divider(),
                          Column(
                            children: [
                              Text(
                                'Education:',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              getEducationList(model.education.values),
                            ],
                          ),
                          Divider(),
                          Column(
                            children: [
                              Text(
                                'Languages:',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              getLanguagesList(model.languages.values),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: VerticalDivider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                ),
                Expanded(
                  flex: 48,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Work Experience:',
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              getWorkExperienceList(
                                  model.workExperience.values),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
