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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32957C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Aug 2021 21:37:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D140460F8F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Aug 2021 21:37:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D140460F8F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A53BE40390;
	Tue,  3 Aug 2021 21:37:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n27zxjSfihsZ; Tue,  3 Aug 2021 21:37:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E8EB9401F7;
	Tue,  3 Aug 2021 21:37:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CB2D5C001A;
	Tue,  3 Aug 2021 21:37:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BD562C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 21:37:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F47D83777
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 21:37:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iAitu2tRN-dx
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 21:37:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0213C83806
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 21:37:55 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id ca5so29334pjb.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 03 Aug 2021 14:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=JQP/SRJ8zXrHVoek+drscJ3oEF60XPvWnWm92RSsOm8=;
 b=txur015ozeo5FtxINzpXy64tF7WQNx978VsCL6Fucw9OdYu22oT6ZQn9mE2bNo1F3j
 pVJKXZMABzVX/dqMq2P6yCn1XrKHmhlrn3hPFPXKxKXUaKKHAKcJXNhLvLUqIR4Vc4Qx
 5xrlJRTK03OBO8uDH5wm8jTa1ecAbhyMYYtzZS2qI9+mhxGk5gDhR2150kP8RttGxVOD
 Q9HegKTHyjSEw65HC9zP9TeCFOUcBoqRKoJ8zEU9nawEI3zJ97dvl6/Pei/MTaBr2zzE
 8iBkisUwLChd4uaKgkBKcMB+Q3Tam579d94FkCWob8w8fW+3RrWDrfEwWfhmaYV1iuT8
 2x8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=JQP/SRJ8zXrHVoek+drscJ3oEF60XPvWnWm92RSsOm8=;
 b=p62C8TW4CreQB3bUFqTVtu0x+uMt2H6arhGpMHXDvsI1I3mkG9JcMPJ7VfIuhAI6pK
 S/VZ7h/K1LkEVWG5xbsiXcdXzT8Z6OJ9gTRp0ZmWYK93mHU7xswPOCJsamq8SAxolrr9
 G50LtWbdSJyMustZGsRAjdCud0j9sJES9aIQl61kYVi7hJxmeg10RlMaWVvdvqCEty2b
 8LUsggr1mULkW7LZs0i2Da7WxQiZnd7qVF4EogpLOrLTLikWwt7ra3ndmghz0bCEtGrx
 So/OaKqiaVvQ6MqES1ewoPaE9DfreLUvswYCvWt4diGh8WMBP4xEnpxuRPQpdWxPllAT
 lnPw==
X-Gm-Message-State: AOAM532xYJ4OBCRTZ4Y1+hG1vHMiBqG+LmtExexGKZMpi2oaLqzIgfIn
 HYDHTW2v1icYBFd0KESSjNs=
X-Google-Smtp-Source: ABdhPJwtI0Ak6uLmMAlfvx5KLNiF81wV47XO6pKR2VNRCBkKVJGX3qhu3aTvPkbQgsGWdliN6W2rlw==
X-Received: by 2002:a65:4785:: with SMTP id e5mr639936pgs.186.1628026675269;
 Tue, 03 Aug 2021 14:37:55 -0700 (PDT)
Received: from localhost.localdomain ([47.9.154.212])
 by smtp.googlemail.com with ESMTPSA id r10sm161184pff.7.2021.08.03.14.37.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 14:37:54 -0700 (PDT)
From: Utkarsh Verma <utkarshverma294@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH v2] Documentation: checkpatch: Add SYMBOLIC_PERMS message
Date: Wed,  4 Aug 2021 03:07:16 +0530
Message-Id: <20210803213716.4484-1-utkarshverma294@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAKXUXMy2V9GJM+h1cEeHSTUsKQ3b=MfXY_jba3FRDNKKo12iRA@mail.gmail.com>
References: <CAKXUXMy2V9GJM+h1cEeHSTUsKQ3b=MfXY_jba3FRDNKKo12iRA@mail.gmail.com>
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

Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Signed-off-by: Utkarsh Verma <utkarshverma294@gmail.com>
---
 Documentation/dev-tools/checkpatch.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
index f0956e9ea..0d60f8e5e 100644
--- a/Documentation/dev-tools/checkpatch.rst
+++ b/Documentation/dev-tools/checkpatch.rst
@@ -957,6 +957,12 @@ Permissions
     Permission bits should use 4 digit octal permissions (like 0700 or 0444).
     Avoid using any other base like decimal.
 
+  **SYMBOLIC_PERMS**
+    Permission bits in the octal form are more readable and easier to
+    understand than their symbolic counterparts.
+
+    See: https://lwn.net/Articles/696229/
+
 
 Spacing and Brackets
 --------------------
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
