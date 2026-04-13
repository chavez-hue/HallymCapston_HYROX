# RRP - Running Route Puzzle

## 프로젝트 개요
GPS 경로로 도형을 완성하는 게임형 러닝 앱. Flutter 멀티플랫폼 (Android + iOS).
팀명: 하이록스 | 한림대학교 SW캡스톤디자인 2026

## 스택
- Frontend: Flutter (Android + iOS)
- State management: flutter_bloc
- DI: get_it + injectable
- Navigation: go_router
- Backend: Firebase (Auth, Firestore)
- GPS: geolocator
- 지도: google_maps_flutter

## 아키텍처
Clean Architecture + Feature-first 구조
- lib/core/ : DI, router, theme, utils
- lib/features/{feature}/data|domain|presentation/
- domain layer에 Flutter/외부 패키지 import 금지 (순수 Dart만)
- Repository는 반드시 domain에 interface, data에 구현체

## 주요 명령어
- 실행: flutter run
- 테스트: flutter test
- 코드 생성: dart run build_runner build --delete-conflicting-outputs
- 패키지: flutter pub get

## Features
- running: GPS 측정, 경로 기록, 거리/페이스 계산
- shape: 도형 유사도 분석 알고리즘 (DTW/Fréchet Distance)
- feed: SNS형 피드, 경로 공유
- ranking: 랭킹 및 보상 시스템
- auth: Firebase 인증
- profile: 사용자 프로필

## 현재 진행 단계
1. [완료] 프로젝트 초기 세팅
2. [완료] 폴더 구조 + 패키지 세팅
3. [진행중] 각 파일 기본 뼈대 코드 작성
4. [예정] GPS + 지도 연동
5. [예정] 도형 유사도 알고리즘
6. [예정] SNS 피드, 랭킹