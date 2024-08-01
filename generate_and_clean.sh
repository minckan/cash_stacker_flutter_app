#!/bin/bash

# OpenAPI 문서 URL
OPENAPI_URL="http://localhost:8000/swagger.yaml"
# 코드 생성 디렉토리
OUTPUT_DIR="lib/swaggers/generated_code"

# OpenAPI Generator CLI를 사용하여 코드 생성
openapi-generator-cli generate -i $OPENAPI_URL -g dart-dio -o $OUTPUT_DIR

# 필요한 파일만 특정 디렉토리로 이동
TARGET_DIR="lib/swaggers"
mkdir -p $TARGET_DIR/src
cp -r $OUTPUT_DIR/lib/src/* $TARGET_DIR/src/
cp $OUTPUT_DIR/lib/openapi.dart $TARGET_DIR/



# 생성된 전체 디렉토리를 삭제 (필요한 파일만 남기기 위해)
rm -rf $OUTPUT_DIR


echo "Generated code has been cleaned and necessary files moved to $TARGET_DIR"