// lib/main.dart
// 이제 모든 오류가 사라지고 앱 실행이 가능해야 합니다.

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // flutterfire configure로 자동 생성된 파일
import 'pages/memo_list_page.dart'; // 올바른 메모 목록 페이지 임포트

void main() async {
  // 1. Firebase 사용 준비
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Firebase 프로젝트 초기화
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp()); // MyApp은 const가 가능합니다.
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '메모장',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),

      // MemoListPage가 내부적으로 const가 불가능한 위젯을 사용하므로,
      // 여기서 const를 제거해야 충돌이 해결됩니다.
      home: MemoListPage(),
    );
  }
}
