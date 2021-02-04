import 'package:KOOMPIACADEMY/screen/HomePage/PlayVideo/videoPlay.dart';
import 'package:flutter/material.dart';

class MyOrginization extends StatefulWidget {
  @override
  _MyOrginizationState createState() => _MyOrginizationState();
}

class _MyOrginizationState extends State<MyOrginization> {
  int _tab = 0;
  _changeTab(index) {
    _tab = index;
  }

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
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
      body: Padding(
        padding: EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                child: Container(
                  width: _screenSize.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      7,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 140,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(
                                  7,
                                ),
                                topRight: Radius.circular(
                                  7,
                                ),
                              ),
                              child: Image(
                                image: NetworkImage(
                                    "https://salabackend.koompi.com/public/uploads/cover-966e4fc9-8faa-45eb-8355-0e8ed7f13f21.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Text(
                            "SALA KOOMPI",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              bottom: 20,
                              left: 10,
                              right: 10,
                            ),
                            child: Text(
                              "It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        top: 100,
                        left: (_screenSize.width / 2) - 48,
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(
                                7,
                              ),
                              child: Image.network(
                                "https://salabackend.koompi.com/public/uploads/avatar-86b8708f-867c-4bd1-bf93-5352fe94e738.png",
                                width: 70,
                                height: 70,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Container(
                  width: double.infinity,
                  height: 50,
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int index) {
                      return Tab(
                        child: Builder(
                          builder: (context) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  _changeTab(index);
                                });
                              },
                              child: Text(
                                "ទំព័រដើម",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: index == _tab
                                      ? Colors.blue
                                      : Colors.black,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: 10,
                      );
                    },
                  ),
                ),
              ),
              _tab == 0
                  ? Card(
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PortfolioTutorialDetailPage()));
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height/2.3,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext ctx, int index) {
                              return Card(
                                child: Container(
                                  width: 300,
                                  height: 140,
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                      10,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          height: 140,
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
                                          height: 7,
                                        ),
                                        Row(
                                          children: [
                                            Image.network(
                                              'https://img.icons8.com/pastel-glyph/2x/home.png',
                                              width: 20,
                                              height: 20,
                                            ),
                                            SizedBox(
                                              width: 7,
                                            ),
                                            Text(
                                              "Content Creator Guideline",
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "បច្ចេកទេសធ្វើវិដេអូមេរៀន",
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 7,
                                        ),
                                        Row(
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(
                                                100,
                                              ),
                                              child: Image.network(
                                                "https://salabackend.koompi.com/public/uploads/avatar-88cd57f2-1524-475e-ba57-18e7fddbfa18.png",
                                                width: 40,
                                                height: 40,
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
                                                  Text("KOOMPI STEAM"),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text("7 views - 7 days ago"),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          height: 35,
                                          width: 120,
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
                              );
                            },
                            separatorBuilder: (BuildContext ctx, int index) {
                              return SizedBox(
                                width: 10,
                              );
                            },
                            itemCount: 10,
                          ),
                        ),
                      ),
                    )
                  : Container(),
              _tab == 1
                  ? Card(
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Container(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "គ្រូបង្រៀន",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                height: 120,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (ctx, index) {
                                    return Column(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: Image.network(
                                            "https://salabackend.koompi.com/public/uploads/avatar.png",
                                            width: 60,
                                            height: 60,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          width: 100,
                                          child: Text(
                                            "SAN Vuthy",
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )
                                      ],
                                    );
                                  },
                                  // griddDelegate:
                                  //     SliverGridDelegateWithFixedCrossAxisCount(
                                  //   crossAxisCount: 4,
                                  //   mainAxisSpacing: 10,
                                  //   crossAxisSpacing: 10,
                                  // ),
                                  itemCount: 10,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  : Container(),
              _tab == 1
                  ? Card(
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Container(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "សិស្ស",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                height: 120,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (ctx, index) {
                                    return Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15.0, vertical: 8.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            child: Image.network(
                                              "https://salabackend.koompi.com/public/uploads/avatar.png",
                                              width: 60,
                                              height: 60,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          width: 100,
                                          child: Text(
                                            "SAN Vuthy",
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )
                                      ],
                                    );
                                  },
                                  // gridDelegate:
                                  //     SliverGridDelegateWithFixedCrossAxisCount(
                                  //   crossAxisCount: 4,
                                  //   mainAxisSpacing: 10,
                                  //   crossAxisSpacing: 10,
                                  // ),
                                  itemCount: 10,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
