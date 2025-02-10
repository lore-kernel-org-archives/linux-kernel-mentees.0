Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE1922F380
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun,  9 Feb 2025 23:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739142587; cv=none; b=j2nZAYqSgU/NAkk0+V9/9yrqZb1WwZGO5HC2vBVv6AzsxuFRiFgzSUnRk70plqb/dwxrTbY+QhaJV21nIgBgfHGUZKeIw+qlUzd/1jKjJUvdV1E2qyPJ7RlvdydDHcKiS9p2DlyMjbET8kvSEPzvU7hqLFokp92Vmj02CKaM6q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739142587; c=relaxed/simple;
	bh=OwyNbHzr6nbf0VNQwpYxaf2tsXgpqdF70EqeajHRFx4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IzG35fPRTMH7+/ko6wdjxFj/ZwxvNU8yypsu5seo0171RMTUz1UfkJC4eRNRnnz4kivLTpWm52ehLJS82YwLsUYpf6GZiQZbuSl+QO3cqzg51Lio755ZRzn+eTE+3w6Z0wAdv2O90RUAlzYxJti7IiocdWCYbwoH2BnQczI3GTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FFgyzpuY; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FFgyzpuY"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8355440A45
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun,  9 Feb 2025 23:09:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 0.928
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P2UqAxnBaVuX for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Feb 2025 23:09:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=ritvikfoss@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8643340A21
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8643340A21
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FFgyzpuY
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 8643340A21
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun,  9 Feb 2025 23:09:44 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-21f4af4f9ddso38715095ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 09 Feb 2025 15:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739142584; x=1739747384; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IRtpFSrOe0YUFBCGtZKy2pmvQABInQf8jn/zl5yH35c=;
        b=FFgyzpuYvPxitkNfru486j1zqxoJXBCy9gMW+piPxkMogVBpFmzkDgU/nnNm+XJ5L3
         3db03Ft7IXM2eV0g+QjL6ybASkC5LJ++707WUszN1cFswu+5ARPdCKfHHflDJU/tKzLG
         Qk40kvqLa105RwwPFKBB/80fOSK2aXkBjSow3wXHOjyW+FxfDjlK+mfq6iOSDUye3CY9
         mRz05KLMFPfgjRoo5mVOiSlDjZ4cttSQv5OhYfMOexFEouqFTcC6kTprmacYDvHxAg3n
         8gG3LSQHmae+ej+lsup3c00StgOlgOCAc8qX7hu8VuNBe4Ws8u+yahXiTTWIjIxMDZdp
         p9Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739142584; x=1739747384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IRtpFSrOe0YUFBCGtZKy2pmvQABInQf8jn/zl5yH35c=;
        b=XBq6/wz7ro3nFggT02XQEOzXYGh66zZDwhtYP5LUXY60Ap+o6ymLkPAqx9i/cIzkW4
         LtPbjuqn3YALf4d+t1qbELbDgRUSSvJlLGHiS3ibYH8sV2JBGNfbxMql2ShCs9y6n1p/
         kDaiKh/Adtc6hhOKK6Wjh4Z/uqJ7iLpgxTMRxWB2qpZtBsavQvIhjQlVnVxFfmERMKfK
         HKeoVdcGzpBE3IGtOyl+Rq+75LqwSNw+dawt2YTjTGjT4TIw6Pf1OtaOA46gVmhGI4H/
         PcyiY+210ZDk3vhUgPb+aFfe+JL/H0xAY6GfPQPl8sInQesxpnbQWJl9HpPvT/YCCooa
         0kWw==
X-Forwarded-Encrypted: i=1; AJvYcCXnT52975L00MJ4LvBFdSy/pTNLY5x+mpHAi7772LaGNn8OwO0mlHvVw/fVqCuph9NncXbPccU/Ue+QXd9BR6rSwR6uZg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwTE3j/TrtlLlVXFPQ2WUdvjeq40jVL04h1EzkzNN/ch4+d+Oug
	Q72vC57/39jcpCuuOF759pAR7C5uH4WAVaQqsfj3dkCfBV3Tytvh
