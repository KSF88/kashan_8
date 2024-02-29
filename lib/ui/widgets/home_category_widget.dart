import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/view_model/news_view_model.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class homeCategoryWidget extends StatefulWidget {
  const homeCategoryWidget({super.key});

  @override
  State<homeCategoryWidget> createState() => _homeCategoryWidgetState();
}

class _homeCategoryWidgetState extends State<homeCategoryWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return SizedBox(
      height: height * .45,
      child: FutureBuilder(
        future: NewsViewModel().fetchCategoriesNewsApi('general'),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: SpinKitPouringHourGlass(
                color: Colors.blue,
                size: 50,
              ),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.articles!.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Container(
                        height: 100,
                        width: 120,
                        child: Image.network(
                          snapshot.data!.articles![index].urlToImage.toString(),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.data!.articles![index].title.toString(),
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Colors.black54,
                              fontWeight: FontWeight.w700,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Author: ${snapshot.data!.articles![index].author}',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
