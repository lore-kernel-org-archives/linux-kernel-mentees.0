Return-Path: <SRS0=j5Lk=GI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F895C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Jan 2021 13:17:41 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0586E229EF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Jan 2021 13:17:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0586E229EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D794785D97;
	Tue,  5 Jan 2021 13:17:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hOXyoq3CwYdy; Tue,  5 Jan 2021 13:17:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 226EF85D9B;
	Tue,  5 Jan 2021 13:17:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0F84EC0891;
	Tue,  5 Jan 2021 13:17:38 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 574EBC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 13:17:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 44F438686D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 13:17:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H93e-QkA2aqw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 13:17:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5733D86849
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 13:17:35 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id b9so20760891qtr.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 05 Jan 2021 05:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jLhbRWXby6luGSFdzAvh4WkvKskLyAT83J5WUyy1B7g=;
 b=h47nmgU0rIwhajSpfHu3iTWzq30XXTCyDfCURIz5rXQNIRu6C7FopM/0vWUwwTmmyZ
 +vaowIcYOlJNYAVajvxvjIC1SV/MoypaMqtT5+zxoFAg5NuXq/+80VctTWUzUK0WYb+w
 a4IvfNrwIDt0sTgffUBa4ECerc3AD4xe1Z3MjJE3Ey8JfCsuhEJGFBvfEttmjQ1+RrZp
 n8xMASrLIDv003UlpTSxrt+VLhCHOnho52wF8o813HcnuTeAITQ+Ol66zNDRMHM+oubh
 otFYkYYcOaEoKrOX7+gpHHvRk7VD/jpVhavlJR9h5B5AXPYbf8IshQ7BVjsrXFMunIPf
 NbTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jLhbRWXby6luGSFdzAvh4WkvKskLyAT83J5WUyy1B7g=;
 b=KaY8HB3tfXZHz+qow88ejnXfhmCZ1JiJa5t7l64qVoVKbW4m8zUJDnDAkqYMakiHGv
 YbItuOQkgqQJQ4ri8F1kcoN/VlfgWfn3uSloJtgm34CLtSWZ2q07cr12skVdH4xbbr2k
 MVqfPIyRysZJgA3D3H1o7m+50GY/RvT558duI6mh5r3gy/wgfOR37aWm24C+xA4y2gsq
 GTTbWpH2IaQP8pSVo4MrcauJjk1sssHRdTgvFGYWu+1rqYNP5Unaxdo3C/2ojr9HWsTL
 RnIyXPoOpSOYWKY6wNKswjkt8H240uPKEEkVro1r48fHlBHEWgPyfQeJ6BOJZzz+JiGq
 B/yQ==
X-Gm-Message-State: AOAM533Bxs3glrbh6Gx3PIF6Sem+lqjP4KuiaF4A7FcHvJ8rKB87BiOJ
 BO6ifxinhXkRSttt5u8Ud5o=
X-Google-Smtp-Source: ABdhPJyVzx47+ZOqsoJXupw8slUQFPMehE0nhfa36KTvI6eGYZb4pDueYzmJKn/d/uD3F22/U5vWEg==
X-Received: by 2002:ac8:1c92:: with SMTP id f18mr71741567qtl.234.1609852654400; 
 Tue, 05 Jan 2021 05:17:34 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:77d4:6fb0:85b3:b6f7])
 by smtp.gmail.com with ESMTPSA id h16sm40697819qko.135.2021.01.05.05.17.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 05:17:33 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab@kernel.org,
	hverkuil@xs4all.nl
Date: Tue,  5 Jan 2021 10:17:25 -0300
Message-Id: <20210105131725.1191046-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-media@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v4l-utils] test-media: add support
	for vidtv
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

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Add support for vidtv at the test-media script so that automated testing
is possible. Proper compliance tests are still pending.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 contrib/test/test-media | 72 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/contrib/test/test-media b/contrib/test/test-media
index 1c1d2e37b..86a2e081a 100755
--- a/contrib/test/test-media
+++ b/contrib/test/test-media
@@ -4,6 +4,7 @@
 #
 # Copyright 2019 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
 
+vidtv=0
 vivid=0
 vim2m=0
 vimc=0
@@ -51,6 +52,7 @@ if [ -z "$1" ]; then
 	echo "-32: use v4l2-ctl-32 and v4l2-compliance-32 to test the 32 bit compat layer"
 	echo
 	echo Test Targets:
+	echo "vidtv: test the vidtv driver"
 	echo "vivid: test the vivid driver"
 	echo "vim2m: test the vim2m driver"
 	echo "vimc: test the vimc driver"
@@ -96,6 +98,7 @@ while [ ! -z "$1" ]; do
 		fi
 		;;
 	all)
+		vidtv=1
 		vivid=1
 		vim2m=1
 		vimc=1
@@ -109,6 +112,9 @@ while [ ! -z "$1" ]; do
 		vimc=1
 		vicodec=1
 		;;
+	vidtv)
+		vidtv=1
+		;;
 	vivid)
 		vivid=1
 		;;
@@ -162,6 +168,72 @@ $v4l2_ctl -z platform:vivid-002 -d vivid-002-vid-out -o1 -x width=3840,height=21
 
 echo
 
+if [ $vidtv -eq 1 ]; then
+	rmmod vidtv 2&>/dev/null
+	modprobe vidtv
+	sleep 2
+	dmesg -n notice
+	echo
+
+	if ! media-ctl -d platform:vidtv -p ; then
+		echo "FAIL: the vidtv module failed to load" | tee -a $tmp
+		echo "Grand Total for vidtv: Succeeded: 0, Failed: 1, Warnings: 0" | tee -a $tmp
+		echo "Final Summary: 1, Succeeded: 0, Failed: 1, Warnings: 0"
+		rmmod vidtv
+		exit 0
+	fi
+
+	echo
+	echo
+	echo
+	echo
+	echo
+	echo
+	echo
+	echo
+	echo
+	echo unbind vidtv
+	echo
+	echo -n vidtv.0 >/sys/bus/platform/drivers/vidtv/unbind
+	sleep $unbind_time
+	echo
+	echo rebind vidtv
+	echo
+	echo -n vidtv.0 >/sys/bus/platform/drivers/vidtv/bind
+	sleep 1
+	echo
+	echo second unbind vidtv
+	echo
+	sleep 1
+	echo
+	echo -n vidtv.0 >/sys/bus/platform/drivers/vidtv/unbind
+	sleep $reunbind_time
+	echo
+	echo rmmod vidtv
+	echo
+	rmmod vidtv
+	sleep $rmmod_time
+	if [ $kmemleak -eq 1 ]; then
+		echo
+		echo kmemleak results for vidtv:
+		echo
+		echo scan >/sys/kernel/debug/kmemleak
+		cat /sys/kernel/debug/kmemleak
+		echo
+		echo end of kmemleak results
+		echo clear >/sys/kernel/debug/kmemleak
+	fi
+	echo
+	echo
+	echo
+	echo
+	echo
+	echo
+	echo
+	echo
+
+fi
+
 if [ $vivid -eq 1 ]; then
 	dmesg -n notice
 	echo
-- 
2.30.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
