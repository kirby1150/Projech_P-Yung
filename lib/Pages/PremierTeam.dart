import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:_6404800007/Models/Team.dart';
import 'package:_6404800007/widgets/menu.dart';

class PremierTeamPage extends StatefulWidget {
  const PremierTeamPage({super.key});

  @override
  State<PremierTeamPage> createState() => _PremierTeamPageState();
}

class _PremierTeamPageState extends State<PremierTeamPage> {
  List<Course>? team = [];
  bool isLoding = true;

  Future<void> getTeamData() async {
    var url = Uri.parse("https://noraphat.dev/web_api/get_team_name/");
    //แปลง String มาเป็นภาษา Dart
    var response = await http.get(url);
    if (response.statusCode == 200) {
      print('Responese : ${response.statusCode}');
      final Team allteam = Team.fromJson(convert.jsonDecode(response.body));
      setState(() {
        team = allteam.team;
        isLoding = false;
      });
    } else {
      print('Error From Backend ${response.statusCode}');
      isLoding = false;
    }
  }

  void initState() {
    super.initState();
    getTeamData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Menu(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Product Page"),
      ),
      body: isLoding == true
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              itemBuilder: (BuildContext context, index) {
                return Container(
                  child: ListTile(
                    leading: Container(
                      width: 60,
                      height: 60,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.network(
                          team![index].team_logo!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text('${team![index].team_name}'),
                    trailing: Icon(Icons.arrow_right),
                    onTap: () {
                      Navigator.pushNamed(context, 'premierStack/detail',
                          arguments: {
                            'id': team![index].id,
                            'team_name': team![index].team_name,
                            'team_detail': team![index].team_detail,
                            'team_logo': team![index].team_logo,
                            'team_lat': team![index].team_lat,
                            'team_long': team![index].team_long,
                          });
                    },
                  ),
                );
              },
              separatorBuilder: (BuildContext context, index) => Divider(),
              padding: EdgeInsets.only(top: 10, bottom: 10),
              itemCount: team!.length,
            ),
    );
  }
}
