import 'package:flutter/material.dart';
import 'package:flutter_body_health_calculator_project/views/about_ui.dart';
import 'package:flutter_body_health_calculator_project/views/bmi_ui.dart';
import 'package:flutter_body_health_calculator_project/views/bmr_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeUi extends StatefulWidget {
  const HomeUi({super.key});

  @override
  State<HomeUi> createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
  //สร้างตัวแปรเก็บหมายเลข Index
  int selectedIndex = 1;

  //สร้างตัวแปรประเภท List เก็บหน้าจอ BmiUi, AboutUi, BmrUi
  //List เหมือน Array
  List subViewShow = [
    BmiUi(),
    AboutUi(),
    BmrUi(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //ส่วนของ AppBar----------------------------------------------
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[700],
        title: Text(
          'Body Health Calculator',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      // ส่วนของ BottomNavigationBar--------------------------------
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value){
          //******* โค้ดใดที่มีผลต่อการแสดงผล เขียนอยู่ภายใต้ setState( )
          setState(() {
            selectedIndex = value;
          });
        },
        currentIndex: selectedIndex,
        selectedItemColor: Colors.deepOrange[700],
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'BMI',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.heartCircleCheck,
            ),
            label: 'BMR',
          ),
        ],
      ),
      //ส่วนของ Body------------------------------------------------
      body: subViewShow[selectedIndex],
    );
  }
}
