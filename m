Return-Path: <SRS0=6HJV=HU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4FEAC433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 18 Feb 2021 21:28:31 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C5E264EAE
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 18 Feb 2021 21:28:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C5E264EAE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A6D0A8741B;
	Thu, 18 Feb 2021 21:28:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 56nsxB4UCFnB; Thu, 18 Feb 2021 21:28:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7613C873FB;
	Thu, 18 Feb 2021 21:28:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 622DFC000E;
	Thu, 18 Feb 2021 21:28:29 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F08E6C000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Feb 2021 21:28:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D7D2D86AB1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Feb 2021 21:28:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XaAcyLbuqnxj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Feb 2021 21:28:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 22B9686A70
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Feb 2021 21:28:27 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id a22so8481556ljp.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Feb 2021 13:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wa+uDqai5FO8EqQOT4ZyA5Zo9X7Xp8q4ul//4wyTkAU=;
 b=RB5Py+t5Ap1gYgPMDhj32nLgunK0vhJxxby5CbqIPytBDUJNM29llOt1MnMjII8N1m
 dAOOrlYFlgEOQD7q1jd8JbpqPqXonWjZDopAFM0DsWEyrqCJHveN++vep973qAlp9BAR
 KJLn0ozKVHWXF0wmOdtQaE4serEteeM2PyBC2OHKPZGrUImg5nGz49g0kATrbFtLYNQb
 ku/lzObRzZedvhiw3oqXJJJK90ieAJajmzrk4QZ7xspkDvM+8ESOiK9+qKGdUNZAtyvq
 rRPMC62dYKyM6xpTqyb+Y5/q5xp1QH8ZAqG23kzfuoDwXoEkEb9ZyCvflOqfOCin+N5v
 BymQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wa+uDqai5FO8EqQOT4ZyA5Zo9X7Xp8q4ul//4wyTkAU=;
 b=MYSRKt5Ye77zpvUFG4FiNhmgY1YHv7KfwbN8tw+/sCgR/Y739qfvl+d3+1V4BpsORb
 /1WvQth7yzeiGHKpTL6BC/JkhxfHVAWk9wqvbtG/9gXfVyfyVnVu1/EZhVSJRAlWXs72
 /aDSD42xHDTqUAvoXvrg09zC2QSqz6JRRdsQRSywJAFWyg/oizYmng6SSaTmjcz3PD3Y
 CGgYPLnJ2RXWc6ubQxfq9FFCnmtMbE9M8C/h3oUrjzZ4tle3udkpoYE2jDeiHKHARYsW
 MKlXt0IVnIf/w0eqg8kiChUFOF2C+gI1tYk5XoQhBASFW5PKElIqDOgHqEYNTcp09/nR
 dcmA==
X-Gm-Message-State: AOAM530n7Xf5nmeopbCR7Poq0MfM1zIMBXH+lRBzfDTbEFjGpogd9tfb
 GKtJmH4hpyGOiq+GgAZ+yQs=
X-Google-Smtp-Source: ABdhPJx6ztEfkQcBu/QP6vpNKMHGfFiwlwJ7PEKrIXj1g+hq1YRPB6shv3lQXhnJAV9n8M7XznIZvA==
X-Received: by 2002:a2e:8444:: with SMTP id u4mr3643266ljh.342.1613683705417; 
 Thu, 18 Feb 2021 13:28:25 -0800 (PST)
Received: from localhost.localdomain (cable-hki-50dc97-115.dhcp.inet.fi.
 [80.220.151.115])
 by smtp.gmail.com with ESMTPSA id w11sm742818ljw.97.2021.02.18.13.28.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 13:28:25 -0800 (PST)
From: Hassan Shahbazi <h.shahbazi.git@gmail.com>
To: akpm@linux-foundation.org
Date: Thu, 18 Feb 2021 23:27:39 +0200
Message-Id: <20210218212738.105097-1-h.shahbazi.git@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Cc: Hassan Shahbazi <h.shahbazi.git@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH] lib: genalloc: fix warning generated
	by checkpatch
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

Add missing blank line after declarations.

Signed-off-by: Hassan Shahbazi <h.shahbazi.git@gmail.com>
---
 lib/genalloc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/genalloc.c b/lib/genalloc.c
index dab97bb69df6..3e901fd93b00 100644
--- a/lib/genalloc.c
+++ b/lib/genalloc.c
@@ -757,6 +757,7 @@ unsigned long gen_pool_best_fit(unsigned long *map, unsigned long size,
 
 	while (index < size) {
 		unsigned long next_bit = find_next_bit(map, size, index + nr);
+
 		if ((next_bit - index) < len) {
 			len = next_bit - index;
 			start_bit = index;
-- 
2.26.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
