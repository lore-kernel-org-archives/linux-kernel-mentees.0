Return-Path: <SRS0=tUVd=BG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B3BFC433E5
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 21:04:39 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D07E120792
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 21:04:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c0dl7GcE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D07E120792
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 82891863F4;
	Mon, 27 Jul 2020 21:04:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AWlXAg8JCHEV; Mon, 27 Jul 2020 21:04:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D27A886252;
	Mon, 27 Jul 2020 21:04:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B355CC0050;
	Mon, 27 Jul 2020 21:04:37 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EA9E8C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 21:04:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id DFC03867C6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 21:04:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UFwZc27niIZr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 21:04:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0A52286783
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 21:04:34 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id l6so16685244qkc.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 14:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fmK6L/0QiUgIiYwBxTGcL+joJ1wkGcxNcczqzti8GgY=;
 b=c0dl7GcE3qXrMwLhOyjCKdHyJDcA7m5LeZ3ATOvuptnRH+viC3uFNrauwRs93IgcOo
 P4UOGQvq9tIWAxrDwItERdsK410OCjjyclMBJFN+cgOk0VnLVwcQW2Hh5oEE5mqvr/sy
 Wp2YwKveou+lupv1qxLro38uV9x6lR7/iDOKfz5rfHmJ9xNmzjrCVvCtMeOZW6J+gq9/
 Mdz0yl3w6rZhpQRZyDKvcG+pfgBvm3EoYzycuT5KMx63zKkwwfyCQeBuPVVZcxpVrDXm
 W0lNdPqNBv+aT8T1t/pPhrftQIrYQ9BA9OHHIOw+bdlCQre/JI9Ds/Lit7p0ipW0aN3z
 kvbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fmK6L/0QiUgIiYwBxTGcL+joJ1wkGcxNcczqzti8GgY=;
 b=gQdlM4fP8hX62FRWhBSA0EcUppXgeYA2br4kPYm/o/VZeWWb1lSdihr1us7VyEtZ3g
 MVaMCnLP23j5fcRRibaT6bdvjsJ6JxO0oiuzicVLXsmNZl4cnZDOhCvjKVIEdSNqn34a
 tG4IYdmTFR06LqS4HnGiUrUzHUOw60rGsVeVQxbqpEumti58LwL+OXR2uYOG5CeA93TA
 4jrxpWM2Sl//fKukoIvH8ssBiZzKBpzi1I7+iMwb3E5cDmzSrtcHwt8lLIo+st1IMbkD
 bAy1c9fAw5p9zxLb2ViSESJILas6XzYU1VmF9AQpzCCLFWt0S4RSipE+muparJrW5Yxk
 Qe0Q==
X-Gm-Message-State: AOAM532COY1RQUzOtGf7uAAdhHBMRY+pytTSr8fgOaFmXOK5Q1FM/yj0
 5efNe+XQ14vxMGMa/EaqSw==
X-Google-Smtp-Source: ABdhPJwB0/ozeneo/2CVyhyaxpaK56OJSASvgnRELqqALjaQFssdkweq7IKzB/8rlXefcfcoKqrb/w==
X-Received: by 2002:ae9:ef8d:: with SMTP id
 d135mr24189692qkg.109.1595883873133; 
 Mon, 27 Jul 2020 14:04:33 -0700 (PDT)
Received: from localhost.localdomain ([209.94.141.207])
 by smtp.gmail.com with ESMTPSA id k2sm20964994qkf.127.2020.07.27.14.04.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 14:04:32 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Kashyap Desai <kashyap.desai@broadcom.com>,
 Sumit Saxena <sumit.saxena@broadcom.com>
Date: Mon, 27 Jul 2020 17:02:35 -0400
Message-Id: <20200727210235.327835-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Shivasharan S <shivasharan.srikanteshwara@broadcom.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, linux-kernel@vger.kernel.org,
 megaraidlinux.pdl@broadcom.com, linux-scsi@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Peilin Ye <yepeilin.cs@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: [Linux-kernel-mentees] [PATCH] scsi/megaraid: Prevent
	kernel-infoleak in kioc_to_mimd()
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

hinfo_to_cinfo() does no operation on `cinfo` when `hinfo` is NULL,
causing kioc_to_mimd() to copy uninitialized stack memory to userspace.
Fix it by initializing `cinfo` with memset().

Cc: stable@vger.kernel.org
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
 drivers/scsi/megaraid/megaraid_mm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/scsi/megaraid/megaraid_mm.c b/drivers/scsi/megaraid/megaraid_mm.c
index 8df53446641a..9df0e6b253a8 100644
--- a/drivers/scsi/megaraid/megaraid_mm.c
+++ b/drivers/scsi/megaraid/megaraid_mm.c
@@ -816,6 +816,8 @@ kioc_to_mimd(uioc_t *kioc, mimd_t __user *mimd)
 
 		case MEGAIOC_QADAPINFO:
 
+			memset(&cinfo, 0, sizeof(cinfo));
+
 			hinfo = (mraid_hba_info_t *)(unsigned long)
 					kioc->buf_vaddr;
 
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
