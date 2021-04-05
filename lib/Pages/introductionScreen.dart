import 'package:fitmess/Helpers/Config.dart';
import 'package:fitmess/Models/IntroductionModel.dart';
import 'package:fitmess/Pages/CheckPhoneScreen.dart';
import 'package:fitmess/localization/localization_constants.dart';
import 'package:flutter/material.dart';
import 'package:story/story_page_view/story_page_view.dart';
import 'package:flutter/services.dart';

class introductionScreen extends StatefulWidget {
  @override
  _introductionScreenState createState() => _introductionScreenState();
}

class _introductionScreenState extends State<introductionScreen> {

  List<introductionModel> introductionData = new List<introductionModel>();
  Config _config=Config();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    introductionData=[introductionModel("assets/drawables/intro_img_1.png","","",_config.get_text(context,"intro_txt_sc1_2")),
      introductionModel("assets/drawables/intro_img_2.png","",_config.get_text(context,"intro_txt_sc2_2"),_config.get_text(context,"intro_txt_sc2_3")),
      introductionModel("assets/drawables/intro_img_2.png",_config.get_text(context,"intro_txt_sc3_1"),_config.get_text(context,"intro_txt_sc3_2"),_config.get_text(context,"intro_txt_sc3_3")),
      introductionModel("assets/drawables/intro_img_3.png","",_config.get_text(context,"intro_txt_sc4_2"),_config.get_text(context,"intro_txt_sc4_3")),
      introductionModel("assets/drawables/intro_img_3.png",_config.get_text(context,"intro_txt_sc5_1"),_config.get_text(context,"intro_txt_sc5_2"),_config.get_text(context,"intro_txt_sc5_3")),
      introductionModel("assets/drawables/intro_img_4.png",_config.get_text(context,"intro_txt_sc6_1"),_config.get_text(context,"intro_txt_sc6_2"),_config.get_text(context,"intro_txt_sc6_3")),
      introductionModel("assets/drawables/intro_img_4.png",_config.get_text(context,"intro_txt_sc7_1"),_config.get_text(context,"intro_txt_sc7_2"),_config.get_text(context,"intro_txt_sc7_3")),
      introductionModel("assets/drawables/intro_img_5.png","",_config.get_text(context,"intro_txt_sc8_2"),_config.get_text(context,"intro_txt_sc8_3")),
      introductionModel("assets/drawables/intro_img_5.png","",_config.get_text(context,"intro_txt_sc9_2"),_config.get_text(context,"intro_txt_sc9_3")),];
  }
  @override
  Widget build(BuildContext context) {

    return Material(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.only(top:20),
          child: StoryPageView(
            backgroundColor:Colors.black,
            indicatorDuration: Duration(seconds: 5),
            itemBuilder: (context, pageIndex, storyIndex) {
              return Container(
                padding: EdgeInsets.symmetric(vertical: 20,horizontal: 5),
                color: Colors.black,
                child: Center(
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 50),
                    padding: EdgeInsets.only(top:100),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        storyIndex !=0? Container(
                          child: Image.asset(
                            "assets/drawables/fitmess_word_blue.png",
                            fit: BoxFit.cover,
                          ),
                        ):Container(),
                        SizedBox(height: 20,),
                        Container(
                          width: 295,
                          height: 259.64,
                          child: Image.asset(
                            introductionData[storyIndex].photo_dir.toString(),
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 10,),

                        storyIndex==0 ? Container(
                          margin: EdgeInsets.only(top: 0,bottom:10,right:30,left: 30),
                          child: RichText(
                            textAlign: TextAlign.center,
                              text: new TextSpan(
                                style: new TextStyle(
                                  fontSize: 32,
                                  color: Colors.black,
                                ),
                                children: <TextSpan>[
                                  TextSpan(text: _config.get_text(context,"intro_txt_sc1_P1",),style: TextStyle(fontFamily: 'Arabic')),
                                  TextSpan(text: _config.get_text(context,"intro_txt_sc1_P2"), style: new TextStyle(fontFamily: 'Arabic',fontWeight: FontWeight.bold,color: Config.app_backgroungColor,fontSize: 30)),
                                  TextSpan(text: _config.get_text(context,"intro_txt_sc1_P3"),style: TextStyle(fontFamily: 'Arabic')),
                                  TextSpan(text: _config.get_text(context,"intro_txt_sc1_P4"), style: new TextStyle(fontFamily: 'Arabic',fontWeight: FontWeight.bold,color: Config.app_backgroungColor,fontSize: 30)),
                                ],
                              ),
                        )):Container(
                          margin: EdgeInsets.symmetric(vertical: 5,horizontal: 50),
                          child: Text(introductionData[storyIndex].text1.toString(),textAlign: TextAlign.center,style: TextStyle(fontSize: 13),),
                        ),
                       storyIndex!=0? Container(
                            margin: EdgeInsets.symmetric(vertical: 0,horizontal: 50),
                            child: storyIndex%2==0 ? Text(introductionData[storyIndex].text2.toString(),textAlign: TextAlign.center,style: TextStyle(fontSize: 24,fontWeight:FontWeight.bold,color:Config.app_backgroungColor))
                                : Text(introductionData[storyIndex].text2.toString(),textAlign: TextAlign.center,style: TextStyle(fontSize: 24,color:Colors.black),)
                        ):Container(),
                        storyIndex!=0?SizedBox(height: 10,):Container(),
                        Container(
                            margin: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                            child: Text(introductionData[storyIndex].text3.toString(),textAlign: TextAlign.center,style: TextStyle(fontSize: 17),)
                        ),

                       /* storyIndex==0?Container(
                            margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                            child: Text(_config.get_text(context, "intro_txt_sc1_3"),textAlign: TextAlign.center,style: TextStyle(fontSize: 17),)
                        ):Container(),*/

                        storyIndex==introductionData.length-1 ?Container(
                          margin: EdgeInsets.symmetric(vertical: 5,horizontal: 50),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(_config.get_text(context,"intro_txt_sc9_4").toString(),textAlign: TextAlign.center,style: TextStyle(fontSize: 17),),
                              Text(_config.get_text(context,"intro_txt_sc9_5"),textAlign: TextAlign.center,style: TextStyle(fontSize: 17),),
                            ],
                          ),
                        ) :Container(),

                      ],
                    ),
                  ),
                ),
              );
            },
            gestureItemBuilder: (context, pageIndex, storyIndex) {
              return Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 80,right: 20),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    color: Colors.black,
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              );
            },
            pageLength: 1,
            storyLength: (int pageIndex) {
              return introductionData.length;
            },
            onPageLimitReached: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => CheckPhoneScreen("NewUser")));
            },

          ),
        ),
      ),
    );
  }
}

