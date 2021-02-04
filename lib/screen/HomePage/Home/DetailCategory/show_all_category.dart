import 'package:KOOMPIACADEMY/screen/HomePage/Home/DetailCategory/list_all_by_category.dart';
import 'package:flutter/material.dart';

class ShowAllCategory extends StatefulWidget {
  @override
  _ShowAllCategoryState createState() => _ShowAllCategoryState();
}

class _ShowAllCategoryState extends State<ShowAllCategory> {
  @override
  Widget build(BuildContext context) {
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
        body: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              children: [
                Expanded(
                  flex: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      500,
                    ),
                    child: Image.network(
                      "https://sala.koompi.com//icons/menu-icons/fill-icons/language.png",
                      width: 50,
                      height: 50,
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: GestureDetector(
                      child: ExpansionTile(
                      title: Text(
                        "បំណិនជីវិត", //"${repositories[index]["no"]}.\t${repositories[index]["title"]}",
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 19,fontWeight: FontWeight.w600),
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
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => ListAllCourseByCategory()));                                },
                                child: Text(
                                  "ការសង្ឡ្រោះបឋម", //" ${repositories[index]["points"][a]["no"]}.\t${repositories[index]["points"][a]["title"]}",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            onTap: () {
                              setState(() {});
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GestureDetector(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Text(
                                "សុខភាពផ្លូវចិត្ត", //" ${repositories[index]["points"][a]["no"]}.\t${repositories[index]["points"][a]["title"]}",
                                textAlign: TextAlign.start,
                                style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),
                              ),
                            ),
                            onTap: () {
                              setState(() {});
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GestureDetector(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Text(
                                "សុខភាពផ្លូវកាយ", //" ${repositories[index]["points"][a]["no"]}.\t${repositories[index]["points"][a]["title"]}",
                                textAlign: TextAlign.start,
                                style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),
                              ),
                            ),
                            onTap: () {
                              setState(() {});
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GestureDetector(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Text(
                                "លារគិតដោយសកម្ម និងផ្នត់គំនិត", //" ${repositories[index]["points"][a]["no"]}.\t${repositories[index]["points"][a]["title"]}",
                                textAlign: TextAlign.start,
                                style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),
                              ),
                            ),
                            onTap: () {
                              setState(() {});
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ));
  }
}
