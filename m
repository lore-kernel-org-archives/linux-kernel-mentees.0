From: shobhitkukreti@gmail.com (Shobhit Kukreti)
Date: Sat, 6 Jul 2019 18:39:50 -0700
Subject: [Linux-kernel-mentees] [PATCH] Documentation: filesystems: Convert
 ufs.txt to reStructuredText format
Message-ID: <20190707013947.GA10663@t-1000>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190707013950.gMeRymNNrCFOJg_OxOU9DHmHl1Yu3Vzq1DFTYbGtu-s@z>

This converts the plain text documentation of ufs.txt to reStructuredText format.
Added to documentation build process and verified with make htmldocs

Signed-off-by: Shobhit Kukreti <shobhitkukreti at gmail.com>
---
 Documentation/filesystems/index.rst |  1 +
 Documentation/filesystems/ufs.rst   | 65 +++++++++++++++++++++++++++++++++++++
 Documentation/filesystems/ufs.txt   | 60 ----------------------------------
 3 files changed, 66 insertions(+), 60 deletions(-)
 create mode 100644 Documentation/filesystems/ufs.rst
 delete mode 100644 Documentation/filesystems/ufs.txt

diff --git a/Documentation/filesystems/index.rst b/Documentation/filesystems/index.rst
index d700330..2b4f870 100644
--- a/Documentation/filesystems/index.rst
+++ b/Documentation/filesystems/index.rst
@@ -42,3 +42,4 @@ Documentation for individual filesystem types can be found here.
 
    binderfs.rst
    jfs
+   ufs
diff --git a/Documentation/filesystems/ufs.rst b/Documentation/filesystems/ufs.rst
new file mode 100644
index 0000000..d6aeef0
--- /dev/null
+++ b/Documentation/filesystems/ufs.rst
@@ -0,0 +1,65 @@
+=========
+USING UFS
+=========
+
+mount -t ufs -o ufstype=type_of_ufs device dir
+
+UFS OPTIONS
+===========
+
+.. tabularcolumns:: |p{0.5cm}|p{0.5cm}|p{8.0cm}|
+
+.. cssclass:: longtable
+
+.. flat-table::   
+   :header-rows:  0
+   :stub-columns: 0
+
+   * - :rspan:`10` ufstype
+     - =type_of_ufs
+     - UFS is a file system widely used in different operating systems. The problem are differences among implementations. Features of some implementations 
+       are undocumented, so its hard to recognize type of ufs automatically. That's why user must specify type of ufs manually by mount option ufstype.
+       Possible values are below.
+
+   * - old 
+     - old format of ufs default value, supported as read-only
+   
+   * - 44bsd	
+     - used in FreeBSD, NetBSD, OpenBSD supported as read-write
+   
+   * - ufs2
+     - used in FreeBSD 5.x supported as read-write
+
+   * - 5xbsd	
+     - synonym for ufs2
+
+   * - sun
+     - used in SunOS (Solaris) supported as read-write
+
+   * - sunx86	
+     - used in SunOS for Intel (Solarisx86) supported as read-write
+
+   * - hp	
+     - used in HP-UX 	supported as read-only
+
+   * - nextstep
+     - used in NextStep supported as read-only
+
+   * - nextstep-cd
+     - used for NextStep CDROMs (block_size == 2048) supported as read-only
+
+   * - openstep
+     - used in OpenStep supported as read-only
+
+
+POSSIBLE PROBLEMS
+-----------------
+
+See next section, if you have any.
+
+
+BUG REPORTS
+-----------
+
+Any ufs bug report you can send to daniel.pirkl at email.cz or
+to dushistov at mail.ru (do not send partition tables bug reports).
diff --git a/Documentation/filesystems/ufs.txt b/Documentation/filesystems/ufs.txt
deleted file mode 100644
index 7a602ad..0000000
--- a/Documentation/filesystems/ufs.txt
+++ /dev/null
@@ -1,60 +0,0 @@
-USING UFS
-=========
-
-mount -t ufs -o ufstype=type_of_ufs device dir
-
-
-UFS OPTIONS
-===========
-
-ufstype=type_of_ufs
-	UFS is a file system widely used in different operating systems.
-	The problem are differences among implementations. Features of
-	some implementations are undocumented, so its hard to recognize
-	type of ufs automatically. That's why user must specify type of 
-	ufs manually by mount option ufstype. Possible values are:
-
-	old	old format of ufs
-		default value, supported as read-only
-
-	44bsd	used in FreeBSD, NetBSD, OpenBSD
-		supported as read-write
-
-	ufs2    used in FreeBSD 5.x
-		supported as read-write
-
-	5xbsd	synonym for ufs2
-
-	sun	used in SunOS (Solaris)
-		supported as read-write
-
-	sunx86	used in SunOS for Intel (Solarisx86)
-		supported as read-write
-
-	hp	used in HP-UX
-		supported as read-only
-
-	nextstep
-		used in NextStep
-		supported as read-only
-
-	nextstep-cd
-		used for NextStep CDROMs (block_size == 2048)
-		supported as read-only
-
-	openstep
-		used in OpenStep
-		supported as read-only
-
-
-POSSIBLE PROBLEMS
-=================
-
-See next section, if you have any.
-
-
-BUG REPORTS
-===========
-
-Any ufs bug report you can send to daniel.pirkl at email.cz or
-to dushistov at mail.ru (do not send partition tables bug reports).
-- 
2.7.4
