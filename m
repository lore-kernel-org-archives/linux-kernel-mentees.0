Return-Path: <SRS0=EU8F=BE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC479C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 25 Jul 2020 22:05:02 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 627E7206D7
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 25 Jul 2020 22:05:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TA5BzKw5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 627E7206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3CBBB81AC2;
	Sat, 25 Jul 2020 22:05:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L+z96jxtx6HB; Sat, 25 Jul 2020 22:05:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D2506889CA;
	Sat, 25 Jul 2020 22:05:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B18FDC004D;
	Sat, 25 Jul 2020 22:05:01 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 42AB7C004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Jul 2020 22:05:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3D824889CA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Jul 2020 22:05:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lMSPhmyVC+1l
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Jul 2020 22:04:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 786A681AC2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Jul 2020 22:04:59 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id x12so1064848qtp.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Jul 2020 15:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ORj8ts7tAGRiEo5hGbERimOD2nuQgJZB1dWj3IpTlc4=;
 b=TA5BzKw5Fy2VrqhNGS5adDNkjAMk2Ozonbl6X+CNDcQBSjU8dH70YBm/mgJxQZDeEU
 mTtYJLs0Wi3OI/09FXhe4itg8dg0Z8VtmBfOqAsjmvGp8zzObsoVApdHkEHyqiT1oKDI
 CYA3m4GEkeQJ/yopNwx8cyY94qFAA7u7PKi4L2Q8lZYogQRe8oealTjJgZHj8DQRGCiY
 +L61pUqPA7g09eha1VNdn63zV8SdKUBgOYSwLfSJ5uAtJxXKRZ7aSbpuGQJmkeEtPUwh
 CVgK7Kof7xEC4UD9/yJMgTCKRt2TQ1UxuYAwezs8EBkoMIea43Fgh1bj2MQTVlSlrn52
 lQEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ORj8ts7tAGRiEo5hGbERimOD2nuQgJZB1dWj3IpTlc4=;
 b=KKNZJV+VcSwkgjvbdmoUnsgMkosk6U2AUFyaKn5dg4djvHa4X1ZRdI5Amvxm/cZ2f9
 4OINYQ1rsZ2+cTP/q55jfIszEC/z7cbN11r8hQ2EUbEHhZeK92Hyo53b4wrJvNw4R8l1
 x1WhoMwPTkCLWfeFir4p+yx6DoJVyg/Yi7wd/nXOE6PnZ5Z0Uh9SOLDGkPJvAobA+bwM
 WOHuMd6HvxmozeJgLhqskcEwTzwVRhqRQFcH3BP1p+2QOYUVFhV4xnCyc6e8Er4SkDqN
 hB3SgvI6jVSP9uCBUsyVUXAJnxb8NQFWxwlxMx2NoOIipFOvhcM8CDhrc6TJpctad90K
 LdYw==
X-Gm-Message-State: AOAM532TM9MpZsgD6VdXLptEclqpHUa3fbALR1Rfd8FgL9nnucM2LSYC
 3eheVP8i2GiDGkcporb1Qw==
X-Google-Smtp-Source: ABdhPJz7E+iPwoBo/pvoBW9iN5HOxLTbBllS4XSHUeC2hqrK35sLHRmkovlHKJAn8ey4pn3T5jsLlA==
X-Received: by 2002:ac8:4e2f:: with SMTP id d15mr15620334qtw.125.1595714698435; 
 Sat, 25 Jul 2020 15:04:58 -0700 (PDT)
Received: from localhost.localdomain (c-76-119-149-155.hsd1.ma.comcast.net.
 [76.119.149.155])
 by smtp.gmail.com with ESMTPSA id 8sm12306554qkh.77.2020.07.25.15.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jul 2020 15:04:57 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Doug Ledford <dledford@redhat.com>,
	Jason Gunthorpe <jgg@ziepe.ca>
Date: Sat, 25 Jul 2020 18:02:03 -0400
Message-Id: <20200725220203.624557-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200725194839.623653-1-yepeilin.cs@gmail.com>
References: <20200725194839.623653-1-yepeilin.cs@gmail.com>
MIME-Version: 1.0
Cc: Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Peilin Ye <yepeilin.cs@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH] infiniband: Prevent uninit-value in
	ucma_accept()
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

ucma_accept() is reading uninitialized memory when `in_len` is
less than `offsetof(struct rdma_ucm_accept, ece)`. Fix it.

Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
 drivers/infiniband/core/ucma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/core/ucma.c b/drivers/infiniband/core/ucma.c
index a591fdccdce0..842d297903c0 100644
--- a/drivers/infiniband/core/ucma.c
+++ b/drivers/infiniband/core/ucma.c
@@ -1134,7 +1134,7 @@ static ssize_t ucma_listen(struct ucma_file *file, const char __user *inbuf,
 static ssize_t ucma_accept(struct ucma_file *file, const char __user *inbuf,
 			   int in_len, int out_len)
 {
-	struct rdma_ucm_accept cmd;
+	struct rdma_ucm_accept cmd = {};
 	struct rdma_conn_param conn_param;
 	struct rdma_ucm_ece ece = {};
 	struct ucma_context *ctx;
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
