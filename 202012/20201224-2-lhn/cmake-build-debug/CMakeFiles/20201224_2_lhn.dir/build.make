# CMAKE generated file: DO NOT EDIT!
# Generated by "NMake Makefiles" Generator, CMake Version 3.17

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE
NULL=nul
!ENDIF
SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = "D:\work\CLion\CLion 2020.2.5\bin\cmake\win\bin\cmake.exe"

# The command to remove a file.
RM = "D:\work\CLion\CLion 2020.2.5\bin\cmake\win\bin\cmake.exe" -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = D:\git\202010\202012\20201224-2-lhn

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = D:\git\202010\202012\20201224-2-lhn\cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles\20201224_2_lhn.dir\depend.make

# Include the progress variables for this target.
include CMakeFiles\20201224_2_lhn.dir\progress.make

# Include the compile flags for this target's objects.
include CMakeFiles\20201224_2_lhn.dir\flags.make

CMakeFiles\20201224_2_lhn.dir\main.cpp.obj: CMakeFiles\20201224_2_lhn.dir\flags.make
CMakeFiles\20201224_2_lhn.dir\main.cpp.obj: ..\main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\git\202010\202012\20201224-2-lhn\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/20201224_2_lhn.dir/main.cpp.obj"
	C:\PROGRA~2\MICROS~3\2017\PROFES~1\VC\Tools\MSVC\1416~1.270\bin\Hostx86\x86\cl.exe @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) /FoCMakeFiles\20201224_2_lhn.dir\main.cpp.obj /FdCMakeFiles\20201224_2_lhn.dir\ /FS -c D:\git\202010\202012\20201224-2-lhn\main.cpp
<<

CMakeFiles\20201224_2_lhn.dir\main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/20201224_2_lhn.dir/main.cpp.i"
	C:\PROGRA~2\MICROS~3\2017\PROFES~1\VC\Tools\MSVC\1416~1.270\bin\Hostx86\x86\cl.exe > CMakeFiles\20201224_2_lhn.dir\main.cpp.i @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E D:\git\202010\202012\20201224-2-lhn\main.cpp
<<

CMakeFiles\20201224_2_lhn.dir\main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/20201224_2_lhn.dir/main.cpp.s"
	C:\PROGRA~2\MICROS~3\2017\PROFES~1\VC\Tools\MSVC\1416~1.270\bin\Hostx86\x86\cl.exe @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) /FoNUL /FAs /FaCMakeFiles\20201224_2_lhn.dir\main.cpp.s /c D:\git\202010\202012\20201224-2-lhn\main.cpp
<<

# Object files for target 20201224_2_lhn
20201224_2_lhn_OBJECTS = \
"CMakeFiles\20201224_2_lhn.dir\main.cpp.obj"

# External object files for target 20201224_2_lhn
20201224_2_lhn_EXTERNAL_OBJECTS =

20201224_2_lhn.exe: CMakeFiles\20201224_2_lhn.dir\main.cpp.obj
20201224_2_lhn.exe: CMakeFiles\20201224_2_lhn.dir\build.make
20201224_2_lhn.exe: CMakeFiles\20201224_2_lhn.dir\objects1.rsp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=D:\git\202010\202012\20201224-2-lhn\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable 20201224_2_lhn.exe"
	"D:\work\CLion\CLion 2020.2.5\bin\cmake\win\bin\cmake.exe" -E vs_link_exe --intdir=CMakeFiles\20201224_2_lhn.dir --rc=C:\PROGRA~2\WI3CF2~1\10\bin\100177~1.0\x86\rc.exe --mt=C:\PROGRA~2\WI3CF2~1\10\bin\100177~1.0\x86\mt.exe --manifests  -- C:\PROGRA~2\MICROS~3\2017\PROFES~1\VC\Tools\MSVC\1416~1.270\bin\Hostx86\x86\link.exe /nologo @CMakeFiles\20201224_2_lhn.dir\objects1.rsp @<<
 /out:20201224_2_lhn.exe /implib:20201224_2_lhn.lib /pdb:D:\git\202010\202012\20201224-2-lhn\cmake-build-debug\20201224_2_lhn.pdb /version:0.0  /machine:X86 /debug /INCREMENTAL /subsystem:console  kernel32.lib user32.lib gdi32.lib winspool.lib shell32.lib ole32.lib oleaut32.lib uuid.lib comdlg32.lib advapi32.lib 
<<

# Rule to build all files generated by this target.
CMakeFiles\20201224_2_lhn.dir\build: 20201224_2_lhn.exe

.PHONY : CMakeFiles\20201224_2_lhn.dir\build

CMakeFiles\20201224_2_lhn.dir\clean:
	$(CMAKE_COMMAND) -P CMakeFiles\20201224_2_lhn.dir\cmake_clean.cmake
.PHONY : CMakeFiles\20201224_2_lhn.dir\clean

CMakeFiles\20201224_2_lhn.dir\depend:
	$(CMAKE_COMMAND) -E cmake_depends "NMake Makefiles" D:\git\202010\202012\20201224-2-lhn D:\git\202010\202012\20201224-2-lhn D:\git\202010\202012\20201224-2-lhn\cmake-build-debug D:\git\202010\202012\20201224-2-lhn\cmake-build-debug D:\git\202010\202012\20201224-2-lhn\cmake-build-debug\CMakeFiles\20201224_2_lhn.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles\20201224_2_lhn.dir\depend

