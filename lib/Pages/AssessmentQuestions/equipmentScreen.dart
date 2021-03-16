import 'package:fitmess/Enum/SelectedWeightEnum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fitmess/Helpers/Config.dart';
import 'package:fitmess/Widgets/LanguageSubmitButton.dart';
import'package:fitmess/Models/EquipmentModel.dart';
import 'package:fitmess/Widgets/AppBarWidget.dart';
import 'package:fitmess/Pages/AssessmentQuestions/InformationSummaryScreen.dart';
import 'package:fitmess/Pages/AssessmentQuestions/numOfMealsScreen.dart';



class equipmentScreen extends StatefulWidget {
  bool isEdit;
  equipmentScreen(this.isEdit);
  @override
  _equipmentScreenState createState() => _equipmentScreenState();
}

class _equipmentScreenState extends State<equipmentScreen> {
  Config _config = Config();
  Color bu_color =Colors.grey[300] , bu_text_color = Colors.grey[600] ;


  String hintText = "";
  String selected_bu="";
  SelectedWeigtEnum selectedWeigtEnum= SelectedWeigtEnum.none;

  bool is_kg =false,is_Completed=false;

  List<EquipmentModel> numOfDays = new List<EquipmentModel>();
  List<EquipmentModel> SelectedDays = new List<EquipmentModel>();



  void changeColor(){
    if(SelectedDays.length==0){
      is_Completed = false;
      bu_color = Colors.grey[300];
      bu_text_color = Colors.grey[600];
    }
    else{
      is_Completed = true;
      bu_color = Colors.blue;
      bu_text_color = Colors.white;
    }

    setState(() {});
  }



  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    numOfDays.add(EquipmentModel(_config.get_text(context, "equipment_txt_1"),"assets/drawables/ic_dumbbeles.png",Colors.grey[100]));
    numOfDays.add(EquipmentModel(_config.get_text(context, "equipment_txt_2"),"assets/drawables/ic_pullUp.png",Colors.grey[100]));
    numOfDays.add(EquipmentModel(_config.get_text(context, "equipment_txt_3"),"assets/drawables/ic_other.png",Colors.grey[100]));
    numOfDays.add(EquipmentModel(_config.get_text(context, "equipment_txt_4"),"assets/drawables/ic_noEq.png",Colors.grey[100]));
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
                margin: EdgeInsets.only(top: 0),
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
                          Text(_config.get_text(context,"assessment_headline4_txt").toString(),textAlign: TextAlign.center,style: TextStyle(fontSize: 16,color:Colors.black))


                        ],

                      ),
                      SizedBox(height: 40,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          width: double.infinity,
                          child: Center(
                            child:Text(_config.get_text(context, "equipment_txt_headline"),textAlign: TextAlign.center,style: TextStyle(fontSize: 40),),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            height: 400,
                            child: GridView.builder(
                              physics: ScrollPhysics(),
                              itemCount: numOfDays.length,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: (){
                                    if(SelectedDays.contains(numOfDays[index]))
                                    {
                                      numOfDays[index].borderColor = Colors.grey[100];
                                      SelectedDays.remove(numOfDays[index]);

                                    }
                                    else
                                    {
                                      numOfDays[index].borderColor = Colors.blue;
                                      SelectedDays.add(numOfDays[index]);
                                    }

                                    changeColor();


                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      border: Border.all(color: numOfDays[index].borderColor),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    margin: EdgeInsets.all(5),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(numOfDays[index].photoURL.toString(),width: 100,height: 100,) ,
                                        SizedBox(height: 10,),
                                        Text(numOfDays[index].name.toString(),textAlign: TextAlign.center,style: TextStyle(fontSize: 16,color:Colors.black ),)

                                      ],
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
                            if(is_Completed){
                              if(widget.isEdit){
                                Navigator.of(context).pushReplacement(MaterialPageRoute(
                                    builder: (BuildContext context) =>InformationSummaryScreen()));
                              }
                              else{
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) => numOfMealsScreen(false)));
                              }
                            }
                          },
                          child: Container(

                              margin:EdgeInsets.symmetric(vertical: 5,horizontal: 50),
                              child: LanguageSubmitButton(bu_text: _config.get_text(context,"assessment_continue_txt").toString(),bu_color: bu_color ,textColor: bu_text_color,))),


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
