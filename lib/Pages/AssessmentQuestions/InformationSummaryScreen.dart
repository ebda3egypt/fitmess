import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fitmess/Helpers/Config.dart';
import 'package:fitmess/Widgets/LanguageSubmitButton.dart';
import 'package:flutter/services.dart';
import 'package:fitmess/Models/InformationSummaryModel.dart';
import 'package:fitmess/Widgets/AppBarWidget.dart';
import 'package:fitmess/Pages/AssessmentQuestions/AssessmentDoneScreen.dart';
import 'package:fitmess/Pages/AssessmentQuestions/birthdayQuestionScreen.dart';
import 'package:fitmess/Pages/AssessmentQuestions/GenderQuestionScreen.dart';
import 'package:fitmess/Pages/AssessmentQuestions/HeightQuestionScreen.dart';
import 'package:fitmess/Pages/AssessmentQuestions/slideWeightScreen.dart';
import 'package:fitmess/Pages/AssessmentQuestions/goalIsScreen.dart';
import 'package:fitmess/Pages/AssessmentQuestions/goalWeightScreen.dart';
import 'package:fitmess/Pages/AssessmentQuestions/fitnessLevelScreen.dart';
import 'package:fitmess/Pages/AssessmentQuestions/numberOfWorkoutsScreen.dart';
import 'package:fitmess/Pages/AssessmentQuestions/daysOfWorkoutsScreen.dart';
import 'package:fitmess/Pages/AssessmentQuestions/workPlaceScreen.dart';
import 'package:fitmess/Pages/AssessmentQuestions/equipmentScreen.dart';
import 'package:fitmess/Pages/AssessmentQuestions/numOfMealsScreen.dart';
import 'package:fitmess/Pages/AssessmentQuestions/unlikeFoodItemsScreen.dart';

class InformationSummaryScreen extends StatelessWidget {

  Config _config = Config();
  List<InformationSummaryModel> summary_data = new List<InformationSummaryModel>();

