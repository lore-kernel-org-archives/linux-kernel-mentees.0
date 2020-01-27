Return-Path: <SRS0=mlYZ=3Q=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36F1CC33CB7
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jan 2020 10:15:10 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D7B220702
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jan 2020 10:15:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PYxFSJCO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D7B220702
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E3CA5878C4;
	Mon, 27 Jan 2020 10:15:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AsEiIFLPDhpa; Mon, 27 Jan 2020 10:15:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 611C9878AF;
	Mon, 27 Jan 2020 10:15:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 50484C0177;
	Mon, 27 Jan 2020 10:15:09 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1F472C0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 10:15:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1B3E72047A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 10:15:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4NvfemZtkbEi
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 10:15:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 8D8392037E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 10:15:07 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id a33so4920453pgm.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 02:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=tfqT994o6hFKwC+NJH5VhBNOIvQ5NHGDSHAgoN5IQQg=;
 b=PYxFSJCOp4tSt1yqQ1Non9MhjGXhvzz0Q0c6Eo4PnLRd2QoSjU2mUZ0Tnf/q7M52U2
 EdBAxOQv+vy4khjwtzDYTucIWnVb09U3ZhooncfWRE1z9ZjPpNnOKjzIF3iB6zHcDGLj
 9aHheSTFbL6ikPdph8gkwdt6pC8nVe4KjRNMsAPXNVtg8KtMcxhdare/0u8JJgKMOlUM
 cwMCYNwU0WYnZ69l8tOmYSwQhr1dnRbQdnolfL2dxQXIXovbYJhBTxO5wRnIainm7gNc
 mnhy+XSfDs9MciGvm0VsKBo3KNB1/LBQRCyt/SYGrNrrUvGSefn/y1q8Mc+ZtxHYk3Fw
 Hi2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=tfqT994o6hFKwC+NJH5VhBNOIvQ5NHGDSHAgoN5IQQg=;
 b=pOrMQGgFP3mwSPDsT578JrFaKRLzC4GoLdJlpdhrLu1Ms5X8M+6GjHTvp2hTbuwQSC
 vbTBFmj4DAAcIuqF6iVbj5jd27WhwqCP45inbcAf0SFOriaXZpm41thWRuQLYA60bDAf
 OpxVPByyElKosEMGR/7KAXm//3piDfCO4zjZ0Kj8dIa2w9Ue8Vp11Q7STe92vD+Wja0s
 oH0UpTXmrn/j5CJQmOwGw+Ao9c9V16dULO+J6/AdDN1ZHeSQHWMHnD4IRq0CuoyTmSB4
 MdCFJsOC/DqTYfWMrGgCAfJGvlbmSlNib02rRG/8BlYXEjzJSWMHrkqlFCSzPwP9L3yJ
 Asog==
X-Gm-Message-State: APjAAAUk/vJS6pxyeNUH7hqI19Bjbt+1ubxtnsxppMafravtej/s6Kcf
 L/3ss43S1SLjM5fBsmvT8J4=
X-Google-Smtp-Source: APXvYqwnlc/BTVD+zB2gkJ9TRRoZAjk4QyN2K+bRR20xZDRzGaJ5+E5yNuABM4OXiSgvvZwiMtkkaA==
X-Received: by 2002:a62:7696:: with SMTP id
 r144mr15571402pfc.177.1580120107229; 
 Mon, 27 Jan 2020 02:15:07 -0800 (PST)
Received: from localhost.localdomain ([2405:205:c902:a5e9:3956:8df2:aee5:9cf6])
 by smtp.gmail.com with ESMTPSA id s15sm15504138pgq.4.2020.01.27.02.15.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2020 02:15:06 -0800 (PST)
From: Pragat Pandya <pragat.pandya@gmail.com>
To: valdis.kletnieks@vt.edu,
	gregkh@linuxfoundation.org
Date: Mon, 27 Jan 2020 15:43:30 +0530
Message-Id: <20200127101343.20415-10-pragat.pandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200127101343.20415-1-pragat.pandya@gmail.com>
References: <20200127101343.20415-1-pragat.pandya@gmail.com>
Cc: devel@driverdev.osuosl.org, Pragat Pandya <pragat.pandya@gmail.com>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 09/22] staging: exfat: Rename
	variable "Size" to "size"
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

Change all the occurences of "Size" to "size" in exfat.

Signed-off-by: Pragat Pandya <pragat.pandya@gmail.com>
---
 drivers/staging/exfat/exfat.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/exfat/exfat.h b/drivers/staging/exfat/exfat.h
index 52f314d50b91..a228350acdb4 100644
--- a/drivers/staging/exfat/exfat.h
+++ b/drivers/staging/exfat/exfat.h
@@ -233,7 +233,7 @@ struct date_time_t {
 
 struct part_info_t {
 	u32      offset;    /* start sector number of the partition */
-	u32      Size;      /* in sectors */
+	u32      size;      /* in sectors */
 };
 
 struct dev_info_t {
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
