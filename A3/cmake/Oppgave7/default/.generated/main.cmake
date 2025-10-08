# cmake files support debug production
include("${CMAKE_CURRENT_LIST_DIR}/rule.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/file.cmake")

set(Oppgave7_default_library_list )

# Handle files with suffix s, for group default-AVR-GCC
if(Oppgave7_default_default_AVR_GCC_FILE_TYPE_assemble)
add_library(Oppgave7_default_default_AVR_GCC_assemble OBJECT ${Oppgave7_default_default_AVR_GCC_FILE_TYPE_assemble})
    Oppgave7_default_default_AVR_GCC_assemble_rule(Oppgave7_default_default_AVR_GCC_assemble)
    list(APPEND Oppgave7_default_library_list "$<TARGET_OBJECTS:Oppgave7_default_default_AVR_GCC_assemble>")
endif()

# Handle files with suffix S, for group default-AVR-GCC
if(Oppgave7_default_default_AVR_GCC_FILE_TYPE_assembleWithPreprocess)
add_library(Oppgave7_default_default_AVR_GCC_assembleWithPreprocess OBJECT ${Oppgave7_default_default_AVR_GCC_FILE_TYPE_assembleWithPreprocess})
    Oppgave7_default_default_AVR_GCC_assembleWithPreprocess_rule(Oppgave7_default_default_AVR_GCC_assembleWithPreprocess)
    list(APPEND Oppgave7_default_library_list "$<TARGET_OBJECTS:Oppgave7_default_default_AVR_GCC_assembleWithPreprocess>")
endif()

# Handle files with suffix [cC], for group default-AVR-GCC
if(Oppgave7_default_default_AVR_GCC_FILE_TYPE_compile)
add_library(Oppgave7_default_default_AVR_GCC_compile OBJECT ${Oppgave7_default_default_AVR_GCC_FILE_TYPE_compile})
    Oppgave7_default_default_AVR_GCC_compile_rule(Oppgave7_default_default_AVR_GCC_compile)
    list(APPEND Oppgave7_default_library_list "$<TARGET_OBJECTS:Oppgave7_default_default_AVR_GCC_compile>")
endif()

# Handle files with suffix cpp, for group default-AVR-GCC
if(Oppgave7_default_default_AVR_GCC_FILE_TYPE_compile_cpp)
add_library(Oppgave7_default_default_AVR_GCC_compile_cpp OBJECT ${Oppgave7_default_default_AVR_GCC_FILE_TYPE_compile_cpp})
    Oppgave7_default_default_AVR_GCC_compile_cpp_rule(Oppgave7_default_default_AVR_GCC_compile_cpp)
    list(APPEND Oppgave7_default_library_list "$<TARGET_OBJECTS:Oppgave7_default_default_AVR_GCC_compile_cpp>")
endif()

# Handle files with suffix elf, for group default-AVR-GCC
if(Oppgave7_default_default_AVR_GCC_FILE_TYPE_objcopy_ihex)
add_library(Oppgave7_default_default_AVR_GCC_objcopy_ihex OBJECT ${Oppgave7_default_default_AVR_GCC_FILE_TYPE_objcopy_ihex})
    Oppgave7_default_default_AVR_GCC_objcopy_ihex_rule(Oppgave7_default_default_AVR_GCC_objcopy_ihex)
    list(APPEND Oppgave7_default_library_list "$<TARGET_OBJECTS:Oppgave7_default_default_AVR_GCC_objcopy_ihex>")
endif()

# Handle files with suffix elf, for group default-AVR-GCC
if(Oppgave7_default_default_AVR_GCC_FILE_TYPE_objcopy_eep)
add_library(Oppgave7_default_default_AVR_GCC_objcopy_eep OBJECT ${Oppgave7_default_default_AVR_GCC_FILE_TYPE_objcopy_eep})
    Oppgave7_default_default_AVR_GCC_objcopy_eep_rule(Oppgave7_default_default_AVR_GCC_objcopy_eep)
    list(APPEND Oppgave7_default_library_list "$<TARGET_OBJECTS:Oppgave7_default_default_AVR_GCC_objcopy_eep>")
endif()

# Handle files with suffix elf, for group default-AVR-GCC
if(Oppgave7_default_default_AVR_GCC_FILE_TYPE_objcopy_lss)
add_library(Oppgave7_default_default_AVR_GCC_objcopy_lss OBJECT ${Oppgave7_default_default_AVR_GCC_FILE_TYPE_objcopy_lss})
    Oppgave7_default_default_AVR_GCC_objcopy_lss_rule(Oppgave7_default_default_AVR_GCC_objcopy_lss)
    list(APPEND Oppgave7_default_library_list "$<TARGET_OBJECTS:Oppgave7_default_default_AVR_GCC_objcopy_lss>")
endif()

# Handle files with suffix elf, for group default-AVR-GCC
if(Oppgave7_default_default_AVR_GCC_FILE_TYPE_objcopy_srec)
add_library(Oppgave7_default_default_AVR_GCC_objcopy_srec OBJECT ${Oppgave7_default_default_AVR_GCC_FILE_TYPE_objcopy_srec})
    Oppgave7_default_default_AVR_GCC_objcopy_srec_rule(Oppgave7_default_default_AVR_GCC_objcopy_srec)
    list(APPEND Oppgave7_default_library_list "$<TARGET_OBJECTS:Oppgave7_default_default_AVR_GCC_objcopy_srec>")
endif()

# Handle files with suffix elf, for group default-AVR-GCC
if(Oppgave7_default_default_AVR_GCC_FILE_TYPE_objcopy_sig)
add_library(Oppgave7_default_default_AVR_GCC_objcopy_sig OBJECT ${Oppgave7_default_default_AVR_GCC_FILE_TYPE_objcopy_sig})
    Oppgave7_default_default_AVR_GCC_objcopy_sig_rule(Oppgave7_default_default_AVR_GCC_objcopy_sig)
    list(APPEND Oppgave7_default_library_list "$<TARGET_OBJECTS:Oppgave7_default_default_AVR_GCC_objcopy_sig>")
endif()

add_executable(Oppgave7_default_image_5nr7IGE1 ${Oppgave7_default_library_list})

set_target_properties(Oppgave7_default_image_5nr7IGE1 PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${Oppgave7_default_output_dir})
set_target_properties(Oppgave7_default_image_5nr7IGE1 PROPERTIES OUTPUT_NAME "default")
set_target_properties(Oppgave7_default_image_5nr7IGE1 PROPERTIES SUFFIX ".elf")

target_link_libraries(Oppgave7_default_image_5nr7IGE1 PRIVATE ${Oppgave7_default_default_AVR_GCC_FILE_TYPE_link})

#Add objcopy steps
Oppgave7_default_objcopy_ihex_rule(Oppgave7_default_image_5nr7IGE1)
Oppgave7_default_objcopy_eep_rule(Oppgave7_default_image_5nr7IGE1)
Oppgave7_default_objcopy_lss_rule(Oppgave7_default_image_5nr7IGE1)
Oppgave7_default_objcopy_srec_rule(Oppgave7_default_image_5nr7IGE1)
Oppgave7_default_objcopy_sig_rule(Oppgave7_default_image_5nr7IGE1)

# Add the link options from the rule file.
Oppgave7_default_link_rule(Oppgave7_default_image_5nr7IGE1)



