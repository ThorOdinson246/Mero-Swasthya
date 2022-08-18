import 'package:testapp1/pages/homepage.dart';
import 'package:testapp1/pages/settings.dart';
import 'package:flutter/material.dart';

class lessonBiology extends StatefulWidget {
  @override
  _lessonBiologyState createState() => _lessonBiologyState();
}

class _lessonBiologyState extends State<lessonBiology> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: drkmd == true ? Colors.grey[900] : Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff0984e3),
        centerTitle: true,
        toolbarHeight: 50,
        title: Text(
          "NOTES",
          style: TextStyle(
            fontFamily: 'SuezOne',
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        // crossAxisCount: 2,
        children: [
          Padding(
            padding: const EdgeInsets.all(0),
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Container(
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  image: DecorationImage(
                    image: AssetImage('images/physics_grid.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(13),
                child: Card(
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                  color:
                      drkmd == true ? HexColor('#444444') : HexColor('#dfe6e9'),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Topic-1",
                          style: TextStyle(
                            color: drkmd == true
                                ? HexColor('#bebebe')
                                : Colors.grey[600],
                            fontSize: 17,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "TestText",
                          style: TextStyle(
                            color: drkmd == true
                                ? HexColor('#bebebe')
                                : Colors.grey[600],
                            fontSize: 22,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w900,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(13),
                child: Card(
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                  color:
                      drkmd == true ? HexColor('#444444') : HexColor('#dfe6e9'),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Topic-2",
                          style: TextStyle(
                            color: drkmd == true
                                ? HexColor('#bebebe')
                                : Colors.grey[600],
                            fontSize: 17,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "TestText",
                          style: TextStyle(
                            color: drkmd == true
                                ? HexColor('#bebebe')
                                : Colors.grey[600],
                            fontSize: 22,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w900,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
                color:
                    drkmd == true ? HexColor('#444444') : HexColor('#dfe6e9'),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Topic-3",
                        style: TextStyle(
                          color: drkmd == true
                              ? HexColor('#bebebe')
                              : Colors.grey[600],
                          fontSize: 17,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "TestText Machine",
                        style: TextStyle(
                          color: drkmd == true
                              ? HexColor('#bebebe')
                              : Colors.grey[600],
                          fontSize: 22,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w900,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
                color:
                    drkmd == true ? HexColor('#444444') : HexColor('#dfe6e9'),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Topic-4",
                        style: TextStyle(
                          color: drkmd == true
                              ? HexColor('#bebebe')
                              : Colors.grey[600],
                          fontSize: 17,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "TestText",
                        style: TextStyle(
                          color: drkmd == true
                              ? HexColor('#bebebe')
                              : Colors.grey[600],
                          fontSize: 22,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w900,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
                color:
                    drkmd == true ? HexColor('#444444') : HexColor('#dfe6e9'),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Topic-5",
                        style: TextStyle(
                          color: drkmd == true
                              ? HexColor('#bebebe')
                              : Colors.grey[600],
                          fontSize: 17,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "TestText",
                        style: TextStyle(
                          color: drkmd == true
                              ? HexColor('#bebebe')
                              : Colors.grey[600],
                          fontSize: 22,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w900,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
                color:
                    drkmd == true ? HexColor('#444444') : HexColor('#dfe6e9'),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Topic-6",
                        style: TextStyle(
                          color: drkmd == true
                              ? HexColor('#bebebe')
                              : Colors.grey[600],
                          fontSize: 17,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "TestText",
                        style: TextStyle(
                          color: drkmd == true
                              ? HexColor('#bebebe')
                              : Colors.grey[600],
                          fontSize: 22,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w900,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
                color:
                    drkmd == true ? HexColor('#444444') : HexColor('#dfe6e9'),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Topic-7",
                        style: TextStyle(
                          color: drkmd == true
                              ? HexColor('#bebebe')
                              : Colors.grey[600],
                          fontSize: 17,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "TestText.",
                        style: TextStyle(
                          color: drkmd == true
                              ? HexColor('#bebebe')
                              : Colors.grey[600],
                          fontSize: 22,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w900,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
