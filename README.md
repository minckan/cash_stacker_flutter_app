# Cash Stacker Flutter 앱

Cash Stacker는 사용자가 자신의 재정을 효율적으로 관리하고 쌓을 수 있도록 도와주는 Flutter 기반 모바일 애플리케이션입니다. 이 문서에서는 앱의 개요, 사용된 라이브러리, 그리고 구현된 핵심 로직에 대해 설명합니다.

## 기능

- **지출 추적:** 사용자가 지출을 기록하고 카테고리별로 분류할 수 있습니다.
- **예산 관리:** 예산을 설정하고 지출을 추적할 수 있습니다.
- **재무 통찰:** 지출 패턴과 트렌드를 시각화하여 제공합니다.

## 시작하기

### 필수 조건

- Flutter SDK
- Dart SDK

### 설치 방법

1. 리포지토리 클론:
   ```bash
   git clone https://github.com/minckan/cash_stacker_flutter_app.git
   ```
2. 프로젝트 디렉토리로 이동:
   ```bash
   cd cash_stacker_flutter_app
   ```
3. 의존성 설치:
   ```bash
   flutter pub get
   ```

## 사용된 주요 라이브러리

- **provider:** 상태 관리를 위해 사용됩니다.
- **shared_preferences:** 로컬 저장소에 데이터를 저장하기 위해 사용됩니다.
- **charts_flutter:** 재무 데이터를 시각화하기 위해 사용됩니다.

## 주요 로직

### 상태 관리

`provider` 패키지를 사용하여 앱 전체에서 상태 관리를 수행합니다. 예산, 지출 등의 데이터는 모두 `ChangeNotifier`를 상속한 클래스에서 관리되며, 이를 통해 UI와 데이터 간의 상호작용을 간편하게 처리합니다.

### 데이터 저장

`shared_preferences`를 이용해 사용자의 설정 및 지출 내역을 로컬에 저장합니다. 이를 통해 사용자가 앱을 종료하고 다시 시작하더라도 데이터가 유지됩니다.

### 데이터 시각화

`charts_flutter` 라이브러리를 사용해 사용자의 지출 데이터를 그래프로 시각화합니다. 막대 그래프, 원형 차트 등을 사용해 직관적인 재무 통찰을 제공합니다.


## 라이선스

이 프로젝트는 MIT 라이선스 하에 배포됩니다. 자세한 내용은 `LICENSE` 파일을 참조하세요.
