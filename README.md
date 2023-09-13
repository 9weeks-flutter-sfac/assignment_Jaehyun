> 본 레포지토리는 과제 제출의 예시입니다.
자세한 내용은 담당 멘토에게 확인하세요.

### 과제 레포지토리 예시

```
./example-assignment                            // 폴더명 레포지토리 명과 동일 (assignment-team1-teddy)
├── README.md                                   // 본인 팀번호와 이름 표기한 파일
├── day1                                        // 과제 요일 폴더
│   └── assignment1                             // 1번째 과제 (안에 플러터 혹은 다트 프로젝트 생성)
│       ├── README.md
│       ├── analysis_options.yaml
│       ├── assignment1.iml
│       ├── lib
│       │   └── main.dart                       // (실제 코드를 주로 작성해야 하는 파일)
│       ├── pubspec.lock
│       └── pubspec.yaml
└── (...)                                       // N일차 과제
```

#### 레포지토리 관리방법
- 일차별로 플러터 프로젝트를 초기화 할 것
    - 예시1, 플러터 프로젝트 생성 명령어 : `flutter create dayN/assignment1`
    - 예시2, 다트 프로젝트 생성 명령어 : `dart create dayN/assignment2`
- 과제안에 프로젝트를 여러개 생성해야하는 경우
    예시)
    ```
    ├── dayN                                    // N일차 과제가 두 개인 경우!
    │   ├── assignment1                         // 플러터 프로젝트 (1번과제)
    │   │   ├── README.md
    │   │   ├── analysis_options.yaml
    │   │   ├── assignment1.iml
    │   │   ├── lib
    │   │   │   └── main.dart
    │   │   ├── pubspec.lock
    │   │   └── pubspec.yaml
    │   └── assignment2                         // 다트 프로젝트 (2번과제)
    │       ├── CHANGELOG.md
    │       ├── README.md
    │       ├── analysis_options.yaml
    │       ├── bin
    │       │   └── assignment2.dart
    │       ├── lib
    │       │   └── assignment2.dart
    │       ├── pubspec.lock
    │       └── pubspec.yaml
    ```
