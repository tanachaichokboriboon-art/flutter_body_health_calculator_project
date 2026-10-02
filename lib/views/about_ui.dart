import 'package:flutter/material.dart';

class AboutUi extends StatelessWidget {
  const AboutUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // ชั้นที่ 1 ชื่อแอปและรูปตรงกลาง
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Body Health Calculator',
                  style: TextStyle(
                    color: Colors.deepOrange[700],
                    fontSize: MediaQuery.of(context).size.height * 0.023,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Image.asset(
                  'assets/images/calculate.png',
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.height * 0.15,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  'คำนวณหาค่าดัชนีมวลกาย (BMI)',
                  style: TextStyle(
                    color: Colors.deepOrange[700],
                    fontSize: MediaQuery.of(context).size.height * 0.019,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'คำนวณแคลอรี่ที่ร่างกายต้องการ (BMR)',
                  style: TextStyle(
                    color: Colors.deepOrange[700],
                    fontSize: MediaQuery.of(context).size.height * 0.019,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // ชั้นที่ 2 โลโก้ม.และขอความด้านล่าง
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  'assets/images/saulogo.png',
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.height * 0.08,
                  fit: BoxFit.cover,
                ),
                Text(
                  '© 2026 SAU. All rights reserved.',
                ),
                Text(
                  'Created by Software Devleopment Team',
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