X-Gm-Gg: ASbGncuUOK+t5v9JoRnY1QwzA2U8Thfd3ZBfTAn8SdFZQliJBmofO92sYbdsV/1wbHj
	4x3KA51Gy+x5D4EHk/s/EEnZ+IGvlGGdhJ5FSm1gIdR+NiRzp0cmnRaqo3zC3QclKoVggl6LUvR
	tDPETXAs9AgJk+Dz64qCjzn9kuEq2KidAZF4PhCEctTsGR2FGMUh9qIT6KhjMyahmsyCxJM4ncP
	zFSeSDK7xH36HnrTUiSMkrBve+188bkivH3PKJ8Q4+Zj6gbl1KQ0ZVLNBY7H4r85sL0zmHUhmig
	vGRkpiBRaimL8Eu2xzUlZoOdD5fGuEiTgYCQJ0TsYNe2DMKd
X-Google-Smtp-Source: AGHT+IEsXaLhAw+BdeFLmr3E9pcj0NZRRv1NE6e2LnmnpRHBIst/JH+s4wYziF17uy1EPreJMNESyw==
X-Received: by 2002:a17:902:da8e:b0:21f:98fc:8421 with SMTP id d9443c01a7336-21f98fc85e7mr21974615ad.50.1739142583722;
        Sun, 09 Feb 2025 15:09:43 -0800 (PST)
Received: from ritvikos.localdomain ([2405:201:5501:4115:fd74:2c07:b6e:c967])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f368d8ccbsm65615965ad.255.2025.02.09.15.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 15:09:43 -0800 (PST)
Received: by ritvikos.localdomain (Postfix, from userid 1000)
	id 43898140645; Mon, 10 Feb 2025 04:39:37 +0000 (UTC)
From: ritvikfoss@gmail.com
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] documentation/filesystems: fix spelling mistakes
Date: Mon, 10 Feb 2025 04:39:37 +0000
Message-ID: <20250210043937.30952-1-ritvikfoss@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ritvik Gupta <ritvikfoss@gmail.com>

Corrected the following spelling mistakes,
based on the suggestions by codespell:

1. Optionaly   -> Optionally
2. prefereable -> preferable
3. peformance  -> performance
4. ontext      -> context
5. failuer     -> failure
6. poiners     -> pointers
7. realtively  -> relatively
8. uptream     -> upstream

Thanks for your time!
Regards Ritvik

Signed-off-by: Ritvik Gupta <ritvikfoss@gmail.com>
---
 Documentation/filesystems/9p.rst                              | 2 +-
 Documentation/filesystems/bcachefs/SubmittingPatches.rst      | 4 ++--
 Documentation/filesystems/coda.rst                            | 2 +-
 Documentation/filesystems/debugfs.rst                         | 2 +-
 Documentation/filesystems/netfs_library.rst                   | 2 +-
 Documentation/filesystems/xfs/xfs-delayed-logging-design.rst  | 2 +-
 .../filesystems/xfs/xfs-maintainer-entry-profile.rst          | 2 +-
 7 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/filesystems/9p.rst b/Documentation/filesystems/9p.rst
index 2bbf68b56b0d..3078f3c9256a 100644
--- a/Documentation/filesystems/9p.rst
+++ b/Documentation/filesystems/9p.rst
@@ -90,7 +90,7 @@ Just start the 9pfs capable network server like diod/nfs-ganesha e.g.::

         $ diod -f -n -d 0 -S -l 0.0.0.0:9999 -e $PWD

-Optionaly scan your bus if there are more then one usbg gadgets to find their path::
+Optionally scan your bus if there are more then one usbg gadgets to find their path::

         $ python $kernel_dir/tools/usb/p9_fwd.py list

diff --git a/Documentation/filesystems/bcachefs/SubmittingPatches.rst b/Documentation/filesystems/bcachefs/SubmittingPatches.rst
index 026b12ae0d6a..4b79ca58faf2 100644
--- a/Documentation/filesystems/bcachefs/SubmittingPatches.rst
+++ b/Documentation/filesystems/bcachefs/SubmittingPatches.rst
@@ -30,7 +30,7 @@ CI:
 ===

 Instead of running your tests locally, when running the full test suite it's
-prefereable to let a server farm do it in parallel, and then have the results
+preferable to let a server farm do it in parallel, and then have the results
 in a nice test dashboard (which can tell you which failures are new, and
 presents results in a git log view, avoiding the need for most bisecting).

