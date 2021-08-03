Return-Path: <SRS0=/NdJ=M2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50489C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Aug 2021 14:20:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC9DF60FA0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Aug 2021 14:20:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DC9DF60FA0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9C8E60797;
	Tue,  3 Aug 2021 14:20:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tt8CXcgf3LN0; Tue,  3 Aug 2021 14:20:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id CC8BE60723;
	Tue,  3 Aug 2021 14:20:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B9B8CC0010;
	Tue,  3 Aug 2021 14:20:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0BC3CC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 14:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F041A40412
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 14:20:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GXbQycnt3ho8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 14:20:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7DA78403F7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 14:20:00 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id a20so23987441plm.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 03 Aug 2021 07:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=rSuCXVvt7Cc664WyDwX82sa7++YHFnHb4fvJqU97Fyw=;
 b=e70lkh/eLCNlSR/gi5DT1dGLJGEaLs1AC5COHZCQnGIEi3ab2rYhhqIQTpNJAw8GMl
 eT2AF/cqT7VJu8xWSvolaBbH8X/XsOsCiPKeYOJ/D9aLomECjhiISshO8O+hqEXQD96g
 /3hyIOIT3QwF59RtxUarL2Z+w7LzBjjHgYYMHqeicCtj2zczwBpb3F6+X1Uvd7/NqHKi
 pW8X/FH7cDtk+VaPNTEueGS6u1GMvJMN7bAcGCbazKJ+5I11HUzen6pQFfw75eTwtk5N
 wX9mpzxKTnpJ+awMH9yph+4WwKJKUXQFasYax/hnm3eFcI1J6u18sFAoabBTOLjMY/k5
 jZLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=rSuCXVvt7Cc664WyDwX82sa7++YHFnHb4fvJqU97Fyw=;
 b=Dzi52u9Ge+ukAAlZ4slOBK40dwkaIAypauZm3yKRazu9nV3Qc43sxAPfEC1aXUR03j
 D9HW2H53XmZO4/T0rKDNk6OUobESwRrJAvq+WitRLVU4PXR5uyAtPUGAvSaTjpZKa70Y
 WcMl6l+p9LdnRYIWXe2gbojYizW/jmL7OQigE4g/nD4gf7K0mtdHwppxuTp95izZES1g
 qpAh2rfit//ebhNgtwMOmmemECx82Q5sp9zPbFTapkZYiMKQRnMMY1PmeyneUZCUDQqF
 i6wbLJ5fK7jAdk8l/09yLusBk+VGlmcthANOBUT5k8qUndVzxr8jXp4k+iXlqXSnrCYF
 qvcg==
X-Gm-Message-State: AOAM533Tt5TwZ2jASnTfSW9zF7doc+1qLq86qLYc6pjUtbklohTvUU6W
 EtfhFiwEVu1mFVOL2ERKzt0=
X-Google-Smtp-Source: ABdhPJzMVPP8npSCiULearNNHbpylN0Ezfn1GTEQ2JtD5Rvbh48FVCOj4yg50KRIlkm5mBjHRFKwoQ==
X-Received: by 2002:a17:90a:948b:: with SMTP id
 s11mr4554803pjo.220.1628000399852; 
 Tue, 03 Aug 2021 07:19:59 -0700 (PDT)
Received: from localhost.localdomain ([47.9.137.220])
 by smtp.googlemail.com with ESMTPSA id z124sm17711108pgb.6.2021.08.03.07.19.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 07:19:59 -0700 (PDT)
From: Utkarsh Verma <utkarshverma294@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] Documentation: checkpatch: Add SYMBOLIC_PERMS message
Date: Tue,  3 Aug 2021 19:49:47 +0530
Message-Id: <20210803141947.16960-1-utkarshverma294@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAKXUXMymBWUcy53a38hA9b3VYL0af2vpDW0=xsCEWuiiUQQn-w@mail.gmail.com>
References: <CAKXUXMymBWUcy53a38hA9b3VYL0af2vpDW0=xsCEWuiiUQQn-w@mail.gmail.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

Add a new message type SYMBOLIC_PERMS under the 'Permissions'
subsection. Checkpatch documentation that recommends the user to use
the octal permission bits instead of their symbolic macro names.

Signed-off-by: Utkarsh Verma <utkarshverma294@gmail.com>
Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 Documentation/dev-tools/checkpatch.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
index f0956e9ea..5094e3419 100644
--- a/Documentation/dev-tools/checkpatch.rst
+++ b/Documentation/dev-tools/checkpatch.rst
@@ -957,6 +957,10 @@ Permissions
     Permission bits should use 4 digit octal permissions (like 0700 or 0444).
     Avoid using any other base like decimal.
 
+  **SYMBOLIC_PERMS**
+    Permission bits in the octal form are more readable and easier to
+    understand than their symbolic counterparts.
+
 
 Spacing and Brackets
 --------------------
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
