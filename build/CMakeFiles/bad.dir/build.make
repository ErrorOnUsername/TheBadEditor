# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.19

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

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/unknown/dev/bad

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/unknown/dev/bad/build

# Include any dependencies generated for this target.
include CMakeFiles/bad.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/bad.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/bad.dir/flags.make

CMakeFiles/bad.dir/src/main.cc.o: CMakeFiles/bad.dir/flags.make
CMakeFiles/bad.dir/src/main.cc.o: ../src/main.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/unknown/dev/bad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/bad.dir/src/main.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/bad.dir/src/main.cc.o -c /home/unknown/dev/bad/src/main.cc

CMakeFiles/bad.dir/src/main.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/bad.dir/src/main.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/unknown/dev/bad/src/main.cc > CMakeFiles/bad.dir/src/main.cc.i

CMakeFiles/bad.dir/src/main.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/bad.dir/src/main.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/unknown/dev/bad/src/main.cc -o CMakeFiles/bad.dir/src/main.cc.s

# Object files for target bad
bad_OBJECTS = \
"CMakeFiles/bad.dir/src/main.cc.o"

# External object files for target bad
bad_EXTERNAL_OBJECTS =

bad: CMakeFiles/bad.dir/src/main.cc.o
bad: CMakeFiles/bad.dir/build.make
bad: CMakeFiles/bad.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/unknown/dev/bad/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable bad"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/bad.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/bad.dir/build: bad

.PHONY : CMakeFiles/bad.dir/build

CMakeFiles/bad.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/bad.dir/cmake_clean.cmake
.PHONY : CMakeFiles/bad.dir/clean

CMakeFiles/bad.dir/depend:
	cd /home/unknown/dev/bad/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/unknown/dev/bad /home/unknown/dev/bad /home/unknown/dev/bad/build /home/unknown/dev/bad/build /home/unknown/dev/bad/build/CMakeFiles/bad.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/bad.dir/depend
