From: shobhitkukreti@gmail.com (Shobhit Kukreti)
Date: Wed, 10 Jul 2019 08:31:23 -0700
Subject: [Linux-kernel-mentees] [PATCH v3] Documentation: filesystems:
	Convert ufs.txt to reStructuredText format
In-Reply-To: <20190710092605.73ddee8b@coco.lan>
References: <20190710092605.73ddee8b@coco.lan>
Message-ID: <1562772683-32422-1-git-send-email-shobhitkukreti@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190710153123.AQyyxmtQCt_nsvjj_n_MD-EmGSP73xNSmO1T6Xc5zgk@z>

This converts the plain text documentation of ufs.txt to
reStructuredText format. Added to documentation build process
and verified with make htmldocs

Signed-off-by: Shobhit Kukreti <shobhitkukreti at gmail.com>
---
Changes in v3:
        1. Reverted to minimally changed ufs.rst
	2. Fix Minor Space Issues
        3. Used -M1 in git format-patch to show files as renamed
Changes in v2:
        1. Removed flat-table
        2. Moved ufs.rst to admin-guide

 Documentation/admin-guide/index.rst                |  1 +
 .../{filesystems/ufs.txt => admin-guide/ufs.rst}   | 36 +++++++++++++---------
 2 files changed, 23 insertions(+), 14 deletions(-)
 rename Documentation/{filesystems/ufs.txt => admin-guide/ufs.rst} (69%)

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
diff --git a/Documentation/filesystems/ufs.txt b/Documentation/admin-guide/ufs.rst
similarity index 69%
rename from Documentation/filesystems/ufs.txt
rename to Documentation/admin-guide/ufs.rst
index 7a602ad..55d1529 100644
--- a/Documentation/filesystems/ufs.txt
+++ b/Documentation/admin-guide/ufs.rst
@@ -1,37 +1,45 @@
-USING UFS
+=========
+Using UFS
 =========
 
 mount -t ufs -o ufstype=type_of_ufs device dir
 
 
-UFS OPTIONS
+UFS Options
 ===========
 
 ufstype=type_of_ufs
 	UFS is a file system widely used in different operating systems.
 	The problem are differences among implementations. Features of
 	some implementations are undocumented, so its hard to recognize
-	type of ufs automatically. That's why user must specify type of 
+	type of ufs automatically. That's why user must specify type of
 	ufs manually by mount option ufstype. Possible values are:
 
-	old	old format of ufs
+	old
+                old format of ufs
 		default value, supported as read-only
 
-	44bsd	used in FreeBSD, NetBSD, OpenBSD
+	44bsd
+                used in FreeBSD, NetBSD, OpenBSD
 		supported as read-write
 
-	ufs2    used in FreeBSD 5.x
+	ufs2
+                used in FreeBSD 5.x
 		supported as read-write
 
-	5xbsd	synonym for ufs2
+	5xbsd
+                synonym for ufs2
 
-	sun	used in SunOS (Solaris)
+	sun
+                used in SunOS (Solaris)
 		supported as read-write
 
-	sunx86	used in SunOS for Intel (Solarisx86)
+	sunx86
+                used in SunOS for Intel (Solarisx86)
 		supported as read-write
 
-	hp	used in HP-UX
+	hp
+                used in HP-UX
 		supported as read-only
 
 	nextstep
@@ -47,14 +55,14 @@ ufstype=type_of_ufs
 		supported as read-only
 
 
-POSSIBLE PROBLEMS
-=================
+Possible Problems
+-----------------
 
 See next section, if you have any.
 
 
-BUG REPORTS
-===========
+Bug Reports
+-----------
 
 Any ufs bug report you can send to daniel.pirkl at email.cz or
 to dushistov at mail.ru (do not send partition tables bug reports).
-- 
2.7.4
