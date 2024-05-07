import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'bottom_navi_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SearchPage(),
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int _selectedIndex = 1; //해당되는 페이지 번호
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2EBDF),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 80,
            child: TextField(
              decoration: InputDecoration(
                hintText: '검색...',
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFE9A05C), width: 5.0),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFE9A05C), width: 5.0),
                ),
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Container(
            height: 180,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: 10,),
                  Container(
                    width: 160,
                    height: 160,
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(height: 16),
                        Image.asset(
                          'assets/images/chair1.png',
                          width: 100,
                          height: 100,
                        ),
                        SizedBox(height: 10),
                        const Text(
                          '139,900',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 40),
                  Container(
                    width: 160,
                    height: 160,
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(height: 16),
                        Image.asset(
                          'assets/images/chair1.png',
                          width: 100,
                          height: 100,
                        ),
                        SizedBox(height: 10),
                        const Text(
                          '139,900',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 40),
                  Container(
                    width: 160,
                    height: 160,
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(height: 16),
                        Image.asset(
                          'assets/images/chair1.png',
                          width: 100,
                          height: 100,
                        ),
                        SizedBox(height: 10),
                        const Text(
                          '139,900',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            height: 1,
            color: Colors.black,
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 168,
                        height: 272,
                        color: Colors.white,
                        child: Column(
                          children: [
                            SizedBox(height: 16),
                            Image.asset(
                              'assets/images/chair1.png',
                              width: 100,
                              height: 100,
                            ),
                            SizedBox(height: 10),
                            const Text(
                              '139,900',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Container(
                        width: 168,
                        height: 272,
                        color: Colors.white,
                        child: Column(
                          children: [
                            SizedBox(height: 16),
                            Image.asset(
                              'assets/images/chair1.png',
                              width: 100,
                              height: 100,
                            ),
                            SizedBox(height: 10),
                            const Text(
                              '139,900',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 168,
                        height: 272,
                        color: Colors.white,
                        child: Column(
                          children: [
                            SizedBox(height: 16),
                            Image.asset(
                              'assets/images/chair1.png',
                              width: 100,
                              height: 100,
                            ),
                            SizedBox(height: 10),
                            const Text(
                              '139,900',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Container(
                        width: 168,
                        height: 272,
                        color: Colors.white,
                        child: Column(
                          children: [
                            SizedBox(height: 16),
                            Image.asset(
                              'assets/images/chair1.png',
                              width: 100,
                              height: 100,
                            ),
                            SizedBox(height: 10),
                            const Text(
                              '139,900',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
