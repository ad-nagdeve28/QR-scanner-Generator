import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';
import 'package:linkwell/linkwell.dart';
import 'package:qr_scanner/Screen/QRGenerator.dart';


class HomeScreen extends StatefulWidget{
  @override
  Home createState()=> Home();
}

class Home extends State<HomeScreen>{

  String _qrInfo = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(5)
                ),
                child: QRBarScannerCamera(
                  onError: (context, error) => Text(error.toString(),
                    style: TextStyle(color: Colors.red),
                  ),
                  qrCodeCallback: (code) {
                    _qrCallback(code!);
                  },),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 27
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[500],
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20)
                      )
                    ),
                    child: Stack(
                       children: [
                         Padding(
                           padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 30, bottom: 5),
                           child: Text("Result:",
                             style: TextStyle(
                                 fontSize: 26,
                                 fontWeight: FontWeight.w700,
                                 color: Colors.black
                             ),
                           ),
                         ),
                         Padding(
                           padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 48),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceAround,
                             children: [
                               Container(
                                 color: Colors.transparent,
                                 height: MediaQuery.of(context).size.height / 6,
                                 width: MediaQuery.of(context).size.width / 1.5,
                                 margin: EdgeInsets.only(right: 5, top:15 ),
                                 child: ListView(
                                   children: [
                                     Padding(
                                       padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 7),
                                       child: LinkWell(_qrInfo,
                                         style: TextStyle(color: Colors.black87,fontSize: 24),
                                          linkStyle: TextStyle(color: Colors.lightBlue, fontSize: 24),
                                       )
                                     ),
                                   ],
                                 )
                               ),
                               InkWell(
                                 onTap: (){
                                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> QRGenerate()));
                                 },
                                 child: Container(
                                   height: MediaQuery.of(context).size.height / 7,
                                   width: MediaQuery.of(context).size.width / 5,
                                   decoration: BoxDecoration(
                                     color: Colors.white,
                                     borderRadius: BorderRadius.circular(20)
                                   ),
                                   child: Column(
                                     children: [
                                       Image.asset('Assets/qr.png'),
                                       Padding(
                                         padding:  EdgeInsets.symmetric(horizontal: 20),
                                         child: Divider(color: Colors.lightGreen,thickness: 3,),
                                       ),
                                       Text("Generate",
                                         style: TextStyle(
                                             fontWeight: FontWeight.w700,
                                             color: Colors.black
                                         ),)
                                     ],
                                   ),
                                 ),
                               ),
                             ],
                           ),
                         ),
                       ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  _qrCallback(String code){
    setState(() {
      _qrInfo = code;
    });
  }
}

