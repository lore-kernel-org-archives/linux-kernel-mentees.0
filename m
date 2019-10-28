From: madhuparnabhowmik04 at gmail.com (madhuparnabhowmik04@gmail.com)
Date: Mon, 28 Oct 2019 11:37:10 +0530
Subject: [Linux-kernel-mentees] [PATCH] Documentation: driver-api: index:
	Removed non-existing document driver-api/sgi-ioc4 from the toctree.
Message-ID: <20191028060710.15154-1-madhuparnabhowmik04@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20191028060710.FSlXf2K1j6D1bCtvEYmdEqo90fdtWDpLm0P_avKxBXs@z>

From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>

This patches fixes the WARNING: toctree contains reference
to nonexisting document u'driver-api/sgi-ioc4'by removing
it from the toctree in the index.rst file.

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04 at gmail.com>
---
 Documentation/driver-api/index.rst | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api/index.rst
index 38e638abe3eb..6d46ceeb62c4 100644
--- a/Documentation/driver-api/index.rst
+++ b/Documentation/driver-api/index.rst
@@ -93,7 +93,6 @@ available subsections can be seen below.
    pwm
    rfkill
    serial/index
-   sgi-ioc4
    sm501
    smsc_ece1099
    switchtec
-- 
2.17.1
