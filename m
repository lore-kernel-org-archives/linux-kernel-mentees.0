Return-Path: <SRS0=6zuU=KL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_RED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB1D9C433B4
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 16 May 2021 12:30:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48D6661155
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 16 May 2021 12:30:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48D6661155
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 04C44401B5;
	Sun, 16 May 2021 12:30:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qQseUEXziTkA; Sun, 16 May 2021 12:30:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 23F7C400CF;
	Sun, 16 May 2021 12:30:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 097B7C000E;
	Sun, 16 May 2021 12:30:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9439BC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 May 2021 12:30:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A84983A69
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 May 2021 12:30:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ux2EzGOMBcoJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 May 2021 12:30:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A5F2383A49
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 May 2021 12:30:02 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id n3so1719189plf.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 May 2021 05:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WG3vPr7jTrZWJiot95jPYHU2QyOXWk1phufGNJD2xZI=;
 b=V3RGkfHJyAKNttBRs2ZB9e2X2di/5AI8Fn9ZsnPjqhfBwRFgo2GYZKZY9uUCX3c95Z
 6odMZIGiOvl5adcoBnz57aSGgNutvwkLdbe6y1vBj65SY4o06lad5cZhXyrcF49UGz/N
 ugjrryLmomOpVA+tCMuxxAEMT2tZ0uxcZRMogCMPwkvlZOFsDbjltywQGJcXnLJMjeV7
 t9Cva5qVoD/ui5GxLv4M0Zcib/BeBWLYten2D2bhtqHawqBjMewBIkivp6AGfnqzYwlb
 uMFyF1nr+ZxVUb7ucwMgsxdlBIFwO8lQghEvF5VJCmZjUYMLE86nhpbH+WoRlNFA7qiP
 8w7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WG3vPr7jTrZWJiot95jPYHU2QyOXWk1phufGNJD2xZI=;
 b=aFc6Rcjgw23NEB3LjRI/xCPRF2DGUiw+gVydYsA2+Hp4WMT/sYupGGKJWYub2rwxbE
 1C1lsIN7ZRrMUqA/wR/DoJ1jtNIWK3lEPtRcLGRMqDPd9hAylCQXTSeBEwDeZeKvTpq6
 Ohl+O2jdFKXIYw9LMRBka3sn54HKYJrEe4z+YjmqWJli0PtYHbXPiO4L3V7PbA7QJ4pF
 hQW7TQfcjvlZTEpusukeoQBrfctZp4fYeOtcRFeJotC4LYaJUGsreldlguEM+3cqJlt1
 V6vv3dD1+K2ukRmGr74g+jOtX8y9/er4UWSTbjqaCOC10qeekMZRZ9Vz8MKOlm7czw/I
 XWyQ==
X-Gm-Message-State: AOAM530ILWLwmIDeJiEx/MEJNMTrmEEzRS/r8C9ic1ZE/sivxfSNqL+H
 Fo2GB08JBFPuASgfVQ/EasA=
X-Google-Smtp-Source: ABdhPJz9HzuN+RORcmcoIvkv93+pVKdpSAysrxX7o5ANQJDnTKBK7nhLOY0A+n2+atJI4ufmFMcKVg==
X-Received: by 2002:a17:90a:94c5:: with SMTP id
 j5mr12062466pjw.121.1621168202092; 
 Sun, 16 May 2021 05:30:02 -0700 (PDT)
Received: from localhost.localdomain ([111.223.96.126])
 by smtp.gmail.com with ESMTPSA id k186sm8004318pgk.82.2021.05.16.05.29.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 05:30:01 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: gregkh@linuxfoundation.org, marcocesati@gmail.com,
 dan.carpenter@oracle.com, fabioaiuto83@gmail.com, fmdefrancesco@gmail.com,
 eantoranz@gmail.com, hdegoede@redhat.com, Larry.Finger@lwfinger.net
Subject: [PATCH 0/7] Staging: rtl8723bs: fix warnings in HalBtc8723b1Ant.c
Date: Sun, 16 May 2021 08:29:20 -0400
Message-Id: <20210516122927.1132356-1-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-staging@lists.linux.dev, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
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

This patch set fixes 134 checkpatch.pl warnings in the file drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c

Although checkpatch.pl reports a large number of checks, these are for issues that were present in the original code. In fact, in the process of fixing warnings, the total number of checks decreased from 548 to 546.

All patches are syntax fixes and no logic is changed. As there are a lot of different warnings, to make things easier to review, each patch addresses a different set of warnings in the following order:

- braces {} are not necessary for any arm of this statement
- please, no space before tabs
- suspect code indent for conditional statements
- Statements should start on a tabstop (this type of warning is solved alongside the previous warning type in the same patch because the fix for one warning addresses the other)
- Comparisons should place the constant on the right side of the test
- Missing a blank line after declarations
- Avoid unnecessary line continuations
- Block comments use * on subsequent lines

Desmond Cheong Zhi Xi (7):
  Staging: rtl8723bs: remove unnecessary braces in HalBtc8723b1Ant.c
  Staging: rtl8723bs: fix spaces in HalBtc8723b1Ant.c
  Staging: rtl8723bs: fix indentation in HalBtc8723b1Ant.c
  Staging: rtl8723bs: fix comparison formatting in HalBtc8723b1Ant.c
  Staging: rtl8723bs: add missing blank line in HalBtc8723b1Ant.c
  Staging: rtl8723bs: fix line continuations in HalBtc8723b1Ant.c
  Staging: rtl8723bs: fix block comment in HalBtc8723b1Ant.c

 .../staging/rtl8723bs/hal/HalBtc8723b1Ant.c   | 335 +++++++++---------
 1 file changed, 158 insertions(+), 177 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
