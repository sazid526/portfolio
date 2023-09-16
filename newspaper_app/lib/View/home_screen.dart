import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newspaper_app/models/news_channel_headlines_model.dart';
import 'package:newspaper_app/view_model/news_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).height * 1;
    final height = MediaQuery.sizeOf(context).height * 1;

    NewsViewModel newsViewModel = NewsViewModel();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset("images/category_icon.png",
          height: 25,width: 25,),
          onPressed: (){

          },
        ),
        backgroundColor: Colors.white,
        title: Center(child: Text("News", style: GoogleFonts.poppins(fontSize: 24,fontWeight: FontWeight.w700,color: Colors.black),)),
      ),
      body: ListView(
        children: [
          Container(
            height: height * .55,
            width: width,
            child: FutureBuilder<NewsChannelHeadlinesModel>(
              future: F,
              builder: (BuildContext, snapshot){
                
              },
            ),
          )
        ],
      ),
    );
  }
}
