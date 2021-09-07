import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_scanner/Screen/HomeScreen.dart';
import 'package:qr_scanner/Widget/Button_Widget.dart';

class QRGenerate extends StatefulWidget{
  @override
  QRGenerat createState()=> QRGenerat();
}

class QRGenerat extends State<QRGenerate>{

  TextEditingController textController = TextEditingController();
  GlobalKey globalKey = new GlobalKey();
  @override
  void dispose() {
    textController.dispose();
    textController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: (){
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context)=> HomeScreen()));
            },
            icon: Icon(Icons.arrow_back_rounded,color: Colors.grey,size: MediaQuery.of(context).size.width / 5/3,),
          ),
        ),
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Center(
              child: Card(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 8,
                    bottom: MediaQuery.of(context).size.height / 10
                ),
                color: Colors.grey[300],
                shadowColor: Colors.black54,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Container(
                  height: 400,
                  width: 300,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RepaintBoundary(
                        key: globalKey,
                        child: QrImage(
                          data: textController.text,
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 20),
              child: Row(
                children: [
                  Text("Enter Data: ", style: TextStyle(fontWeight: FontWeight.w700, fontSize: MediaQuery.of(context).size.height / 55),),
                  Expanded(
                      child: Text(textController.text, style: TextStyle(fontWeight: FontWeight.w600,fontSize: MediaQuery.of(context).size.height / 55),))
                ],
              ),
            ),
            Container(
              height: 60,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 8,
                  right: MediaQuery.of(context).size.width / 45,
                  left: MediaQuery.of(context).size.width  / 45
              ),
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 1.3,
                    padding: EdgeInsets.only(left: 20),
                    child: TextField(
                      controller: textController,
                      decoration: InputDecoration(
                          hintText: 'Enter',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)
                          )
                      ),
                    ),
                  ),
                  RaisedButton(
                    splashColor: Colors.black38,
                    shape: CircleBorder(),
                    color: Colors.grey,
                    onPressed: (){
                      setState(() {
                        textController.clear();
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      child: Icon(Icons.refresh, color: Colors.white, size: 35,),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(
                  right: MediaQuery.of(context).size.width / 30,
                  top: MediaQuery.of(context).size.height / 50,
                  bottom: 10
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RaisedButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)
                      ),
                      onPressed: (){
                        setState(() {
                        });
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height / 20,
                        width: MediaQuery.of(context).size.width / 5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Generate",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w700,
                                  fontSize: MediaQuery.of(context).size.height / 60
                              ),
                            ),
                            Icon(
                              Icons.qr_code_rounded,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      )
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

