import 'package:KOOMPIACADEMY/screen/HomePage/PlayVideo/videoPlay.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';

class ListAllCourseByCategory extends StatefulWidget {
  @override
  _ListAllCourseByCategoryState createState() =>
      _ListAllCourseByCategoryState();
}

class _ListAllCourseByCategoryState extends State<ListAllCourseByCategory> {
  String text = '';
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Search',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(
                    Icons.search_outlined,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 11,
            child: GridView.builder(
                shrinkWrap: true,
                itemCount: 5,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                    childAspectRatio: width / (height / 1.5)),
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PortfolioTutorialDetailPage()));
                      },
                      child: Container(
                        width: 300,
                        height: 200,
                        child: Padding(
                          padding: EdgeInsets.all(
                            10,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 100,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                    7,
                                  ),
                                  child: Image.network(
                                    "https://www.wowmakers.com/blog/wp-content/uploads/2019/02/Video-thumbnail.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Image.network(
                                    'https://img.icons8.com/pastel-glyph/2x/home.png',
                                    width: 20,
                                    height: 20,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Content Creator Guideline",
                                    style: TextStyle(
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                "បច្ចេកទេសធ្វើវិដេអូមេរៀន",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      100,
                                    ),
                                    child: Image.network(
                                      "https://salabackend.koompi.com/public/uploads/avatar-88cd57f2-1524-475e-ba57-18e7fddbfa18.png",
                                      width: 25,
                                      height: 25,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 5,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("KOOMPI STEAM",style: TextStyle(fontSize: 12)),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text("7 views - 7 days ago",style: TextStyle(fontSize: 11)),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: 25,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Color(0xFF0f73ee),
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(40),
                                    bottomRight: Radius.circular(
                                      40,
                                    ),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "តម្លៃៈ ឥតគិតថ្លៃ",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
