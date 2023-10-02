Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D37AEE784A4
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Oct 2023 07:27:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DF0E41B46;
	Mon,  2 Oct 2023 07:27:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DF0E41B46
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=V8Q9Mbl9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZJHcIufJs54b; Mon,  2 Oct 2023 07:27:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id EFFD041B3E;
	Mon,  2 Oct 2023 07:27:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFFD041B3E
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B9FDFC0071;
	Mon,  2 Oct 2023 07:27:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 63F66C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Oct 2023 07:27:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3FB23605A3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Oct 2023 07:27:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FB23605A3
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=V8Q9Mbl9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QSKwgYfg-N-N
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Oct 2023 07:27:52 +0000 (UTC)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7FA386059B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Oct 2023 07:27:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FA386059B
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1c72e235debso10329625ad.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 02 Oct 2023 00:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696231672; x=1696836472;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fKdhwE6Nvv6dfMJ1charSbuyq7vd9RUBMHfjBdkzVPc=;
 b=V8Q9Mbl9tV620xl6fUEsPGxKwybBIC8iw7hCgo9QDb11e5oA+Rsk900DMVEfC61K3F
 IkmqPdVWERGhvzvX7nVs4J3Tyy1Fw/veqvu0L5PweJNhogUBvf+vPupcayi7R433zX2+
 mIk1EMXt2r4fC4fpxmTcfsCdtoKG5cjsxndTIqsi/IrLdjw7zzbPjKWxzS1UuP8JY4xv
 UO+nOkDymGVMpErMTsFtVSKsuIQoLBVjW+SkbVVx1V3SNrqa7SMT9NaESMm8OXLukpUz
 5eqQuQ0l6u3eY5DJR/sU4b5Mnb4zB//bq9vTBfFW9i0BXdGjlG0O+fGTXZAi1NmcjQ5W
 Y+NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696231672; x=1696836472;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fKdhwE6Nvv6dfMJ1charSbuyq7vd9RUBMHfjBdkzVPc=;
 b=pWgKsAK94ETx0uOomM6G39kzPz2Y8OiayFAm5CAbCRRaha5rfXLJW3oEKhAgxlfLcS
 KdSKj9Ye3jPA0BFHTOuOC1buq+g+wyWAXM36DH+iehF8HSjH8MH3wThI/bvnZfH7SRC5
 lXuruiHwFOpqLnkR6tWSYWfhCCi8LuuvhQGCc/lJEWzrUMs8Zk2qJlEp1O4cWvMm4OTk
 rX7pCos3BAVU/n9NTiEE3rjWGhExMpEPezKip9B+qdnIKt94FWF68shfx0lIYOpy4Twn
 U9w45soGsRFdFN9u/Wv4rLBciTH537cVZb6SjM5C++dd9gQUS42opDU6VRqIGdntydxJ
 JVxw==
X-Gm-Message-State: AOJu0YxO1WSDSurbDRHlBB7HazhLTdm4wx5P1md4uUq/rYzg+dA0EmjZ
 7PEB3GabYF0cSTCzx3edjXc=
X-Google-Smtp-Source: AGHT+IHYjn8vbhw0v2ocpkuF8SIWfiwgwx7fIsV29nwtCJY3zotMPH6p6MLpJsCcAJDaxG3ZUVPSFQ==
X-Received: by 2002:a17:903:41c1:b0:1bf:349f:b85c with SMTP id
 u1-20020a17090341c100b001bf349fb85cmr12573981ple.1.1696231671756; 
 Mon, 02 Oct 2023 00:27:51 -0700 (PDT)
Received: from abhinav-IdeaPad-Slim-5-14ABR8.. ([103.75.161.210])
 by smtp.googlemail.com with ESMTPSA id
 4-20020a170902c14400b001c755810f89sm4059895plj.181.2023.10.02.00.27.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 00:27:51 -0700 (PDT)
From: Abhinav <singhabhinav9051571833@gmail.com>
To: shuah@kernel.org
Subject: [PATCH v2] Added missing TARGETS in kselftest top level Makefile
Date: Mon,  2 Oct 2023 12:57:35 +0530
Message-Id: <20231002072735.1566009-1-singhabhinav9051571833@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2023100135-stiffen-depress-8121@gregkh>
References: <2023100135-stiffen-depress-8121@gregkh>
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

Some tests like dma, ia64, etc. were not present in top level of
selftest Makefile, so when someone ran 'make run_tests' they would miss
these tests. This patches adds those left out tests.

Signed-off-by: Abhinav <singhabhinav9051571833@gmail.com>
---
 tools/testing/selftests/Makefile | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index 8d9b2341b79a..dc138c1dcb4b 100644
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
@@ -32,17 +33,21 @@ TARGETS += ftrace
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
@@ -66,6 +71,7 @@ TARGETS += pid_namespace
 TARGETS += powerpc
 TARGETS += prctl
 TARGETS += proc
+TARGETS += ptp
 TARGETS += pstore
 TARGETS += ptrace
 TARGETS += openat2
@@ -99,6 +105,7 @@ TARGETS += user
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
