import 'dart:io';
import 'package:file_picker/file_picker.dart';


import 'package:geocoding/geocoding.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import 'package:uuid/uuid.dart';
class Edit extends StatefulWidget {



  final produt;
  Edit(this.produt, {Key? key}) : super(key: key);
  @override
  EditState createState() {
    return EditState();
  }
}
class EditState extends State<Edit > {
  final _formKey = GlobalKey<FormState>();
  var title="";
  var trustname="";
  var contact="";
  var lat="";
  var lon="";
  var addrese="";
  var web="";
  var ami1="";
  var ami2="";
  var ami3="";
  var ami4="";
  var det="";

  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.

//  final TextEditingController  _brandController = new TextEditingController();
  final TextEditingController    _templenameController = new TextEditingController();
  final TextEditingController  _trustnameController = new TextEditingController();
  final TextEditingController  _HistController = new TextEditingController();
  final TextEditingController  _contactController = new TextEditingController();
  final TextEditingController    _Ami1Controller = new TextEditingController();
  final TextEditingController  _Ami2Controller = new TextEditingController();
  final TextEditingController   _Ami3Controller = new TextEditingController();
  final TextEditingController    _Ami4Controller = new TextEditingController();
  final TextEditingController  _webController = new TextEditingController();
  final TextEditingController   _addreseController = new TextEditingController();
  // final TextEditingController    _latiController = new TextEditingController();
  // final TextEditingController    _longController = new TextEditingController();

  final _auth = FirebaseAuth.instance;
  static String? get uid => null;


  void initState() {
    print('Init'+widget.produt.toString());
    _templenameController.text=widget.produt['title']??'';
    _trustnameController.text=widget.produt['trust_name']??'';
    _HistController.text=widget.produt['spc']??'';
    _contactController.text=widget.produt['contact']??'';
    _Ami1Controller.text=widget.produt['Ami1']??'';
    _Ami2Controller.text=widget.produt['Ami2']??'';
    _Ami3Controller.text=widget.produt['Ami3']??'';
    _Ami4Controller.text=widget.produt['Ami4']??'';
    _webController.text=widget.produt['website']??'';
    _addreseController.text=widget.produt['Addrese']??'';

    super.initState();
  }
  getl() async {
  List<Location> locations = await locationFromAddress( _addreseController.text);
  setState((){});
  lat=locations.last.latitude.toString();
  lon=locations.last.longitude.toString();
}
  @override
  void dispose(){
    // _brandController.dispose();
    _templenameController.dispose();
    _trustnameController.dispose();
    _HistController.dispose();
    _contactController.dispose();
    _Ami1Controller.dispose();
    _Ami2Controller.dispose();
    _Ami3Controller.dispose();
    _Ami4Controller.dispose();
    _webController.dispose();
    _addreseController.dispose();
    //_latiController.dispose();
    //  _longController.dispose();

    super.dispose();
  }

  Future search() async {


    List<Location> locations = await locationFromAddress( _addreseController.text);
    var a=locations.last.latitude.toString();
    var b=locations.last.latitude.toString();
  }
  CollectionReference Mapo = FirebaseFirestore.instance.collection('Mapo');

  Future<void> updateUser(id) {
    return Mapo
        .doc(id)
        .update({'company': 'Stokes and Sons'})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  Future<void>addUser(id)async {

    if(lat==''||lon==''){
      Fluttertoast.showToast(msg: "Lang loat is Null");
    }
    else{
      print(''+widget.produt.id);
      CollectionReference Mapo = FirebaseFirestore.instance.
      collection('Mapo');
      Mapo.doc(widget.produt.id).update({
        'spc':det ,
        'datee':DateTime.now().toString(),
       'Addrese':addrese,
        'Ami1':ami1,  'Ami2':ami2,'Ami3':ami3,'Ami4':ami4, 'ide':'',
        'contact':contact,
         'lati':lat,'long':lon,
        'title':title,'trust_name':trustname,'website':web,



      }).then((valure) =>print('Product Added'))
          .catchError((error)=>print('failed to add Product:$error'));
      Fluttertoast.showToast(msg: "Posted");
      Navigator.of(context).pop();
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Sellpanelupload()));
      // print('User added');
    }

  }
