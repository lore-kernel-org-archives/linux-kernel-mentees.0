Return-Path: <SRS0=5Mz1=BF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74111C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 26 Jul 2020 02:28:47 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37892206D7
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 26 Jul 2020 02:28:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K/Y4CcDR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37892206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0C3FC851CB;
	Sun, 26 Jul 2020 02:28:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HDbC8tZ4ztjY; Sun, 26 Jul 2020 02:28:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A0AE185081;
	Sun, 26 Jul 2020 02:28:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8D0B5C004D;
	Sun, 26 Jul 2020 02:28:46 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7C04EC004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 02:28:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6A90E2040E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 02:28:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Glis6hFH7BPG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 02:28:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 by silver.osuosl.org (Postfix) with ESMTPS id D3CAF2039B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 02:28:43 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id 11so12363788qkn.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Jul 2020 19:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4RfkvlMt2rThYkklpBMRg3zwGuy1XZ+sZK1Hvc1Zws8=;
 b=K/Y4CcDRyCp8X8+LBwvI77yMPhDNYMu5OIkLphXaFjLvLFUoaLUZ7Um2xZ384bUFJr
 9kWU+QsNe+XFzYY4NGXk+b5XYpAjxwVplrp0ZnCq4gH4RAghgzoiOyAjUYCAxHMB1gGQ
 M3TdfUxgrOEEX1m9zqMWhWeo83I0rANSgTZD3qWKbRE6GJQoe5bqFeh1tIBq4S/L37iC
 e10A2X/xcfoWI8gDoXPtUzOli4jnil7PkoohG4YcE1Mrz+HlTNzsiBUcI9bxOxgjEM49
 kQ3v4NxRxKwgC/UYEHZBUwzgayUuaaunIPUHOgkOZlmp0VXsaTqU02EDLtXJOsenTIuB
 kq2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4RfkvlMt2rThYkklpBMRg3zwGuy1XZ+sZK1Hvc1Zws8=;
 b=BjY2LTgEjwpqo1j0wIfjk/sM24OnQgUqLqMYbW5FH0Ma7gLfxoKaowNyDF72X2MpOC
 uAOeoT8GTfS9QamMtbgiJqfn6DcBTM3DZH39l9KTIzvcGJt9RniYtcLWKbH6EnjKUeBJ
 bjBU7TCvBSEcfTI9D+rqPPReQevnyuG+EDvtQBsuQYXI7oKfeJnoYYjpFdNqjAAhjISR
 UqIQ2rPmDSwPjUGh0t5cIjHhls5m5+YiZwTQy5fURqCm+hmGQ1zbUzLl9+7WVSDBHZwV
 tHN/fymLFzUHokYfASMbxT64lBQBRN3kF0Et+88EaZchZDQvTAASKYdCiKICfhx+k7a9
 yYmA==
X-Gm-Message-State: AOAM531ko793DjVleX43RCjXQlVAvFEgSNL6nEkAzTAXqCgwL0wghMWQ
 2jv6CxPadlOGH7Fr8IzD+g==
X-Google-Smtp-Source: ABdhPJwzZVg3MNUXqS+wa+k0VLYtFF6fVCt3zo5divFq0l52ko+Cw1GX/Gak4/JDH4PGLtaCJ1J7aQ==
X-Received: by 2002:a05:620a:5f7:: with SMTP id
 z23mr1413433qkg.206.1595730522804; 
 Sat, 25 Jul 2020 19:28:42 -0700 (PDT)
Received: from localhost.localdomain (c-76-119-149-155.hsd1.ma.comcast.net.
 [76.119.149.155])
 by smtp.gmail.com with ESMTPSA id z197sm13512785qkb.66.2020.07.25.19.28.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jul 2020 19:28:42 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Doug Ledford <dledford@redhat.com>,
	Jason Gunthorpe <jgg@ziepe.ca>
Date: Sat, 25 Jul 2020 22:27:16 -0400
Message-Id: <20200726022716.635727-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200725220203.624557-1-yepeilin.cs@gmail.com>
References: <20200725220203.624557-1-yepeilin.cs@gmail.com>
MIME-Version: 1.0
Cc: Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Peilin Ye <yepeilin.cs@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v2] infiniband: Prevent uninit-value
	in ucma_accept()
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

Reported-and-tested-by: syzbot+086ab5ca9eafd2379aa6@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?id=0bce3bb68cb383fce92f78444e3ef77c764b60ad
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
Change in v2:
    - syzbot has reported this bug as "KMSAN: uninit-value in xa_load".
      Add "Reported-and-tested-by:" and "Link:" tags for it.

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
