# SPDX-License-Identifier: GPL-3.0-only
# Copyright (c) 2025 CERN
#
# Please retain this header in all redistributions and modifications of the code.

CPMAddPackage(
    NAME SoCMake
    GIT_TAG v0.2.17
    GIT_REPOSITORY "https://github.com/HEP-SoC/SoCMake.git"
)

CPMAddPackage(
    NAME common_cells
    GIT_TAG v0.0.5
    GIT_REPOSITORY "https://github.com/HEP-SoC/common_cells.git"
)

CPMAddPackage(
    NAME prim_cells
    GIT_TAG v0.1.8
    GIT_REPOSITORY "ssh://git@gitlab.cern.ch:7999/socrates/ip_blocks/prim_cells.git"
)
