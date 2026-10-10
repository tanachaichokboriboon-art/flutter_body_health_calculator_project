// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class BmiUi extends StatefulWidget {
  const BmiUi({super.key});

  @override
  State<BmiUi> createState() => _BmiUiState();
}

class _BmiUiState extends State<BmiUi> {
  // ตัวควบคุม TextField
  TextEditingController weightCtrl = TextEditingController();
  TextEditingController heightCtrl = TextEditingController();

  // ตัวแปร สำหรับแสดงค่า BMI และการแปรผล
  String bmiValue = '0.00';
  String bmiResult = 'การแปรผล';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 50,
            bottom: 50,
            left: 45,
            right: 45,
          ),
          child: Column(
            children: [
              Text(
                'คำนวณหาค่าดัชนีมวลกาย (BMI)',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.03,
              ),
              Image.asset(
                'assets/images/bmi.png',
                width: MediaQuery.of(context).size.width * 0.4,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.03,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'น้ำหนัก (kg.)',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.01,
              ),
              TextField(
                controller: weightCtrl,
                decoration: InputDecoration(
                  hintText: 'กรอกน้ำหนักของคุณ',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.03,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'ส่วนสูง (cm.)',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.01,
              ),
              TextField(
                controller: heightCtrl,
                decoration: InputDecoration(
                  hintText: 'กรอกส่วนสูงของคุณ',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.035,
              ),
              ElevatedButton(
                onPressed: () {
                  if (weightCtrl.text.isEmpty || heightCtrl.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'กรุณากรอกข้อมูลให้ครบถ้วน'
                        ),
                        backgroundColor: Colors.red,
                        duration: Duration(seconds: 2),
                      ),
                    );

                    return; //อย่าลืม return
                  }

                  //คำนวณ BmI และแสดงผล
                  double weight = double.parse(weightCtrl.text);
                  double height = double.parse(heightCtrl.text);
                  double bmi = weight / ((height/100) * (height/100));

                  setState(() {
                    //แสดงผล BMI
                    bmiValue = bmi.toStringAsFixed(2);

                    //แสดงผลการแปรผล
                    if(bmi < 18.5){
                      bmiResult = 'น้ำหนักต่ำกว่าเกณฑ์';
                    }else if(bmi <= 22.9){
                      bmiResult = 'น้ำหนักสมส่วน';
                    }else if(bmi <= 24.9){
                      bmiResult = 'น้ำหนักเกิน';
                    }else if(bmi <= 29.9){
                      bmiResult = 'โรคอ้วนระดับ 1';
                    }else {
                      bmiResult = 'โรคอ้วนระดับ 2';
                    }
                  });
                },
                child: Text(
                  'คำนวณ BMI',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(
                    MediaQuery.of(context).size.width,
                    65,
                  ),
                  backgroundColor: Colors.deepOrange,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.035,
              ),
              ElevatedButton(
                onPressed: () {
                  //ล้างข้อมูล
                  setState(() {
                    weightCtrl.text = '';
                    heightCtrl.text = '';
                    bmiValue = '0.00';
                    bmiResult = 'การแปรผล';
                  });
                },
                child: Text(
                  'ล้างข้อมูล',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(
                    MediaQuery.of(context).size.width,
                    65,
                  ),
                  backgroundColor: Colors.grey,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.035,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 221, 250, 222)),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.055,
                    ),
                    Text(
                      'BMI',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.045,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      bmiValue,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.085,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      bmiResult,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.045,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.055,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
