import 'package:date_time_text_form_field/date_time_text_form_field.dart';
import 'package:fitmess/Helpers/Config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class DateTest extends StatelessWidget {
  final String title;
  final DateTime initialDateTime;

  DateTest({Key key, this.title, this.initialDateTime}) : super();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Material(

      child: MyHomePage(
        title: title ?? 'Home Page',
        initialDateTime: initialDateTime ?? DateTime.now(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, @required this.title, @required this.initialDateTime})
      : super(key: key);

  final String title;
  final DateTime initialDateTime;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<FormState> _formKey;
  DateTime _dateTime;

  Config _config = Config();

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final firstFocus = FocusNode();
    final secondFocus = FocusNode();
    final thirdFocus = FocusNode();
    final forthFocus = FocusNode();
    final fifthFocus = FocusNode();
    final sixthFocus = FocusNode();
    final seventhFocus = FocusNode();
    final eighthFocus = FocusNode();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 30,left: 20,right: 20,bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              width: double.infinity,
              child: Center(
                child:Text(_config.get_text(context, "assessment_q1_txt"),textAlign: TextAlign.center,style: TextStyle(fontSize: 30),),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 20,
                              height: 100,
                              child: TextFormField(
                                focusNode: firstFocus,
                                textInputAction: TextInputAction.next,
                                autofocus: true,
                                maxLength: 1,
                                style: TextStyle(fontSize: 20),
                                decoration: InputDecoration(hintText: '0',counterText: "",border: InputBorder.none,),
                                keyboardType: TextInputType.number,
                                onChanged: (v){
                                  if(v.length==1){
                                    firstFocus.nextFocus();
                                   // FocusScope.of(context).requestFocus(focus);
                                  }

                                },
                              ),
                            ),
                            Container(
                              width: 20,
                              height: 100,
                              child: TextFormField(
                                focusNode: secondFocus,
                                style: TextStyle(fontSize: 20),
                                maxLength: 1,
                               decoration: InputDecoration(hintText: '0',counterText: "",border: InputBorder.none,),
                                keyboardType: TextInputType.number,
                                onChanged: (t){
                                  if(t.length==1){
                                    secondFocus.nextFocus();
                                  }
                                 if(t.length == 0){
                                   secondFocus.previousFocus();
                                 }
                                },

                              ),
                            ),

                            Container(
                              width: 20,
                              height: 100,
                              child: TextFormField(
                                textInputAction: TextInputAction.next,
                                autofocus: true,
                                maxLength: 1,
                                enabled: false,
                                style: TextStyle(fontSize: 20),
                                decoration: InputDecoration(hintText: '/',counterText: "",border: InputBorder.none,),
                                keyboardType: TextInputType.number,
                                onChanged: (v){

                                },
                              ),
                            ),

                            Container(
                              width: 20,
                              height: 100,
                              child: TextFormField(
                                focusNode: thirdFocus,
                                textInputAction: TextInputAction.next,
                                autofocus: true,
                                maxLength: 1,
                                style: TextStyle(fontSize: 20),
                                decoration: InputDecoration(hintText: '0',counterText: "",border: InputBorder.none,),
                                keyboardType: TextInputType.number,
                                onChanged: (v){
                                  if(v.length==1){
                                    thirdFocus.nextFocus();
                                  }
                                  if(v.length == 0){
                                    thirdFocus.previousFocus();
                                  }

                                },
                              ),
                            ),
                            Container(
                              width: 20,
                              height: 100,
                              child: TextFormField(
                                focusNode: forthFocus,
                                style: TextStyle(fontSize: 20),
                                maxLength: 1,
                                decoration: InputDecoration(hintText: '0',counterText: "",border: InputBorder.none,),
                                keyboardType: TextInputType.number,
                                onChanged: (t){
                                  if(t.length==1){
                                    forthFocus.nextFocus();
                                  }
                                  if(t.length == 0){
                                    forthFocus.previousFocus();
                                  }
                                },

                              ),
                            ),


                            Container(
                              width: 20,
                              height: 100,
                              child: TextFormField(
                                textInputAction: TextInputAction.next,
                                autofocus: true,
                                maxLength: 1,
                                enabled: false,
                                style: TextStyle(fontSize: 20),
                                decoration: InputDecoration(hintText: '/',counterText: "",border: InputBorder.none,),
                                keyboardType: TextInputType.number,
                                onChanged: (v){

                                },
                              ),
                            ),

                            Container(
                              width: 20,
                              height: 100,
                              child: TextFormField(
                                focusNode:fifthFocus ,
                                textInputAction: TextInputAction.next,
                                autofocus: true,
                                maxLength: 1,
                                style: TextStyle(fontSize: 20),
                                decoration: InputDecoration(hintText: '0',counterText: "",border: InputBorder.none,),
                                keyboardType: TextInputType.number,
                                onChanged: (v){
                                  if(v.length==1){
                                    fifthFocus.nextFocus();
                                  }
                                  if(v.length == 0){
                                    fifthFocus.previousFocus();
                                  }

                                },
                              ),
                            ),

                            Container(
                              width: 20,
                              height: 100,
                              child: TextFormField(
                                focusNode: sixthFocus,
                                style: TextStyle(fontSize: 20),
                                maxLength: 1,
                                decoration: InputDecoration(hintText: '0',counterText: "",border: InputBorder.none,),
                                keyboardType: TextInputType.number,
                                onChanged: (t){
                                  if(t.length==1){
                                    sixthFocus.nextFocus();
                                  }
                                  if(t.length == 0){
                                    sixthFocus.previousFocus();
                                  }
                                },

                              ),
                            ),

                            Container(
                              width: 20,
                              height: 100,
                              child: TextFormField(
                                focusNode: seventhFocus,
                                style: TextStyle(fontSize: 20),
                                maxLength: 1,
                                decoration: InputDecoration(hintText: '0',counterText: "",border: InputBorder.none,),
                                keyboardType: TextInputType.number,
                                onChanged: (t){
                                  if(t.length==1){
                                    seventhFocus.nextFocus();
                                  }
                                  if(t.length == 0){
                                    seventhFocus.previousFocus();
                                  }
                                },

                              ),
                            ),

                            Container(
                              width: 20,
                              height: 100,
                              child: TextFormField(
                                focusNode: eighthFocus,
                                style: TextStyle(fontSize: 20),
                                maxLength: 1,
                                decoration: InputDecoration(hintText: '0',counterText: "",border: InputBorder.none,),
                                keyboardType: TextInputType.number,
                                onChanged: (t){
                                  if(t.length==1){
                                    //eighthFocus.nextFocus();
                                  }
                                  if(t.length == 0){
                                    eighthFocus.previousFocus();
                                  }
                                },

                              ),
                            ),
                          ],
                        ),
                      )

                ),
              ),
          ],
        ),
      ),
    );
  }
}