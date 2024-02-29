import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/app_colors/app_colors.dart';
import 'package:flutter_application_1/configs/routes/routes_names.dart';
import 'package:flutter_application_1/model/NewsChannelHeadlinesModel.dart';
import 'package:flutter_application_1/model/categories_news_model.dart';
import 'package:flutter_application_1/ui/view_model/news_view_model.dart';
import 'package:flutter_application_1/ui/widgets/home_category_widget.dart';
import 'package:flutter_application_1/ui/widgets/home_headlines_widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class home_view extends StatefulWidget {
  const home_view({super.key});

  @override
  State<home_view> createState() => _home_viewState();
}

enum NewsfilterList { bbcNews, aryNews, independent, reuters, cnn, alJazeera }

class _home_viewState extends State<home_view> {
  NewsViewModel newsViewModel = NewsViewModel();

  final formate = DateFormat('MMM dd, YYYY');

  String name = 'bbc-news';

  NewsfilterList? selectedMenu;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;

    return Scaffold(
      appBar: AppBar(backgroundColor: primaryColor,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.category_outlined, size: 30),
            onPressed: () {
              Navigator.pushNamed(context, RoutesNames.Category_view);
            },
          ),
          actions: [
            PopupMenuButton<NewsfilterList>(
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.black,
                ),
                onSelected: (NewsfilterList item) {
                  if (NewsfilterList.bbcNews.name == item.name) {
                    name = 'bbc-news';
                  }
                  if (NewsfilterList.aryNews.name == item.name) {
                    name = 'ary-news';
                  }
                  if (NewsfilterList.alJazeera.name == item.name) {
                    name = 'al-jazeera-english';
                  }
                  setState(() {});
                },
                initialValue: selectedMenu,
                itemBuilder: (context) => <PopupMenuEntry<NewsfilterList>>[
                      PopupMenuItem<NewsfilterList>(
                        child: Text("BBC News"),
                        value: NewsfilterList.bbcNews,
                      ),
                      PopupMenuItem<NewsfilterList>(
                        child: Text("Ary News"),
                        value: NewsfilterList.aryNews,
                      ),
                      PopupMenuItem<NewsfilterList>(
                        child: Text("Al-jazeera News"),
                        value: NewsfilterList.alJazeera,
                      ),
                    ])
          ],
          title: Text(
            "NEWS !",
            style:
                GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w700),
          )),
      body: Container(
        height: double.infinity,
        child: ListView(
          children: [
            SizedBox(
              height: height * .55,
              width: width,
              child: FutureBuilder<NewsChannelsHeadlinesModel>(
                future: newsViewModel.fetchNewsChannelsApi(name),
                builder: (context, /* AsyncSnapshot<dynamic> */ snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: SpinKitPouringHourGlass(
                        color: Colors.blue,
                        size: 50,
                      ),
                    );
                  } else {
                    //custom headlines widget used
                    return homeHeadlinesWidget(articles: snapshot.data!.articles!);
                  }
                },
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            //custom category widget
            homeCategoryWidget()
          ],
        ),
      ),
    );
  }
}




















//top headlines
// https://newsapi.org/v2/top-headlines?country=us&apiKey= myapikey  //myapi key at the end 
//myapikey= 4a50bdfa3ec34ab6a3b3955c4ee30689


//