  @override
  Widget build(BuildContext context) {

    summary_data.add(InformationSummaryModel(headline: _config.get_text(context,"age_text"),amount:"24",unit: _config.get_text(context,"year_text")));
    summary_data.add(InformationSummaryModel(headline: _config.get_text(context,"gender_text"),amount:"Male",unit:""));
    summary_data.add(InformationSummaryModel(headline: _config.get_text(context,"height_text"),amount:"170",unit: _config.get_text(context,"cm_text")));
    summary_data.add(InformationSummaryModel(headline: _config.get_text(context,"fat_body_text"),amount: "20",unit:"%"));
    summary_data.add(InformationSummaryModel(headline: _config.get_text(context,"goal_text"),amount: "Lose Weight",unit: ""));
    summary_data.add(InformationSummaryModel(headline: _config.get_text(context,"goal_weight_text"),amount: "70",unit: _config.get_text(context,"weight_KG_unit_txt")));
    summary_data.add(InformationSummaryModel(headline: _config.get_text(context,"fitness_leve_text"),amount: "Beginner",unit:""));
    summary_data.add(InformationSummaryModel(headline: _config.get_text(context,"num_of_days_text"),amount:"3 days",unit: _config.get_text(context,"days_text")));
    summary_data.add(InformationSummaryModel(headline: _config.get_text(context,"days_work_text"),amount: "sun,mon,tue",unit: ""));
    summary_data.add(InformationSummaryModel(headline: _config.get_text(context,"work_text"),amount: "Home",unit: ""));
    summary_data.add(InformationSummaryModel(headline: _config.get_text(context,"work_eq_text"),amount: "Dumbbells",unit: ""));
    summary_data.add(InformationSummaryModel(headline: _config.get_text(context,"meals_eat_text"),amount: "3",unit: _config.get_text(context,"meals_text")));
    summary_data.add(InformationSummaryModel(headline: _config.get_text(context,"snacks_eat_text"),amount:"3",unit: _config.get_text(context,"snacks_text")));
    summary_data.add(InformationSummaryModel(headline: _config.get_text(context,"unlike_items_text"),amount: "Apples",unit:""));



    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      //or set color with: Color(0xFF0000FF)
    ));


    return Material(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarWidget().AppBarWid(),
        body: Container(
              padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
              color: Colors.white,
              child: Center(
                child: Container(
                  width: double.infinity,

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
                              "assets/drawables/ic_info_Summary.png",
                              fit: BoxFit.cover,
                            ),
                          ),

                          SizedBox(width: 10,),
                          Text(_config.get_text(context,"information_review_text").toString(),textAlign: TextAlign.center,style: TextStyle(fontSize: 15,color:Config.app_backgroungColor))


                        ],

                      ),

                      SizedBox(height: 20,),
                      Container(
                          margin: EdgeInsets.symmetric(vertical: 0,horizontal: 40),
                          child:Text(_config.get_text(context,"information_summary_text").toString(),textAlign: TextAlign.center,style: TextStyle(fontSize: 24,color:Colors.black)),

                      ),

                      SizedBox(height: 10,),

                      Container(
                          margin: EdgeInsets.symmetric(vertical: 0,horizontal: 40),
                          child:Text(_config.get_text(context,"review_text").toString(),textAlign: TextAlign.center,style: TextStyle(fontSize: 15,color:Colors.grey[800]))

                      ),

                      SizedBox(height: 10,),

                     SizedBox(
                       height: 400,
                       child:  ListView.separated(
                         shrinkWrap: true,
                         itemCount:summary_data.length,
                         itemBuilder: (context, index) {
                           return Container(
                             padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               crossAxisAlignment: CrossAxisAlignment.center,
                               children: [

                                 Text(summary_data[index].headline.toString(),style: TextStyle(fontSize: 17,)),

                                 GestureDetector(
                                   onTap: (){
                                     navigate_to_edit(context,index);
                                   },
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     crossAxisAlignment: CrossAxisAlignment.center,
                                     children: [
                                       Text(summary_data[index].amount.toString(),style: TextStyle(fontSize: 15,)),
                                       SizedBox(width: 5,),
                                       Text(summary_data[index].unit.toString(),style: TextStyle(fontSize: 15,)),
                                       SizedBox(width: 10,),
                                       Icon(Icons.edit,color: Config.app_backgroungColor,size: 20,)
                                     ],
                                   ),
                                 ),


                               ],
                             ),
                           );
                         },
                         separatorBuilder: (context, index) {
                           return Divider();
                         },
                       ),
                     ),

                      SizedBox(height: 10,),

                      GestureDetector(
                          onTap: ()async{
                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (BuildContext context) => AssessmentDoneScreen()));
                          },
                          child: Container(
                              margin:EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                              child: LanguageSubmitButton(bu_text: _config.get_text(context,"start_text").toString(),bu_color: Config.app_backgroungColor,textColor: Colors.white,))),


                      //SizedBox(height: 20,),



                    ],
                  ),
                ),
              ),
            ),
          ),

    );
  }

  void navigate_to_edit(var context,int num){
    switch (num){
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => birthdayQuestionScreen(true)));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => GenderQuestionScreen(true)));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => HeightQuestionScreen(true)));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => slideWeightScreen(true)));
        break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => goalIsScreen(true)));
        break;
      case 5:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => goalWeightScreen(true)));
        break;
      case 6:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => fitnessLevelScreen(true)));
        break;
      case 7:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => numberOfWorkoutsScreen(true)));
        break;
      case 8:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => daysOfWorkoutsScreen(true)));
        break;
      case 9:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => workPlaceScreen(true)));
        break;
      case 10:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => equipmentScreen(true)));
        break;
      case 11:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => numOfMealsScreen(true)));
        break;
      case 12:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => numOfMealsScreen(true)));
        break;
      case 13:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => unlikeFoodItemsScreen(true)));
        break;


    }
  }
}
