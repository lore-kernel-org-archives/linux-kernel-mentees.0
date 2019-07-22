From: skunberg.kelsey at gmail.com (Kelsey Skunberg)
Date: Sun, 21 Jul 2019 20:35:28 -0600
Subject: [Linux-kernel-mentees] [PATCH 1/3] ACPI: Remove acpi_has_method()
	call from acpi_adxl.c
In-Reply-To: <20190722023530.67676-1-skunberg.kelsey@gmail.com>
References: <20190722023530.67676-1-skunberg.kelsey@gmail.com>
Message-ID: <20190722023530.67676-2-skunberg.kelsey@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

acpi_check_dsm() will already return an error if the DSM method does not
exist. Checking if the DSM method exists before the acpi_check_dsm() call
is not needed. Remove acpi_has_method() call to avoid additional work.

Signed-off-by: Kelsey Skunberg <skunberg.kelsey at gmail.com>
---
 drivers/acpi/acpi_adxl.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/acpi/acpi_adxl.c b/drivers/acpi/acpi_adxl.c
index 13c8f7b50c46..89aac15663fd 100644
--- a/drivers/acpi/acpi_adxl.c
+++ b/drivers/acpi/acpi_adxl.c
@@ -148,11 +148,6 @@ static int __init adxl_init(void)
 		return -ENODEV;
 	}
 
-	if (!acpi_has_method(handle, "_DSM")) {
-		pr_info("No DSM method\n");
-		return -ENODEV;
-	}
-
 	if (!acpi_check_dsm(handle, &adxl_guid, ADXL_REVISION,
 			    ADXL_IDX_GET_ADDR_PARAMS |
 			    ADXL_IDX_FORWARD_TRANSLATE)) {
-- 
2.20.1
