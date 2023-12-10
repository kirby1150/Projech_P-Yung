import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class PicturePage extends StatefulWidget {
  const PicturePage({super.key});

  @override
  State<PicturePage> createState() => _PicturePageState();
}

class _PicturePageState extends State<PicturePage> {
  Map? picture;

  @override
  Widget build(BuildContext context) {
    picture = ModalRoute.of(context)?.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Picture Page'),
      ),
      body: Container(
          child: Image.file(
        File(picture!['path']),
        fit: BoxFit.fill,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
      )),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.file_upload),
          onPressed: () async {
            final bytes = await File(picture!['path']).readAsBytes();
            var base64Image = convert.base64Encode(bytes);
            var url = Uri.parse('https://noraphat.dev/web_api/upload/');
            var response = await http.post(url,
                headers: {'Content-Type': 'application/json'},
                body: convert.jsonEncode(
                    {'imageData': 'data:image/jped;base64,' + base64Image}));
            if (response.statusCode == 200) {
              var feedback = convert.jsonDecode(response.body);
              print(feedback);
              Future.delayed(Duration(seconds: 2), () {
                Navigator.pop(context);
              });
            } else {
              print("Error From Backend");
            }
          }),
    );
  }
}
