import 'package:flutter/material.dart';

class RectangleContainer extends StatelessWidget {
  final String label; // label 매개변수 정의

  // 생성자에서 label 값을 받도록 수정
  const RectangleContainer({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140, // 기본 140px, 위젯 사용 시 조정 가능
      height: 50, // 고정값
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10), // 둥근 모서리
        border: Border.all(
          color: Color(0xFFEBC755),
          width: 2,
        ), // 스트로크 색상 EBC755
      ),
      child: Center(
        child: Text(
          label, // label을 Text로 표시
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
      ),
    );
  }
}
