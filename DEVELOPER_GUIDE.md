# 만능앱 개발자 가이드

본 문서는 만능앱 개발을 위한 개발자 문서이며, 개발 멤버들이 보다 쉽게 프로젝트 참여를 하고 성공적인 결과를 만들어내기 위해서 따라야 할 가이드라인을 제사합니다.

# 참고해야 할 문서

- 패키지 만들기
  - [공식문서: Flutter CLI - Developing Dart Packages](https://flutter.dev/docs/development/packages-and-plugins/developing-packages)
  - [공식문서: Creating Packages](https://dart.dev/guides/libraries/create-library-packages)
# 참여 인원 모집

- 프로젝트에 참여하시려는 분은 [한국 플러터 개발자 그룹](https://github.com/flutter/flutter/wiki/Style-guide-for-Flutter-repo) 단톡방에서 참여 신청을 해 주세요.
- 프로젝트에 참여하시는 분은 github 멤버로 들어와서 git repo 에 바로 액세스 할 수 있습니다.
- 문서화 작업을 도와 주실 분을 찾습니다.
  - 다른 개발자가 작성한 코드를 보고, 해당 개발자에게 소스 코드 주석을 요청하고 부족한 부분을 dartdoc 에 맞추어 작업을 하는 것입니다.
  - 특히, Restful Api 관련 코드를 문서화하는 경우 공부에 큰 도움이 되리라 생각합니다.

# 본 프로젝트(스터디) 공부해야 할 순서

- 온라인 세미나 참여
  - 세미나 참여하는 방법: README 참고
- 깃 이슈 및 프로젝트 참고
- 앱 설치 및 실행
- 편집기 설정
- 프로젝트 설정
  - launch.json
  - launch.json 에서 옵션 별로 실행하는 방법
- 개발 문서 및 dartdoc 문서 읽고, dartdoc 으로 문서화 하는 방법 확인
- 깃 브랜치의 소스코드를 보며 아래의 순서대로 공부
  - Git clone 하고 앱을 실행하는 방법
  - .launch.json 에 실행 설정 등록
  - 기본 페이지 이동, 테마, Layout 등
  - matrix - 오픈소스 백엔드 Materix 와 연동
  - 플러터 테스트 - Integration Test
  - Android 와 iOS 에서 firebase 연동.
  - user - 회원 가입 및 관리. 백엔드로 로그인을 하고 동시에 파이어베이스로 로그인.
  - 소셜 로그인 - 파이어베이스를 통한 구글, 페이스북, 애플 로그인. 그리고 카카오톡과 네이버 로그인
  - 패스로그인을 통한 본인(성인 실명) 인증.
  - 게시판 기능 일체. 일반적인 게시판의 모든 기능.
  - 친구 관리. 블럭 사용자 관리. 블럭한 사용자의 글,코멘트,사진,추천,채팅 등을 블럭.
  - 1:1 채팅 기능
- 작업 후, 프로젝트 매니저에게 main 브랜치로 merge 요청
- 자기만의 브랜치에서 맡은 기능 개발
- Mono repo 를 통한 자기만의 앱 개발


# 이슈 및 개발 작업 공간

- [Git Projects 참고](https://github.com/thruthesky/all_in_one/projects/1)

# 과제

- [Git Projects 참고](https://github.com/thruthesky/all_in_one/projects/1)

# 설치

## 만능앱 프로젝트 설치

- 프로젝트를 시작하기 위해서는 만능앱 플러터 소스 코드를 Git repo 에서 클론을 합니다.

  - 예: `% git clone https://github.com/thruthesky/all_in_one`

- git clone 후, 본인의 이름 또는 기능별로 branch 를 생성하여, 작업을 합니다.
  - 예: `% git checkout -b thruthesky`
    - 위에서 `thruthesky` 라는 이름으로 브랜치를 만들었습니다. 그리고 앞으로 이 브랜치에서 작업을 하면 됩니다.
  - 작업을 할 때에 main 브랜치가 불시에 변경될 수 있으니, 수시로, main 브랜치를 자신의 브랜치로 merge 해야 합니다.
  - 작업이 완료되면 본인의 브랜치를 github 로 올립니다.
    이 때, 주의 할 점은 main branch 로는 merge 할 수 없도록 되어져 있으므로 프로젝트 매니저에게 main 으로 merge 해 달라고 요청하셔야 합니다.

- 요약을 하면,
  - git clone 후,
  - 자신만의 branch 만들고,
  - 수정하여 push 를 한 다음,
  - github 의 all_in_one 사이트로 들어가서, pull request 버튼을 눌러, request 하면 됩니다.

## Flutter 코드 개발 편집기

- 통일성 있게 `VSCode` 를 사용합니다.
- dart line length 를 100 으로 해 주세요. 기본 80 인데, 100으로 늘려서 작업을 하겠습니다.
- VSCode Better comment 플러그인을 활용합니다.
  사용하는 태그는 아래와 같습니다.
  - `@attention` (json 설정에서 강조 표시 필요)
  - `@todo`

## 스타일 가이드

- 본 프로젝트는 다트/플러터 코딩 가이드라인을 따릅니다.

  - 참고: [다트 코딩 가이드](https://dart.dev/guides/language/effective-dart/style)
  - 참고: [플러터 코딩 가이드](https://github.com/flutter/flutter/wiki/Style-guide-for-Flutter-repo)
  - 이 두 문서는 다트와 플러터를 개발한 팀에서 개발자들을 위해서 마련한 표준 코딩 가이드라인이라고 보시면 됩니다. 우리는 팀멤버간에 말로 소통을 하지 않고, 서로가 작성한 소스 코드를 공유해서 교감하고 소통합니다. 그래서 각 개발자의 개성이나 취향대로 코딩를 작성해 버리면, 다른 개발자가 그 코드를 읽기 매우 어려워 집니다. 그래서 개인의 코딩 스타일을 버리고 표준을 따라야합니다.
    이것은 필수 사항이 아니며, 서로가 매일 조금씩 노력해 가면 됩니다.

- Null safety 에 많은 혼동과 올바르지 않은 사용이 예상됩니다.

  - Null safety 의 목적은 null 을 안전하게 관리하자는 것입니다.
  - 그런데 만약 변수 선언에서 `String? name` 와 같이 해 버리면, name 변수가 null 일 수 있다고 표시하는 것인데, 이렇게 하면 null safety 를 쓰는 효과가 전혀 없는 것입니다. 다시 말하면, null safety 를 사용하지도 않으면서, 억지로 null safety 적용해서 코드만 읽기 어렵게 만드는 역효과가 발생합니다.
  - 그래서 null 값이 지정될 수 있다고 표시를 하는 `물음표(?)`는 정말 어쩔 수 없는 경우에만 써야합니다.

- 코드는 짧고 간단하게
  - 코드가 길어지면, 대부분의 경우 잘못된 코드이며, 버그가 많습니다.
  - 코드가 짧아지면 짧아질수록 좋은 코드이며 버그가 적습니다.
  - 짧고 간결하게, 그리고 원하는 것을 충분히 표현하도록하는 연습을 해야 합니다.

### 개발 방향

- 플러터의 정체성(기본)을 헤치지 않는 범위에서 3rd party 라이브러리 또는 패키지를 사용한다.
  - 예를 들어, 디자인 시스템을 사용하는데 기존의 플러터 코딩 또는 Material Design 방식의 코딩과 매우 동떨어진다면, 사용하기 어렵다.
    - Velocity X 나 Flutter Hooks 가 그러한 예이다. 비록 좋은 기능들이긴 하지만, 기존의 플러터 코딩 방식과 차이가 있어 채택하지 않는다.

### Mono repo

- 본 페이지의 mono repo 항목을 참고해 주세요.


## 문서화

- `$ dartdoc`
  - 만약, 문서화에 에러가 있으면, 플러터 폴더에 들어 있는 `dartdoc` 명령을 실행한다.
  - 예) `$HOME/bin/flutter/bin/cache/dart-sdk/bin/dartdoc --exclude 'dart:async,dart:collection,dart:convert,dart:core,dart:developer,dart:ffi,dart:html,dart:io,dart:isolate,dart:js,dart:js_util,dart:math,dart:typed_data,dart:ui'`
- `$ npm i -g http-server`
- `$ http-server doc/api`

- 본인이 작업 한 것은 반드시, 문서로 잘 남기셔야 합니다. 이것은 매우 중요합니다.
  - 문서화는 dartdoc 를 따릅니다.
    - 참고: [Dart 문서화 툴](https://pub.dev/packages/dartdoc)
    - 참고: [Dart 문서화를 잘하는 방법](https://dart.dev/guides/language/effective-dart/documentation)

## 백엔드 설치

- 백엔드는 Matrix 를 사용합니다. Matrix 는 도커 기반에 Nginx + PHP + MariaDB 로 작성된 오픈 소스입니다.
- 백엔드 설치는 Matrix 문서를 사용하면 되며,
- 직접 개발 컴퓨터에 설치해서 테스트를 해도 되고,
- 본 프로젝트를 위해서 미리 준비한 실제 서버를 사용해도 됩니다.
- Materix 에 값을 저장하고 가져오는 것, 회원, 게시판 등의 정보를 활용하는 것에 있어서 다양한 방법이 있으니, 꼭 백엔드 문서를 참고해 주세요.

# 테스트

- 테스트는 공식 문서의 Integration Test 를 진행합니다.
- 본인이 작업을 한 부분에 대해서 Integration Test 를 하면 좋습니다. 필수 사항은 아니지만, 권장합니다.

# 폴더 및 파일

- 당연히, 모든 경우에서, [다트 스타일 가이드](https://dart.dev/guides/language/effective-dart)와 [플러터 스타일 가이드](https://github.com/flutter/flutter/wiki/Style-guide-for-Flutter-repo)가 우선합니다.
- 위젯 또는 클래스 이름은 가능한 파일명과 일치하는 것이 좋습니다. 단, 예외가 있을 수는 있습니다.
- `lib/screens` 폴더에 각 기능별로 서브 폴더를 만들어 작업을 합니다.
  - 예) 회원 관련 기능은 `lib/screens/user` 폴더 아래에 모두 들어갑니다.
  - 개발 멤버가 본인이 맡은 기능을 작업하기 위해서 `lib/screens` 아래에 폴더를 만들면 됩니다.
- 각 스크린(페이지)는 `lib/screens/**/*.screen.dart` 와 같이 기록해야 하며,
  - 스크린 위젯의 이름은 파일명과 일치해야 합니다.
    - 예) 파일명이 `abc.def.screen.dart` 이면 위젯 이름은 `AbcDefScreen` 이어야 합니다.
- 위젯은 반드시 `**/widgets` 라는 폴더 아래에 기록되어야 합니다.
  - 예) `lib/screens/user/widgets/name_label.dart`
- 공유 위젯은 `lib/widgets/**/*.dart` 형태로 저장되며, 여러곳에서 활용 할 수 있는 범용성이 위젯만 이곳에 저장됩니다.
- `lib/controllers` 에는 각종 Getx 컨트롤러가 저장됩니다. 본 문서의 상태 관리를 참고하세요.
- 각종 임시 파일은 `lib/tmp/**/*` 에 저장하면 됩니다.
  - 예) `lib/tmp/json/user.json`

- `/packages` 에는 프로젝트 별로 공유 가능한 디자인 UI, 비지니스 로직, 또는 여러가지 리소스가 들어가 있습니다.
  - `/packages/subtrees` 에는 다른 git repo 가 subtree 로 추가되어져 있습니다.

- `/projects` 에는 개별 플러터 앱(프로젝트)를 생성하고 개발하는 곳입니다.
  각 프로젝트에서는 `/packages` 에 있는 리소스를 가져다 개발을 하면 되며, 최 상위 프로젝트의 여러가지 기능을 보고 마음에 드는 것만 골라서 쓰면 됩니다.

- 스크린(페이지) 만드는 방법은 "코드 설명: 스크린 생성" 항목을 참고해주세요.

# 실행 및 개발 설정

- launch.json 에 실행 설정을 해야 한다면, 가능한 다음의 포멧을 따르세요.
  - `name` 에는 "개발자이름(또는 앱 이름) - 장치 타입 및 버전 - 개발컴퓨터(또는 위치) - 서버"
  - `CONFIG` 는 앱의 설정을 하는 것입니다.
  - `OPTIONS` 에는 앱을 실행 할 때, 어떤 옵션으로 실행 할지 지정하는 것입니다.

```json
{
    "name": "JaeHo - Simulator 12 Pro Max - Macbook 16 - Remote",
    "program": "lib/main.dart",
    "args": [
        "--dart-define",
        "CONFIG=remote",
        "--dart-define",
        "OPTIONS=firebase=off&in_app_purchase=off"
    ],
    "request": "launch",
    "type": "dart",
    "deviceId": "00008030-000904C80290802E"
},
```

# 상태 관리

- Getx 로 합니다.
- `lib/controllers` 폴더에 전역적인 컨트롤러를 저장합니다.
- `lib/controllers/app.controller.dart` 가 앱의 전반적인 상태 관리를 합니다.
  - 예를 들어 회원 로그인/로그아웃에 따른 상태 관리는 앱의 전반적인 영역에 걸쳐서 사용됩니다.
  - 또는 게시판 기능을 만들 때, 앱이 부팅 될 때, 게시판 카테고리를 서버로 부터 읽어 들이고, 또한 게시판이 쇼핑몰이나 기타 기능을 커스터마이징 되어 앱의 전역에서 사용된다면 이 엮시 `app.controller.dart` 에서 상태 관리를 해야 합니다.
  - 또 다른 예로, 채팅방 기능이 있는 경우, 새로운 채팅 메세지가 있으면 뱃지로 표시하거나 기타 여러 곳에 새로운 메시지가 도착했음을 표시해야 한다면 `app.controller.dart`에서 상태 관리가 되어야 합니다. 
  이와 같이 앱의 전체 영역에서 사용되는 경우, `app.controller.dart` 를 사용합니다.
- 하나의 스크린(또는 위젯)내에서 상태 관리가 필요하면 그냥 StatefulWidget 을 사용합니다.
- 지역적인 상태 관리가 필요하다면, `lib/screens/**/controllers/*.controller.dart` 와 같이 컨트롤러를 만들면 됩니다.
  - 예를 들어, 메모장 기능에만 필요한 컨트롤러가 있다면, `lib/screens/memo/controllers/memo.controller.dart` 와 같이 컨트롤러 파일을 만들면 됩니다.
    - 그런데 메모장 기능의 상태가 앱의 전반적인 영역에 걸쳐서 적용되면, `app.controller.dart` 에 상태 관리가 되어야 할 것입니다.




# 모델

- `lib/models/**/*.model.dart` 와 같이 모델을 저장합니다.
- 지역적인 모델은 `lib/screens/**/models/*.model.dart` 와 같이 저장합니다.
- 모델 작성 형식은 [표준 문서: Serializing JSON inside model classes](https://flutter.dev/docs/development/data-and-backend/json#serializing-json-inside-model-classes)를 따릅니다.
- JSON 으로 부터 Model 을 작성하기 위해서는 `JSON TO DART` VSCODE 플러그인 를 사용하길 권장합니다.
  다만, 생성된 Model 에 적용된 Null safety 가 원하는 대로 되지 않은 경우, 보정을 해 주어야 합니다.
  - `> JSON TO DART: Convert from Clipboard`
  - `> Support for advance equality check? No`
  - `> Immutable class? No`
  - `> Equality operator? No`
  - `> toString()? Yes`
  - `> Copy with? No`
  - `> Null safety? Yes`

# 백엔드

- pub.dev 에 [x_flutter 패키지](https://pub.dev/packages/x_flutter)가 있습니다. 그 패키지를 사용하여 백엔드와 통신을 합니다.
- Matrix 가 설치되어져 있는 서버 도메인: flutterkorea.com
- 접속 설정은 service/config.dart 에 이미 되어져 있어 그대로 사용하면 됩니다.
- 백엔드 관리자 사용법
  - 게시판 생성 및 게시판 메뉴를 앱에서 보여주는 방법
  - 백엔드 관리자가 푸시를 하는 방법
    - 아이콘 설정
    - 소리 설정

## x_flutter 패키지 개발 방법

- x_flutter 를 직접 코딩하지 않는다면, 일반적인 사용은 pub.dev 의 최신 버전을 사용하면 된다.

- 만약, x_flutter 를 직접 개발(코딩) 할 것이라면,
  - `% git submodule update --init` 으로 추가하면 된다.
    - 참고로, 아래와 같이 서브 모듈로 추가되어져 있으므로, 다시 `submodule add` 는 할 필요 없다.
      - `% git submodule add https://github.com/withcenter/x_flutter packages/x_flutter`

  - 그리고 `pubspec.yaml` 에서 경로 수정해서 개발하면 된다. 개발 완료 후, pub.dev 에 publish 하고,
    pubspec.yaml 의 x_flutter 를 pub.dev 의 최신 버전으로 변경하면된다.
  - 주의 할 점은, pub.dev 의 패키지를 사용하는 경우, x_flutter 를 수정하면, github 에 적용이 안된다.

# 파이어베이스

- 파이어베이스는 본 프로젝트에 이미 설정되어져 있으며, 직접 본인의 파이어베이스 프로젝트에 연결하여도 됩니다.

# 깃 브랜치

## base

프로젝트 처음 시작시 매우 기본적인 구조가 들어가 있습니다.

# 코드 설명

## 실행 및 설정

-

## Layout

- 일반적으로 각 스크린(페이지)은 Scaffold 를 바탕으로 appbar, body 등을 구성하는데, 각 스크린 별로 통일된 디자인을 하기가 쉽지 않은데, Layout 이라는 위젯들 만들어, 그 안에 Scaffold 를 두고 통일된 appbar, body 등의 디자인을 적용하는 것입니다.
  이렇게하면 모든 스크린에서 동일한 Scaffold 를 가지게 되어 일관성 있게 디장니을 유지할 수 있으며, Layout 을 수정하면 전체 스크린의 디자인이 모두 같이 변경되는 것입니다.
  특히 메뉴, 퀵메뉴 등 여러가지 부가적인 기능을 Layout 에 추가 할 수 있습니다.

- Layout 위젯은 각 프로젝트의 공유 widgets 폴더에 넣으면 됩니다.
  그리고 이 위젯 안에서 packages/widgets/layout 에 있는 여러가지 위젯 중 하나를 선택해서 사용하면 됩니다.

## 스크린 생성

스크린(페이지)를 생성하는 방법에 대해서 설명을 합니다.


- screens 폴더안에 스크린 폴더를 만들고, **.screen.dart 와 같이 dart 파일을 만듭니다.
  - 예를 들어, 스크린의 이름이 memo 라면, 아래와 같이 만들면 됩니다.
    - 예: `screens/memo/memo.screen.dart`

- 그리고, services/route_name.dart 에 memo 라는 변수를 만듭니다.

```dart
class RouteNames {
  static final String memo = 'memo'; // <== 여기에 추가
}
```

- 그리고, main.ts 에서 getPages: 속성에 memo screen 을 추가합니다.

```dart
class AioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // ...
      getPages: [
        // ...
        GetPage(name: RouteNames.memo, page: () => MemoScreen()), // <== 여기에 추가
      ],
    );
  }
}
```

- 그리고, memo screen 으로 이동 할 수 있도록 메뉴(또는 특정 위치)에 버튼을 달고 클릭이 되면 `service.open(RouteNames.memo);` 를 실행해서 해당 페이지로 이동합니다.
- 
```dart
ElevatedButton(
  onPressed: () => service.open(RouteNames.memo), // 클릭하면, memo 스크린으로 이동
  child: Text('메모장'),
)
```

## 사용자 정보 표시

- 회원 가입, 로그인, 로그아웃, 회원 정보 수정 등에서 회원 정보가 변할 때 적절히 표시 할 수 있어야 합니다. [x_flutter 프로젝트 문서](https://github.com/withcenter/x_flutter)를 참고 해 주세요.

## 사진 업로드

- 특정 위치에 원하는 사진을 표시하고 싶을 때, `UploadImage` 위젯을 통해서 이미지를 업로드 할 수 있습니다. [x_flutter 프로젝트 문서](https://github.com/withcenter/x_flutter)를 참고 해 주세요.



# Mono repo

- Mono repo 란, 하나의 Git repo 에 여러개의 프로젝트가 관리되고 개발되는 것을 말합니다.

- 만능앱은 굉장히 많은 기능들을 포함하고, 또 여러가지 형태로 파생되어 서브 프로젝트 개발 및 앱 스토어에 배포가 이루어 질 것입니다.
  - 이와 같은 경우, 어떻게 하면 효율적으로 만능앱에서 필요한 기능만 쏙 빼서 나만의 앱을 만들 수 있을까요?
  - 만능앱에서 서브 프로젝트를 생성 할 때 마다, 새로운 플러터 프로젝트를 만들고 원하는 기능의 소스 코드만 가져와서 개발할까요? 그런데 원본 소스가 계속 업데이트가 된다면요?
  - 만능앱의 주요 요소를 패키지화하거나 서브 git repo 로 만들어 submodule 로 사용하면 조금 낫겠지만, 번거롭습니다.
  - 플러터의 Flavor 도 만이 번거롭습니다.
  - 이 문제의 핵심은 바로 코드 공유입니다.

- Flavor 도 쓰지 않고, git submodule 방식으로 하지 않고, pub.dev 에 패키지를 올리지 않고, 더 간단하게 코드 공유를 할 수 있 방법?
  - 그래서 Mono repo 를 선택 했습니다.

- 흩어져 있는 repo 들은 `git subtree` 기능으로 모았으며, `/packages` 폴더에 재 사용가능한 코드를 모아 놓았습니다.
  - 참고로 `git subtree` 는
    - `$ git subtree --prefix=packages/subtrees/x_flutter x_flutter main` 으로 지정되어져 있습니다.

- `/projects` 폴더에 서브 프로젝트를 생성하면 됩니다.

## 각자의 프로젝트 생성

- 먼저 아래와 같이 여러분들의 프로젝트를 생성합니다.
  - `$ cd projects`
  - `$ flutter create project-name`

- 프로젝트 생성 후, pubspec.yaml 설정을 통해서 x_flutter 를 비롯한 필요한 패키지를 추가합니다.
  예를 들면 아래와 같습니다.
  여러분들이 개발할 앱의 요구 사항에 맞게 수정하여 사용하시면 됩니다.

예제) pubspec.yaml
```yaml
name: youngja
description: A new Flutter project.
publish_to: 'none'
version: 1.0.0+1

environment:
  sdk: ">=2.12.0 <3.0.0"

dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2
  get: ^4.1.4
  get_storage: ^2.0.2
  x_flutter: 0.0.7
  user:
    path: ../../packages/user

dev_dependencies:
  flutter_test:
    sdk: flutter
flutter:
  uses-material-design: true
```

## 각자의 프로젝트 설정

- 루트 프로젝트의 `lib/main.dart` 에 있는 코드를 복사를 해서 쓰거나 비슷하게 쓰면 됩니다.




# 문제점, 버그

- KNOWN_PROBLEMS.md 문서 참고

