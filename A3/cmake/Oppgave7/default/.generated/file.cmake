# The following variables contains the files used by the different stages of the build process.
set(Oppgave7_default_default_AVR_GCC_FILE_TYPE_assemble)
set_source_files_properties(${Oppgave7_default_default_AVR_GCC_FILE_TYPE_assemble} PROPERTIES LANGUAGE ASM)

# For assembly files, add "." to the include path for each file so that .include with a relative path works
foreach(source_file ${Oppgave7_default_default_AVR_GCC_FILE_TYPE_assemble})
        set_source_files_properties(${source_file} PROPERTIES INCLUDE_DIRECTORIES "$<PATH:NORMAL_PATH,$<PATH:REMOVE_FILENAME,${source_file}>>")
endforeach()

set(Oppgave7_default_default_AVR_GCC_FILE_TYPE_assembleWithPreprocess)
set_source_files_properties(${Oppgave7_default_default_AVR_GCC_FILE_TYPE_assembleWithPreprocess} PROPERTIES LANGUAGE ASM)

# For assembly files, add "." to the include path for each file so that .include with a relative path works
foreach(source_file ${Oppgave7_default_default_AVR_GCC_FILE_TYPE_assembleWithPreprocess})
        set_source_files_properties(${source_file} PROPERTIES INCLUDE_DIRECTORIES "$<PATH:NORMAL_PATH,$<PATH:REMOVE_FILENAME,${source_file}>>")
endforeach()

set(Oppgave7_default_default_AVR_GCC_FILE_TYPE_compile "${CMAKE_CURRENT_SOURCE_DIR}/../../../main.c")
set_source_files_properties(${Oppgave7_default_default_AVR_GCC_FILE_TYPE_compile} PROPERTIES LANGUAGE C)
set(Oppgave7_default_default_AVR_GCC_FILE_TYPE_compile_cpp)
set_source_files_properties(${Oppgave7_default_default_AVR_GCC_FILE_TYPE_compile_cpp} PROPERTIES LANGUAGE CXX)
set(Oppgave7_default_default_AVR_GCC_FILE_TYPE_link)
set(Oppgave7_default_default_AVR_GCC_FILE_TYPE_objcopy_ihex)
set(Oppgave7_default_default_AVR_GCC_FILE_TYPE_objcopy_eep)
set(Oppgave7_default_default_AVR_GCC_FILE_TYPE_objcopy_lss)
set(Oppgave7_default_default_AVR_GCC_FILE_TYPE_objcopy_srec)
set(Oppgave7_default_default_AVR_GCC_FILE_TYPE_objcopy_sig)
set(Oppgave7_default_image_name "default.elf")
set(Oppgave7_default_image_base_name "default")

# The output directory of the final image.
set(Oppgave7_default_output_dir "${CMAKE_CURRENT_SOURCE_DIR}/../../../out/Oppgave7")

# The full path to the final image.
set(Oppgave7_default_full_path_to_image ${Oppgave7_default_output_dir}/${Oppgave7_default_image_name})
