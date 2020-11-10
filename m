Return-Path: <SRS0=mimn=EQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 586BEC5517A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Nov 2020 15:52:08 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A08882068D
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Nov 2020 15:52:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gUTyGTQg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A08882068D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3756A8656A;
	Tue, 10 Nov 2020 15:52:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6wDn-8ueCwJ6; Tue, 10 Nov 2020 15:52:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8389E864D8;
	Tue, 10 Nov 2020 15:52:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6B875C088B;
	Tue, 10 Nov 2020 15:52:06 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 21A73C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 15:52:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 04BCE2036E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 15:52:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ANZEoVKO1MCk
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 15:52:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 3ED8F22C44
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 15:52:04 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id e7so11777646pfn.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 07:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=p7BfMtOnE/LpJ0Crt8wgon1nRqzmHVhKaZn6sFng2vo=;
 b=gUTyGTQgNxeuy0fu/nde4ua6XVOobj3IyX93i0JrKm7kbYtxwLRwyUSm4daec/4vyN
 Deo4FsFHNZ3deaRVcCStOb6ZZFQI7LKYT65i4PgJJM3ICaL1iXdm9yQAKSQTEjiSrYa7
 NfBYqjcbg8LJPQ5IJPlnDIAdAmYydZ3BlJ8f4RsdQtgpnKZdlU+rKL8By26+m2YpEEz2
 JciinGd2jkgDmAd2RNvLpX8awzryqV9alNpRi5AJZtj6XPCVrCbNGqAvhNQYVBl4qe1B
 iFYSbslxvkufGwe0IKQv52pasw5xEWvOTmjrfNX5euqryEYBKO4sJ2Be2Uf2O/0caH3u
 cbHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=p7BfMtOnE/LpJ0Crt8wgon1nRqzmHVhKaZn6sFng2vo=;
 b=S/qBjvVOLIJD2Z2dBWRa44+yTi1YDDkf3tsUNCYi62kbVCSLx45t9bHBT6S1CBji5s
 1hVWdgOq0v42w9e0HQqoLayR/v321b5gEkEtSEx2hdNrbMJSCmQbQJyhc7U+2NEZpuT+
 +1JxW+3NqmWH1diyob2jWmp2txyUu/jOVVBCBTBfFVOUzfu16iY+lKpxuU4BwEoTpUSF
 Nz4/fJX0c2L30+iRU21HXbltVVyLyC+Jg4jn/nQGCbhBtExicRP4Qsq127fj5PjDA6qg
 PdnCzaHjN0q1b/6kfBJVShg4P60cle+25vtPKUo45ILT4b+h/lmm9kijxZ2zky7e++6p
 riyA==
X-Gm-Message-State: AOAM532BHUDi3DTz6Tk6m2jR8IoDXEqOyMpIkiNOh7Zs8042VbDUHjxh
 Xydozprsav4P8hPhBoNd5hE=
X-Google-Smtp-Source: ABdhPJwo/c0UVxRstqpDjIDuEpCQ/rWe2ahqfqs7Zisty8dJFO1qxLxSyh+jBXZ8XLITKGH0ljLR3Q==
X-Received: by 2002:a17:90b:19d8:: with SMTP id
 nm24mr340282pjb.144.1605023523721; 
 Tue, 10 Nov 2020 07:52:03 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:413:8adf:79d0:1679:313c:70a2])
 by smtp.googlemail.com with ESMTPSA id t5sm3549116pjq.7.2020.11.10.07.51.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 07:52:03 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: mchehab+huawei@kernel.org
Date: Tue, 10 Nov 2020 21:21:53 +0530
Message-Id: <20201110155153.29862-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: yashsri421@gmail.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, krzk@kernel.org, grandmaster@al2klimov.de,
 trix@redhat.com, joe@perches.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: Documentation: include
	sign off for reverts
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Currently, we do not have any documentation on commit reverts regarding
the requirement of Signed-off-by tag for it. This may be misleading to
the users.

Evaluating MISSING_SIGN_OFF checkpatch warnings on v4.13..v5.8 showed
that 4 out of 11 cases missing a sign-off are revert commits.

Add documentation regarding the same to document the community
consensus and let readers know.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 Documentation/process/submitting-patches.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index 83d9a82055a7..ff065e1f6a25 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -404,6 +404,8 @@ then you just add a line saying::
 
 using your real name (sorry, no pseudonyms or anonymous contributions.)
 This will be done for you automatically if you use ``git commit -s``.
+Also reverts should include a Signed-off-by. ``git revert -s`` does
+that for you.
 
 Some people also put extra tags at the end.  They'll just be ignored for
 now, but you can do this to mark internal company procedures or just
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
