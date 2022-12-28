import 'dart:io';

import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/Controller/db_helper.dart';
import 'package:flutter_application_1/View/home_data.dart';
import 'package:path_provider/path_provider.dart';

import 'AllCsvFileScreen.dart';

class ShowList extends StatefulWidget {
  const ShowList({super.key});

  @override
  State<ShowList> createState() => _ShowListState();
}

class _ShowListState extends State<ShowList> {
  List productList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProdctList();
  }

  getProdctList() async {
    DBHelper database = DBHelper.instance;
    productList = await database.getAllProduct();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Product List'),
          actions: [
            Center(
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const MyHomePage()));
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  height: 45,
                  width: 80,
                  color: Colors.redAccent,
                  child: const Center(child: Text('New')),
                ),
              ),
            ),
            Center(
              child: InkWell(
                onTap: () {
                  generateCsv();
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 10,left: 10),
                  height: 45,
                  width: 80,
                  color: Colors.redAccent,
                  child: const Center(child: Text('Export')),
                ),
              ),
            )

          ],
        ),
        body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: 400,
            child: ListView.builder(
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  return  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  padding: EdgeInsets.only(left: 15),
                    height: 200,
                    color: Colors.grey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        text('Branch :${productList[index]['branch']}'),
                        const SizedBox(height: 5,),
                        text('Sr_No :${productList[index]['srNumber']}'),
                        const SizedBox(height: 5,),
                        text('QR_No :${productList[index]['qrNumber']}'),
                        const SizedBox(height: 5,),
                        text(' Ass_Cate : ${productList[index]['assetCategory']}'),
                        const SizedBox(height: 5,),
                        text('Ass_SubCat : ${productList[index]['assetSubCategory']}'),
                        const SizedBox(height: 5,),
                        text('Ass_Desc : ${productList[index]['assetDescription']}'),
                        const SizedBox(height: 5,),
                        text('Asst_QRBarCd : ${productList[index]['assetQRBarCode']}'),

                      ],
                    ),
                  );
                })),
      ),
    );
  }

  text(String txt){
    return Text(
      txt,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w300,
      ),
    );
  }
  generateCsv() async {
    DBHelper database =DBHelper .instance;
    List data=await database.getAllProduct();
    print(data);
    List<List<String>> stringList=[];
    print('Starting...');
    for(int i=0; i<data.length ;i++){
      stringList.add([
        data[i]['branch'],
        data[i]['srNumber'],
        data[i]['qrNumber'],
        data[i]['assetCategory'],
        data[i]['assetSubCategory'],
        data[i]['assetDescription'],
        data[i]['assetQRBarCode'],
      ]);
    }
    print('Ending....');
    print(stringList);
    String csvData = ListToCsvConverter().convert(stringList);
    final String directory = (await getApplicationSupportDirectory()).path;
    final path = "$directory/csv-${DateTime.now()}.csv";
    print(path);
    final File file = File(path);
    await file.writeAsString(csvData);
    print('Saved');
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return LoadCsvDataScreen(path: path);
        },
      ),
    );
  }
}
