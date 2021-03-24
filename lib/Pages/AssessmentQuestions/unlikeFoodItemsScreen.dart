import 'package:fitmess/Enum/SelectedWeightEnum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fitmess/Helpers/Config.dart';
import 'package:fitmess/Widgets/LanguageSubmitButton.dart';
import'package:fitmess/Models/AssessmentFoodItem.dart';
import 'package:fitmess/Widgets/AppBarWidget.dart';
import 'package:fitmess/Pages/AssessmentQuestions/InformationSummaryScreen.dart';


class unlikeFoodItemsScreen extends StatefulWidget {
  bool isEdit;
  unlikeFoodItemsScreen(this.isEdit);

  @override
  _unlikeFoodItemsScreenState createState() => _unlikeFoodItemsScreenState();
}

class _unlikeFoodItemsScreenState extends State<unlikeFoodItemsScreen> {
  Config _config = Config();
  Color bu_color =Color(int.parse("FFEDF7FC",radix: 16)) , bu_text_color = Colors.black ;


  String hintText = "";
  String selected_bu="";
  SelectedWeigtEnum selectedWeigtEnum= SelectedWeigtEnum.none;

  bool is_kg =false,is_Completed=false;

  List<AssessmentFoodItem> numOfDays = new List<AssessmentFoodItem>();
  List<AssessmentFoodItem> SelectedDays = new List<AssessmentFoodItem>();



  void changeColor(){
    if(SelectedDays.length==0){
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
    numOfDays.add(AssessmentFoodItem(_config.get_text(context, "test1"),"",Color(int.parse("FFEDF7FC",radix: 16))));
    numOfDays.add(AssessmentFoodItem(_config.get_text(context, "test1"),"",Color(int.parse("FFEDF7FC",radix: 16))));
    numOfDays.add(AssessmentFoodItem(_config.get_text(context, "test1"),"",Color(int.parse("FFEDF7FC",radix: 16))));
    numOfDays.add(AssessmentFoodItem(_config.get_text(context, "test1"),"",Color(int.parse("FFEDF7FC",radix: 16))));
    numOfDays.add(AssessmentFoodItem(_config.get_text(context, "test1"),"",Color(int.parse("FFEDF7FC",radix: 16))));
    numOfDays.add(AssessmentFoodItem(_config.get_text(context, "test1"),"",Color(int.parse("FFEDF7FC",radix: 16))));
    numOfDays.add(AssessmentFoodItem(_config.get_text(context, "test1"),"",Color(int.parse("FFEDF7FC",radix: 16))));
    numOfDays.add(AssessmentFoodItem(_config.get_text(context, "test1"),"",Color(int.parse("FFEDF7FC",radix: 16))));
    numOfDays.add(AssessmentFoodItem(_config.get_text(context, "test1"),"",Color(int.parse("FFEDF7FC",radix: 16))));
    numOfDays.add(AssessmentFoodItem(_config.get_text(context, "test1"),"",Color(int.parse("FFEDF7FC",radix: 16))));
    numOfDays.add(AssessmentFoodItem(_config.get_text(context, "test1"),"",Color(int.parse("FFEDF7FC",radix: 16))));
    numOfDays.add(AssessmentFoodItem(_config.get_text(context, "test1"),"",Color(int.parse("FFEDF7FC",radix: 16))));
    numOfDays.add(AssessmentFoodItem(_config.get_text(context, "test1"),"",Color(int.parse("FFEDF7FC",radix: 16))));
    numOfDays.add(AssessmentFoodItem(_config.get_text(context, "test1"),"",Color(int.parse("FFEDF7FC",radix: 16))));
    numOfDays.add(AssessmentFoodItem(_config.get_text(context, "test1"),"",Color(int.parse("FFEDF7FC",radix: 16))));
    numOfDays.add(AssessmentFoodItem(_config.get_text(context, "test1"),"",Color(int.parse("FFEDF7FC",radix: 16))));
    numOfDays.add(AssessmentFoodItem(_config.get_text(context, "test1"),"",Color(int.parse("FFEDF7FC",radix: 16))));
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
                              Text("(7/7)", textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black)),
                            ],
                          )


                        ],

                      ),
                      SizedBox(height: 40,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Container(
                          width: double.infinity,
                          child: Center(
                            child:Text(_config.get_text(context, "unLikeFood_headline"),textAlign: TextAlign.center,style: TextStyle(fontSize: 32),),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            height: 350,
                            child: GridView.builder(
                              /*physics: ScrollPhysics(),*/
                              itemCount: numOfDays.length,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:4,childAspectRatio: 50/100,
                                mainAxisSpacing: 0.0,
                                crossAxisSpacing: 10.0,),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: (){
                                    if(SelectedDays.contains(numOfDays[index]))
                                    {
                                      numOfDays[index].border_color = Color(int.parse("FFEDF7FC",radix: 16));
                                      SelectedDays.remove(numOfDays[index]);

                                    }
                                    else
                                    {
                                      numOfDays[index].border_color = Config.app_backgroungColor;
                                      SelectedDays.add(numOfDays[index]);
                                    }
                                    changeColor();
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 50,vertical: 50),
                                        decoration: BoxDecoration(
                                          color: Color(int.parse("FFEDF7FC",radix: 16)),
                                          border: Border.all(color:numOfDays[index].border_color ),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      Container(
                                        child: Center(
                                            child:Text(numOfDays[index].name.toString(),textAlign: TextAlign.center,style: TextStyle(fontSize: 16,color:Colors.black ),)
                                        ),
                                      )
                                    ],
                                  ),

                                );
                              },
                            ),
                          )
                      ),

                      SizedBox(height: 30,),

                      GestureDetector(
                          onTap: ()async{
                            if(is_Completed){
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>InformationSummaryScreen()));
                            }
                          },
                          child: Container(

                              margin:EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                              child: LanguageSubmitButton(bu_text: _config.get_text(context,"submit_assess_text").toString(),bu_color: bu_color ,textColor: bu_text_color,))),


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
