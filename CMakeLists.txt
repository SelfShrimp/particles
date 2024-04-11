cmake_minimum_required(VERSION 3.5)

project(particles)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Core Quick)

set(PROJECT_SOURCES
        main.cpp
)

qt_add_executable(particles
    main.cpp
    assets/particle.png main.qml
    qml.qrc
)

set_target_properties(particles PROPERTIES
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(particles PUBLIC
    Qt6::Core
    Qt6::Quick
)



include(GNUInstallDirs)
install(TARGETS particles
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

if(QT_VERSION_MAJOR EQUAL 6)
    qt_finalize_executable(particles)
endif()
