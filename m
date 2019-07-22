From: skunberg.kelsey@gmail.com (Kelsey Skunberg)
Date: Sun, 21 Jul 2019 20:35:29 -0600
Subject: [Linux-kernel-mentees] [PATCH 2/3] ACPI: Remove acpi_has_method()
	call from scan.c
In-Reply-To: <20190722023530.67676-1-skunberg.kelsey@gmail.com>
References: <20190722023530.67676-1-skunberg.kelsey@gmail.com>
Message-ID: <20190722023530.67676-3-skunberg.kelsey@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190722023529.AYoJtEiGc3sKsC2s18JnMsiWhoRIfJ_XbwQ3PbguZLE@z>

acpi_evaluate_reference() will return an error if the DEP method
does not exist. Checking if the DEP method exists before the
acpi_evaluate_reference() call is not needed. Remove acpi_has_method()
call to avoid additional work.

Signed-off-by: Kelsey Skunberg <skunberg.kelsey at gmail.com>
---
 drivers/acpi/scan.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index 0e28270b0fd8..4f2b0b481cee 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -1803,9 +1803,6 @@ static void acpi_device_dep_initialize(struct acpi_device *adev)
 
 	adev->dep_unmet = 0;
 
-	if (!acpi_has_method(adev->handle, "_DEP"))
-		return;
-
 	status = acpi_evaluate_reference(adev->handle, "_DEP", NULL,
 					&dep_devices);
 	if (ACPI_FAILURE(status)) {
-- 
2.20.1
