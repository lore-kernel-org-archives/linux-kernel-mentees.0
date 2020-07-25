Return-Path: <SRS0=EU8F=BE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC037C433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 25 Jul 2020 19:50:49 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BBA9206D7
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 25 Jul 2020 19:50:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kt77VASD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BBA9206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 3412220396;
	Sat, 25 Jul 2020 19:50:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W15gh6R+bFxH; Sat, 25 Jul 2020 19:50:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id EF2A020378;
	Sat, 25 Jul 2020 19:50:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D5809C004E;
	Sat, 25 Jul 2020 19:50:47 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A9453C004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Jul 2020 19:50:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 756A0880C5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Jul 2020 19:50:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1aObv3GhrwVM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Jul 2020 19:50:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C51CA880A1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Jul 2020 19:50:41 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id s23so9417381qtq.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 25 Jul 2020 12:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e08VaL7U6vcRwt77EFzQ26KfIcvSUB32fpWd9IVs9Bs=;
 b=kt77VASDEmQbVAz4Uvdk29D1TC+84NUnd+mgBDeBIxhJSHHVN1GNaYwHzRUJnVgwYJ
 L5FlOI/L7SKhAaXsF4O1W4MJAdo28oYFcGKqYUr+rNQNphq5ls1VVvOn9mCbap4Ig0Gy
 rDgrrXFHn2Wyd1K68kMWEzpRjAGS+65G9lo87TtBYE6UP4JjwJzl4yqG4JJfRroRSLLl
 WYEf+9YwxqVa6hUzNhIkZzHsM4efa2a4x9qYTfdChHwKUF1IDIzYY+Bc2ee2nIIQFeA+
 KeE2C3Pf4APGBDVnJhPQ4CICyYxIGAvcpDMU4gxqHclzRWoUiVzkk6yiIPsIa2V0ETiG
 uSOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e08VaL7U6vcRwt77EFzQ26KfIcvSUB32fpWd9IVs9Bs=;
 b=Edkodlf+cDAhhzJCvqmBukuX88QLZj8ZIZ/b3cUtOFumd/KhVmWXG3QqAzpj2WOyVU
 jU/6/dGjEGrQIZRQTrCpibC19q71fknsVQrEufLmvgc8qM5AoJZ4MFBX39eqQPokrnhs
 1Cahl8+D2D7sF6mm42+toAFBGUGLI4LH7oGc0BLI3gdTmCqgSwMoGXzxJjWzNgApZyrv
 fMFJjrAzYrnDOErHo3HV+shLwj3r8wK3hcdgpyyyiceF8RTsLc4f5vAyYtyTOiLT+kwn
 HBvtxPiTs0TZbg4D5i+UBZ26jz/lpKzDk5QXkO0z69efx4csn7fMjDHTntdbW95+1rvB
 Woig==
X-Gm-Message-State: AOAM532ZvBhLPWIilGJwrYxq6q4BgX/ApeLPR210vlCLKR8y0XtrjAj2
 LiXzjRs1bt19zmK6M5bolg==
X-Google-Smtp-Source: ABdhPJy2dOu0lT+ZNEf0I8fySl5RLPKWHC67dEp991MzbpceBkId+9TlOp8LdSJkMc9uH8ZrYznGdA==
X-Received: by 2002:ac8:44b9:: with SMTP id a25mr11234149qto.356.1595706640781; 
 Sat, 25 Jul 2020 12:50:40 -0700 (PDT)
Received: from localhost.localdomain (c-76-119-149-155.hsd1.ma.comcast.net.
 [76.119.149.155])
 by smtp.gmail.com with ESMTPSA id h144sm12680373qke.83.2020.07.25.12.50.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jul 2020 12:50:40 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Doug Ledford <dledford@redhat.com>,
	Jason Gunthorpe <jgg@ziepe.ca>
Date: Sat, 25 Jul 2020 15:48:39 -0400
Message-Id: <20200725194839.623653-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Peilin Ye <yepeilin.cs@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH] infiniband: Fix uninit-value in
	ucma_connect()
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

ucma_connect() is reading uninitialized memory when `in_len` is less than
`offsetof(struct rdma_ucm_connect, ece)`. Fix it.

Reported-and-tested-by: syzbot+7446526858b83c8828b2@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?id=2c85ca2b1aedb22ed1029383751e36cee3f7d047
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
 drivers/infiniband/core/ucma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/core/ucma.c b/drivers/infiniband/core/ucma.c
index 5b87eee8ccc8..a591fdccdce0 100644
--- a/drivers/infiniband/core/ucma.c
+++ b/drivers/infiniband/core/ucma.c
@@ -1079,7 +1079,7 @@ static ssize_t ucma_connect(struct ucma_file *file, const char __user *inbuf,
 {
 	struct rdma_conn_param conn_param;
 	struct rdma_ucm_ece ece = {};
-	struct rdma_ucm_connect cmd;
+	struct rdma_ucm_connect cmd = {};
 	struct ucma_context *ctx;
 	size_t in_size;
 	int ret;
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
