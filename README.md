# ☀️ Feelcast - 감정과 하늘을 기록하는 앱

![Feelcast Logo](android/app/src/main/res/mipmap-xxxhdpi/ic_launcher.png)

> 완성 시 매일의 감정과 하늘을 함께 기록하고 회고할 수 있는 감성 다이어리 앱을 목표로 합니다.

---

## 📦 프로젝트 개요

- **서비스명**: Feelcast
- **목적**: 갓 찍은 하늘 사진과 그 때의 감정을 기록하여, 과거의 감정과 날씨를 돌아볼 수 있도록 도와요.
- **플랫폼**: Android / iOS

---

## 📲 실기기 APK 설치 

#### Firebase App Distribution(only Android)

Firebase 초대 링크 [https://appdistribution.firebase.dev/i/c43592a20db2c267]

## 🧭 에뮬레이터용 소스

#### 프로젝트 클론

Github 링크 [https://github.com/Alice-in-korea/feelcast.git]

---

## 🔧 기술 스택

| 구분             | 사용 기술                    |
| ---------------- | ---------------------------- |
| 언어             | Dart(v3.7.0)                 |
| 프레임워크       | Flutter(v3.29.1)             |
| 상태 관리        | Cubit (flutter_bloc)         |
| 라우팅           | go_router                    |
| API 통신         | Dio                          |
| 로컬 저장소      | Isar, flutter_secure_storage |
| 모델링/직렬화    | Freezed, json_serializable   |
| 백그라운드 작업  | workmanager                  |
| 로깅 및 모니터링 | Firebase Crashlytics         |
| 위치 정보        | geolocator                   |
| 네트워크         | connectivity_plus            |
| 앱 권한 요청     | permission_handler           |

---

## 🧱 프로젝트 구조

```
└── 📁lib
    └── 📁core
        └── 📁config
        └── 📁dio
        └── 📁error
        └── 📁router
    └── 📁model
        └── 📁dto
        └── 📁local_db
    └── 📁presentation
    └── 📁repository
    └── 📁support
        └── 📁common_ui
        └── 📁constant
        └── 📁enum
        └── 📁style
        └── 📁util
    └── main.dart
```

- 레이어 단위로 분리 (Core/Model/Presentation/Repository etc.)
- 클린아키텍쳐 차용

## 💊 성능 최적화 전략

- 불필요한 re-build 방지 위한 최소 위젯 단위 BlocBuilder 사용
- 빌드 시 obfuscation option 적용
- 주기적인 api 호출 등 isolate thread로 분리(workmanager)
- DevTools 사용 - 메모리 사용, rebuild 확인

## 🔑 보고된 이슈 문제 해결
#### 1. 네트워크 연결 끊김
- 네트워크 상태만을 관리하는 cubit의 StreamSubscription을 앱 구동과 동시에 등록하여 실시간으로 네트워크 상태를 모니터링합니다. 이로 인해 네트워크의 연결 상태에 따라 서로 다른 UI, Api 호출을 할 수 있도록 개발하였습니다.
  
#### 2. API 호출 중 UI 멈춤
- api 무한 호출 또는 메모리 누출로 인한 UI/UX 장애를 방지하고자 각각의 api를 상태를 관리하는 cubit을 분리하였습니다. 또한 요청 실패 시 UI 로직 분기 및 최대 3회까지 동일 api 호출하는 방어 로직을 통해 데이터 업데이트 실패 확률은 낮출 수 있도록 하였고, 문제 발생 시 유저로 하여금 새로고침 할 수 있도록 UI를 노출시킵니다.(toast, refresh indicatior 안내 등)
  
#### 3. local DB - remote 동기화 출돌
- api 호출 결과, 유효한 데이터인 경우에만 local DB에 저장합니다. 또한 앱의 상태값으로 가지고 있는 데이터로는 local DB를 업데이트 하지 않습니다. remote > local > state 또는 remote > state 단방향으로만 업데이트됩니다. 또한 local, remote 데이터 모두 동일한 model class로 구조화 하였습니다.

## 🙈 아쉬운 점
- 시간적 한계로 인해 선택과 집중 전략으로 과제에 임했습니다. 
- 과제에 기재되어 있는 이슈가 대부분 클라이언트쪽 비지니스 로직, UX, 성능 최적화와 관련이 있다 판단하여 비지니스 로직 구현에 보다 집중했습니다.
- flutter_screenutil 및 LayoutBuilder등으로 구현하는 반응형 디자인 및 곧 deprecated 예정인 firebase deeplink는 과제에 반영되지 않았습니다.
- 클라이언티쪽 테스트 코드는 항상 마음의 짐과 같습니다. 테스트를 적극적으로 하고 계신 개발팀이라면 기회가 되면 꼭 배워보고 싶습니다.
