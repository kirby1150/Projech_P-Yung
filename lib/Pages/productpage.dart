// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:_6404800007/Models/Product.dart';
import 'package:_6404800007/widgets/menu.dart';

class productpage extends StatefulWidget {
  const productpage({super.key});

  @override
  State<productpage> createState() => _productpageState();
}

class _productpageState extends State<productpage> {
  List<Course>? course = [];
  bool isLoding = true;
  Future<void> _getData() async {
    var url = Uri.parse("https://noraphat.dev/ComSciSiamU/uttapol/get_product/");
    //แปลง String มาเป็นภาษา Dart
    var response = await http.get(url);
    if (response.statusCode == 200) {
      print('Responese : ${response.statusCode}');
      // print(response.body);
      final Product product =
          Product.fromJson(convert.jsonDecode(response.body));
      setState(() {
        course = product.course;
        isLoding = false;
      });
    } else {
      print('Error From Backend ${response.statusCode}');
      isLoding = false;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
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
                return ListTile(
                  leading: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                            image: NetworkImage(course![index].images!),
                            fit: BoxFit.cover)),
                  ),
                  title: Text('${course![index].pdName}'),
                  subtitle: Text('price : ${course![index].price} .-'),
                  trailing: Icon(Icons.arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, 'productstack/detail',
                    arguments: {
                      'id':course![index].id,
                      'pdname':course![index].pdName,
                      'images':course![index].images,
                      'price':course![index].price,
                    });
                  },
                );
              },
              separatorBuilder: (BuildContext context, index) => Divider(),
              itemCount: course!.length,
            ),
    );
  }
}