@@ -68,7 +68,7 @@ Other things to think about:
   land - use them. Use them judiciously, and not as a replacement for proper
   error handling, but use them.

-- Does it need to be performance tested? Should we add new peformance counters?
+- Does it need to be performance tested? Should we add new performance counters?

   bcachefs has a set of persistent runtime counters which can be viewed with
   the 'bcachefs fs top' command; this should give users a basic idea of what
diff --git a/Documentation/filesystems/coda.rst b/Documentation/filesystems/coda.rst
index bdde7e4e010b..0db3c83a50e5 100644
--- a/Documentation/filesystems/coda.rst
+++ b/Documentation/filesystems/coda.rst
@@ -141,7 +141,7 @@ kernel support.
   a process P which accessing a Coda file. It makes a system call which
   traps to the OS kernel. Examples of such calls trapping to the kernel
   are ``read``, ``write``, ``open``, ``close``, ``create``, ``mkdir``,
-  ``rmdir``, ``chmod`` in a Unix ontext.  Similar calls exist in the Win32
+  ``rmdir``, ``chmod`` in a Unix context.  Similar calls exist in the Win32
   environment, and are named ``CreateFile``.

   Generally the operating system handles the request in a virtual
diff --git a/Documentation/filesystems/debugfs.rst b/Documentation/filesystems/debugfs.rst
index f7f977ffbf8d..610f718ef8b5 100644
--- a/Documentation/filesystems/debugfs.rst
+++ b/Documentation/filesystems/debugfs.rst
@@ -220,7 +220,7 @@ There are a couple of other directory-oriented helper functions::

 A call to debugfs_change_name() will give a new name to an existing debugfs
 file, always in the same directory.  The new_name must not exist prior
-to the call; the return value is 0 on success and -E... on failuer.
+to the call; the return value is 0 on success and -E... on failure.
 Symbolic links can be created with debugfs_create_symlink().

 There is one important thing that all debugfs users must take into account:
diff --git a/Documentation/filesystems/netfs_library.rst b/Documentation/filesystems/netfs_library.rst
index 73f0bfd7e903..3886c14f89f4 100644
--- a/Documentation/filesystems/netfs_library.rst
+++ b/Documentation/filesystems/netfs_library.rst
@@ -515,7 +515,7 @@ The methods defined in the table are:
    the cache to expand a request in either direction.  This allows the cache to
    size the request appropriately for the cache granularity.

-   The function is passed poiners to the start and length in its parameters,
+   The function is passed pointers to the start and length in its parameters,
    plus the size of the file for reference, and adjusts the start and length
    appropriately.  It should return one of:

diff --git a/Documentation/filesystems/xfs/xfs-delayed-logging-design.rst b/Documentation/filesystems/xfs/xfs-delayed-logging-design.rst
index 6402ab8e370c..2a2705e975e8 100644
--- a/Documentation/filesystems/xfs/xfs-delayed-logging-design.rst
+++ b/Documentation/filesystems/xfs/xfs-delayed-logging-design.rst
@@ -219,7 +219,7 @@ The log is circular, so the positions in the log are defined by the combination
 of a cycle number - the number of times the log has been overwritten - and the
 offset into the log.  A LSN carries the cycle in the upper 32 bits and the
 offset in the lower 32 bits. The offset is in units of "basic blocks" (512
-bytes). Hence we can do realtively simple LSN based math to keep track of
+bytes). Hence we can do relatively simple LSN based math to keep track of
 available space in the log.

 Log space accounting is done via a pair of constructs called "grant heads".  The
diff --git a/Documentation/filesystems/xfs/xfs-maintainer-entry-profile.rst b/Documentation/filesystems/xfs/xfs-maintainer-entry-profile.rst
index 32b6ac4ca9d6..ce4584fb3103 100644
--- a/Documentation/filesystems/xfs/xfs-maintainer-entry-profile.rst
+++ b/Documentation/filesystems/xfs/xfs-maintainer-entry-profile.rst
@@ -93,7 +93,7 @@ others on a regular basis about burnout.
   sponsoring work on any part of XFS.

 - **LTS Maintainer**: Someone who backports and tests bug fixes from
-  uptream to the LTS kernels.
+  upstream to the LTS kernels.
   There tend to be six separate LTS trees at any given time.

   The maintainer for a given LTS release should identify themselves with an
--
2.43.0

