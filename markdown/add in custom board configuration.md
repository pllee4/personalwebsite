# To be able to build own board 

## Using west

```
$ west build -d <build-directory> -b <board-name> -s <path-to-project> -- -DBOARD_ROOT=<path-to-your-board-project>
```  

## Using CMake

- To prevent direct changing of boards configuration under zephyr folder, it is recommended to either create or make a copy of boards folder and put under the projects.
  
```
$ list(APPEND BOARD_ROOT ${CMAKE_CURRENT_SOURCE_DIR})
```
where the boards folder is at the same directory level with the current CMakeLists.txt

- It is recommended to follow the zephyr convention for the self-defined board, for eg:
{APPLICATION_ROOT}/boards/arm/myBoard1