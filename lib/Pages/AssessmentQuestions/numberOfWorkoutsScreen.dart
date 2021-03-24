import 'package:fitmess/Enum/SelectedWeightEnum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fitmess/Helpers/Config.dart';
import 'package:fitmess/Widgets/LanguageSubmitButton.dart';
import 'package:fitmess/Widgets/AppBarWidget.dart';
import 'package:fitmess/Pages/AssessmentQuestions/InformationSummaryScreen.dart';
import 'package:fitmess/Pages/AssessmentQuestions/daysOfWorkoutsScreen.dart';



class numberOfWorkoutsScreen extends StatefulWidget {
  bool isEdit;
  numberOfWorkoutsScreen(this.isEdit);

  @override
  _numberOfWorkoutsScreenState createState() => _numberOfWorkoutsScreenState();
}

class _numberOfWorkoutsScreenState extends State<numberOfWorkoutsScreen> {
  Config _config = Config();
  Color bu_color =Color(int.parse("FFEDF7FC",radix: 16)) , bu_text_color = Colors.black ;


  String hintText = "";
  String selected_bu="";
  SelectedWeigtEnum selectedWeigtEnum= SelectedWeigtEnum.none;

  bool is_kg =false,is_Completed=false;

  List<String> numOfDays = new List<String>();



  void changeColor(){
    if(selectedWeigtEnum == SelectedWeigtEnum.none){
      is_Completed = false;
      bu_color = Color(int.parse("FFEDF7FC",radix: 16));
      bu_text_color = Colors.black;
    }
    else{
      is_Completed = true;
      bu_color = Config.app_backgroungColor;
      bu_text_color = Colors.white;
    }

    setState(() {});
  }



  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
   numOfDays = List.generate(6, (index) => (index+1).toString());
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      //or set color with: Color(0xFF0000FF)
    ));

    return Material(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarWidget().AppBarWid(),
        body:Container(
            padding: EdgeInsets.symmetric(vertical: 20,horizontal: 5),
            color: Colors.white,
            child: Center(
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 20),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            child: Image.asset(
                              "assets/drawables/ic_4.png",
                              fit: BoxFit.cover,
                            ),
                          ),

                          SizedBox(width: 10,),
                          Row(
                            children: [
                              Text(_config.get_text(
                                  context, "assessment_headline4_txt").toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 16,
                                      color: Config.app_backgroungColor)),
                              SizedBox(width: 5,),
                              Text("(2/7)", textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black)),
                            ],
                          )

                        ],

                      ),
                      SizedBox(height: 40,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60),
                        child: Container(
                          width: double.infinity,
                          child: Center(
                            child:Text(_config.get_text(context, "workout_txt"),textAlign: TextAlign.center,style: TextStyle(fontSize: 32),),
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          height: 100,
                          child: GridView.builder(
                                physics: ScrollPhysics(),
                                itemCount: numOfDays.length,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:6),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: ()async{

                                      if(widget.isEdit){
                                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                                            builder: (BuildContext context) =>InformationSummaryScreen()));
                                      }
                                      else{
                                        Navigator.of(context).push(MaterialPageRoute(
                                            builder: (BuildContext context) => daysOfWorkoutsScreen(false)));
                                      }

                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(int.parse("FFEDF7FC",radix: 16)),
                                        borderRadius: BorderRadius.all(Radius.circular(5)),
                                      ),
                                      margin: EdgeInsets.all(5),
                                      child: Center(
                                          child:Text(numOfDays[index].toString(),textAlign: TextAlign.center,style: TextStyle(fontSize: 16),)
                                      ),
                                    ),
                                  );
                                },
                          ),
                        )
                      ),

                      SizedBox(height: 30,),

                      GestureDetector(
                          onTap: ()async{

                              if(widget.isEdit){
                                Navigator.of(context).pushReplacement(MaterialPageRoute(
                                    builder: (BuildContext context) =>InformationSummaryScreen()));
                              }
                              else{
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) => daysOfWorkoutsScreen(false)));
                              }

                          },
                          child: Container(

                              margin:EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                              child: LanguageSubmitButton(bu_text: _config.get_text(context,"not_workout_txt").toString(),bu_color: bu_color ,textColor: bu_text_color,))),


                      SizedBox(height: 20,),



                    ],
                  ),
                ),
              ),
            ),
          ),
        ),

    );
  }
}
