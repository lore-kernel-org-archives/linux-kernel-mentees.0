Return-Path: <SRS0=ZuYk=KS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6AC3C47080
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 23 May 2021 14:32:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 859EC601FA
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 23 May 2021 14:32:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 859EC601FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D1704027F;
	Sun, 23 May 2021 14:32:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r5iErRS3EHHm; Sun, 23 May 2021 14:32:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 687AD402C0;
	Sun, 23 May 2021 14:32:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3F6BCC000E;
	Sun, 23 May 2021 14:32:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9B635C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 May 2021 14:32:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 88A424040F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 May 2021 14:32:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nE-3k4UWQLHo
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 May 2021 14:32:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D4125403F2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 May 2021 14:32:56 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id x18so14406344pfi.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 May 2021 07:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=80oEOEMtjRDbSB+qf+VpWW8ktshD+Ev6RXgmcb2Yryg=;
 b=LJgraF0zltHesYML2Hh6g8kAJJKk1IY9s6V3w9sPul6auOktjjaN1eIVLaIj0gRRIA
 +GpEEfArRBpYmYt8FHuQbol/acDgcWlsyM/9pZBma4IKGnqFZPQ+a3aZbaduSBB5vXT1
 9/ZJ6KbDhc3mBPSmAC6US+zebuwf+Muk/JcWqUwVL+RDBxojmTqf76EIK5iLQQq3WDRb
 aaf6lgPM55SpuLlRf23nvNBfyzOiBFC7zQeIKXdLYAtagbS/IkiF3rvGmJEEYFaFu/Lw
 OXt4zdOxetI8SUnAC2fk3lTVdHkakdaHTPdYEzrIDN2lzyR68+Ed2vjv0VIytVDEd3Jf
 /5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=80oEOEMtjRDbSB+qf+VpWW8ktshD+Ev6RXgmcb2Yryg=;
 b=VAkEaok5aOxlpWQWgqE+4mEAB2vpwh5Wery+sb5eFhA9uMLmc5UydYa07BYfLxQBdD
 Lkb6WFvmlj8E6hFrbKPTuDLMJqrqqicPD3b7f0dKM1Z/A9UvTfssYp3mQKd93nZCluuZ
 sRAqukZphNddKuefU8stspJHPX56uhF+FFHyvR7rFCaeKK4SO2PtshUbzR/Z6PmwS/Qv
 9RDcqMwRYcSr0NTjGtII2e+hMpjOvg+M49uN2fJcTKq7AWN5hE6VB6c8ksinD/q0Q6e9
 7ahVOB7zjlCdTI4tot/UeQrBohPsmofgdiHM31A5m9dpNdDWn8ZIxo6bHamqUK3WtECx
 GX1A==
X-Gm-Message-State: AOAM532DGhW5+aSRIRgvhDO5TfRuQy1fYaebCjwtL7xnFcyzL0SYceoJ
 L9Vrwu8y0NmnVVKyKOWpA3w=
X-Google-Smtp-Source: ABdhPJzsmevD/ZAiSNoaU4f+57udZ8vqYKNCuzS0Q5au4B6tdKmWAhLlEXYFD1QUxEedPEKXycOnsw==
X-Received: by 2002:a62:ab14:0:b029:2db:b3d9:1709 with SMTP id
 p20-20020a62ab140000b02902dbb3d91709mr19579788pff.80.1621780376223; 
 Sun, 23 May 2021 07:32:56 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:600d:a93f:c492:941f:bc2a:cc89])
 by smtp.googlemail.com with ESMTPSA id t1sm9365231pgl.40.2021.05.23.07.32.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 May 2021 07:32:55 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
To: will@kernel.org
Subject: [PATCH] iommu/vt-d: fix kernel-doc syntax in file header
Date: Sun, 23 May 2021 20:02:45 +0530
Message-Id: <20210523143245.19040-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: yashsri421@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 joro@8bytes.org, rdunlap@infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 dwmw2@infradead.org, baolu.lu@linux.intel.com
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

The opening comment mark '/**' is used for highlighting the beginning of
kernel-doc comments.
The header for drivers/iommu/intel/pasid.c follows this syntax, but
the content inside does not comply with kernel-doc.

This line was probably not meant for kernel-doc parsing, but is parsed
due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
causes unexpected warnings from kernel-doc:
warning: Function parameter or member 'fmt' not described in 'pr_fmt'

Provide a simple fix by replacing this occurrence with general comment
format, i.e. '/*', to prevent kernel-doc from parsing it.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 drivers/iommu/intel/pasid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/intel/pasid.c b/drivers/iommu/intel/pasid.c
index 72646bafc52f..aaffb226a6a9 100644
--- a/drivers/iommu/intel/pasid.c
+++ b/drivers/iommu/intel/pasid.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-/**
+/*
  * intel-pasid.c - PASID idr, table and entry manipulation
  *
  * Copyright (C) 2018 Intel Corporation
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
