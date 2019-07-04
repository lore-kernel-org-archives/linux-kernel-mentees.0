From: skunberg.kelsey at gmail.com (Kelsey Skunberg)
Date: Wed,  3 Jul 2019 18:08:17 -0600
Subject: [Linux-kernel-mentees] [PATCH 0/2] lspci: Add lspci support to
	decode AIDA64 and dmesg log files
Message-ID: <20190704000819.25050-1-skunberg.kelsey@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Add lspci support to decode AIDA64 log files and dmesg log files with
"pci=earlydump" parameter to output PCI configuration space information.

	Patch 1: Add lspci support to decode AIDA64 log file.

	AIDA64 log file included in patch for testing. Use the following
	command to run:

		lspci -F tests/aida64-dump


	Patch 2: Add lspci support to decode dmesg log file with
	"pci=earlydump" parameter.

	dmesg log file with "pci=earlydump" included in patch for
	testing. Use the following command to run:

                lspci -F tests/dmesg-dump





Bjorn Helgaas (2):
  lspci: Add lspci support to decode an AIDA64 log file
  lspci: Add lspci support to decode "pci=earlydump" output

 lib/dump.c        |   96 ++-
 tests/aida64-dump |  954 ++++++++++++++++++++++++
 tests/dmesg-dump  | 1795 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 2812 insertions(+), 33 deletions(-)
 create mode 100644 tests/aida64-dump
 create mode 100644 tests/dmesg-dump

-- 
2.20.1
