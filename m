From: sheriffesseson@gmail.com (Sheriff Esseson)
Date: Thu, 27 Jun 2019 01:34:47 +0100
Subject: [Linux-kernel-mentees] [linux-kernel-mentees] [PATCH] Documentation
	: fs : Convert xfs.txt to xfs.rst
Message-ID: <20190627003447.23397-1-sheriffesseson@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190627003447.brxngX5zL1MRHM8eC6enXkgevsc5XYZSMi8xXISyGzQ@z>

- Convert xfs.txt to a ReST file for compatibility with doc-tools.

- Rename xfs.txt with xfs.rst accordingly.

Signed-off-by: Sheriff Esseson <sheriffesseson at gmail.com>
---
 .../filesystems/{xfs.txt => xfs.rst}          | 146 +++++++++---------
 Documentation/scsi/{scsi.txt => scsi.rst}     |  37 +++--
 2 files changed, 93 insertions(+), 90 deletions(-)
 rename Documentation/filesystems/{xfs.txt => xfs.rst} (82%)
 rename Documentation/scsi/{scsi.txt => scsi.rst} (72%)

diff --git a/Documentation/filesystems/xfs.txt b/Documentation/filesystems/xfs.rst
similarity index 82%
rename from Documentation/filesystems/xfs.txt
rename to Documentation/filesystems/xfs.rst
index a5cbb5e0e..8ac72bebd 100644
--- a/Documentation/filesystems/xfs.txt
+++ b/Documentation/filesystems/xfs.rst
@@ -1,7 +1,8 @@
+.. SPDX-License-Identifier: GPL-2.0
 
+======================
 The SGI XFS Filesystem
 ======================
-
 XFS is a high performance journaling filesystem which originated
 on the SGI IRIX platform.  It is completely multi-threaded, can
 support large files and large filesystems, extended attributes,
@@ -18,10 +19,11 @@ Mount Options
 =============
 
 When mounting an XFS filesystem, the following options are accepted.
-For boolean mount options, the names with the (*) suffix is the
-default behaviour.
 
-  allocsize=size
+**For most boolean mount options, the names with the "(*)" suffix is the
+default behaviour.**
+
+  ``allocsize=size``
 	Sets the buffered I/O end-of-file preallocation size when
 	doing delayed allocation writeout (default size is 64KiB).
 	Valid values for this option are page size (typically 4KiB)
@@ -34,12 +36,11 @@ default behaviour.
 	to the file. Specifying a fixed allocsize value turns off
 	the dynamic behaviour.
 
-  attr2
-  noattr2
+  ``attr2 | noattr2`` : Boolean
 	The options enable/disable an "opportunistic" improvement to
 	be made in the way inline extended attributes are stored
 	on-disk.  When the new form is used for the first time when
