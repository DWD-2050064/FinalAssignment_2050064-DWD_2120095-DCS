import 'dart:io';

import 'package:finalassign/postApi/web2.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget Listing = const viewList();

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  String? filePath;
  String? thumbnailExt;
  ImagePicker picker = ImagePicker();
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Category'),),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            TextButton(
              onPressed: (){
                showMaterialModalBottomSheet(
                  expand: false,
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (context) => Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        ListTile(
                          leading: const Icon(Icons.browse_gallery),
                          onTap: () async{
                            XFile? image = await picker.pickImage(source: ImageSource.gallery);
                            setState(() {
                              filePath = image!.path;
                              thumbnailExt = image.path.split('.').last;
                            });
                          },
                          title: const Text('Upload from gallery'),
                        ),
                        const Divider(),
                        ListTile(
                          leading: const Icon(Icons.camera),
                          onTap: () async{
                            XFile? image = await picker.pickImage(source: ImageSource.camera);
                            setState(() {
                              filePath = image!.path;
                              thumbnailExt = image.path.split('.').last;
                            });
                          },
                          title: const Text('Upload from camera'),
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: const Text('Choose File/Image'),
            ),
            if(filePath != null)
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black)
                ),
                child: Image.file(File(filePath!)),
                height: 200,
              ),
            const Padding(padding: EdgeInsets.all(10)),
            TextFormField(
              controller: name,
              keyboardType: TextInputType.number,
              decoration:  const InputDecoration(
                  hintText: 'Name'
              ),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            TextFormField(
              controller: description,
              keyboardType: TextInputType.number,
              decoration:  const InputDecoration(
                  hintText: 'Description'
              ),
            ),
            TextButton(onPressed: () async {
              var response = await ACategory.ac(name,description,filePath,thumbnailExt);
              var obj = jsonDecode(response);
              if(obj['code'] != 'error') {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString('category_id', obj['category_id']);
                showDialog(
                    context: context,
                    builder: (_) =>
                        CupertinoAlertDialog(
                          title: Text('Add Sucessfully'),
                        )
                ).then((value) {
                  setState(() {
                    filePath = null;
                    thumbnailExt = null;
                    name.clear();
                    description.clear();
                  });
                });
              }
            },
                child: Text('Add')
            ),
            Listing
          ],
        ),
      ),
    );
  }
}

class viewList extends StatefulWidget {
  const viewList({Key? key}) : super(key: key);

  @override
  State<viewList> createState() => _viewListState();
}

