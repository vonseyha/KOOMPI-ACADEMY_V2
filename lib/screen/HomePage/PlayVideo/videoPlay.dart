import 'package:KOOMPIACADEMY/API%20service/connection/graphQLVideoConf.dart';
import 'package:KOOMPIACADEMY/graphql/query.dart';
import 'package:KOOMPIACADEMY/model/videoPlay.dart';
import 'package:KOOMPIACADEMY/screen/Comment/commentSection.dart';
import 'package:KOOMPIACADEMY/screen/DetailCourse/content_course.dart';
import 'package:KOOMPIACADEMY/screen/DetailCourse/overview_coure.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../constants.dart';

class PortfolioTutorialDetailPage extends StatefulWidget {
  final String course_Id;
  final String course_Title;

  const PortfolioTutorialDetailPage(
      {Key key, @required this.course_Id, this.course_Title})
      : super(key: key);

  @override
  _PortfolioTutorialDetailPageState createState() =>
      _PortfolioTutorialDetailPageState();
}

class _PortfolioTutorialDetailPageState
    extends State<PortfolioTutorialDetailPage>
    with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Overview'),
    Tab(text: 'Content'),
  ];

  List<LinkVideo> list =
      List<LinkVideo>(); //-------------------------homeQuery/datas.dart';
  GraphqlVideoConf graphqlVideoConf =
      GraphqlVideoConf(); //---------------------graphQLVideoConf.dart';
  String videoId_link;

  Future<String> filllist() async {
    QueryData queryData = QueryData();
    GraphQLClient client = graphqlVideoConf.clientToQuery();
    QueryResult result = await client.query(QueryOptions(
        documentNode: gql(queryData.getInitVideo(widget.course_Id))));
    if (!result.hasException) {
      for (var i = 0; i < result.data['sections'].length; i++) {
        if (result.data['sections'][i].containsKey('points')) {
          for (var a = 0;
              a < result.data['sections'][i]['points'].length;
              a++) {
            if (result.data['sections'][i]['points'][a]
                .containsKey('video_link')) {
              videoId_link =
                  result.data['sections'][0]['points'][0]['video_link'];
              setState(() {
                videoId = YoutubePlayer.convertUrlToId(videoId_link);
              });
              print(videoId);
            }
          }
        }
      }
    }
    return videoId;
  }

  ////////////
  String videoId = "8q1_NkDbfzE";
  // create variable to compare with result
  TabController _tabController;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  YoutubePlayerController _controller;
  PlayerState _playerState;
  YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;

  @override
  void dispose() {
    _tabController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() => setState(() {}));
    // filllist();
    _controller = YoutubePlayerController(
      initialVideoId: "8q1_NkDbfzE", //videoId,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
      ),
    )..addListener(listener);
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  void _showSnackBar(String message) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 16.0,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        behavior: SnackBarBehavior.floating,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );
  }

  // ValueNotifier<GraphQLClient> clientdata = ValueNotifier(
  //   GraphQLClient(
  //     cache: InMemoryCache(),
  //     link: HttpLink(uri: 'https://learnbackend.koompi.com/student'),
  //   ),
  // );

  // QueryData queryData = QueryData();//---------------------------homeQuery/query.dart';

  @override
  Widget build(BuildContext context) {
    var datawh = MediaQuery.of(context);
    return YoutubePlayerBuilder(
      onExitFullScreen: () {
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      },
      player: YoutubePlayer(
        controller: _controller,
        liveUIColor: Colors.amber,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.blueAccent,
        onReady: () {
          _isPlayerReady = true;
        },
        onEnded: (data) {
          _controller.load(videoId);
          _showSnackBar('Next Video Started!');
        },
      ),
      builder: (context, player) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(icon: Icon(Icons.arrow_back,size: 25,color: Colors.black54,),onPressed:(){ Navigator.pop(context);}),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                  width: 190.0,
                  height: 20.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(20.0),
                    color: kPrimaryColor,
                  ),
                  child: Text(
                    "ចុះឈ្មោះចូលរៀនមេរៀននេះ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  )),
                ),
              ],
          ),
          body: Container(
              height: datawh.size.height,
              child: Column(
                children: <Widget>[
                  player,
                  Expanded(
                    child: _buildDesc(context),
                  )
                ],
              )),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder:(context) => FregementAnswer())
              );
            },
            backgroundColor: Colors.blueAccent,
            child: Icon(Icons.question_answer),
          ),
        );
      },
    );
  }

  Widget _buildDesc(BuildContext context) {
    var datawh = MediaQuery.of(context);
    print(datawh);
    return Container(
        height: datawh.size.height / 2,
        color: Colors.white,
        child: Column(children: <Widget>[
          Container(
              child: Column(
            children: <Widget>[
              DefaultTabController(
                length: 2,
                child: Container(
                  height: datawh.size.height / 13,
                  child: TabBar(
                    controller: _tabController,
                    tabs: [
                      Expanded(
                        child: new Text(
                          'OVERVIEW',
                          style: TextStyle(fontSize: 15.0),
                        ),
                      ),
                      Expanded(
                        child: new Text(
                          'CONTENT',
                          style: TextStyle(fontSize: 15.0),
                        ),
                      ),
                    ],
                    unselectedLabelColor: Colors.grey[600],
                    indicatorColor: Colors.blueAccent,
                    labelColor: Colors.blueAccent,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorWeight: 2.0,
                    indicatorPadding: EdgeInsets.all(10),
                    isScrollable: false,
                  ),
                ),
              ),
              DefaultTabController(
                length: 2,
                child: Container(
                  height: datawh.size.height / 1.93,
                  child:
                      TabBarView(controller: _tabController, children: <Widget>[
                    // ContentFregement(courseTitle: widget.course_Title),
                    OverviewCourse(),
                    Scaffold(
                      // client: clientdata,
                      // child: Scaffold(
                      body:
                          //   Query(
                          // options: QueryOptions(
                          //     documentNode: gql(
                          //         queryData.getContentCourse(widget.course_Id)),
                          //     variables: {"course_id": "${widget.course_Id}"}),
                          // builder: (QueryResult result,
                          //     {VoidCallback refetch, FetchMore fetchMore}) {
                          //   if (result.hasException) {
                          //     return Text(result.exception.toString());
                          //   }
                          //   if (result.loading) {
                          //     return Center(
                          //       child: SpinKitFadingCircle(
                          //           color: Colors.blueGrey, size: 40),
                          //     );
                          //   }
                          //   List repositories = result.data['sections'];
                          //   return
                          ListView.builder(
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return ExpansionTile(
                            title: Text(
                              "${index + 1} \tSectionTitle", //"${repositories[index]["no"]}.\t${repositories[index]["title"]}",
                              textAlign: TextAlign.start,
                              style: TextStyle(fontSize: 17),
                            ),
                            children: <Widget>[
                              // if (result.data['sections'][index]
                              //     .containsKey("points"))
                              //   for (var a = 0;
                              //       a <
                              //           result
                              //               .data['sections'][index]
                              //                   ["points"]
                              //               .length;
                              //       a++)
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: GestureDetector(
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Text(
                                      "${index + 1} \tPointTitle", //" ${repositories[index]["points"][a]["no"]}.\t${repositories[index]["points"][a]["title"]}",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      // videoId =
                                      //     YoutubePlayer.convertUrlToId(
                                      //         repositories[index]
                                      //                 ["points"][a]
                                      //             ["video_link"]);
                                      _controller.load(videoId);
                                    });
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                      ), //;
                      //   },//--
                      // )//--
                    ),
                    // )
                  ]),
                ),
              )
            ],
          ))
        ]));
  }
}
