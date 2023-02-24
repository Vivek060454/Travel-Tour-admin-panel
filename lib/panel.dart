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
class Homepanel extends StatefulWidget {
  const Homepanel ({super.key});
  @override
  HomepanelState createState() {
    return HomepanelState();
  }
}
class HomepanelState extends State<Homepanel > {
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



  final brands = [
    'Firefox', '91', 'Unirox', 'Rellyz', 'Giant', 'Trek',
  ];

  String? brand =  'Firefox';



  final pris = [
    '0-10k','10k-20k','20k-30k','30k-40k','40k-50k','50k-60k','60k-70k','70k-80k','80k-90k','90k-100k','100k-nk'

  ];

  String? pri =  '0-10k';


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

  Future<void>addUser()async {
    if(lat==''||lon==''){
      Fluttertoast.showToast(msg: "Please click on addrese button");
    }
    else{
      Navigator.of(context).pop();
      UploadTask? uploadTask;
      UploadTask? uploadTask1;
      UploadTask? uploadTask2;
      final path='Image/${imageName}';
      final file =File(imagePath!.path);
      final ref=FirebaseStorage.instance.ref().child(path);

      uploadTask =ref.putFile(file);
      final snapshot=await uploadTask;
      var url = await snapshot.ref.getDownloadURL();
      final path1='Image/${imageName1}';
      final file1 =File(imagePath1!.path);
      final ref1=FirebaseStorage.instance.ref().child(path1);
      uploadTask1 =ref1.putFile(file1);
      final snapshot1=await uploadTask1;
      var url1 = await snapshot1.ref.getDownloadURL();
      final path2='Image/${imageName2}';
      final file2 =File(imagePath2!.path);
      final ref2=FirebaseStorage.instance.ref().child(path2);
      uploadTask2 =ref2.putFile(file2);
      final snapshot2=await uploadTask2;
      var url2 = await snapshot2.ref.getDownloadURL();
      // var uuid = Uuid();
      //  final curUuid = uuid.v1();
      // CollectionReference usersell = FirebaseFirestore.instance.
      // collection('usersell').doc(_auth.currentUser?.uid ).collection('product_sell');
      // usersell.doc(curUuid).set({
      //   'model':model,'dec':dec,  'image':url,'img1':url,'img2':url,
      //    'pr':pri,'del':del,'front':front,'price':price,
      //  'fork':fork,'rim':rim,'size':size,'tyre':tyres,'cassette':cassette,'chain':chain,
      //   'saddle':saddle,'seatpost':seatpost,'break':breaks,'weight':weight,'brand':brand,'types':type,
      // }).then((valure) =>print('Product Added'))
      //     .catchError((error)=>print('failed to add Product:$error'));

      CollectionReference Mapo = FirebaseFirestore.instance.
      collection('Mapo');
      Mapo.doc().set({
        'image':url,'img1':url1,'img2':url2,'spc':det,
        'datee':DateTime.now().toString(),

        'Addrese':addrese,'Ami1':ami1,  'Ami2':ami2,'Ami3':ami3,'Ami4':ami4, 'ide':'',
        'contact':contact,'lati':lat,'long':lon,'title':title,'trust_name':trustname,'website':web,



      }).then((valure) =>print('Product Added'))
          .catchError((error)=>print('failed to add Product:$error'));
      Fluttertoast.showToast(msg: "Posted");

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
  String imageName='';
  XFile? imagePath;
  String imageName1='';
  XFile? imagePath1;
  String imageName2='';
  XFile? imagePath2;
  final ImagePicker _picker1= ImagePicker();
  final ImagePicker _picker2= ImagePicker();
  final ImagePicker _picker= ImagePicker();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(

        appBar: AppBar(

          title: Text('Upload'),
          backgroundColor: Colors.blue,

        ),

        body: SingleChildScrollView(
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
                  //       Text('Select Brand name*', style: TextStyle(
                  //           fontWeight: FontWeight.bold, fontSize: 20),),
                  //     ],
                  //   ),
                  // ),
                  //
                  //
                  // SizedBox(
                  //   height: 68,
                  //   child: Container(
                  //     width: 360,
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(10),
                  //         border: Border.all(color: Colors.black)
                  //     ),
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(13.0),
                  //       child: DropdownButton<String>(
                  //         isExpanded: true,
                  //
                  //         value: brand,
                  //         items: brands.map((ite) =>
                  //             DropdownMenuItem<String>(
                  //               value: ite,
                  //
                  //               child: Text(ite, style: TextStyle(fontSize: 20)
                  //               )
                  //               ,))
                  //             .toList(),
                  //         onChanged: (items) =>
                  //             setState(() => brand = items),),
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Row(
                      children: [

                        Text('Upload Temple Image *', style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Column(
                      children: [

                        imageName =='' ? Container(): Text('${imageName}',maxLines:2,overflow: TextOverflow.ellipsis,softWrap: false,),


                      ],
                    ),

                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),

                    child: IconButton(icon: Icon(Icons.add),
                      onPressed: (){
                        imagePicker();
                      },),

                  ),

                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Column(
                      children: [

                        imageName1 =='' ? Container(): Text('${imageName1}',maxLines:2,overflow: TextOverflow.ellipsis,softWrap: false,),


                      ],
                    ),

                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),

                    child: IconButton(icon: Icon(Icons.add),
                      onPressed: (){
                        imagePicker();
                      },),

                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Column(
                      children: [

                        imageName2 =='' ? Container(): Text('${imageName2}',maxLines:2,overflow: TextOverflow.ellipsis,softWrap: false,),


                      ],
                    ),

                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),

                    child: IconButton(icon: Icon(Icons.add),
                      onPressed: (){
                        imagePicker();
                      },),

                  ),
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
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
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
                  // Padding(
                  //   padding: const EdgeInsets.all(13.0),
                  //   child: Row(
                  //     children: [
                  //       Text('Enter LatLog*', style: TextStyle(
                  //           fontWeight: FontWeight.bold, fontSize: 20),),
                  //     ],
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(13.0),
                  //   child: TextFormField(
                  //     controller: _latiController,
                  //
                  //     textInputAction: TextInputAction.next,
                  //     keyboardType: TextInputType.number,
                  //
                  //     decoration: InputDecoration(
                  //       fillColor: Colors.grey.shade100,
                  //       filled: true,
                  //       hintText: 'Latitude',
                  //       hintStyle: const TextStyle(
                  //           height: 2, fontWeight: FontWeight.bold),
                  //       border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(8)
                  //       ),
                  //     ),
                  //     // The validator receives the text that the user has entered.
                  //     // validator: (value) {
                  //     //   if (value == null || value.isEmpty) {
                  //     //     return ' Enter latitude';
                  //     //   }
                  //     //
                  //     //   return null;
                  //     // },
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(13.0),
                  //   child: TextFormField(
                  //     controller: _longController,
                  //
                  //     textInputAction: TextInputAction.next,
                  //     keyboardType: TextInputType.number,
                  //
                  //     decoration: InputDecoration(
                  //       fillColor: Colors.grey.shade100,
                  //       filled: true,
                  //       hintText: 'Longitude',
                  //       hintStyle: const TextStyle(
                  //           height: 2, fontWeight: FontWeight.bold),
                  //       border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(8)
                  //       ),
                  //     ),
                  //     // The validator receives the text that the user has entered.
                  //     // validator: (value) {
                  //     //   if (value == null || value.isEmpty) {
                  //     //     return ' Enter longitude';
                  //     //   }
                  //     //
                  //     //   return null;
                  //     // },
                  //   ),
                  // ),
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


                            //  url=_imageController.text;
                            // py=_pyController.text;
                            // pr=_prController.text;
                            // _uploadImage();
                            addUser();
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

  imagePicker() async {
    final XFile? image =await _picker.pickImage(source: ImageSource.gallery);
    if(image!=null){
      setState((){
        imagePath = image;
        imageName=image.name.toString();
      });
    }
    final XFile? image1 =await _picker1.pickImage(source: ImageSource.gallery);
    if(image!=null){
      setState((){
        imagePath1 = image1;
        imageName1=image1!.name.toString();

      });
    }
    final XFile? image2 =await _picker2.pickImage(source: ImageSource.gallery);
    if(image!=null){
      setState((){
        imagePath2 = image2;
        imageName2=image2!.name.toString();

      });
    }
  }



}