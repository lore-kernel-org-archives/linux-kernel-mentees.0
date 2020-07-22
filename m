Return-Path: <SRS0=MEeH=BB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C309C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 22 Jul 2020 16:07:26 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC75120717
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 22 Jul 2020 16:07:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a8k1mfHu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC75120717
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 805BD2035D;
	Wed, 22 Jul 2020 16:07:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0OUzRG7p7cB0; Wed, 22 Jul 2020 16:07:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2737D20031;
	Wed, 22 Jul 2020 16:07:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0E846C004E;
	Wed, 22 Jul 2020 16:07:25 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6B65BC004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 16:07:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 598CE886D0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 16:07:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VblU3QO9mTEb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 16:07:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C669888622
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 16:07:23 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id l23so2512458qkk.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 09:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=inXRPYgND6+0WE39IDvE6wldzJTBYfDxX/wQ/vOfPn0=;
 b=a8k1mfHuBtctSv/v34AEQtJKDDMJsmzgQiLNEMGt4v2xwXaP9+GEfP4S+dVZi9N5cm
 StZ5VmZHe2C9KFpm5eofHmXUSvhi240cLFMIKR7UoqZ+KwFyYOXEZdIAbWrh7WAmVu4o
 7OcBxIEmwji96oE6vzBnqIvyyolTXj+IlHB/WVPIq0FWjRTz4zKz9GVi7/uWcYDDWFeu
 OqcdP+yyS4UEjao+xsT+J2XbAySKFfuFsUPmlbi8SM84zy/p3CExBuMfJQ6sk2CPMnnJ
 cKxPqrDOJnOgIQyJ2xBQ9c6B2wlAss8VNk//84EIuIgbdRYnnERBUNuz5E6J9LoAwTOu
 bSAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=inXRPYgND6+0WE39IDvE6wldzJTBYfDxX/wQ/vOfPn0=;
 b=GVxhbn+GU2JXpLbmx22SkiSPQtGDgBuZ1l2jgOBXZ10zFiUK6qP+XPrKPU9ujBTKYt
 s3ZZOP3BD9A0Q9X15h2EmH44aOhMETN4TvygL1sQc8qCIaq0rPKb3c0JIt1oDo8r28I8
 jLANGvK9ZG9sqGYtnWHrdZzt/1hV3j71qlTLi2FCFUYJqnddCigIv6cMQUlQTLsnMTmI
 ggU7r7Ult3NA2Zau0pEv9QpnEFEc/fTxZcCefJ32m/TsX4QyO24aCXnSGDRmgNV7uWm8
 e/55BtJGu2JPFhNBfl9MfhdhzpSTItNqTjnh2y1SJukD4ItvqPeLzs+zRYkjTrsm2flA
 eWwQ==
X-Gm-Message-State: AOAM531Nktoq2o81VoOw86o5vhSOk4SIjRvgWIZsHS1sG/UOAp+a8YBf
 Hqt5z7p0nwh4kVFm97tmAg==
X-Google-Smtp-Source: ABdhPJx8zadp5hybrNbT1YGP6AF/F1kHC13kJf+YtmdUCtFIfFdTeqlM39WpgDmRgaDFzLlCZ3LU0A==
X-Received: by 2002:a37:8302:: with SMTP id f2mr644452qkd.271.1595434041414;
 Wed, 22 Jul 2020 09:07:21 -0700 (PDT)
Received: from localhost.localdomain (c-76-119-149-155.hsd1.ma.comcast.net.
 [76.119.149.155])
 by smtp.gmail.com with ESMTPSA id f54sm76376qte.76.2020.07.22.09.07.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 09:07:20 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Joerg Reuter <jreuter@yaina.de>,
	Ralf Baechle <ralf@linux-mips.org>
Date: Wed, 22 Jul 2020 12:05:12 -0400
Message-Id: <20200722160512.370802-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 Peilin Ye <yepeilin.cs@gmail.com>, netdev@vger.kernel.org,
 linux-hams@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S . Miller" <davem@davemloft.net>
Subject: [Linux-kernel-mentees] [PATCH net] AX.25: Prevent out-of-bounds
	read in ax25_sendmsg()
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

Checks on `addr_len` and `usax->sax25_ndigis` are insufficient.
ax25_sendmsg() can go out of bounds when `usax->sax25_ndigis` equals to 7
or 8. Fix it.

It is safe to remove `usax->sax25_ndigis > AX25_MAX_DIGIS`, since
`addr_len` is guaranteed to be less than or equal to
`sizeof(struct full_sockaddr_ax25)`

Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
 net/ax25/af_ax25.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
index ef5bf116157a..0862fe49d434 100644
--- a/net/ax25/af_ax25.c
+++ b/net/ax25/af_ax25.c
@@ -1509,7 +1509,8 @@ static int ax25_sendmsg(struct socket *sock, struct msghdr *msg, size_t len)
 			struct full_sockaddr_ax25 *fsa = (struct full_sockaddr_ax25 *)usax;
 
 			/* Valid number of digipeaters ? */
-			if (usax->sax25_ndigis < 1 || usax->sax25_ndigis > AX25_MAX_DIGIS) {
+			if (usax->sax25_ndigis < 1 || addr_len < sizeof(struct sockaddr_ax25) +
+			    sizeof(ax25_address) * usax->sax25_ndigis) {
 				err = -EINVAL;
 				goto out;
 			}
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
