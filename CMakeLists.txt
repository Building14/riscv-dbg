# SPDX-License-Identifier: GPL-3.0-only
# Copyright (c) 2023 CERN
#
# Please retain this header in all redistributions and modifications of the code.

cmake_minimum_required(VERSION 3.25)
project(riscv_dbg NONE)

# Fetch dependencies
include("deps/deps.cmake")

add_ip(riscv_dbg
    VENDOR pulp_platform
    LIBRARY ip
    VERSION 0.8.1
)

ip_sources(${IP} SYSTEMVERILOG
    ${PROJECT_SOURCE_DIR}/src/dm_pkg.sv
    ${PROJECT_SOURCE_DIR}/debug_rom/debug_rom.sv
    ${PROJECT_SOURCE_DIR}/debug_rom/debug_rom_one_scratch.sv
    ${PROJECT_SOURCE_DIR}/src/dm_csrs.sv
    ${PROJECT_SOURCE_DIR}/src/dm_mem.sv
    ${PROJECT_SOURCE_DIR}/src/dm_top.sv
    ${PROJECT_SOURCE_DIR}/src/dm_obi_top.sv
    ${PROJECT_SOURCE_DIR}/src/dmi_cdc.sv
    ${PROJECT_SOURCE_DIR}/src/dmi_jtag.sv
    ${PROJECT_SOURCE_DIR}/src/dmi_jtag_tap.sv
    ${PROJECT_SOURCE_DIR}/src/dm_sba.sv
)

ip_link(${IP}
    pulp_platform::ip::tech_cells_generic
    pulp_platform::ip::common_cells
)

if(NOT PROJECT_IS_TOP_LEVEL)
    set(RTL_LIB_NAME ${IP} PARENT_SCOPE)
endif()
