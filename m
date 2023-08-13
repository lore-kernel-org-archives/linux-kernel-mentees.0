Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28AF8C001DB
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 13 Aug 2023 11:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9FB180FAB;
	Sun, 13 Aug 2023 11:08:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9FB180FAB
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=o7bz97et
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NLYo7NF0WSxD; Sun, 13 Aug 2023 11:08:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 9E2B780E8A;
	Sun, 13 Aug 2023 11:08:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E2B780E8A
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 85B5FC0072;
	Sun, 13 Aug 2023 11:08:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 13E70C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Aug 2023 11:08:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E3A7D40176
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Aug 2023 11:08:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3A7D40176
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=o7bz97et
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id INqOeyit3vp5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Aug 2023 11:08:47 +0000 (UTC)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5F01C40160
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Aug 2023 11:08:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F01C40160
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1bdaeb0f29aso15475755ad.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Aug 2023 04:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691924927; x=1692529727;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SsTxCPc1FRbAQu+e710DcZ5hw9KbeEFuU6FiiWJ0vJM=;
 b=o7bz97etTRFrHOOxA8YPH4LZZ6DNi3D8HA+1Yj7/KT0Qh09pjAaj1f9+0tiDYhKW39
 M2l2qf0Cd3Lvf7p5AGeq/0llMEof6BVNI/a6sSxPSkavQgZAPEKfBS54xQvxP4OQ4rZD
 6zHbRs1EbkiAypuEX+a4JHPIQj7x+k34hUMNVQoJKmdg4vytzv/OzI7mUXps4Y/wa402
 mKckoIC/UYpkpErG68BFKs7XBc/Ls5qYW6dV6fxK6761GIodkPP/6WTU9aHybRVzr4NH
 o4AX8pTqIJCsL8ffNy5oGeKhhF2DmztcveWwPa025lQPTzFmPoLxTrQWWX6frk7nCmg2
 vXPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691924927; x=1692529727;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SsTxCPc1FRbAQu+e710DcZ5hw9KbeEFuU6FiiWJ0vJM=;
 b=UYRUmOlb4je6RIuJEdlCzCsW5wfmchCmbSBtuOcw5uoA/GD8YJ7c2yz8AHKnM4WD8j
 oCP370BRRjgJ8HCt6gQBishgoYyKGzQuuX/hAoPmYrOp7JikIeVBTdEC1sczYa6sUhFW
 01L8viDP/ZINQuAsbPBgTaICFJBsFkFAn9M1bWv0gXDLggmPXgGk62R9nFIfmheORh3f
 0Tu9+gxMn7NGbrwdX38EJwQkxYmORSLTHYKzf1IN023xbbJQ8E2hekOSU+UBH/KiWXHm
 PVWlHTCElr0RmmCWP+qvD6XxM8IEhpsWurQV3FKSQ/Et8noiEoMGeTW93et5Fm87tEzM
 +wuQ==
X-Gm-Message-State: AOJu0YwUth5IbpWGzCW/9hKrPfF7s6UuThwe9n+HDHs1hkeP34/5q6TK
 9yfTM/JGrQiIHQSgiOJ4Omg=
X-Google-Smtp-Source: AGHT+IFkEYzu/K2uHtVx4RUNoiA3sjvyV1RZ7XxaOOlzLZahj9blAepnvECtMVlFp0IwnrbfvCkxtQ==
X-Received: by 2002:a17:902:da8f:b0:1b6:9551:e297 with SMTP id
 j15-20020a170902da8f00b001b69551e297mr5071022plx.44.1691924926670; 
 Sun, 13 Aug 2023 04:08:46 -0700 (PDT)
Received: from localhost.localdomain ([2409:40c2:100c:8e93:d00a:1992:423:e24e])
 by smtp.gmail.com with ESMTPSA id
 c12-20020a170902d48c00b001bdc2fdcf7esm3910509plg.129.2023.08.13.04.08.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Aug 2023 04:08:46 -0700 (PDT)
From: coolrrsh@gmail.com
To: Shyam-sundar.S-k@amd.com, hdegoede@redhat.com, markgross@kernel.org,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] platform: sps: Fix an unsigned comparison that can never
 be negative
Date: Sun, 13 Aug 2023 16:38:41 +0530
Message-Id: <20230813110841.130206-1-coolrrsh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

From: Rajeshwar R Shinde <coolrrsh@gmail.com>

The variable 'mode' is declared as unsigned int in local function.
The return value of function amd_pmf_get_pprof_modes(dev) is int and
it is stored in the 'mode' variable. Also the value of 'mode' variable
is compared with 0 which is signed int by default. Thus redeclaring the
variable to signed int.

This fixes warning such as:
drivers/platform/x86/amd/pmf/sps.c:128:5-9:
WARNING: Unsigned expression compared with zero: mode < 0

Signed-off-by: Rajeshwar R Shinde <coolrrsh@gmail.com>

---
v1->v2
changed the commit subject
---
 drivers/platform/x86/amd/pmf/sps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmf/sps.c b/drivers/platform/x86/amd/pmf/sps.c
index ab69d517a36a..703723a66830 100644
--- a/drivers/platform/x86/amd/pmf/sps.c
+++ b/drivers/platform/x86/amd/pmf/sps.c
@@ -176,7 +176,7 @@ int amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf)
 
 int amd_pmf_power_slider_update_event(struct amd_pmf_dev *dev)
 {
-	u8 mode, flag = 0;
+	int mode, flag = 0;
 	int src;
 
 	mode = amd_pmf_get_pprof_modes(dev);
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
