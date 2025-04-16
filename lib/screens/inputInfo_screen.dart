import 'package:flutter/material.dart';
import 'package:create_book/widgets/rectangle_container.dart';
import 'package:create_book/widgets/circle_container.dart';
import 'package:create_book/widgets/custom_progress_bar.dart';
import 'package:create_book/widgets/basic_ig_button.dart';

class InputInfoScreen extends StatefulWidget {
  const InputInfoScreen({super.key});

  @override
  _InputInfoScreenState createState() => _InputInfoScreenState();
}

class _InputInfoScreenState extends State<InputInfoScreen> {
  String selectedGender = '';
  String selectedAgeGroup = '';
  bool isStep1Completed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEFFED),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            // step1
            if (!isStep1Completed) ...[
              Text(
                '독자의 성별과 연령대를 알려주세요!',
                style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [Text('성별', style: TextStyle(fontSize: 18))],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildGenderOption('남아', 'assets/images/kid_boy.png'),
                  SizedBox(width: 20),
                  _buildGenderOption('여아', 'assets/images/kid_girl.png'),
                ],
              ),
              SizedBox(height: 20),

              // 연령대 선택
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [Text('연령대', style: TextStyle(fontSize: 18))],
              ),
              SizedBox(height: 10),
              Wrap(
                spacing: 20.0,
                runSpacing: 12.0,
                children: [
                  _buildAgeButton('1세 이하'),
                  _buildAgeButton('1~2세'),
                  _buildAgeButton('3~4세'),
                  _buildAgeButton('5~6세'),
                  _buildAgeButton('7~8세'),
                  _buildAgeButton('9~10세'),
                ],
              ),
              SizedBox(height: 30),

              // 완료 버튼
              ElevatedButton(
                onPressed:
                    selectedGender.isNotEmpty && selectedAgeGroup.isNotEmpty
                        ? () {
                          setState(() {
                            isStep1Completed = true;
                          });
                        }
                        : null, // 성별과 연령대가 선택되었을 때만 버튼 활성화
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.orange, // backgroundColor -> primary로 변경
                ),
                child: Text("다음"),
              ),
            ],

            // 두 번째 화면 (교훈 선택)
            if (isStep1Completed) ...[
              // 교훈 선택 UI 구현
              Text(
                '생성할 동화의 교훈을 선택해 주세요!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Wrap(
                spacing: 10.0,
                children: [
                  _buildLessonButton('우정의 소중함'),
                  _buildLessonButton('용기와 자신감'),
                  _buildLessonButton('용서와 이해'),
                  _buildLessonButton('인내와 겸손'),
                  _buildLessonButton('열린 마음과 배려'),
                  _buildLessonButton('창의성과 상상력'),
                  _buildLessonButton('책임감과 신뢰'),
                  _buildLessonButton('성실한 노력의 가치'),
                  _buildLessonButton('공평함과 정의'),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildGenderOption(String label, String imagePath) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGender = label;
        });
      },
      child: Column(
        children: [
          CircleContainer(imagePath: imagePath), // CircleContainer 안에 이미지 표시
          SizedBox(height: 5),
          Text(label, style: TextStyle(fontSize: 18, color: Colors.black)),
        ],
      ),
    );
  }

  Widget _buildAgeButton(String label) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedAgeGroup = label;
        });
      },
      child: RectangleContainer(label: label),
    );
  }

  Widget _buildLessonButton(String label) {
    return ElevatedButton(
      onPressed: () {
        // 교훈 선택 처리
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        side: BorderSide(color: Colors.orange),
      ),
      child: Text(label),
    );
  }
}
