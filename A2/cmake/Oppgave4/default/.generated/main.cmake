# cmake files support debug production
include("${CMAKE_CURRENT_LIST_DIR}/rule.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/file.cmake")

set(Oppgave4_default_library_list )

# Handle files with suffix (s|as|asm|AS|ASM|As|aS|Asm), for group default-XC8
if(Oppgave4_default_default_XC8_FILE_TYPE_assemble)
add_library(Oppgave4_default_default_XC8_assemble OBJECT ${Oppgave4_default_default_XC8_FILE_TYPE_assemble})
    Oppgave4_default_default_XC8_assemble_rule(Oppgave4_default_default_XC8_assemble)
    list(APPEND Oppgave4_default_library_list "$<TARGET_OBJECTS:Oppgave4_default_default_XC8_assemble>")
endif()

# Handle files with suffix S, for group default-XC8
if(Oppgave4_default_default_XC8_FILE_TYPE_assemblePreprocess)
add_library(Oppgave4_default_default_XC8_assemblePreprocess OBJECT ${Oppgave4_default_default_XC8_FILE_TYPE_assemblePreprocess})
    Oppgave4_default_default_XC8_assemblePreprocess_rule(Oppgave4_default_default_XC8_assemblePreprocess)
    list(APPEND Oppgave4_default_library_list "$<TARGET_OBJECTS:Oppgave4_default_default_XC8_assemblePreprocess>")
endif()

# Handle files with suffix [cC], for group default-XC8
if(Oppgave4_default_default_XC8_FILE_TYPE_compile)
add_library(Oppgave4_default_default_XC8_compile OBJECT ${Oppgave4_default_default_XC8_FILE_TYPE_compile})
    Oppgave4_default_default_XC8_compile_rule(Oppgave4_default_default_XC8_compile)
    list(APPEND Oppgave4_default_library_list "$<TARGET_OBJECTS:Oppgave4_default_default_XC8_compile>")
endif()

add_executable(Oppgave4_default_image_VX9cfxLw ${Oppgave4_default_library_list})

set_target_properties(Oppgave4_default_image_VX9cfxLw PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${Oppgave4_default_output_dir})
set_target_properties(Oppgave4_default_image_VX9cfxLw PROPERTIES OUTPUT_NAME "default")
set_target_properties(Oppgave4_default_image_VX9cfxLw PROPERTIES SUFFIX ".elf")

target_link_libraries(Oppgave4_default_image_VX9cfxLw PRIVATE ${Oppgave4_default_default_XC8_FILE_TYPE_link})


# Add the link options from the rule file.
Oppgave4_default_link_rule(Oppgave4_default_image_VX9cfxLw)



