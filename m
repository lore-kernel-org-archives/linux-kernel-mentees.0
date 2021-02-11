Return-Path: <SRS0=BNSL=HN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15A25C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 11 Feb 2021 17:59:29 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64C5E64DEE
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 11 Feb 2021 17:59:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64C5E64DEE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 176BF86949;
	Thu, 11 Feb 2021 17:59:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AG4egy5zpGTv; Thu, 11 Feb 2021 17:59:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4F5CF86813;
	Thu, 11 Feb 2021 17:59:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 310B6C0174;
	Thu, 11 Feb 2021 17:59:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 46564C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Feb 2021 17:59:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A1616F480
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Feb 2021 17:59:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xlN2GySKOBPM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Feb 2021 17:59:25 +0000 (UTC)
Received: by smtp3.osuosl.org (Postfix, from userid 1001)
 id 826496F510; Thu, 11 Feb 2021 17:59:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5434F6F480
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Feb 2021 17:59:24 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id d2so3844454pjs.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Feb 2021 09:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+om9eHtS9j/YdxgTsTfGj56DNm0I/KgrW6X/2Oi1Uis=;
 b=aMI0kNpZOLIKo69EZWvigH+ZrGg1sMA7p0WKReEGFGURdA7v7G8PLbzWpPmkmX6Bk5
 5UrLqs3i10MdHiIiaoe2kmn2v6pJ5YoH7wyGKxa9yJfA62/SQGOHq/0xmB4D0ijKjj7R
 F9bO7kgi5gR6xdgaYQg/cZKA+kvNFiCelyvEdayok2915LDzTzJQbMd0Ly5AaCwt9gBT
 n3r17efCwwpWYq93HCEil/9PoP7Km3Lfctz0TFZ3r56QD+obUSTTm1PZ9rRziQrDvfdy
 PKQ6dSdXRFNGgYNLK/K3zHNn+0yt/a4YM7Lc1UPYKW2F5XP8V9tffH3OKv7RByHSVAro
 dLDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+om9eHtS9j/YdxgTsTfGj56DNm0I/KgrW6X/2Oi1Uis=;
 b=nzMP919W38G6glptrWLH0TqpxBB9UjDB9FQII/yGi5JKAc6Fx44DL+Mc13hwLbsnZk
 ACcNaL9YsOaPhzBzAE/G2y55icibYPg2ZtmvQE+WsPCw/eK8sr61YRFDAyXtaHyRXDFI
 iU5VDcKWxWGz1pLN8Do8ZdXfFspYXl2w6WPgvTISxZEvsC2JFCdYbLhOVh319TFdrqsC
 ESBEL1JV/dCZN8dFBRHwODHDGODhD7a32Y0KC7HjhUbX/T+9A/K7gWa82F1MZenVsBHW
 7zGcdfixTo7GqH6QB4yNnuKw+l49BZFp24o955F/1rYbfu5fXnhlYYJDNw/jnrd9zlxb
 grBQ==
X-Gm-Message-State: AOAM530X4x9vDwxC8Okiw25UQ1p/M+XTu9UvJNmis3h/08B1jMpehfAE
 HCNkwChfajGS6nrXozHpjZ4=
X-Google-Smtp-Source: ABdhPJxrtP2fAwNHtKx0zlDJ5SHzwXPh1c6ZZeqKKHVEX5gLiJUxnBmmqlcHL/gYU2lWH6hotTjQOA==
X-Received: by 2002:a17:902:6b43:b029:df:fb48:aecf with SMTP id
 g3-20020a1709026b43b02900dffb48aecfmr8452570plt.67.1613066363755; 
 Thu, 11 Feb 2021 09:59:23 -0800 (PST)
Received: from localhost ([2601:1c0:6c02:1d30:4920:87a0:85cd:f278])
 by smtp.gmail.com with ESMTPSA id c23sm6180015pfi.47.2021.02.11.09.59.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Feb 2021 09:59:23 -0800 (PST)
From: Adithya Chandrakasan <adithya.chandrakasan@gmail.com>
To: akpm@linux-foundation.org
Date: Thu, 11 Feb 2021 09:59:14 -0800
Message-Id: <0c1ce6d55fb011f29b2c22134f59829402eba175.1613066176.git.adithya.chandrakasan@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <bce53689-4a6e-c3c3-a09c-6e946a577f61@redhat.com>
References: <bce53689-4a6e-c3c3-a09c-6e946a577f61@redhat.com>
MIME-Version: 1.0
Cc: linux-mm@kvack.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Adithya Chandrakasan <adithya.chandrakasan@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH] Staging: mm: util.c: checkpatch.pl
	coding style warning fix
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

FILE: mm/util.c:930:
checkpatch.pl scripts basic coding style issues as below
WARNING: Missing a blank line after declarations

Signed-off-by: Adithya Chandrakasan <adithya.chandrakasan@gmail.com>
---
 mm/util.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/util.c b/mm/util.c
index 8c9b7d1e7c49..60286876636d 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -927,6 +927,7 @@ int get_cmdline(struct task_struct *task, char *buffer, int buflen)
 	unsigned int len;
 	struct mm_struct *mm = get_task_mm(task);
 	unsigned long arg_start, arg_end, env_start, env_end;
+
 	if (!mm)
 		goto out;
 	if (!mm->arg_end)
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
