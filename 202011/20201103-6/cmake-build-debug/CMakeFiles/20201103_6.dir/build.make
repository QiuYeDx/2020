# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.17

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


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

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /snap/clion/129/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /snap/clion/129/bin/cmake/linux/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/qiuyedianxia/CLionOutput/exercises/202011/20201103-6

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/qiuyedianxia/CLionOutput/exercises/202011/20201103-6/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/20201103_6.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/20201103_6.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/20201103_6.dir/flags.make

CMakeFiles/20201103_6.dir/main.c.o: CMakeFiles/20201103_6.dir/flags.make
CMakeFiles/20201103_6.dir/main.c.o: ../main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/qiuyedianxia/CLionOutput/exercises/202011/20201103-6/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/20201103_6.dir/main.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/20201103_6.dir/main.c.o   -c /home/qiuyedianxia/CLionOutput/exercises/202011/20201103-6/main.c

CMakeFiles/20201103_6.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/20201103_6.dir/main.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/qiuyedianxia/CLionOutput/exercises/202011/20201103-6/main.c > CMakeFiles/20201103_6.dir/main.c.i

CMakeFiles/20201103_6.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/20201103_6.dir/main.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/qiuyedianxia/CLionOutput/exercises/202011/20201103-6/main.c -o CMakeFiles/20201103_6.dir/main.c.s

# Object files for target 20201103_6
20201103_6_OBJECTS = \
"CMakeFiles/20201103_6.dir/main.c.o"

# External object files for target 20201103_6
20201103_6_EXTERNAL_OBJECTS =

20201103_6: CMakeFiles/20201103_6.dir/main.c.o
20201103_6: CMakeFiles/20201103_6.dir/build.make
20201103_6: CMakeFiles/20201103_6.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/qiuyedianxia/CLionOutput/exercises/202011/20201103-6/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable 20201103_6"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/20201103_6.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/20201103_6.dir/build: 20201103_6

.PHONY : CMakeFiles/20201103_6.dir/build

CMakeFiles/20201103_6.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/20201103_6.dir/cmake_clean.cmake
.PHONY : CMakeFiles/20201103_6.dir/clean

CMakeFiles/20201103_6.dir/depend:
	cd /home/qiuyedianxia/CLionOutput/exercises/202011/20201103-6/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/qiuyedianxia/CLionOutput/exercises/202011/20201103-6 /home/qiuyedianxia/CLionOutput/exercises/202011/20201103-6 /home/qiuyedianxia/CLionOutput/exercises/202011/20201103-6/cmake-build-debug /home/qiuyedianxia/CLionOutput/exercises/202011/20201103-6/cmake-build-debug /home/qiuyedianxia/CLionOutput/exercises/202011/20201103-6/cmake-build-debug/CMakeFiles/20201103_6.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/20201103_6.dir/depend

