
# ExternalPrject 관련 명령어 셋 추가
include(ExternalProject)
# Dependency 관련 변수설정
set(DEP_INSTALL_DIR ${PROJECT_BINARY_DIR}/install)
set(DEP_INCLUDE_DIR ${DEP_INSTALL_DIR}/include)
set(DEP_LIB_DIR ${DEP_INSTALL_DIR}/lib)

#spdlog: fast logger library
ExternalProject_Add(
    dep-spdlog 
    GIT_REPOSITORY "https://github.com/gabime/spdlog.git"
    GIT_TAG "v1.x" # 브랜치 or 태그 설정
    GIT_SHALLOW 1 #가장 최신 커밋만 다운로드
    UPDATE_COMMAND ""
    PATCH_COMMAND ""
    CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${DEP_INSTALL_DIR}
    TEST_COMMAND ""
    )
# Dependency 리스트 및 라이브러리 파일 리스트 추가
set(DEP_LIST ${DEP_LIST} dep-spdlog)
set(DEP_LIBS $(DEP_LIBS) spdlog$<$<CONFIG:Debug>:d>)

#glfw
ExternalProject_Add(
    dep-glfw
    GIT_REPOSITORY "https://github.com/glfw/glfw.git"
    GIT_TAG "3.4" # 브랜치 or 태그 설정
    GIT_SHALLOW 1 #가장 최신 커밋만 다운로드
    UPDATE_COMMAND "" PATCH_COMMAND "" TEST_COMMAND ""
    CMAKE_ARGS 
        -DCMAKE_INSTALL_PREFIX=${DEP_INSTALL_DIR}
        -DGLFW_BUILD_EXAMPLEWS=OFF
        -DGLFW_BUILD_TESTS=OFF
        _DGLFW_BUILD_DOCS=OFF
    )

set(DEP_LIST ${DEP_LIST} dep-glfw)
set(DEP_LIBS $(DEP_LIBS) glfw3)

# glad
ExternalProject_Add(
    dep_glad
    GIT_REPOSITORY "https://github.com/Dav1dde/glad"
    GIT_TAG "v0.1.36"
    GIT_SHALLOW 1
    UPDATE_COMMAND ""
    PATCH_COMMAND ""
    CMAKE_ARGS
        -DCMAKE_INSTALL_PREFIX=${DEP_INSTALL_DIR}
        -DGLAD_INSTALL=ON
    TEST_COMMAND ""
    )
set(DEP_LIST ${DEP_LIST} dep_glad)
set(DEP_LIBS ${DEP_LIBS} glad)
