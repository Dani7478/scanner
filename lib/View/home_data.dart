import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controller/db_helper.dart';
import 'package:flutter_application_1/Model/product_model.dart';
import 'package:flutter_application_1/View/showallData.dart';
import 'package:flutter_application_1/View/snackbar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TextEditingController branchCtrl=TextEditingController();
    TextEditingController srNumberCtrl=TextEditingController();
    TextEditingController qrNumberCtrl=TextEditingController();
    TextEditingController assetCategoryCtrl=TextEditingController();
    TextEditingController assetSubCategoryCtrl=TextEditingController();
    TextEditingController assetDescriptionCtrl=TextEditingController();
    TextEditingController assetQRBarCodeCtrl=TextEditingController();

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: TextFormField(
                      controller: branchCtrl,
                      decoration: InputDecoration(
                        hintText: 'Branch'.toUpperCase(),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator: (value) {
                        if (value!.length < 4) {
                          return "character must be greater than 4";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: srNumberCtrl,
                    decoration: InputDecoration(
                      hintText: 'sr. Number'.toUpperCase(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    validator: (value) {
                      if (value!.length < 4) {
                        return "character must be greater than 4";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: qrNumberCtrl,
                    decoration: InputDecoration(
                      hintText: 'QR No.',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    validator: (value) {
                      if (value!.length < 4) {
                        return "character must be greater than 4";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: assetCategoryCtrl,
                    decoration: InputDecoration(
                      hintText: 'Asset category'.toUpperCase(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    validator: (value) {
                      if (value!.length < 4) {
                        return "character must be greater than 4";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: assetSubCategoryCtrl,
                    decoration: InputDecoration(
                      hintText: 'asset sub category'.toUpperCase(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    validator: (value) {
                      if (value!.length < 4) {
                        return "character must be greater than 4";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: assetDescriptionCtrl,
                    decoration: InputDecoration(
                      hintText: 'asset description'.toUpperCase(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    validator: (value) {
                      if (value!.length < 4) {
                        return "character must be greater than 4";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: assetQRBarCodeCtrl,
                    decoration: InputDecoration(
                      hintText: 'asset qr barcode'.toUpperCase(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    validator: (value) {
                      if (value!.length < 4) {
                        return "character must be greater than 4";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FloatingActionButton.extended(
                    onPressed: () async {

                      if (formKey.currentState!.validate()) {
                     Product newProduct=  Product(
                         branch: branchCtrl.text,
                         srNumber: srNumberCtrl.text,
                         qrNumber: qrNumberCtrl.text,
                         assetCategory: assetCategoryCtrl.text,
                         assetSubCategory: assetSubCategoryCtrl.text,
                         assetDescription: assetDescriptionCtrl.text,
                         assetQRBarCode: assetQRBarCodeCtrl.text
                       );
                       DBHelper database = DBHelper.instance;
                       int? id=await database.insertProduct(newProduct);
                       if(id!=null){
                         showAlert('Added','Product Added with Sr.No: ${srNumberCtrl.text}');
                         Navigator.push(context, MaterialPageRoute(builder: (_) => ShowList()));
                       }else
                         {
                           print('Something Went Wrong');
                         }

                      }
                    },
                    label: const SizedBox(
                      width: 120,
                      child: Center(
                        child: Text('Save'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
