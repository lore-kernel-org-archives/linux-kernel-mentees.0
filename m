Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DC32FDC3F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Aug 2025 17:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755020410; cv=none; b=YgMuB6NNBjUztWWjKGE2+hJJD7GnI02McQzQpTunUpR1fEhJ/4j40/BhRXyb2lTperZJIzf4JjB+FWWlO3nlvLwOWWukdEF0wnJCIlOcm4scvgcEOMo75WJ3YumEyHTsQYeRViwvkWj6q+lX/zwVbyo6jOJfJIMAd5QjFL+hxOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755020410; c=relaxed/simple;
	bh=TocwVLOEB5XV1gbfP3Auy1jcleuECYNnrJVj3OjWh6A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=ewxdytJsUShEUzBmKWH5kvcSCMOCJrvTn3DaV6KOXuv+O71kEO0hKpIWl7EMYF0w7F3CQzcbN4L3Lh1Qr8JTDJGHrS2UBiUl5ctsZeRd3vZ/jwJzD79hPNhIi2v8M4UE/hGg0RKtTDudtFL3Af/9ay/x5MKssO3Z6jyONlop8Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gkxrUv6v; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gkxrUv6v"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 36E0240065
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Aug 2025 17:40:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 3.986
X-Spam-Level: ***
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id abUk5crX7hAn for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Aug 2025 17:40:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=sohammetha01@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7BFC04002A
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BFC04002A
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gkxrUv6v
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 7BFC04002A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Aug 2025 17:40:07 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-76bd2b11f80so5316035b3a.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Aug 2025 10:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755020407; x=1755625207; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yyx7QBE1HdTMr+wK3W6o508v+6XZUO5YXF3fJFpQ8Lg=;
        b=gkxrUv6v2+gJhf4l8nWF2j+fyY1xYyZpyNED62SMBl8JwAex8YpaUpHdcByue1olAv
         mXkShwDdb9nRNroT40diG5kTVhapYvb/hL/6Eg7CKFcI+wbqR1sobsS9StY+kXuKt0Gq
         g4xfj0gifwEN/V+PK9+keuV+WaW/KuMKGZ1szBOZWsUBIYxN1dxfS8hgl+qZmmvXbM3P
         xtdJx/LF7BLXbTgK4/Q7nm5spHEbA7GhPcu3fmont03r5QQOHFOHpR/iRtaoUPkL9VSO
         zJ/BRGsASdnwouUpb7OiVNcjL8wqAM5voo+sGTkVHJ9UOFOyTIiHVaDsbfcVUCdKk6kb
         IzEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755020407; x=1755625207;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yyx7QBE1HdTMr+wK3W6o508v+6XZUO5YXF3fJFpQ8Lg=;
        b=WcDEcKoYmnpz7pJnYBH4tjCkmhq4x6zh+5KTNYzIT/GDEIDmske77BiAeVRh2H1Z5M
         avtnAV5w97h6cdqjIUoT1ODk8Z4hmTBQary/4pu2jn9Zm/foAFUGh6kuvVuXgkYaTU+Z
         nk9fz0U/R7XryMYaqoybLwYKzR1tcPCvKBQMPJaH7JNKmZIHomq93HMuOAnYnoS7EOs2
         joGooE/yyqOlEVEx0Y/JWtEqQ5ENBleZ3EP9AE0+mXE08I28I2DLjOGAiA5wc2BU4Fhc
         a9B2fS9b9ySzfZvu8n1p6/GBnaYOmCK48BdGQ591+EsHwm15E9S3LlrENQQHZj77fUoD
         3itA==
X-Gm-Message-State: AOJu0YydTmWoEOjKJltlZ0amAIEW+51MbJ8ghUZzaUGzs0tPXQ7NgszR
	xKJIGYZNru+FfvZUA7OKtHODdu4p1+jgJy4RA1hLVmoDhZ6f4iJ+yvfw
X-Gm-Gg: ASbGnct/FRJeL12VJM/O2u9PmUl7AEXiD6f8bBjbAbtDTVDNkglMZ4S8nz2q/DTYfbx
	SOK3tgaf4YtktSvKIyhYHxDVaZub8d9BjwVgxUT2Os2/rZZ/asWAUZ7CrVHZ6Zv0imq87oKixql
	W8EEGmfii4ALQPebuKfk7mIc2TVDRTwDxJce6XP9B5CB2LWLQeOAWd1xr732gVUpAocPK5aVY8B
	hhgZ/Lk/AtcfwLBzgXC+fOfBDdQtDg3nhhZI2QQ/mNWhA9hTVImIiWuzVeG4trv9R4a2XAG9iJJ
	B3glTqo42vpggSFhaajLItPQ6sDlvBBiroOVd6oxDLgwzHi0/vJzEIlBIAb6OuM4PG3opvt1x0o
	IFVl74QuaxvIPXgkCc06fiZ0kB9qJlsel4y6qPHR/jg==
