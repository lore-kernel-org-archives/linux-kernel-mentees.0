From: skunberg.kelsey at gmail.com (Kelsey Skunberg)
Date: Sun, 21 Jul 2019 20:35:27 -0600
Subject: [Linux-kernel-mentees] [PATCH 0/3] ACPI: Remove unnecessary
	acpi_has_method() calls
Message-ID: <20190722023530.67676-1-skunberg.kelsey@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Remove acpi_has_method() calls which return an error a following call will
provide anyways. Removing the unnecessary acpi_has_method() calls help to
clean up code and remove extra work.

Kelsey Skunberg (3):
  ACPI: Remove acpi_has_method() call from acpi_adxl.c
  ACPI: Remove acpi_has_method() call from scan.c
  ACPI: Remove acpi_has_method() calls from thermal.c

 drivers/acpi/acpi_adxl.c |  5 -----
 drivers/acpi/scan.c      |  3 ---
 drivers/acpi/thermal.c   | 11 +++--------
 3 files changed, 3 insertions(+), 16 deletions(-)

-- 
2.20.1