class _viewListState extends State<viewList> {
  String? filePath;
  String? thumbnailExt;
  ImagePicker picker = ImagePicker();
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SharedPreferences.getInstance(),
      builder: (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot){
        if(snapshot.hasData){
          if(snapshot.data!.getString('category_id') != null) {
            String category_id = snapshot.data!.getString("category_id")!;
            return FutureBuilder(
                future: VCategoryDetail.vcdetail(category_id),
                builder: (BuildContext context,
                    AsyncSnapshot<String> snapshot) {
                  if (snapshot.hasData) {
                    var response = snapshot.data;
                    var obj = jsonDecode(response!);
                    if (obj['code'] == 'success') {
                      return Table(
                          border: TableBorder.all(color: Colors.black),
                          columnWidths: {
                            0: FixedColumnWidth(40), // this column has a fixed width of 50
                            1: FlexColumnWidth(2), // take 1/3 of the remaining space
                            2: FlexColumnWidth(1), // // take 2/3 of the remaining space
                          },
                          children: [
                            TableRow(
                                children: [
                                  TableCell(
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        child: Text('No'),
                                      )
                                  ),
                                  TableCell(child:Container(
                                    padding: EdgeInsets.all(10),
                                    child: Text('Name / Description'),
                                  )
                                  ),
                                  TableCell(child: Container(
                                    padding: EdgeInsets.all(10),
                                    child:Text('Update'),
                                  )
                                  ),
                                ]
                            ),
                            for(var i = 0; i < obj['resultList'].length;i++)
                              TableRow(
                                  children: [
                                    TableCell( child: Container(
                                      padding: EdgeInsets.all(10),
                                      child: Text((i+1).toString()),
                                    )
                                    ),
                                    TableCell(
                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Padding(padding: EdgeInsets.all(10),
                                                child: Text(obj['resultList'][i]['name']),),
                                              Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                                                child: Text(obj['resultList'][i]['description']),),
                                            ]
                                        )
                                    ),
                                    TableCell(
                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Padding(padding: EdgeInsets.all(10),
                                                child: Container(
                                                  child: InkWell(
                                                    onTap: () async{
                                                      setState(() {
                                                        name.text = obj['resultlist'][i]['name'];
                                                        description = obj['resultlist'][i]['description'];
                                                        filePath = 'https://androidapi.bitesbytesnetwork.com/' + obj['resultList'][i]['picture'];
                                                      });
                                                      showBarModalBottomSheet(
                                                        expand: true,
                                                        context: context,
                                                        builder: (context) => Scaffold(
                                                          appBar: AppBar(title: Text('Edit Technician'),),
                                                          body: Container(
                                                            padding: EdgeInsets.all(10),
                                                            child: ListView(
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  children: [
                                                                    FittedBox(
                                                                      child: Image.network(filePath!,
                                                                          width: 160,height: 180, fit:BoxFit.fill),
                                                                    ),
                                                                    TextButton(
                                                                      onPressed: (){
                                                                        showMaterialModalBottomSheet(
                                                                            expand: false,
                                                                            context: context,
                                                                            backgroundColor: Colors.transparent,
                                                                            builder: (context) => Container(
                                                                                decoration: const BoxDecoration(color: Colors.black),
                                                                                child: ListView(
                                                                                  padding:  EdgeInsets.zero,
                                                                                  shrinkWrap: true,
                                                                                  physics: const NeverScrollableScrollPhysics(),
                                                                                  children: [
                                                                                    ListTile(
                                                                                      leading: const Icon(Icons.browse_gallery,color: Colors.orange,),
                                                                                      onTap: ()async{
                                                                                        XFile? image = await picker.pickImage(source: ImageSource.gallery);
                                                                                        setState(() {
                                                                                          filePath = image!.path;
                                                                                          thumbnailExt = image.path.split('.').last;
                                                                                        });
                                                                                      },
                                                                                      title: const Text('Upload from gallery',style: TextStyle(color: Colors.white),),
                                                                                    ),
                                                                                    const Divider(),
                                                                                    ListTile(
                                                                                      leading: const Icon(Icons.camera,color: Colors.orange,),
                                                                                      onTap: ()async{
                                                                                        XFile? image = await picker.pickImage(source: ImageSource.camera);
                                                                                        setState(() {
                                                                                          filePath = image!.path;
                                                                                          thumbnailExt = image.path.split('.').last;
                                                                                        });
                                                                                      },
                                                                                      title: const Text('Upload from camera',style: TextStyle(color: Colors.white),),
                                                                                    ),
                                                                                  ],
                                                                                )
                                                                            )
                                                                        );
                                                                      },
                                                                      child: const Icon(Icons.refresh, color: Colors.orange,),
                                                                      style: TextButton.styleFrom(
                                                                          padding: EdgeInsets.zero
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                TextFormField(
                                                                  controller: name,
                                                                  decoration: InputDecoration(
                                                                    enabledBorder: OutlineInputBorder(
                                                                        borderSide: BorderSide(
                                                                          color: Colors.blue,
                                                                        )
                                                                    ),
                                                                    focusedBorder: OutlineInputBorder(
                                                                        borderSide: BorderSide(
                                                                          color: Colors.black,
                                                                        )
                                                                    ),
                                                                    labelText: 'Name',
                                                                  ),

                                                                ),
                                                                Padding(padding: EdgeInsets.all(10)),
                                                                Container(
                                                                    padding: EdgeInsets.all(10),
                                                                    child: InkWell(
                                                                      onTap: () async{
                                                                        var response2 = await ECategory.ec(name, description, category_id, filePath, thumbnailExt);
                                                                        var obj2 = jsonDecode(response2);
                                                                        if(obj2['code'] == 'success'){
                                                                          setState(() {
                                                                            Listing = viewList();
                                                                          });
                                                                        }
                                                                        showDialog(
                                                                            context: context,
                                                                            builder: (context){
                                                                              return CupertinoAlertDialog(
                                                                                title: Text(obj2['code']),
                                                                                content: Text(obj2['message']),
                                                                              );
                                                                            }
                                                                        );
                                                                      },
                                                                      child: Text(
                                                                        'Save',
                                                                        style: TextStyle(
                                                                            color: Colors.blue
                                                                        ),
                                                                        textAlign: TextAlign.center,
                                                                      ),
                                                                    )
                                                                ),
                                                                Container(
                                                                    padding: EdgeInsets.all(10),
                                                                    child: InkWell(
                                                                      onTap: () async{
                                                                        var response3 = await RCategory.rc(obj['resultList'][i]['category_id']);
                                                                        var obj3 = jsonDecode(response3);
                                                                        if(obj3['code'] == 'success'){
                                                                          setState(() {
                                                                            Listing = viewList();
                                                                          });
                                                                        }
                                                                        showDialog(
                                                                            context: context,
                                                                            builder: (context){
                                                                              return CupertinoAlertDialog(
                                                                                title: Text(obj3['code']),
                                                                                content: Text(obj3['message']),
                                                                              );
                                                                            }
                                                                        );
                                                                      },
                                                                      child: Text(
                                                                        'Remove',
                                                                        style: TextStyle(
                                                                            color: Colors.red
                                                                        ),
                                                                        textAlign: TextAlign.center,
                                                                      ),
                                                                    )
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    child: Text('Edit',
                                                      style: TextStyle(
                                                          color: Colors.blue
                                                      ),
                                                      textAlign: TextAlign.center,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ]
                                        )
                                    )
                                  ]
                              )
                          ]
                      );
                    } else {
                      return Container();
                    }
                  } else {
                    return Container();
                  }
                }
            );
          }else {
            return Container();
          }
        } else{
          return Container();
        }
      },
    );
  }
}

