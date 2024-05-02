import 'package:flutter/material.dart';
import 'dart:async';
import 'loginpage.dart';

void main()=>runApp(const MyApp());

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override

  Widget build(BuildContext context){
    return const MaterialApp(
      title: '나만의 의자',
      home: TitlePage(),
    );
  }
}

class TitlePage extends StatelessWidget{
  const TitlePage({super.key});
  @override
  Widget build(BuildContext context){

    // 3초 후에 자동으로 다음 페이지로 이동
    Timer(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });

    return Scaffold(
      backgroundColor: const Color(0xFFE9A05C),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('나',
                    style: TextStyle(
                      fontSize: 34, color: Colors.white,fontWeight: FontWeight.bold),),
                  Text('에게',
                    style: TextStyle(
                        fontSize: 34, color: Colors.white,),),
                ],
              ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('꼭 맞는 ',
                  style: TextStyle(
                      fontSize: 34, color: Colors.white,),),
                Text('의자',
                  style: TextStyle(
                    fontSize: 34, color: Colors.white,fontWeight: FontWeight.bold),),
              ],
            ),
            const SizedBox(height: 32), // 텍스트와 이미지 사이의 간격 조절
            Image.asset('assets/images/mainicon.png'),
          ],
        ),
      ),
    );
  }
}
