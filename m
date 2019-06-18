From: puranjay12@gmail.com (Puranjay Mohan)
Date: Tue, 18 Jun 2019 11:02:27 +0530
Subject: [Linux-kernel-mentees] [PATCH] Documentation: platform: convert
	x86-laptop-drivers.txt to reST
Message-ID: <20190618053227.31678-1-puranjay12@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190618053227.bd_cRuU9cbFr27ymmI3PKhb_Hb3YCoEpsFk7cV1M6Qk@z>

This converts the plain text documentation to reStructuredText format.
No essential content change.

Signed-off-by: Puranjay Mohan <puranjay12 at gmail.com>
---
 Documentation/platform/x86-laptop-drivers.rst | 23 +++++++++++++++++++
 Documentation/platform/x86-laptop-drivers.txt | 18 ---------------
 2 files changed, 23 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/platform/x86-laptop-drivers.rst
 delete mode 100644 Documentation/platform/x86-laptop-drivers.txt

diff --git a/Documentation/platform/x86-laptop-drivers.rst b/Documentation/platform/x86-laptop-drivers.rst
new file mode 100644
index 000000000000..0494c3fdd41c
--- /dev/null
+++ b/Documentation/platform/x86-laptop-drivers.rst
@@ -0,0 +1,23 @@
+=============
+compal-laptop
+=============
+
+List of supported hardware:
+===========================
+
+by Compal:
+----------
+- Compal FL90/IFL90
+- Compal FL91/IFL91
+- Compal FL92/JFL92
+- Compal FT00/IFT00
+
+by Dell:
+--------
+- Dell Vostro 1200
+- Dell Mini 9 (Inspiron 910)
+- Dell Mini 10 (Inspiron 1010)
+- Dell Mini 10v (Inspiron 1011)
+- Dell Mini 1012 (Inspiron 1012)
+- Dell Inspiron 11z (Inspiron 1110)
+- Dell Mini 12 (Inspiron 1210)
diff --git a/Documentation/platform/x86-laptop-drivers.txt b/Documentation/platform/x86-laptop-drivers.txt
deleted file mode 100644
index 01facd2590bb..000000000000
--- a/Documentation/platform/x86-laptop-drivers.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-compal-laptop
-=============
-List of supported hardware:
-
-by Compal:
-	Compal FL90/IFL90
-	Compal FL91/IFL91
-	Compal FL92/JFL92
-	Compal FT00/IFT00
-
-by Dell:
-	Dell Vostro 1200
-	Dell Mini 9 (Inspiron 910)
-	Dell Mini 10 (Inspiron 1010)
-	Dell Mini 10v (Inspiron 1011)
-	Dell Mini 1012 (Inspiron 1012)
-	Dell Inspiron 11z (Inspiron 1110)
-	Dell Mini 12 (Inspiron 1210)
-- 
2.21.0
