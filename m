Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82BD284891
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  1 Oct 2025 08:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759307996; cv=none; b=g9yAN+fI1ZqOjKznqRSh8vz/mOALt6V6AXQ0TIWUubQvgdut7L16f0liIkd/IxuD3Ie20sMV7J22+6AV3MyAAsR4YAAyAAR8nBbUYp89X5mLBp/1pUup0FfdnMkiDrcbK+38x1sgJZlXr7X8AGHjcWRtJT5kNxUHq9pLELWc+oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759307996; c=relaxed/simple;
	bh=VyoVY4Q4GDe6RMQi5QGg4ffoiIPwM6SwqIJ2pC+aeyo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=e1VKQZHiAwKUIMVUGhsYRo+4i2eg0PIxnR5vrojwcg4BnNBbRgieLgfjtE26/QCjjlZp+/c7j6b5uIX4pMi9Ukw/deCRJA+bZ260jo5Xjm8BP73aHfMpzAKPLYoM82jJyUgX5bWSLo76bURuMQZ/APPHFheKFcZlw5/ZwXN9GhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fj9OLOzv; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fj9OLOzv"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7886961241
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  1 Oct 2025 08:39:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qErqEiNzWnKa for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Oct 2025 08:39:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com; envelope-from=bhanuseshukumar@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BC6FF60FF4
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC6FF60FF4
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fj9OLOzv
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
	by smtp3.osuosl.org (Postfix) with ESMTPS id BC6FF60FF4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  1 Oct 2025 08:39:52 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-b5579235200so5005316a12.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 01 Oct 2025 01:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759307992; x=1759912792; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D4FfG++OYH0UQ2cb2chNsj++JT4lH4Ovdjh6P4PE8Qc=;
        b=fj9OLOzvW0YKd/USZ0k+BNcgOAaK6vpaPCJBggwyxlK0ZfhIAHHI8LcG+yaTkD2PBc
         0aJ7AtihXRt+bZEFaDo3PfU1g32LMT7nGdz0qjzReHSm5jmV+I3/JrjiSQeHM07Uo756
         LtkMT5okix8CoFEm4ImogYR80iJavfLyvhZ1216NS380YZb8apbWkskzQqqt5ZjIT7TO
         UoXy4RXRm/iAoshp8SDCxi01Ozmb5tuwiNrNxyyiwEpXQu4oJOqp4fLHr1JPBOtmVyKI
         bANpx9pyMdK6MWOx/OqsWO3bWKoDWZ/6WydFkcyaG68dtWUtaGAvhPhxTkrweTGyOWeN
         hIfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759307992; x=1759912792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D4FfG++OYH0UQ2cb2chNsj++JT4lH4Ovdjh6P4PE8Qc=;
        b=UoA/os2h+lIo2zi3BMdGuLgp6Y3UPz67I+pdW8wOzD5t2o4W2HBVFs03+TWq/ScwrL
         /039ljbrgVWhq+8CJe5nSPXjB2B3NttvgONLZcUJmJFYiIw7TqafSqRUPzuToajPt4ig
         Ux35YRH51Qv2a5sZ0OZ4MHb5VORgR1WYNC5/Euiv4zacmIrjy10nuU57cLedHTbGroZw
         gjAE4lhdUCZl4VgHCp+vVisqAcklv4Qj9/syfouI/Oan6XD93nwNU1ASNB77pyxNLQhK
         7XffFPrJwiBORFambP9EGTa5GWM4YlfiL3tkSNJ+vnKtplAFJgZQLcH8XL85xChYsZIp
         Hxxw==
X-Gm-Message-State: AOJu0Yyy0+vB9OSCQ4GFx23HMiBl0+FBqUcDzYC0vHt1PYt/hG4DI5Z+
	znXbWa5/1N0ouBxqOimCbWIg5+GxBo1/M0wYjb0/EFO2ZUT9haIMf+jq
X-Gm-Gg: ASbGncso1xpNIQ7SfwV/6Vdh1FQImneW4QD9eGpm65C6I3m1mvlx1ot5uMCGuPc6HKN
	qU1WBafjzgLq6iuCvBd4iLdw44r5kILSLS7ITRTtoy9+QsEa4NqsrpOstLHmBgGsPvpcPARV43m
	QoRoxh0iYfsPvj2bt5u5lz8mLqZtclXNik+OdmLTl4X/BEpBgBje9br0141aWR5cRIZoQj1/h0w
	tZtOtOEbryywC63dpnXTSxtYcHnVRHZLafx2YIhar2+d+LKfFK+rBnrirMXe4yYF3S1Ln0+0pXw
	0IqFlro5ZWcNX6djmBIxt+91/wxJOjYrdENVhg0814SB5N/6PYfEdZQ058xKthCffMfdDhoMNd5
	qcxmD7iJOsJYgqk+TJ0dallc9Vcrb1voo2EzBhxMTn3E8HqdimQcLEbTM2K6bR2KqT1THLFe0wQ
	==
X-Google-Smtp-Source: AGHT+IGDAA5bS+9IItYzYTvHt755RN1Ht/RXQRCnt03we0AczFtZuNBaAi5b7oWoS/mnvJ+e//+JYg==
X-Received: by 2002:a17:903:11c7:b0:269:8407:5ae3 with SMTP id d9443c01a7336-28e7f4b6843mr37492805ad.54.1759307991850;
        Wed, 01 Oct 2025 01:39:51 -0700 (PDT)
