project (Daniel2.SimplePlayerGL)

find_package(OpenAL REQUIRED)
find_package(OpenGL REQUIRED)
find_package(GLUT   REQUIRED)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(SOURCES
	stdafx.cpp
	AudioSource.cpp
	Block.cpp
	DecodeDaniel2.cpp
	ReadFileDN2.cpp
	Daniel2.SimplePlayerGL.cpp
)

set(HEADERS
	stdafx.h
	AudioSource.h
	Block.h
	CinecoderErrorHandler.h
	cudaDefines.h
	DecodeDaniel2.h
	ReadFileDN2.h
	Timer.h
)

include_directories("../common")
include_directories("${Cinecoder_INCLUDE_DIRS}")
link_directories("${Cinecoder_LIBRARY_DIRS}")

add_compile_options("-D__CINECODER_DISABLE_PRINT_VERSION__")

add_executable(${PROJECT_NAME} ${SOURCES} ${HEADERS})
target_link_libraries(${PROJECT_NAME} ${Cinecoder_LIBRARIES} ${OPENGL_LIBRARY} ${OPENAL_LIBRARY} ${GLUT_LIBRARY} pthread dl X11)