X-Google-Smtp-Source: AGHT+IGOeIXoT0DNozfxYJyFMhODlnRgCfgda7DRTMqeWV97DgXp1NykiFOe5OZ+vBQ47Y9zL5xJyw==
X-Received: by 2002:a17:903:fab:b0:235:c9a7:d5f5 with SMTP id d9443c01a7336-2430d0c9b8emr888825ad.13.1755020406364;
        Tue, 12 Aug 2025 10:40:06 -0700 (PDT)
Received: from soham-laptop.. ([103.182.158.111])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1f0e9bdsm303688995ad.53.2025.08.12.10.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 10:40:05 -0700 (PDT)
From: Soham Metha <sohammetha01@gmail.com>
To: linux-doc@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	jaegeuk@kernel.org,
	chao@kernel.org,
	dlemoal@kernel.org,
	hch@lst.de,
	tj@kernel.org,
	hannes@cmpxchg.org,
	mkoutny@suse.com,
	agk@redhat.com,
	snitzer@kernel.org,
	mpatocka@redhat.com,
	kuurtb@gmail.com,
	sj@kernel.org,
	corbet@lwn.net,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	Soham Metha <sohammetha01@gmail.com>
Subject: [PATCH] docs: fix spelling mistakes across multiple directories
Date: Tue, 12 Aug 2025 23:09:03 +0530
Message-Id: <20250812173903.43333-1-sohammetha01@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Used codespell to detect spelling mistakes across 5 directories

- Documentation/ABI
- Documentation/accel
- Documentation/accounting
- Documentation/admin-guide
- Documentation/arch

and fixed various simple typos found after filtering out the 
abbreviations, names, and non-english words.

Signed-off-by: Soham Metha <sohammetha01@gmail.com>
---
Specific changes:
 - deivces → devices
 - intiating → initiating
 - conventioanl → conventional
 - directoy → directory
 - flushs → flushes
 - explicitely → explicitly
 - aproximate → approximate
 - entension → extension

 Documentation/ABI/testing/sysfs-fs-f2fs             | 4 ++--
 Documentation/admin-guide/blockdev/zoned_loop.rst   | 4 ++--
 Documentation/admin-guide/cgroup-v2.rst             | 2 +-
 Documentation/admin-guide/device-mapper/delay.rst   | 8 ++++----
 Documentation/admin-guide/laptops/alienware-wmi.rst | 2 +-
 Documentation/admin-guide/mm/damon/usage.rst        | 2 +-
 Documentation/admin-guide/tainted-kernels.rst       | 2 +-
 Documentation/arch/loongarch/irq-chip-model.rst     | 2 +-
 8 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index bc0e7fefc39d..1ccd8ef1dc65 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -822,8 +822,8 @@ What:		/sys/fs/f2fs/<disk>/gc_valid_thresh_ratio
 Date:		September 2024
 Contact:	"Daeho Jeong" <daehojeong@google.com>
 Description:	It controls the valid block ratio threshold not to trigger excessive GC
-		for zoned deivces. The initial value of it is 95(%). F2FS will stop the
-		background GC thread from intiating GC for sections having valid blocks
+		for zoned devices. The initial value of it is 95(%). F2FS will stop the
+		background GC thread from initiating GC for sections having valid blocks
 		exceeding the ratio.
 
 What:		/sys/fs/f2fs/<disk>/max_read_extent_count
