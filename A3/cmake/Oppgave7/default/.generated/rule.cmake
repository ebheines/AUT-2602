# The following functions contains all the flags passed to the different build stages.

set(PACK_REPO_PATH "/Users/ebheines/.mchp_packs" CACHE PATH "Path to the root of a pack repository.")

function(Oppgave7_default_default_AVR_GCC_assemble_rule target)
    set(options
        "-x"
        "assembler-with-cpp"
        "${MP_EXTRA_AS_PRE}"
        "-mmcu=avr128db48"
        "-B${PACK_REPO_PATH}/Microchip/AVR-Dx_DFP/2.7.321/gcc/dev/avr128db48"
        "-c"
        "-Wa,--defsym=__MPLAB_BUILD=1${MP_EXTRA_AS_POST},--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--gdwarf-2")
    list(REMOVE_ITEM options "")
    target_compile_options(${target} PRIVATE "${options}")
    target_compile_definitions(${target}
        PRIVATE "DEBUG"
        PRIVATE "__AVR128DB48__"
        PRIVATE "default=default")
    target_include_directories(${target} PRIVATE "${PACK_REPO_PATH}/Microchip/AVR-Dx_DFP/2.7.321/include")
endfunction()
function(Oppgave7_default_default_AVR_GCC_assembleWithPreprocess_rule target)
    set(options
        "-x"
        "assembler-with-cpp"
        "${MP_EXTRA_AS_PRE}"
        "-mmcu=avr128db48"
        "-B${PACK_REPO_PATH}/Microchip/AVR-Dx_DFP/2.7.321/gcc/dev/avr128db48"
        "-c"
        "-Wa,--defsym=__MPLAB_BUILD=1${MP_EXTRA_AS_POST},--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--gdwarf-2")
    list(REMOVE_ITEM options "")
    target_compile_options(${target} PRIVATE "${options}")
    target_compile_definitions(${target}
        PRIVATE "DEBUG"
        PRIVATE "__AVR128DB48__"
        PRIVATE "default=default")
    target_include_directories(${target} PRIVATE "${PACK_REPO_PATH}/Microchip/AVR-Dx_DFP/2.7.321/include")
endfunction()
function(Oppgave7_default_default_AVR_GCC_compile_rule target)
    set(options
        "-g"
        "-gdwarf-2"
        "${MP_EXTRA_CC_PRE}"
        "-mmcu=avr128db48"
        "-B${PACK_REPO_PATH}/Microchip/AVR-Dx_DFP/2.7.321/gcc/dev/avr128db48"
        "-x"
        "c"
        "-c"
        "-funsigned-char"
        "-funsigned-bitfields"
        "-O1"
        "-ffunction-sections"
        "-fdata-sections"
        "-fpack-struct"
        "-fshort-enums"
        "-Wall")
    list(REMOVE_ITEM options "")
    target_compile_options(${target} PRIVATE "${options}")
    target_compile_definitions(${target}
        PRIVATE "DEBUG"
        PRIVATE "__AVR128DB48__"
        PRIVATE "default=default")
    target_include_directories(${target} PRIVATE "${PACK_REPO_PATH}/Microchip/AVR-Dx_DFP/2.7.321/include")
endfunction()
function(Oppgave7_default_default_AVR_GCC_compile_cpp_rule target)
    set(options
        "-g"
        "-gdwarf-2"
        "${MP_EXTRA_CC_PRE}"
        "-mmcu=avr128db48"
        "-B${PACK_REPO_PATH}/Microchip/AVR-Dx_DFP/2.7.321/gcc/dev/avr128db48"
        "-x"
        "c++"
        "-c"
        "-funsigned-char"
        "-funsigned-bitfields"
        "-O1"
        "-ffunction-sections"
        "-fdata-sections"
        "-fpack-struct"
        "-fshort-enums"
        "-Wall")
    list(REMOVE_ITEM options "")
    target_compile_options(${target} PRIVATE "${options}")
    target_compile_definitions(${target}
        PRIVATE "DEBUG"
        PRIVATE "__AVR128DB48__"
        PRIVATE "default=default")
    target_include_directories(${target} PRIVATE "${PACK_REPO_PATH}/Microchip/AVR-Dx_DFP/2.7.321/include")
endfunction()
function(Oppgave7_default_link_rule target)
    set(options
        "-gdwarf-2"
        "${MP_EXTRA_LD_PRE}"
        "-mmcu=avr128db48"
        "-B${PACK_REPO_PATH}/Microchip/AVR-Dx_DFP/2.7.321/gcc/dev/avr128db48"
        "-o"
        "${FINAL_IMAGE_NAME}"
        "-Wl,--defsym=__MPLAB_BUILD=1${MP_EXTRA_LD_POST},--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1"
        "-Wl,--gc-sections")
    list(REMOVE_ITEM options "")
    target_link_options(${target} PRIVATE "${options}")
    target_compile_definitions(${target}
        PRIVATE "__AVR128DB48__"
        PRIVATE "default=default")
endfunction()
function(Oppgave7_default_objcopy_ihex_rule target)
    add_custom_command(
        TARGET ${target}
        POST_BUILD
        COMMAND ${OBJCOPY}
        ARGS --output-target=ihex ${Oppgave7_default_image_name} ${Oppgave7_default_image_base_name}.hex
        WORKING_DIRECTORY ${Oppgave7_default_output_dir})
endfunction()
function(Oppgave7_default_objcopy_eep_rule target)
    add_custom_command(
        TARGET ${target}
        POST_BUILD
        COMMAND ${OBJCOPY}
        ARGS --only-section=.eeprom --change-section-lma .eeprom=0 --no-change-warnings --output-target=ihex ${Oppgave7_default_image_name} ${Oppgave7_default_image_base_name}.eep
        WORKING_DIRECTORY ${Oppgave7_default_output_dir})
endfunction()
function(Oppgave7_default_objcopy_lss_rule target)
    add_custom_command(
        TARGET ${target}
        POST_BUILD
        COMMAND ${OBJDUMP}
        ARGS --disassemble --wide --demangle --line-numbers --section-headers --source ${Oppgave7_default_image_name} > ${Oppgave7_default_image_base_name}.lss
        WORKING_DIRECTORY ${Oppgave7_default_output_dir})
endfunction()
function(Oppgave7_default_objcopy_srec_rule target)
    add_custom_command(
        TARGET ${target}
        POST_BUILD
        COMMAND ${OBJCOPY}
        ARGS --output-target=srec --remove-section=.eeprom --remove-section=.fuse --remove-section=.lock --remove-section=.signature ${Oppgave7_default_image_name} ${Oppgave7_default_image_base_name}.srec
        WORKING_DIRECTORY ${Oppgave7_default_output_dir})
endfunction()
function(Oppgave7_default_objcopy_sig_rule target)
    add_custom_command(
        TARGET ${target}
        POST_BUILD
        COMMAND ${OBJCOPY}
        ARGS --only-section=.user_signatures --change-section-lma .user_signatures=0 --no-change-warnings --output-target=ihex ${Oppgave7_default_image_name} ${Oppgave7_default_image_base_name}.usersignatures
        WORKING_DIRECTORY ${Oppgave7_default_output_dir})
endfunction()
