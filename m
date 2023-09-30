Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7551E748E5
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 30 Sep 2023 19:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55C4481F4B;
	Sat, 30 Sep 2023 19:41:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55C4481F4B
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cJ1Jjqc1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PgOcahR3I38e; Sat, 30 Sep 2023 19:41:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 32A6581E58;
	Sat, 30 Sep 2023 19:41:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32A6581E58
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 02CE6C0071;
	Sat, 30 Sep 2023 19:41:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 41F94C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 30 Sep 2023 19:41:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 177CD4021C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 30 Sep 2023 19:41:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 177CD4021C
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cJ1Jjqc1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a1jK0Decp3XV
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 30 Sep 2023 19:41:22 +0000 (UTC)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8059A4013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 30 Sep 2023 19:41:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8059A4013B
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-690f2719ab2so3383379b3a.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 30 Sep 2023 12:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696102882; x=1696707682;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DLeIJ/fAJFQuWgfN3SfqzLo+G0sfER2FPjENsdAZzLE=;
 b=cJ1Jjqc1775cDvNs05oP+WS8PxnL4aq3Pwb1RETLniLsdkjtMpgzajMO5pJxt8/qG1
 /EKvFdhf/S4beTvcCY31Nq3NSfrYiwHStBxUb6RdnsT7C6/9h3kirsOkMqra+Kx9FP08
 +OuX6BjgrxQyL5fRPQcafktjdFDpEiXkRUSqvwcK3e/W2gSbLol1ACvMrNyHAy4Y9Jr5
 f+yaqLy+WgTHfc5Hx1nzXKq/pUAcsY+FxADjYDWYiotoEjP6GyzedEktb1RdUxoCHvTv
 5sxr6DyElO38lY/BYCFijF79emab4dsclzYs38OSU2bmSpqAG3VLSsXAUaisGWPlm10h
 zUqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696102882; x=1696707682;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DLeIJ/fAJFQuWgfN3SfqzLo+G0sfER2FPjENsdAZzLE=;
 b=mU9OX4G2ocPcYm5GO3AcEymWenDzk1jDEMa5VvfajQFt3HewX/7sXdSqkz87hK0vPh
 8QBj9jTlo/8Jf9riEW4Ei6qx9TSbpZWa06vz017ah7U61gKC1cSgUS3i1ijihMVZmTF5
 1PXe6oFSyr+jehauq88I6I/3BgZDH5QgU4dacsbgBgwu9rzyRatl+ssWmZNGxEBGxD2y
 fdKUzeCGE0/bYfWiZ/Jyz658VdH8fPyGyAXjmaPGO+qrRajQ9TXY2ff+kTcrHGnREGcZ
 Bg5JhTs/h1vGqSbkaVjlzbshPWEOi6RstWtqGiWTZUQOzLil6DTGOrpY/8C8j8YE62Hk
 my2w==
X-Gm-Message-State: AOJu0Yz+l083SUo7imvQ1y+va0Y0Aw8ucRtNUMy/rUx8NjAQEVRa/dZO
 gb6FF0M6Nvte7c15HSG6nRk=
X-Google-Smtp-Source: AGHT+IFLX+X0bbprJYYxzfpMKb+uZKzOoBVsOhZSCU2aGF5m/fir3wpoVoZJzPPS/RknQ/D0E/cltQ==
X-Received: by 2002:a05:6a21:33a0:b0:15a:4634:e4c with SMTP id
 yy32-20020a056a2133a000b0015a46340e4cmr8807395pzb.5.1696102881879; 
 Sat, 30 Sep 2023 12:41:21 -0700 (PDT)
Received: from abhinav-IdeaPad-Slim-5-14ABR8.. ([103.75.161.211])
 by smtp.googlemail.com with ESMTPSA id
 i14-20020aa787ce000000b006900cb919b8sm16969510pfo.53.2023.09.30.12.41.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Sep 2023 12:41:21 -0700 (PDT)
From: Abhinav <singhabhinav9051571833@gmail.com>
To: shuah@kernel.org
Subject: [PATCH] Added missing TARGETS in kselftest top level Makefile
Date: Sun,  1 Oct 2023 01:11:06 +0530
Message-Id: <20230930194106.1379527-1-singhabhinav9051571833@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Abhinav <singhabhinav9051571833@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Some TARGETS were missing in selftests top level Makefile.Added those.
Signed-off-by: Abhinav <singhabhinav9051571833@gmail.com>
---
 tools/testing/selftests/Makefile | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index 8d9b2341b79a..14050f39cc5e 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -13,6 +13,7 @@ TARGETS += core
 TARGETS += cpufreq
 TARGETS += cpu-hotplug
 TARGETS += damon
+TARGETS += dma
 TARGETS += dmabuf-heaps
 TARGETS += drivers/dma-buf
 TARGETS += drivers/s390x/uvdevice
@@ -22,6 +23,7 @@ TARGETS += dt
 TARGETS += efivarfs
 TARGETS += exec
 TARGETS += fchmodat2
+TARGETS += filelock
 TARGETS += filesystems
 TARGETS += filesystems/binderfs
 TARGETS += filesystems/epoll
@@ -32,17 +34,21 @@ TARGETS += ftrace
 TARGETS += futex
 TARGETS += gpio
 TARGETS += hid
+TARGETS += ia64
 TARGETS += intel_pstate
 TARGETS += iommu
 TARGETS += ipc
 TARGETS += ir
 TARGETS += kcmp
 TARGETS += kexec
+TARGETS += kmod
 TARGETS += kvm
 TARGETS += landlock
 TARGETS += lib
 TARGETS += livepatch
 TARGETS += lkdtm
+TARGETS += locking
+TARGETS += media_tests
 TARGETS += membarrier
 TARGETS += memfd
 TARGETS += memory-hotplug
@@ -66,14 +72,18 @@ TARGETS += pid_namespace
 TARGETS += powerpc
 TARGETS += prctl
 TARGETS += proc
+TARGETS += ptp
 TARGETS += pstore
 TARGETS += ptrace
+TARGETS += rcutorture
 TARGETS += openat2
 TARGETS += resctrl
 TARGETS += riscv
 TARGETS += rlimits
 TARGETS += rseq
 TARGETS += rtc
+TARGETS += safesetid
+TARGETS += sched
 TARGETS += seccomp
 TARGETS += sgx
 TARGETS += sigaltstack
@@ -99,6 +109,7 @@ TARGETS += user
 TARGETS += user_events
 TARGETS += vDSO
 TARGETS += mm
+TARGETS += watchdog
 TARGETS += x86
 TARGETS += zram
 #Please keep the TARGETS list alphabetically sorted
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
