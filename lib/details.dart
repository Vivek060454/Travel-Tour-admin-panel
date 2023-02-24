import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  final produt;
  Details(this.produt, {Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Temple Name:  '+ widget.produt['title'],style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),

            Align(
            alignment: Alignment.topLeft,
                child: Text('Trust Name:  '+widget.produt['trust_name'],style: TextStyle(fontSize: 19,fontWeight: FontWeight.w500),)),
            Table(
              columnWidths: {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(2),
                2: FlexColumnWidth(2),

              },

              children: [

                TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color:   Colors.white,
                          child:
                          FadeInImage.assetNetwork(
                              placeholder: 'assets/tem.jpg',
                              image:  widget.produt['image'],width: 130,height: 70
                          ),


                          //  Image.network(storedocs[i]['image'],width: 130,height: 70)
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color:   Colors.white,
                          child:
                          FadeInImage.assetNetwork(
                              placeholder: 'assets/tem.jpg',
                              image:   widget.produt['img1'],width: 130,height: 70
                          ),
                          // Image.network(storedocs[i]['img1'],width: 130,height: 70)
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color:   Colors.white,
                          child:
                          FadeInImage.assetNetwork(
                              placeholder: 'assets/tem.jpg',
                              image:  widget.produt['img2'],width: 130,height: 70
                          ),
                          // Image.network(storedocs[i]['img2'],width: 130,height: 70)
                        ),
                      ),




                    ]
                ),

              ],
            ),
            Align(
                alignment: Alignment.topLeft,
                child:widget.produt['spc']==''?  Text('-----',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)):
                Text('Histoy:  '+widget.produt['spc'],style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),),

            Align(
                alignment: Alignment.topLeft,
                child:widget.produt['Addrese']==''?  Text('-----',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)):
                Text('Addrese:  '+widget.produt['Addrese'],style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),),

            Align(
                alignment: Alignment.topLeft,
                child:widget.produt['lati']==''?  Text('-----',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)):
                Text('Longitude:  '+widget.produt['lati'],style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),),

            Align(
                alignment: Alignment.topLeft,
                child:  widget.produt['long']==''?  Text('-----',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)):
                Text('Latitude:  '+widget.produt['long'],style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),),

            Align(
                alignment: Alignment.topLeft,
                child:widget.produt['contact']==''?  Text('Contact:  '+'-----',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)):
                Text('Contact:  '+widget.produt['contact'],style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),),
            Align(
              alignment: Alignment.topLeft,
              child:  widget.produt['website']==''?  Text('Website:  '+'-----',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)):
              Text('Website:  '+widget.produt['website'],style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),),

            Align(
              alignment: Alignment.topLeft,
              child: widget.produt['Ami1']==''?  Text('Amini 1:  '+'-----',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)):
              Text('Amini 1:  '+widget.produt['Ami1'],style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),),

            Align(
              alignment: Alignment.topLeft,
              child: widget.produt['Ami2']==''?  Text('Amini 2:  '+'-----',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)):
              Text('Amini 2:  '+widget.produt['Ami2'],style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),),

            Align(
              alignment: Alignment.topLeft,
              child: widget.produt['Ami3']==''?  Text('Amini 3:  '+'-----',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)):
              Text('Amini 3:  '+widget.produt['Ami3'],style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),),

            Align(
              alignment: Alignment.topLeft,
              child:widget.produt['Ami4']==''?  Text('Amini 4:  '+'-----',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)):
              Text('Amini 4:  '+widget.produt['Ami4'],style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),),











          ],
        ),
      ),
    );
  }
}
