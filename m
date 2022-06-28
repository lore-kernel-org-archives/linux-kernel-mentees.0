Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD0F0C43334
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jun 2022 05:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F15C60BFD;
	Tue, 28 Jun 2022 05:46:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F15C60BFD
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FRRdoThf
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZshVe8EXPY9n; Tue, 28 Jun 2022 05:46:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 5A603606EB;
	Tue, 28 Jun 2022 05:46:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A603606EB
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 37FBBC0039;
	Tue, 28 Jun 2022 05:46:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 970F8C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jun 2022 05:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F03782D04
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jun 2022 05:46:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F03782D04
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=FRRdoThf
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X9DolJcBZXVV
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jun 2022 05:46:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D315782CB7
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D315782CB7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jun 2022 05:46:21 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id x8so6553129pgj.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jun 2022 22:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BHznjnB3X6pSSzGF29R7wDFX5N5Qt9JR+ltijgYS9ao=;
 b=FRRdoThfrfkXaV9KDBETEgtLkw6haOT82RIqDQ2eRxR2CIUxkq2vuZIw6DAqDA22dX
 05TBLlD8tx7KQKIUgr0ZooSdtoql1qH6mQsDDuTjpfXpE+nvtGNor33yQoHKWKQQ4JBG
 AemDo+eTnDHOLa6/K54Vb7wlBn4eeQ4yEtArCYzW16DYuCb/6r2m/1uxCiwIbaQS4fDT
 xfV8lI3fmJpFf3iBx9Th1lfLKDi1F2EMgDSvF32hrZbeWvI+TDFAltsGlEM//TEkb7+s
 Rz71UD4sp0JR80rzgcnGJ1R4Ch8p4ElL93oftR7uktIpNQlCGN1cn/1BJGl2WLdk+0fJ
 fuSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BHznjnB3X6pSSzGF29R7wDFX5N5Qt9JR+ltijgYS9ao=;
 b=15QAFAYmeunkFsyxdz/uvpvosngCPBYWwvErjbM0CkxymRfXoxvyFg6/xdl589LQV/
 K+1Iu07HfapqyB+3+xxnuTftAN6eDVP13jtSbT1vvl+uT9ayikKJD17k6dD3YrvQ1DWU
 ETPpMRgxcobfnfzKF3TP7Xh1bECY2+lxxnk/8es874XqZ+npcuM8wYUR6MW6zFlEqye9
 fRxDs5hEVBJumD1guJDIoR+3fOppWYSGBJG3ODWgyF5xE9w4uAjUDOHxBslihJXNH/AF
 R89YeDf4I6DQJD06dPrBOQ/FgtHCh1wNJCYABj9kmrmWS3bcOuP4z1T6TbixFNICzbwT
 Wf5Q==
X-Gm-Message-State: AJIora/BbzHHdcmuDM7nvaTysk+snrFc6en4hLX/guMxjbjoAU7Ret9i
 HrBmtiyS0n0carrTKIlp8QE=
X-Google-Smtp-Source: AGRyM1sa/E5y4Eo5PRGtC0bm2I9DTSmOmtfPSivl0aZgtiDsPOkc733Ft6YCLXDEmYc+wbDXwGBpMw==
X-Received: by 2002:a63:6e44:0:b0:40c:73a7:b6c9 with SMTP id
 j65-20020a636e44000000b0040c73a7b6c9mr15831082pgc.285.1656395181226; 
 Mon, 27 Jun 2022 22:46:21 -0700 (PDT)
Received: from fedora.. ([103.230.148.187]) by smtp.gmail.com with ESMTPSA id
 v14-20020aa7808e000000b00518e1251197sm8656228pff.148.2022.06.27.22.46.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 22:46:20 -0700 (PDT)
From: Gautam Menghani <gautammenghani201@gmail.com>
To: shuah@kernel.org
Subject: [PATCH] selftests/drivers/gpu: Add error messages to drm_mm.sh
Date: Tue, 28 Jun 2022 11:16:03 +0530
Message-Id: <20220628054603.157310-1-gautammenghani201@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Gautam Menghani <gautammenghani201@gmail.com>
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

Add error messages when the module test-drm_mm is not found or could 
not be removed to make tests output more readable.

Signed-off-by: Gautam Menghani <gautammenghani201@gmail.com>
---
 tools/testing/selftests/drivers/gpu/drm_mm.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/drivers/gpu/drm_mm.sh b/tools/testing/selftests/drivers/gpu/drm_mm.sh
index b789dc8257e6..09c76cd7661d 100755
--- a/tools/testing/selftests/drivers/gpu/drm_mm.sh
+++ b/tools/testing/selftests/drivers/gpu/drm_mm.sh
@@ -3,7 +3,7 @@
 # Runs API tests for struct drm_mm (DRM range manager)
 
 if ! /sbin/modprobe -n -q test-drm_mm; then
-       echo "drivers/gpu/drm_mm: [skip]"
+       echo "drivers/gpu/drm_mm: module test-drm_mm is not found in /lib/modules/`uname -r` [skip]"
        exit 77
 fi
 
@@ -11,6 +11,6 @@ if /sbin/modprobe -q test-drm_mm; then
        /sbin/modprobe -q -r test-drm_mm
        echo "drivers/gpu/drm_mm: ok"
 else
-       echo "drivers/gpu/drm_mm: [FAIL]"
+       echo "drivers/gpu/drm_mm: module test-drm_mm could not be removed [FAIL]"
        exit 1
 fi
-- 
2.36.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