-	attr2 is selected (either when setting or removing extended
+	``attr2`` is selected (either when setting or removing extended
 	attributes) the on-disk superblock feature bit field will be
 	updated to reflect this format being in use.
 
@@ -48,78 +49,73 @@ default behaviour.
 	mount option it set, then that becomes the new default used
 	by the filesystem.
 
-	CRC enabled filesystems always use the attr2 format, and so
-	will reject the noattr2 mount option if it is set.
+	**Note:** CRC enabled filesystems always use the ``attr2`` format, and so
+	will reject the ``noattr2 mount`` option if it is set.
 
-  discard
-  nodiscard (*)
+  ``discard | nodiscard (*)`` : Boolean
 	Enable/disable the issuing of commands to let the block
 	device reclaim space freed by the filesystem.  This is
 	useful for SSD devices, thinly provisioned LUNs and virtual
 	machine images, but may have a performance impact.
 
-	Note: It is currently recommended that you use the fstrim
+	**Note:** It is currently recommended that you use the ``fstrim``
 	application to discard unused blocks rather than the discard
 	mount option because the performance impact of this option
 	is quite severe.
 
-  grpid/bsdgroups
-  nogrpid/sysvgroups (*)
+  ``grpid/bsdgroups | nogrpid/sysvgroups (*)`` : Boolean
 	These options define what group ID a newly created file
-	gets.  When grpid is set, it takes the group ID of the
+	gets.  When ``grpid`` is set, it takes the group ID of the
 	directory in which it is created; otherwise it takes the
 	fsgid of the current process, unless the directory has the
 	setgid bit set, in which case it takes the gid from the
 	parent directory, and also gets the setgid bit set if it is
 	a directory itself.
 
-  filestreams
+  ``filestreams``
 	Make the data allocator use the filestreams allocation mode
 	across the entire filesystem rather than just on directories
 	configured to use it.
 
-  ikeep
-  noikeep (*)
+  ``ikeep | noikeep (*)``
 	When ikeep is specified, XFS does not delete empty inode
 	clusters and keeps them around on disk.  When noikeep is
 	specified, empty inode clusters are returned to the free
 	space pool.
 
-  inode32
-  inode64 (*)
-	When inode32 is specified, it indicates that XFS limits
+  ``inode32 | inode64 (*)`` : Boolean
+	When ``inode32`` is specified, it indicates that XFS limits
 	inode creation to locations which will not result in inode
 	numbers with more than 32 bits of significance.
 
-	When inode64 is specified, it indicates that XFS is allowed
+	When ``inode64`` is specified, it indicates that XFS is allowed
 	to create inodes at any location in the filesystem,
 	including those which will result in inode numbers occupying
-	more than 32 bits of significance. 
+	more than 32 bits of significance.
 
-	inode32 is provided for backwards compatibility with older
+	**Note:** ``inode32`` is provided for backwards compatibility with older
 	systems and applications, since 64 bits inode numbers might
 	cause problems for some applications that cannot handle
 	large inode numbers.  If applications are in use which do
-	not handle inode numbers bigger than 32 bits, the inode32
+	not handle inode numbers bigger than 32 bits, the ``inode32``
 	option should be specified.
 
 
-  largeio
-  nolargeio (*)
-	If "nolargeio" is specified, the optimal I/O reported in
-	st_blksize by stat(2) will be as small as possible to allow
+  ``largeio | nolargeio (*)`` : Boolean
+	If ``nolargeio`` is specified, the optimal I/O reported in
+	``st_blksize`` by ``stat(2)`` will be as small as possible to allow
 	user applications to avoid inefficient read/modify/write
 	I/O.  This is typically the page size of the machine, as
 	this is the granularity of the page cache.
 
-	If "largeio" specified, a filesystem that was created with a
-	"swidth" specified will return the "swidth" value (in bytes)
-	in st_blksize. If the filesystem does not have a "swidth"
-	specified but does specify an "allocsize" then "allocsize"
+	If ``largeio`` specified, a filesystem that was created with a
+	``swidth`` specified will return the ``swidth`` value (in bytes)
+	in st_blksize. If the filesystem does not have a ``swidth``
+	specified but does specify an ``allocsize`` then ``allocsize``
 	(in bytes) will be returned instead. Otherwise the behaviour
-	is the same as if "nolargeio" was specified.
+	is the same as if ``nolargeio`` was specified.
 
-  logbufs=value
+  ``logbufs=<value>``
 	Set the number of in-memory log buffers.  Valid numbers
 	range from 2-8 inclusive.
 
@@ -131,7 +127,7 @@ default behaviour.
 	controls the size of each buffer and so is also relevant to
 	this case.
 
-  logbsize=value
+  ``logbsize=<value>``
 	Set the size of each in-memory log buffer.  The size may be
 	specified in bytes, or in kilobytes with a "k" suffix.
 	Valid sizes for version 1 and version 2 logs are 16384 (16k)
@@ -143,50 +139,50 @@ default behaviour.
 	The default value for for version 1 logs is 32768, while the
 	default value for version 2 logs is MAX(32768, log_sunit).
 
-  logdev=device and rtdev=device
+  ``logdev=device and rtdev=device``
 	Use an external log (metadata journal) and/or real-time device.
 	An XFS filesystem has up to three parts: a data section, a log
 	section, and a real-time section.  The real-time section is
 	optional, and the log section can be separate from the data
 	section or contained within it.
 
-  noalign
+  ``noalign``
 	Data allocations will not be aligned at stripe unit
 	boundaries. This is only relevant to filesystems created
 	with non-zero data alignment parameters (sunit, swidth) by
 	mkfs.
 
-  norecovery
+  ``norecovery``
 	The filesystem will be mounted without running log recovery.
 	If the filesystem was not cleanly unmounted, it is likely to
-	be inconsistent when mounted in "norecovery" mode.
+	be inconsistent when mounted in ``norecovery`` mode.
 	Some files or directories may not be accessible because of this.
-	Filesystems mounted "norecovery" must be mounted read-only or
+	Filesystems mounted ``norecovery`` must be mounted read-only or
 	the mount will fail.
 
-  nouuid
+  ``nouuid``
 	Don't check for double mounted file systems using the file
 	system uuid.  This is useful to mount LVM snapshot volumes,
 	and often used in combination with "norecovery" for mounting
 	read-only snapshots.
 
-  noquota
+ ``noquota``
 	Forcibly turns off all quota accounting and enforcement
 	within the filesystem.
 
-  uquota/usrquota/uqnoenforce/quota
+  ``uquota/usrquota/uqnoenforce/quota``
 	User disk quota accounting enabled, and limits (optionally)
 	enforced.  Refer to xfs_quota(8) for further details.
 
-  gquota/grpquota/gqnoenforce
+  ``gquota/grpquota/gqnoenforce``
 	Group disk quota accounting enabled and limits (optionally)
 	enforced.  Refer to xfs_quota(8) for further details.
 
-  pquota/prjquota/pqnoenforce
+ ``pquota/prjquota/pqnoenforce``
 	Project disk quota accounting enabled and limits (optionally)
 	enforced.  Refer to xfs_quota(8) for further details.
 
-  sunit=value and swidth=value
+  ``sunit=<value> and swidth=<value>``
 	Used to specify the stripe unit and width for a RAID device
 	or a stripe volume.  "value" must be specified in 512-byte
 	block units. These options are only relevant to filesystems
@@ -203,12 +199,12 @@ default behaviour.
 	modified, such as adding a new disk to a RAID5 lun and
 	reshaping it.
 
-  swalloc
+  ``swalloc``
 	Data allocations will be rounded up to stripe width boundaries
 	when the current end of file is being extended and the file
 	size is larger than the stripe width size.
 
-  wsync
+  ``wsync``
 	When specified, all filesystem namespace operations are
 	executed synchronously. This ensures that when the namespace
 	operation (create, unlink, etc) completes, the change to the
@@ -238,32 +234,32 @@ Removed Mount Options
   nobarrier			v4.19
 
 
-sysctls
-=======
+``sysctls``
+=============
 
 The following sysctls are available for the XFS filesystem:
 
-  fs.xfs.stats_clear		(Min: 0  Default: 0  Max: 1)
+  ``fs.xfs.stats_clear``		(Min: 0  Default: 0  Max: 1)
 	Setting this to "1" clears accumulated XFS statistics
 	in /proc/fs/xfs/stat.  It then immediately resets to "0".
 
-  fs.xfs.xfssyncd_centisecs	(Min: 100  Default: 3000  Max: 720000)
+  ``fs.xfs.xfssyncd_centisecs``	(Min: 100  Default: 3000  Max: 720000)
 	The interval at which the filesystem flushes metadata
 	out to disk and runs internal cache cleanup routines.
 
-  fs.xfs.filestream_centisecs	(Min: 1  Default: 3000  Max: 360000)
+  ``fs.xfs.filestream_centisecs``	(Min: 1  Default: 3000  Max: 360000)
 	The interval at which the filesystem ages filestreams cache
 	references and returns timed-out AGs back to the free stream
 	pool.
 
-  fs.xfs.speculative_prealloc_lifetime
+  ``fs.xfs.speculative_prealloc_lifetime``
 		(Units: seconds   Min: 1  Default: 300  Max: 86400)
 	The interval at which the background scanning for inodes
 	with unused speculative preallocation runs. The scan
 	removes unused preallocation from clean inodes and releases
 	the unused space back to the free pool.
 
-  fs.xfs.error_level		(Min: 0  Default: 3  Max: 11)
+  ``fs.xfs.error_level``		(Min: 0  Default: 3  Max: 11)
 	A volume knob for error reporting when internal errors occur.
 	This will generate detailed messages & backtraces for filesystem
 	shutdowns, for example.  Current threshold values are:
@@ -272,7 +268,7 @@ The following sysctls are available for the XFS filesystem:
 		XFS_ERRLEVEL_LOW:       1
 		XFS_ERRLEVEL_HIGH:      5
 
-  fs.xfs.panic_mask		(Min: 0  Default: 0  Max: 256)
+ ``fs.xfs.panic_mask``		(Min: 0  Default: 0  Max: 256)
 	Causes certain error conditions to call BUG(). Value is a bitmask;
 	OR together the tags which represent errors which should cause panics:
 
@@ -289,43 +285,43 @@ The following sysctls are available for the XFS filesystem:
 
 	This option is intended for debugging only.
 
-  fs.xfs.irix_symlink_mode	(Min: 0  Default: 0  Max: 1)
+  ``fs.xfs.irix_symlink_mode``	(Min: 0  Default: 0  Max: 1)
 	Controls whether symlinks are created with mode 0777 (default)
 	or whether their mode is affected by the umask (irix mode).
 
-  fs.xfs.irix_sgid_inherit	(Min: 0  Default: 0  Max: 1)
+  ``fs.xfs.irix_sgid_inherit``	(Min: 0  Default: 0  Max: 1)
 	Controls files created in SGID directories.
 	If the group ID of the new file does not match the effective group
 	ID or one of the supplementary group IDs of the parent dir, the
 	ISGID bit is cleared if the irix_sgid_inherit compatibility sysctl
 	is set.
 
-  fs.xfs.inherit_sync		(Min: 0  Default: 1  Max: 1)
+  ``fs.xfs.inherit_sync``		(Min: 0  Default: 1  Max: 1)
 	Setting this to "1" will cause the "sync" flag set
-	by the xfs_io(8) chattr command on a directory to be
+	by the ``xfs_io(8)`` chattr command on a directory to be
 	inherited by files in that directory.
 
-  fs.xfs.inherit_nodump		(Min: 0  Default: 1  Max: 1)
+  ``fs.xfs.inherit_nodump``		(Min: 0  Default: 1  Max: 1)
 	Setting this to "1" will cause the "nodump" flag set
 	by the xfs_io(8) chattr command on a directory to be
 	inherited by files in that directory.
 
-  fs.xfs.inherit_noatime	(Min: 0  Default: 1  Max: 1)
+  ``fs.xfs.inherit_noatime``	(Min: 0  Default: 1  Max: 1)
 	Setting this to "1" will cause the "noatime" flag set
 	by the xfs_io(8) chattr command on a directory to be
 	inherited by files in that directory.
 
-  fs.xfs.inherit_nosymlinks	(Min: 0  Default: 1  Max: 1)
+  ``fs.xfs.inherit_nosymlinks``	(Min: 0  Default: 1  Max: 1)
 	Setting this to "1" will cause the "nosymlinks" flag set
 	by the xfs_io(8) chattr command on a directory to be
 	inherited by files in that directory.
 
-  fs.xfs.inherit_nodefrag	(Min: 0  Default: 1  Max: 1)
+  ``fs.xfs.inherit_nodefrag``	(Min: 0  Default: 1  Max: 1)
 	Setting this to "1" will cause the "nodefrag" flag set
 	by the xfs_io(8) chattr command on a directory to be
 	inherited by files in that directory.
 
-  fs.xfs.rotorstep		(Min: 1  Default: 1  Max: 256)
+  ``fs.xfs.rotorstep``		(Min: 1  Default: 1  Max: 256)
 	In "inode32" allocation mode, this option determines how many
 	files the allocator attempts to allocate in the same allocation
 	group before moving to the next allocation group.  The intent
@@ -347,25 +343,25 @@ Removed Sysctls
   fs.xfs.age_buffer_centisecs	v4.0
 
 
-Error handling
+Error Handling
 ==============
 
 XFS can act differently according to the type of error found during its
 operation. The implementation introduces the following concepts to the error
 handler:
 
- -failure speed:
+ **-failure speed:**
 	Defines how fast XFS should propagate an error upwards when a specific
 	error is found during the filesystem operation. It can propagate
 	immediately, after a defined number of retries, after a set time period,
 	or simply retry forever.
 
- -error classes:
+ **-error classes:**
 	Specifies the subsystem the error configuration will apply to, such as
 	metadata IO or memory allocation. Different subsystems will have
 	different error handlers for which behaviour can be configured.
 
- -error handlers:
+ **-error handlers:**
 	Defines the behavior for a specific error.
 
 The filesystem behavior during an error can be set via sysfs files. Each
@@ -404,7 +400,7 @@ level directory:
 
   /sys/fs/xfs/<dev>/error/
 
-  fail_at_unmount		(Min:  0  Default:  1  Max: 1)
+  ``fail_at_unmount``		(Min:  0  Default:  1  Max: 1)
 	Defines the filesystem error behavior at unmount time.
 
 	If set to a value of 1, XFS will override all other error configurations
@@ -418,7 +414,7 @@ level directory:
 	filesystem from ever unmounting fully in the case of "retry forever"
 	handler configurations.
 
-	Note: there is no guarantee that fail_at_unmount can be set while an
+	**Note:** there is no guarantee that fail_at_unmount can be set while an
 	unmount is in progress. It is possible that the sysfs entries are
 	removed by the unmounting filesystem before a "retry forever" error
 	handler configuration causes unmount to hang, and hence the filesystem
@@ -434,7 +430,7 @@ to be propagated. The handler configurations are found in the directory:
 
   /sys/fs/xfs/<dev>/error/<class>/<error>/
 
-  max_retries			(Min: -1  Default: Varies  Max: INTMAX)
+  ``max_retries``			(Min: -1  Default: Varies  Max: INTMAX)
 	Defines the allowed number of retries of a specific error before
 	the filesystem will propagate the error. The retry count for a given
 	error context (e.g. a specific metadata buffer) is reset every time
@@ -449,7 +445,7 @@ to be propagated. The handler configurations are found in the directory:
 	Setting the value to "N" (where 0 < N < Max) will make XFS retry the
 	operation "N" times before propagating the error.
 
-  retry_timeout_seconds		(Min:  -1  Default:  Varies  Max: 1 day)
+  ``retry_timeout_seconds``		(Min:  -1  Default:  Varies  Max: 1 day)
 	Define the amount of time (in seconds) that the filesystem is
 	allowed to retry its operations when the specific error is
 	found.
@@ -463,7 +459,7 @@ to be propagated. The handler configurations are found in the directory:
 	Setting the value to "N" (where 0 < N < Max) will allow XFS to retry the
 	operation for up to "N" seconds before propagating the error.
 
-Note: The default behaviour for a specific error handler is dependent on both
+**Note:** The default behaviour for a specific error handler is dependent on both
 the class and error context. For example, the default values for
 "metadata/ENODEV" are "0" rather than "-1" so that this error handler defaults
 to "fail immediately" behaviour. This is done because ENODEV is a fatal,
diff --git a/Documentation/scsi/scsi.txt b/Documentation/scsi/scsi.rst
similarity index 72%
rename from Documentation/scsi/scsi.txt
rename to Documentation/scsi/scsi.rst
index 3d99d38cb..bf6d8c5c4 100644
--- a/Documentation/scsi/scsi.txt
+++ b/Documentation/scsi/scsi.rst
@@ -1,5 +1,10 @@
-SCSI subsystem documentation
+.. SPDX-License-Identifier: GPL-2.0
+..
+
+============================
+SCSI Subsystem Documentation
 ============================
+
 The Linux Documentation Project (LDP) maintains a document describing
 the SCSI subsystem in the Linux kernel (lk) 2.4 series. See:
 http://www.tldp.org/HOWTO/SCSI-2.4-HOWTO . The LDP has single
@@ -9,36 +14,38 @@ http://web.archive.org/web/*/http://www.torque.net/scsi/SCSI-2.4-HOWTO
 
 Notes on using modules in the SCSI subsystem
 ============================================
-The scsi support in the linux kernel can be modularized in a number of 
+The scsi support in the linux kernel can be modularized in a number of
 different ways depending upon the needs of the end user.  To understand
 your options, we should first define a few terms.
 
-The scsi-core (also known as the "mid level") contains the core of scsi 
+The SCSI-CORE
+        Also known as the "mid level", contains the core of scsi
 support.  Without it you can do nothing with any of the other scsi drivers.
+
 The scsi core support can be a module (scsi_mod.o), or it can be built into
-the kernel. If the core is a module, it must be the first scsi module 
-loaded, and if you unload the modules, it will have to be the last one 
+the kernel. If the core is a module, it must be the first scsi module
+loaded, and if you unload the modules, it will have to be the last one
 unloaded.  In practice the modprobe and rmmod commands (and "autoclean")
 will enforce the correct ordering of loading and unloading modules in
 the SCSI subsystem.
 
-The individual upper and lower level drivers can be loaded in any order 
+The individual upper and lower level drivers can be loaded in any order
 once the scsi core is present in the kernel (either compiled in or loaded
-as a module).  The disk driver (sd_mod.o), cdrom driver (sr_mod.o),
-tape driver ** (st.o) and scsi generics driver (sg.o) represent the upper 
-level drivers to support the various assorted devices which can be 
-controlled.  You can for example load the tape driver to use the tape drive, 
+as a module).  The disk driver ``(sd_mod.o)``, cdrom driver ``(sr_mod.o)``,
+tape driver ``(st.o)`` and scsi generics driver ``(sg.o)`` represent the upper
+level drivers to support the various assorted devices which can be
+controlled.  You can for example load the tape driver to use the tape drive,
 and then unload it once you have no further need for the driver (and release
 the associated memory).
 
 The lower level drivers are the ones that support the individual cards that
 are supported for the hardware platform that you are running under. Those
-individual cards are often called Host Bus Adapters (HBAs). For example the
-aic7xxx.o driver is used to control all recent SCSI controller cards from 
-Adaptec. Almost all lower level drivers can be built either as modules or 
+individual cards are often called **Host Bus Adapters** (HBAs). For example the
+``aic7xxx.o`` driver is used to control all recent SCSI controller cards from
+Adaptec. Almost all lower level drivers can be built either as modules or
 built into the kernel.
 
 
-** There is a variant of the st driver for controlling OnStream tape
-   devices. Its module name is osst.o .
+**Note:** There is a variant of the st driver for controlling OnStream tape
+   devices. Its module name is ``osst.o``.
 
-- 
2.22.0
