import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class PremierDetail extends StatefulWidget {
  const PremierDetail({super.key});

  @override
  State<PremierDetail> createState() => _PremierDetailState();
}

class _PremierDetailState extends State<PremierDetail> {
  String? teamID;
  String? teamName;
  String? teamDetail;
  String? teamLogo;
  double teamLat = 0;
  double teamLong = 0;

  Completer<GoogleMapController> _controller = Completer();
  _openGoogleMapApp(double lat, double long) async {
    Uri url =
        Uri.parse('https://www.google.com/maps/search/?api=1&query=$lat,$long');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not lunch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    Map<String, String?> team =
        ModalRoute.of(context)!.settings.arguments as Map<String, String?>;
    teamID = team['id'].toString();
    teamName = team['team_name'].toString();
    teamDetail = team['team_detail'].toString();
    teamLogo = team['team_logo'].toString();
    teamLat = double.tryParse(team['team_lat'].toString())!;
    teamLong = double.tryParse(team['team_long'].toString())!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "$teamName",
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: GoogleMap(
          mapType: MapType.normal,
          markers: <Marker>[
            Marker(
              markerId: MarkerId('marker1'),
              position: LatLng(teamLat, teamLong),
              infoWindow: InfoWindow(title: '$teamName'),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueRose),
              onTap: () {
                showModalBottomSheet(
                  barrierColor: Colors.transparent,
                  isScrollControlled: true,
                  showDragHandle: false,
                  context: context,
                  builder: (builder) {
                    return DraggableScrollableSheet(
                      expand: false,
                      initialChildSize: 0.3,
                      maxChildSize: 0.5,
                      minChildSize: 0.1,
                      builder: (BuildContext context,
                          ScrollController scrollController) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: SingleChildScrollView(
                            controller: scrollController,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Container(
                                    width: 100,
                                    height: 5,
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15.0),
                                      child: Image.network(
                                        "$teamLogo",
                                        width: 55,
                                        height: 55,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(right: 10)),
                                    Text("$teamName",style: TextStyle(fontSize: 22),)
                                  ],
                                ),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10,right: 15,left: 15,bottom: 15),
                                    child: Text(
                                      "$teamDetail",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ].toSet(),
          initialCameraPosition:
              CameraPosition(target: LatLng(teamLat, teamLong), zoom: 15),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          }),
    );
  }
}
