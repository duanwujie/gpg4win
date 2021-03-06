# inst-gnupg2.nsi - Installer snippet for gnupg-w32. -*- coding: latin-1; -*-
# Copyright (C) 2015 Intevation GmbH
#
# This file is part of Gpg4win.
#
# Gpg4win is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# Gpg4win is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
# MA 02110-1301, USA.

!ifdef prefix
!undef prefix
!endif
!define prefix ${ipdir}/gnupg-w32-${gpg4win_pkg_gnupg_w32_version}
!define source ${bpdir}/gnupg-w32-${gpg4win_pkg_gnupg_w32_version}

${MementoSection} "GnuPG" SEC_gnupg_w32
  SectionIn RO

!ifdef SOURCES
  SetOutPath "$INSTDIR"
  File "${gpg4win_pkg_gnupg_w32}"
!else

SetOutPath "$TEMP"
  DetailPrint  "$(T_Installing_GnuPG) ${gpg4win_pkg_gnupg_w32_version}"
  File "${prefix}/gnupg-w32-${gpg4win_pkg_gnupg_w32_version}-bin.exe"
  ExecWait '"$TEMP\gnupg-w32-${gpg4win_pkg_gnupg_w32_version}-bin.exe" /S /D=$INSTDIR\..\GnuPG'

  Delete "$TEMP\gnupg-w32-${gpg4win_pkg_gnupg_w32_version}-bin.exe"
!endif
${MementoSectionEnd}

LangString T_Installing_GnuPG ${LANG_ENGLISH} \
   "Installing GnuPG"

LangString DESC_SEC_gnupg_w32 ${LANG_ENGLISH} \
   "GNU Privacy Guard"
