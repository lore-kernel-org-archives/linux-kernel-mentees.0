From: shobhitkukreti at gmail.com (Shobhit Kukreti)
Date: Tue,  9 Jul 2019 20:25:25 -0700
Subject: [Linux-kernel-mentees] [PATCH v2] Documentation: filesystems:
	Convert jfs.txt to
In-Reply-To: <20190708195717.GG32320@bombadil.infradead.org>
References: <20190708195717.GG32320@bombadil.infradead.org>
Message-ID: <1562729125-31475-1-git-send-email-shobhitkukreti@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

This converts the plain text documentation of jfs.txt to reStructuredText format.
Added to documentation build process and verified with make htmldocs

Signed-off-by: Shobhit Kukreti <shobhitkukreti at gmail.com>
---
Changes in v2:
        1. Removed flat-table.
        2. Moved jfs.rst from filesystem to admin-guide

 Documentation/admin-guide/index.rst |  1 +
 Documentation/admin-guide/jfs.rst   | 50 +++++++++++++++++++++++++++++++++++
 Documentation/filesystems/jfs.txt   | 52 -------------------------------------
 3 files changed, 51 insertions(+), 52 deletions(-)
 create mode 100644 Documentation/admin-guide/jfs.rst
 delete mode 100644 Documentation/filesystems/jfs.txt

diff --git a/Documentation/admin-guide/index.rst b/Documentation/admin-guide/index.rst
index 8001917..2871b79 100644
--- a/Documentation/admin-guide/index.rst
+++ b/Documentation/admin-guide/index.rst
@@ -70,6 +70,7 @@ configure specific aspects of kernel behavior to your liking.
    ras
    bcache
    ext4
+   jfs
    pm/index
    thunderbolt
    LSM/index
diff --git a/Documentation/admin-guide/jfs.rst b/Documentation/admin-guide/jfs.rst
new file mode 100644
index 0000000..a0a95e5
--- /dev/null
+++ b/Documentation/admin-guide/jfs.rst
@@ -0,0 +1,50 @@
+===========================================
+IBM's Journaled File System (JFS) for Linux
+===========================================
+
+JFS Homepage:  `<http://jfs.sourceforge.net/>`_
+
+The following mount options are supported:
+(*) == default
+
+**iocharset=name**      Character set to use for converting from Unicode to ASCII. The default is to do no conversion.
+
+**iocharset=utf8**      Use for UTF-8 translations. This requires CONFIG_NLS_UTF8 to be set in the kernel .config file.
+
+**iocharset=none**      specifies the default behavior explicitly.
+
+**resize=value**        Resize the volume to <value> blocks. JFS only supports growing a volume, not shrinking it.
+This option is only valid during a remount, when the volume is mounted read-write. The resize keyword with no value 
+will grow the volume to the full size of the partition.
+
+
+**nointegrity**	        Do not write to the journal. The primary use of this option is to allow for higher performance 
+when restoring a volume from backup media. The integrity of the volume is not guaranteed if the system abnormally abends.
+
+**integrity(*)**	Commit metadata changes to the journal. Use this option to remount a volume where the nointegrity 
+option was previously specified in order to restore normal behavior.
+
+**errors=continue**	Keep going on a filesystem error.
+
+**errors=remount-ro(*)**	Remount the filesystem read-only on an error.
+
+**errors=panic**	Panic and halt the machine if an error occurs.
+
+**uid=value**	Override on-disk uid with specified value
+
+**gid=value**	Override on-disk gid with specified value
+
+**umask=value**	Override on-disk umask with specified octal value. For directories, the execute bit will be set if the 
+corresponding  read bit is set.
+
+**discard=minlen, discard, nodiscard(*)**
+
+This enables/disables the use of discard/TRIM commands. The discard/TRIM 
+commands are sent to the underlying block device when blocks are freed. This is useful for SSD devices and 
+sparse/thinly-provisioned LUNs. The FITRIM ioctl command is also available together with the nodiscard option.
+The value of minlen specifies the minimum blockcount, when a TRIM command to the block device is considered useful.
+When no value is given to the discard option, it defaults to 64 blocks, which means 256KiB in JFS. The minlen value 
+of discard overrides the minlen value given on an FITRIM ioctl().
+
+The JFS mailing list can be subscribed to by using the link labeled
+"Mail list Subscribe" at our web page `<http://jfs.sourceforge.net/>`_
diff --git a/Documentation/filesystems/jfs.txt b/Documentation/filesystems/jfs.txt
deleted file mode 100644
index 41fd757..0000000
--- a/Documentation/filesystems/jfs.txt
+++ /dev/null
@@ -1,52 +0,0 @@
-IBM's Journaled File System (JFS) for Linux
-
-JFS Homepage:  http://jfs.sourceforge.net/
-
-The following mount options are supported:
-(*) == default
-
-iocharset=name	Character set to use for converting from Unicode to
-		ASCII.  The default is to do no conversion.  Use
-		iocharset=utf8 for UTF-8 translations.  This requires
-		CONFIG_NLS_UTF8 to be set in the kernel .config file.
-		iocharset=none specifies the default behavior explicitly.
-
-resize=value	Resize the volume to <value> blocks.  JFS only supports
-		growing a volume, not shrinking it.  This option is only
-		valid during a remount, when the volume is mounted
-		read-write.  The resize keyword with no value will grow
-		the volume to the full size of the partition.
-
-nointegrity	Do not write to the journal.  The primary use of this option
-		is to allow for higher performance when restoring a volume
-		from backup media.  The integrity of the volume is not
-		guaranteed if the system abnormally abends.
-
-integrity(*)	Commit metadata changes to the journal.  Use this option to
-		remount a volume where the nointegrity option was
-		previously specified in order to restore normal behavior.
-
-errors=continue		Keep going on a filesystem error.
-errors=remount-ro(*)	Remount the filesystem read-only on an error.
-errors=panic		Panic and halt the machine if an error occurs.
-
-uid=value	Override on-disk uid with specified value
-gid=value	Override on-disk gid with specified value
-umask=value	Override on-disk umask with specified octal value.  For
-		directories, the execute bit will be set if the corresponding
-		read bit is set.
-
-discard=minlen	This enables/disables the use of discard/TRIM commands.
-discard		The discard/TRIM commands are sent to the underlying
-nodiscard(*)	block device when blocks are freed. This is useful for SSD
-		devices and sparse/thinly-provisioned LUNs.  The FITRIM ioctl
-		command is also available together with the nodiscard option.
-		The value of minlen specifies the minimum blockcount, when
-		a TRIM command to the block device is considered useful.
-		When no value is given to the discard option, it defaults to
-		64 blocks, which means 256KiB in JFS.
-		The minlen value of discard overrides the minlen value given
-		on an FITRIM ioctl().
-
-The JFS mailing list can be subscribed to by using the link labeled
-"Mail list Subscribe" at our web page http://jfs.sourceforge.net/
-- 
2.7.4
