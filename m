Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A1E8E784B3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Oct 2023 11:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 815A8827D8;
	Mon,  2 Oct 2023 11:47:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 815A8827D8
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VmwKoAvM
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tJdZBt04gxet; Mon,  2 Oct 2023 11:47:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 80D8682702;
	Mon,  2 Oct 2023 11:47:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80D8682702
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5AB63C0071;
	Mon,  2 Oct 2023 11:47:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 55EE7C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Oct 2023 11:47:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2047682751
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Oct 2023 11:47:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2047682751
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hI4nHDeTo_1n
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Oct 2023 11:46:59 +0000 (UTC)
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C98BD82702
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Oct 2023 11:46:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C98BD82702
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-57b68555467so1098317eaf.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 02 Oct 2023 04:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696247219; x=1696852019;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tVk5KR1wNzlzQ39q1hN4Y07KLXpNDHXN5VrDHX49DM8=;
 b=VmwKoAvMinOOLZUwGwbRxPBf7/Lwckvpj8nDt9QKPws6B8q7bOBiKP99+ty8BFIO5v
 dHD1QcDJDySl9UxPZOJ7iayg5Xs+V3nSAfhD81AMxeiZcnmWY3nv2KFumnetfKAowU1B
 mqV1S8bjYg4WgsG4WcqFYHunUSF9IARbZi6j1gnPmtfJ6caw4rwUgV6TAZbhJYqqCf4M
 gBBWvdtcKUal0Kh9dpuZhOo7Gsde7HseJf2N5PxT5PQlcxME8Vmbz974EKRACPLKuS3W
 IcQXZMFOoxoVP5KDsL8g++ZvJqS8xpSnDmMIlCVF8HlHd4YcRu2NDvYR4o5L007GjVhm
 ZEMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696247219; x=1696852019;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tVk5KR1wNzlzQ39q1hN4Y07KLXpNDHXN5VrDHX49DM8=;
 b=mio6uDLm2C2Spk1CWUhp3hVTBJtWrngFeIZ3xDCBRxjq2QWo+2qHOyQtH3pUTyiX/M
 x6Rp3UyOAANhtiFLGoxYy5UG0wj5he1dVosLBofUUmcl8OAKzzcbli/WKqJlviE8MyeX
 lJGXw6Vt+PB0LydKxqwZxOUUVH88OTNc/v04KUeMXMILUo5MjZnZNlVSke0C1UchB8Rw
 xLGuS+hiDyic2sgY6HJyEijWGpJjENuyrUTmJLR9nMjdY/YQvEoCLSHTx/dPCuRkPbsP
 oEKJ2ZoczCY3Ajanopfe9BzMujPqYWaAx3Nmgws2QobXdPTMxuRNX9vVDcN5XdPsyZHW
 C3XQ==
X-Gm-Message-State: AOJu0YwSFVJTuFI9OsXR5vYrTAgmYYv6r7i8KClCF5B6P//5ImpzNlHH
 KLfL7AnVw1PgR5K2QOOj2vI=
X-Google-Smtp-Source: AGHT+IEwUStqiKFWDnWMW5V5pmfpPcUGnYrlpxP9GZBVOUfS+hpnSkU74TkvIR7AkSVJzvljJSmRxA==
X-Received: by 2002:a4a:2542:0:b0:57b:3b64:7ea5 with SMTP id
 v2-20020a4a2542000000b0057b3b647ea5mr9139908ooe.1.1696247218648; 
 Mon, 02 Oct 2023 04:46:58 -0700 (PDT)
Received: from abhinav-IdeaPad-Slim-5-14ABR8.. ([103.75.161.210])
 by smtp.googlemail.com with ESMTPSA id
 i187-20020a639dc4000000b0050f85ef50d1sm18876426pgd.26.2023.10.02.04.46.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 04:46:58 -0700 (PDT)
From: Abhinav <singhabhinav9051571833@gmail.com>
To: shuah@kernel.org
Subject: [PATCH v2] Added missing TARGETS in kselftest top level Makefile
Date: Mon,  2 Oct 2023 17:16:35 +0530
Message-Id: <20231002114635.1567809-1-singhabhinav9051571833@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2023100251-recycled-purist-1ea5@gregkh>
References: <2023100251-recycled-purist-1ea5@gregkh>
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

I removed sched, safesetid and filelock from the Makefile, because these
tests were actually triggered when we run 'make run_tests' even though it
has not been mentioned explicitly inside top level Makefile of selftest.

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
