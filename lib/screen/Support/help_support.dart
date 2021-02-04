import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HelpSupport extends StatefulWidget {
  @override
  _HelpSupportState createState() => _HelpSupportState();
}

class _HelpSupportState extends State<HelpSupport> {
  final _pageCotroller = PageController(viewportFraction: 0.877);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("ជំនួយ", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700, color:Colors.grey)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black54),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 250,
              // flex: 1,
              child: PageView(
                physics: BouncingScrollPhysics(),
                controller: _pageCotroller,
                scrollDirection: Axis.horizontal,
                children: List.generate(
                    3,
                    (index) => Container(
                      margin: EdgeInsets.all(5),
                      width: MediaQuery.of(context).size.width,
                      height: 250,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.6),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://image.freepik.com/free-vector/business-people-disscussing-work-with-laptop_180868-161.jpg"),
                          )),
                      child: Stack(
                        children: [
                          Positioned(
                              bottom: 5.0,
                              left: 19.2,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4.8),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                      sigmaX: 100.2, sigmaY: 100.2),
                                  child: Container(
                                    height: 36,
                                    padding: EdgeInsets.only(
                                        left: 16.72, right: 14.4),
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: [
                                        Icon(Icons.group_work_outlined),
                                        SizedBox(width: 9.52),
                                        Text("SALA KOOMPI",
                                            style: GoogleFonts.lato(
                                                fontWeight:
                                                    FontWeight.w700,
                                                color: Colors.blueGrey,
                                                fontSize: 16.8))
                                      ],
                                    ),
                                  ),
                                ),
                              ))
                        ],
                      ),
                    )),
              )),
          Padding(
            padding: EdgeInsets.only(left: 28.8, top: 8.8),
            child: SmoothPageIndicator(
              controller: _pageCotroller,
              count: 3,
              effect: ExpandingDotsEffect(
                activeDotColor: Color(0xFF8a8a8a),
                dotColor: Color(0xFFababab),
                dotHeight: 4.8,
                dotWidth: 6,
                spacing: 4.8,
              ),
            ),
          ),
          SizedBox(height: 15),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext Context , int index){
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  child: Card (
                    child: Container(
                      height: 60.0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("តើខ្ញុំអាចធ្វើការកំណត់បន្ថែម លើគណនីយរបស់ខ្ញុំបានទៀតទេ?", maxLines: 2, style:TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                            Icon(Icons.video_call_outlined, color: Colors.grey)
                          ],
                        ),
                      )
                    )
                  ),
                );
              }
            )
          ),
        ],
      ),
    );
  }
}
