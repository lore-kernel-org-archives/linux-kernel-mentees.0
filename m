Return-Path: <SRS0=tq4P=G5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BED0C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 26 Jan 2021 18:35:36 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB5172223D
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 26 Jan 2021 18:35:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB5172223D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6C0CE86FC7;
	Tue, 26 Jan 2021 18:35:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iS8Dz0BontYG; Tue, 26 Jan 2021 18:35:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id EE78F86E5B;
	Tue, 26 Jan 2021 18:35:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DE67EC0FA7;
	Tue, 26 Jan 2021 18:35:34 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9D374C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Jan 2021 18:35:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9959F86FC7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Jan 2021 18:35:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vmiOXh4PnaCU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Jan 2021 18:35:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8091286E5B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Jan 2021 18:35:32 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id h15so7763291pli.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Jan 2021 10:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vdH6zS43Uh1xLUVirUD1G6mrrWUijLO9wl7HWhhmt7g=;
 b=iKdXBNV4CeeaDytwPHx45WzE9t58NE6pbbesPsoW1ml0vM4Q04xdAQOL9D634qvI8W
 yEX5OVMg32jH7U8qU+8uK2J5xLJtdJJNsJEs5T2bb/OWEKCcs1/CeTId2/DY79NJiZ2K
 XXEJuSY0VBey+HGi7P4foFtOJeu3lztqgc637rTlNfd0fP2mt4H40Bm2YLiZ4Ij0P35J
 TAIEcRH+tu65eTbSTecmuEXyR2n9giFJBuxR8sUAbp/ncN6nl7SPaLr/1qoAWvu3xCbB
 fJqv27i0uVG2kOI7WmHVshjrMGeNOojZBNEGzL6DtwnFIulrTyUcknGlrGX3GruCFYm1
 vsKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vdH6zS43Uh1xLUVirUD1G6mrrWUijLO9wl7HWhhmt7g=;
 b=bhQIVZtF8jjxDYHZmV2CW6rGac+FSxvLhMb+nwStIrKZ60aOR9Hu6utuVqQS63PTLD
 cmuUpBrWkcLgWAMpejLCMlucqEOtslxUBNhzhFMwrH32xSZVuG/YvazhfrqDeNNHiVDQ
 rQ8U7d85UUKb5qWrz50yjAQ9abtRrh4BWqUy+nPoWPId8OWlvCiZl3yncKii/TySVbAm
 ZIjPeSI71/3n2fRCiQ+lJY0PDpmJ2zRQkzC5J+/fYe5o4RsJzBukY4YrpeZ+UMoBJkCq
 5Z65fsgxxtnm0BHZ6F1x8dkt2rLYD+p3spfuEM5AtL9uWaK6UmMN/3e//GVSQOi4aODf
 JIVQ==
X-Gm-Message-State: AOAM531hMgmOhk0YGpXZxNIbc4xhMLbqvwU97RNnyRhq89gq9k53xnAC
 U/Hm2YkF/639RorC/9nQnXgWiYerMJm1VQc2
X-Google-Smtp-Source: ABdhPJyDk3bnM+aGCU0UA/6LlXwIXWP2f/m2rpsWhOOtzxsmPNbrpUqcec7c9L0c7jLNAhxd+1airg==
X-Received: by 2002:a17:902:8b89:b029:e0:6c0:dea8 with SMTP id
 ay9-20020a1709028b89b02900e006c0dea8mr7500631plb.28.1611686132071; 
 Tue, 26 Jan 2021 10:35:32 -0800 (PST)
Received: from localhost.localdomain ([49.37.2.129])
 by smtp.gmail.com with ESMTPSA id a31sm19713654pgb.93.2021.01.26.10.35.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 10:35:31 -0800 (PST)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com
Date: Wed, 27 Jan 2021 00:05:21 +0530
Message-Id: <20210126183521.26535-4-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210126183521.26535-1-dwaipayanray1@gmail.com>
References: <20210126183521.26535-1-dwaipayanray1@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Dwaipayan Ray <dwaipayanray1@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH RFC 3/3] docs: add documentation for
	checkpatch
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

Link checkpatch.rst to the dev-tools index for sphinx.

Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 Documentation/dev-tools/index.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/dev-tools/index.rst b/Documentation/dev-tools/index.rst
index 1b1cf4f5c9d9..43d28998118b 100644
--- a/Documentation/dev-tools/index.rst
+++ b/Documentation/dev-tools/index.rst
@@ -14,6 +14,7 @@ whole; patches welcome!
 .. toctree::
    :maxdepth: 2
 
+   checkpatch
    coccinelle
    sparse
    kcov
-- 
2.30.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