//FirebaseFirestore firestoreRef =FirebaseFirestore.instance;
//FirebaseStorage storageRef =FirebaseStorage.instance;


  clearText(){
    //  _brandController.clear();
    _templenameController.clear();
    _trustnameController.clear();
    _HistController.clear();
    _contactController.clear();
    _Ami1Controller.clear();
    _Ami2Controller.clear();
    _Ami3Controller.clear();
    _Ami4Controller.clear();
    _webController.clear();
    _addreseController.clear();
    // _latiController.clear();
    // _longController.clear();


  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(

        appBar: AppBar(

          title: Text('Edit'),
          backgroundColor: Colors.blue,

        ),

        body:
        SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Row(
                      children: [
                        Text('Enter Temple name*', style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: TextFormField(
                     controller: _templenameController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.streetAddress,
                    // initialValue: widget.produt['title'].toString(),
                      onSaved: (value) {
                        _templenameController.text = value!;
                      },

                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'Temple Name',
                        hintStyle: const TextStyle(
                            height: 2, fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)
                        ),
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter temple name';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Row(
                      children: [
                        Text('Enter Trust name*', style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: TextFormField(
                 controller: _trustnameController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.streetAddress,
                     // initialValue:  widget.produt['trust_name'].toString(),
                      onSaved: (value) {
                       _trustnameController.text = value!;
                      },

                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'Trust Name',
                        hintStyle: const TextStyle(
                            height: 2, fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)
                        ),
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter trust name';
                        }
                        return null;
                      },
                    ),
                  ),


                  // Padding(
                  //   padding: const EdgeInsets.all(13.0),
                  //   child: Row(
                  //     children: [
                  //
                  //       Text('Upload Temple Image *', style: TextStyle(
                  //           fontWeight: FontWeight.bold, fontSize: 20),),
                  //     ],
                  //   ),
                  // ),

                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Row(
                      children: [

                        Text('History of temple*', style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: TextFormField(
                 controller: _HistController,
                     // initialValue:    widget.produt['spc'] .toString(),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      onSaved: (value) {
                        _HistController.text = value!;
                      },

                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'Write a breif history of temple',
                        hintStyle: const TextStyle(
                            height: 2, fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)
                        ),
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter description of Bikes';
                        }

                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Row(
                      children: [

                        Text('Addrese*', style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: TextFormField(
                  controller: _addreseController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      onSaved: (value) {
                        _addreseController.text = value!;
                      },
                   // initialValue:  widget.produt['Addrese'].toString(),
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'Write Addreses',
                        hintStyle: const TextStyle(
                            height: 2, fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)
                        ),
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter addrese';
                        }

                        return null;
                      },
                    ),
                  ),
                  IconButton(onPressed: () async {
                    List<Location> locations = await locationFromAddress( _addreseController.text);
                    setState((){});
                    lat=locations.last.latitude.toString();
                    lon=locations.last.longitude.toString();

                    Text(lat);
                    Text(lon);
                  }, icon: Icon(Icons.account_box_sharp)),
                  Text(lat),
                  Text(lon),
                        Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Row(
                      children: [
                        Text('Enter Contact details*', style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: TextFormField(
                  controller: _contactController,

                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      onSaved: (value) {
                        _contactController.text = value!;
                      },

                     // initialValue:   widget.produt['contact'].toString(),
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'Contact',
                        hintStyle: const TextStyle(
                            height: 2, fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)
                        ),
                      ),
                      // The validator receives the text that the user has entered.

                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Row(
                      children: [
                        Text('Entee website url*', style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: TextFormField(
                    controller: _webController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.streetAddress,
                      onSaved: (value) {
                        _webController.text = value!;
                      },
                  // initialValue:     widget.produt['website'].toString(),
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'Website url',
                        hintStyle: const TextStyle(
                            height: 2, fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)
                        ),
                      ),
                      // The validator receives the text that the user has entered.

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Row(
                      children: [
                        Text('Entee Aminities*', style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: TextFormField(
                    controller: _Ami1Controller,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.streetAddress,
                      onSaved: (value) {
                        _Ami1Controller.text = value!;
                      },
                   // initialValue:  widget.produt['Ami1'].toString(),
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'Aminities 1',
                        hintStyle: const TextStyle(
                            height: 2, fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)
                        ),
                      ),
                      // The validator receives the text that the user has entered.

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: TextFormField(
               controller: _Ami2Controller,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.streetAddress,
                      onSaved: (value) {
                        _Ami2Controller.text = value!;
                      },
               //  initialValue:  widget.produt['Ami2'].toString(),
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'Aminities 2',
                        hintStyle: const TextStyle(
                            height: 2, fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)
                        ),
                      ),
                      // The validator receives the text that the user has entered.

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: TextFormField(
                 controller: _Ami3Controller,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.streetAddress,
                      onSaved: (value) {
                        _Ami3Controller.text = value!;
                      },
                 //  initialValue:  widget.produt['Ami3'].toString(),
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'Aminities 3',
                        hintStyle: const TextStyle(
                            height: 2, fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)
                        ),
                      ),
                      // The validator receives the text that the user has entered.

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: TextFormField(
                     controller: _Ami4Controller,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.streetAddress,
                      onSaved: (value) {
                        _Ami4Controller.text = value!;
                      },
                   // initialValue:    widget.produt['Ami4'].toString(),
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'Aminities 4',
                        hintStyle: const TextStyle(
                            height: 2, fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)
                        ),
                      ),
                      // The validator receives the text that the user has entered.

                    ),
                  ),









                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child:ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                      ),
//color: Color.fromRGBO(100, 0, 0, 10),

                      onPressed: (){
                        if(_formKey.currentState!.validate())
                        {
                          setState(()
                          {
                            title=_templenameController.text;
                            trustname=_trustnameController.text;
                            contact=_contactController.text;
                           // lat=_latiController.text;
                            //  lon=_longController.text;
                            addrese=_addreseController.text;
                            web=_webController.text;
                            ami1=_Ami1Controller.text;
                            ami2=_Ami2Controller.text;
                            ami3=_Ami3Controller.text;
                            ami4=_Ami4Controller.text;
                            det=_HistController.text;
getl();

                            //  url=_imageController.text;
                            // py=_pyController.text;
                            // pr=_prController.text;
                            // _uploadImage();
                            addUser(widget.produt.id);
                            clearText();


                          });
                        }},
                      child: Text("Post"),

                    ),
                  ),

                ]
            ),
          ),
        )
    );
  }





}