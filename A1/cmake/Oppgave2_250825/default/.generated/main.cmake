# cmake files support debug production
include("${CMAKE_CURRENT_LIST_DIR}/rule.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/file.cmake")

set(Oppgave2_250825_default_library_list )

# Handle files with suffix (s|as|asm|AS|ASM|As|aS|Asm), for group default-AVR-GCC
if(Oppgave2_250825_default_default_AVR_GCC_FILE_TYPE_assemble)
add_library(Oppgave2_250825_default_default_AVR_GCC_assemble OBJECT ${Oppgave2_250825_default_default_AVR_GCC_FILE_TYPE_assemble})
    Oppgave2_250825_default_default_AVR_GCC_assemble_rule(Oppgave2_250825_default_default_AVR_GCC_assemble)
    list(APPEND Oppgave2_250825_default_library_list "$<TARGET_OBJECTS:Oppgave2_250825_default_default_AVR_GCC_assemble>")
endif()

# Handle files with suffix S, for group default-AVR-GCC
if(Oppgave2_250825_default_default_AVR_GCC_FILE_TYPE_assemblePreprocess)
add_library(Oppgave2_250825_default_default_AVR_GCC_assemblePreprocess OBJECT ${Oppgave2_250825_default_default_AVR_GCC_FILE_TYPE_assemblePreprocess})
    Oppgave2_250825_default_default_AVR_GCC_assemblePreprocess_rule(Oppgave2_250825_default_default_AVR_GCC_assemblePreprocess)
    list(APPEND Oppgave2_250825_default_library_list "$<TARGET_OBJECTS:Oppgave2_250825_default_default_AVR_GCC_assemblePreprocess>")
endif()

# Handle files with suffix [cC], for group default-AVR-GCC
if(Oppgave2_250825_default_default_AVR_GCC_FILE_TYPE_compile)
add_library(Oppgave2_250825_default_default_AVR_GCC_compile OBJECT ${Oppgave2_250825_default_default_AVR_GCC_FILE_TYPE_compile})
    Oppgave2_250825_default_default_AVR_GCC_compile_rule(Oppgave2_250825_default_default_AVR_GCC_compile)
    list(APPEND Oppgave2_250825_default_library_list "$<TARGET_OBJECTS:Oppgave2_250825_default_default_AVR_GCC_compile>")
endif()


add_executable(Oppgave2_250825_default_image_cA_hHXpG ${Oppgave2_250825_default_library_list})

set_target_properties(Oppgave2_250825_default_image_cA_hHXpG PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${Oppgave2_250825_default_output_dir})
set_target_properties(Oppgave2_250825_default_image_cA_hHXpG PROPERTIES OUTPUT_NAME "default")
set_target_properties(Oppgave2_250825_default_image_cA_hHXpG PROPERTIES SUFFIX ".elf")
         

target_link_libraries(Oppgave2_250825_default_image_cA_hHXpG PRIVATE ${Oppgave2_250825_default_default_AVR_GCC_FILE_TYPE_link})


# Add the link options from the rule file.
Oppgave2_250825_default_link_rule(Oppgave2_250825_default_image_cA_hHXpG)