Received: from ti-am64x-sdk.. ([157.50.93.46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6ad1d45sm179473835ad.141.2025.10.01.01.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 01:39:51 -0700 (PDT)
From: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
To: Kent Overstreet <kent.overstreet@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Carlos Maiolino <cem@kernel.org>,
	David Howells <dhowells@redhat.com>,
	Paulo Alcantara <pc@manguebit.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>,
	linux-bcachefs@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-xfs@vger.kernel.org,
	netfs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com
Subject: [PATCH] fs: doc: Fix typos
Date: Wed,  1 Oct 2025 14:09:31 +0530
Message-Id: <20251001083931.44528-1-bhanuseshukumar@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in doc comments

Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
---
 Note: No change in functionality intended.

 Documentation/filesystems/bcachefs/future/idle_work.rst  | 6 +++---
 Documentation/filesystems/xfs/xfs-online-fsck-design.rst | 2 +-
 fs/netfs/buffered_read.c                                 | 2 +-
 fs/xfs/xfs_linux.h                                       | 2 +-
 include/linux/fs.h                                       | 4 ++--
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/filesystems/bcachefs/future/idle_work.rst b/Documentation/filesystems/bcachefs/future/idle_work.rst
index 59a332509dcd..f1202113dde0 100644
--- a/Documentation/filesystems/bcachefs/future/idle_work.rst
+++ b/Documentation/filesystems/bcachefs/future/idle_work.rst
@@ -11,10 +11,10 @@ idle" so the system can go to sleep. We don't want to be dribbling out
 background work while the system should be idle.
 
 The complicating factor is that there are a number of background tasks, which
-form a heirarchy (or a digraph, depending on how you divide it up) - one
+form a hierarchy (or a digraph, depending on how you divide it up) - one
 background task may generate work for another.
 
-Thus proper idle detection needs to model this heirarchy.
+Thus proper idle detection needs to model this hierarchy.
 
 - Foreground writes
 - Page cache writeback
@@ -51,7 +51,7 @@ IDLE REGIME
 When the system becomes idle, we should start flushing our pending work
 quicker so the system can go to sleep.
 
-Note that the definition of "idle" depends on where in the heirarchy a task
+Note that the definition of "idle" depends on where in the hierarchy a task
 is - a task should start flushing work more quickly when the task above it has
 stopped generating new work.
 
diff --git a/Documentation/filesystems/xfs/xfs-online-fsck-design.rst b/Documentation/filesystems/xfs/xfs-online-fsck-design.rst
index e231d127cd40..e872d480691b 100644
--- a/Documentation/filesystems/xfs/xfs-online-fsck-design.rst
+++ b/Documentation/filesystems/xfs/xfs-online-fsck-design.rst
@@ -4179,7 +4179,7 @@ When the exchange is initiated, the sequence of operations is as follows:
    This will be discussed in more detail in subsequent sections.
 
 If the filesystem goes down in the middle of an operation, log recovery will
-find the most recent unfinished maping exchange log intent item and restart
+find the most recent unfinished mapping exchange log intent item and restart
 from there.
 This is how atomic file mapping exchanges guarantees that an outside observer
 will either see the old broken structure or the new one, and never a mismash of
diff --git a/fs/netfs/buffered_read.c b/fs/netfs/buffered_read.c
index 37ab6f28b5ad..c81be6390309 100644
--- a/fs/netfs/buffered_read.c
+++ b/fs/netfs/buffered_read.c
@@ -329,7 +329,7 @@ static void netfs_read_to_pagecache(struct netfs_io_request *rreq,
  * the netfs if not.  Space beyond the EOF is zero-filled.  Multiple I/O
  * requests from different sources will get munged together.  If necessary, the
  * readahead window can be expanded in either direction to a more convenient
- * alighment for RPC efficiency or to make storage in the cache feasible.
+ * alignment for RPC efficiency or to make storage in the cache feasible.
  *
  * The calling netfs must initialise a netfs context contiguous to the vfs
  * inode before calling this.
diff --git a/fs/xfs/xfs_linux.h b/fs/xfs/xfs_linux.h
index 9a2221b4aa21..fdf3cd8c4d19 100644
--- a/fs/xfs/xfs_linux.h
+++ b/fs/xfs/xfs_linux.h
@@ -145,7 +145,7 @@ static inline void delay(long ticks)
 /*
  * XFS wrapper structure for sysfs support. It depends on external data
  * structures and is embedded in various internal data structures to implement
- * the XFS sysfs object heirarchy. Define it here for broad access throughout
+ * the XFS sysfs object hierarchy. Define it here for broad access throughout
  * the codebase.
  */
 struct xfs_kobj {
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 601d036a6c78..72e82a4a0bbc 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1040,7 +1040,7 @@ struct fown_struct {
  * struct file_ra_state - Track a file's readahead state.
  * @start: Where the most recent readahead started.
  * @size: Number of pages read in the most recent readahead.
- * @async_size: Numer of pages that were/are not needed immediately
+ * @async_size: Number of pages that were/are not needed immediately
  *      and so were/are genuinely "ahead".  Start next readahead when
  *      the first of these pages is accessed.
  * @ra_pages: Maximum size of a readahead request, copied from the bdi.
@@ -3149,7 +3149,7 @@ static inline void kiocb_start_write(struct kiocb *iocb)
 
 /**
  * kiocb_end_write - drop write access to a superblock after async file io
- * @iocb: the io context we sumbitted the write with
+ * @iocb: the io context we submitted the write with
  *
  * Should be matched with a call to kiocb_start_write().
  */
-- 
2.34.1

