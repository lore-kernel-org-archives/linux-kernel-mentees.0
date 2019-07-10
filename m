From: shobhitkukreti at gmail.com (Shobhit Kukreti)
Date: Tue,  9 Jul 2019 20:42:42 -0700
Subject: [Linux-kernel-mentees] [PATCH v2] Documentation: filesystems:
	Convert ufs.txt to reStructuredText format
In-Reply-To: <20190707013947.GA10663@t-1000>
References: <20190707013947.GA10663@t-1000>
Message-ID: <1562730162-2116-1-git-send-email-shobhitkukreti@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

This converts the plain text documentation of ufs.txt to reStructuredText format.
Added to documentation build process and verified with make htmldocs

Signed-off-by: Shobhit Kukreti <shobhitkukreti at gmail.com>
---
Changes in v2:
	1. Removed flat-table
	2. Moved ufs.rst to admin-guide
	
 Documentation/admin-guide/index.rst |  1 +
 Documentation/admin-guide/ufs.rst   | 48 +++++++++++++++++++++++++++++
 Documentation/filesystems/ufs.txt   | 60 -------------------------------------
 3 files changed, 49 insertions(+), 60 deletions(-)
 create mode 100644 Documentation/admin-guide/ufs.rst
 delete mode 100644 Documentation/filesystems/ufs.txt

diff --git a/Documentation/admin-guide/index.rst b/Documentation/admin-guide/index.rst
index 2871b79..9bfb076 100644
--- a/Documentation/admin-guide/index.rst
+++ b/Documentation/admin-guide/index.rst
@@ -71,6 +71,7 @@ configure specific aspects of kernel behavior to your liking.
    bcache
    ext4
    jfs
+   ufs
    pm/index
    thunderbolt
    LSM/index
diff --git a/Documentation/admin-guide/ufs.rst b/Documentation/admin-guide/ufs.rst
new file mode 100644
index 0000000..20b9c56
--- /dev/null
+++ b/Documentation/admin-guide/ufs.rst
@@ -0,0 +1,48 @@
+=========
+USING UFS
+=========
+
+mount -t ufs -o ufstype=type_of_ufs device dir
+
+UFS OPTIONS
+===========
+
+ufstype=type_of_ufs
+	UFS is a file system widely used in different operating systems.
+	The problem are differences among implementations. Features of
+	some implementations are undocumented, so its hard to recognize
+	type of ufs automatically. That's why user must specify type of 
+	ufs manually by mount option ufstype. Possible values are:
+
+	**old**	        old format of ufs default value, supported as read-only
+
+	**44bsd**       used in FreeBSD, NetBSD, OpenBSD supported as read-write
+
+	**ufs2**        used in FreeBSD 5.x supported as read-write
+
+	**5xbsd**       synonym for ufs2
+
+	**sun**         used in SunOS (Solaris)	supported as read-write
+
+	**sunx86**      used in SunOS for Intel (Solarisx86) supported as read-write
+
+	**hp**  used in HP-UX supported as read-only
+
+	**nextstep**    used in NextStep supported as read-only
+
+	**nextstep-cd** 	used for NextStep CDROMs (block_size == 2048) supported as read-only
+
+	**openstep**    used in OpenStep supported as read-only
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