diff --git a/Documentation/admin-guide/blockdev/zoned_loop.rst b/Documentation/admin-guide/blockdev/zoned_loop.rst
index 9c7aa3b482f3..2d50d081592b 100644
--- a/Documentation/admin-guide/blockdev/zoned_loop.rst
+++ b/Documentation/admin-guide/blockdev/zoned_loop.rst
@@ -77,9 +77,9 @@ capacity_mb        Device total capacity in MiB. This is always rounded up to
 zone_size_mb       Device zone size in MiB. Default: 256 MiB.
 zone_capacity_mb   Device zone capacity (must always be equal to or lower than
                    the zone size. Default: zone size.
-conv_zones         Total number of conventioanl zones starting from sector 0.
+conv_zones         Total number of conventional zones starting from sector 0.
                    Default: 8.
-base_dir           Path to the base directoy where to create the directory
+base_dir           Path to the base directory where to create the directory
                    containing the zone files of the device.
                    Default=/var/local/zloop.
                    The device directory containing the zone files is always
diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index d9d3cc7df348..29172f03b863 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -435,7 +435,7 @@ both cgroups.
 Controlling Controllers
 -----------------------
 
-Availablity
+Availability
 ~~~~~~~~~~~
 
 A controller is available in a cgroup when it is supported by the kernel (i.e.,
diff --git a/Documentation/admin-guide/device-mapper/delay.rst b/Documentation/admin-guide/device-mapper/delay.rst
index 4d667228e744..a1e673c0e782 100644
--- a/Documentation/admin-guide/device-mapper/delay.rst
+++ b/Documentation/admin-guide/device-mapper/delay.rst
@@ -3,7 +3,7 @@ dm-delay
 ========
 
 Device-Mapper's "delay" target delays reads and/or writes
-and/or flushs and optionally maps them to different devices.
+and/or flushes and optionally maps them to different devices.
 
 Arguments::
 
@@ -18,7 +18,7 @@ Table line has to either have 3, 6 or 9 arguments:
    to write and flush operations on optionally different write_device with
    optionally different sector offset
 
-9: same as 6 arguments plus define flush_offset and flush_delay explicitely
+9: same as 6 arguments plus define flush_offset and flush_delay explicitly
    on/with optionally different flush_device/flush_offset.
 
 Offsets are specified in sectors.
@@ -40,7 +40,7 @@ Example scripts
 	#!/bin/sh
 	#
 	# Create mapped device delaying write and flush operations for 400ms and
-	# splitting reads to device $1 but writes and flushs to different device $2
+	# splitting reads to device $1 but writes and flushes to different device $2
 	# to different offsets of 2048 and 4096 sectors respectively.
 	#
 	dmsetup create delayed --table "0 `blockdev --getsz $1` delay $1 2048 0 $2 4096 400"
@@ -48,7 +48,7 @@ Example scripts
 ::
 	#!/bin/sh
 	#
-	# Create mapped device delaying reads for 50ms, writes for 100ms and flushs for 333ms
+	# Create mapped device delaying reads for 50ms, writes for 100ms and flushes for 333ms
 	# onto the same backing device at offset 0 sectors.
 	#
 	dmsetup create delayed --table "0 `blockdev --getsz $1` delay $1 0 50 $2 0 100 $1 0 333"
diff --git a/Documentation/admin-guide/laptops/alienware-wmi.rst b/Documentation/admin-guide/laptops/alienware-wmi.rst
index 27a32a8057da..e532c60db8e2 100644
--- a/Documentation/admin-guide/laptops/alienware-wmi.rst
+++ b/Documentation/admin-guide/laptops/alienware-wmi.rst
@@ -105,7 +105,7 @@ information.
 
 Manual fan control on the other hand, is not exposed directly by the AWCC
 interface. Instead it let's us control a fan `boost` value. This `boost` value
-has the following aproximate behavior over the fan pwm:
+has the following approximate behavior over the fan pwm:
 
 ::
 
diff --git a/Documentation/admin-guide/mm/damon/usage.rst b/Documentation/admin-guide/mm/damon/usage.rst
index ff3a2dda1f02..5cd42d428c89 100644
--- a/Documentation/admin-guide/mm/damon/usage.rst
+++ b/Documentation/admin-guide/mm/damon/usage.rst
@@ -357,7 +357,7 @@ The directory for the :ref:`quotas <damon_design_damos_quotas>` of the given
 DAMON-based operation scheme.
 
 Under ``quotas`` directory, four files (``ms``, ``bytes``,
-``reset_interval_ms``, ``effective_bytes``) and two directores (``weights`` and
+``reset_interval_ms``, ``effective_bytes``) and two directories (``weights`` and
 ``goals``) exist.
 
 You can set the ``time quota`` in milliseconds, ``size quota`` in bytes, and
diff --git a/Documentation/admin-guide/tainted-kernels.rst b/Documentation/admin-guide/tainted-kernels.rst
index a0cc017e4424..ed1f8f1e86c5 100644
--- a/Documentation/admin-guide/tainted-kernels.rst
+++ b/Documentation/admin-guide/tainted-kernels.rst
@@ -186,6 +186,6 @@ More detailed explanation for tainting
 
  18) ``N`` if an in-kernel test, such as a KUnit test, has been run.
 
- 19) ``J`` if userpace opened /dev/fwctl/* and performed a FWTCL_RPC_DEBUG_WRITE
+ 19) ``J`` if userspace opened /dev/fwctl/* and performed a FWTCL_RPC_DEBUG_WRITE
      to use the devices debugging features. Device debugging features could
      cause the device to malfunction in undefined ways.
diff --git a/Documentation/arch/loongarch/irq-chip-model.rst b/Documentation/arch/loongarch/irq-chip-model.rst
index a7ecce11e445..94ed2858a570 100644
--- a/Documentation/arch/loongarch/irq-chip-model.rst
+++ b/Documentation/arch/loongarch/irq-chip-model.rst
@@ -139,7 +139,7 @@ Feature EXTIOI_HAS_INT_ENCODE is part of standard EIOINTC. If it is 1, it
 indicates that CPU Interrupt Pin selection can be normal method rather than
 bitmap method, so interrupt can be routed to IP0 - IP15.
 
-Feature EXTIOI_HAS_CPU_ENCODE is entension of V-EIOINTC. If it is 1, it
+Feature EXTIOI_HAS_CPU_ENCODE is extension of V-EIOINTC. If it is 1, it
 indicates that CPU selection can be normal method rather than bitmap method,
 so interrupt can be routed to CPU0 - CPU255.
 
-- 
2.34.1

