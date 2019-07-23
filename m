From: sheriffesseson@gmail.com (Sheriff Esseson)
Date: Tue, 23 Jul 2019 12:48:13 +0100
Subject: [Linux-kernel-mentees] [PATCH] Documentation: filesystem: fix
	"Removed Sysctls" table
Message-ID: <20190723114813.GA14870@localhost>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190723114813.KxUK3TJkt5gYDhkUz4DZ4f2GQJOVr1pbp51ch-TBiv8@z>

the "Removed Sysctls" section is a table - bring it alive with ReST.

Signed-off-by: Sheriff Esseson <sheriffesseson at gmail.com>
---
 Documentation/admin-guide/xfs.rst | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/xfs.rst b/Documentation/admin-guide/xfs.rst
index e76665a8f2f2..fb5b39f73059 100644
--- a/Documentation/admin-guide/xfs.rst
+++ b/Documentation/admin-guide/xfs.rst
@@ -337,11 +337,12 @@ None at present.
 Removed Sysctls
 ===============
 
+=============================	=======
   Name				Removed
-  ----				-------
+=============================	=======
   fs.xfs.xfsbufd_centisec	v4.0
   fs.xfs.age_buffer_centisecs	v4.0
-
+=============================	=======
 
 Error handling
 ==============
-- 
2.22.0
