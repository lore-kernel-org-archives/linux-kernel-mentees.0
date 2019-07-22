From: skunberg.kelsey@gmail.com (Kelsey Skunberg)
Date: Sun, 21 Jul 2019 20:35:30 -0600
Subject: [Linux-kernel-mentees] [PATCH 3/3] ACPI: Remove acpi_has_method()
	calls from thermal.c
In-Reply-To: <20190722023530.67676-1-skunberg.kelsey@gmail.com>
References: <20190722023530.67676-1-skunberg.kelsey@gmail.com>
Message-ID: <20190722023530.67676-4-skunberg.kelsey@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190722023530.1eTQf8CT-4yf1JmfKOw9IrUKNF4dhyubo0zd1vTO3ro@z>

The following acpi_has_method() calls are unnecessary since
acpi_execute_simple_method() and acpi_evaluate_reference() will return an
error if the given method does not exist. Remove acpi_has_method() calls
to avoid additional work.

Signed-off-by: Kelsey Skunberg <skunberg.kelsey at gmail.com>
---
 drivers/acpi/thermal.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/acpi/thermal.c b/drivers/acpi/thermal.c
index 00f12a86ecbd..d831a61e0010 100644
--- a/drivers/acpi/thermal.c
+++ b/drivers/acpi/thermal.c
@@ -225,13 +225,9 @@ static int acpi_thermal_set_cooling_mode(struct acpi_thermal *tz, int mode)
 	if (!tz)
 		return -EINVAL;
 
-	if (!acpi_has_method(tz->device->handle, "_SCP")) {
-		ACPI_DEBUG_PRINT((ACPI_DB_INFO, "_SCP not present\n"));
+	if (ACPI_FAILURE(acpi_execute_simple_method(tz->device->handle,
+						    "_SCP", mode)))
 		return -ENODEV;
-	} else if (ACPI_FAILURE(acpi_execute_simple_method(tz->device->handle,
-							   "_SCP", mode))) {
-		return -ENODEV;
-	}
 
 	return 0;
 }
@@ -463,8 +459,7 @@ static int acpi_thermal_trips_update(struct acpi_thermal *tz, int flag)
 			break;
 	}
 
-	if ((flag & ACPI_TRIPS_DEVICES)
-	    && acpi_has_method(tz->device->handle, "_TZD")) {
+	if (flag & ACPI_TRIPS_DEVICES) {
 		memset(&devices, 0, sizeof(devices));
 		status = acpi_evaluate_reference(tz->device->handle, "_TZD",
 						NULL, &devices);
-- 
2.20.1
