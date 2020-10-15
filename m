Return-Path: <SRS0=0JRt=DW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B68EDC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 15 Oct 2020 00:18:01 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AF01221FF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 15 Oct 2020 00:18:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A/Z6g0IJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AF01221FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A3F938830A;
	Thu, 15 Oct 2020 00:18:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UyOTFfxGT0YW; Thu, 15 Oct 2020 00:18:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 47AC788304;
	Thu, 15 Oct 2020 00:18:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 32A79C0052;
	Thu, 15 Oct 2020 00:18:00 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B8A7BC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Oct 2020 00:17:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 95C622E5DA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Oct 2020 00:17:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hdIW-y8TSpKI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Oct 2020 00:17:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by silver.osuosl.org (Postfix) with ESMTPS id CF51D2E5D6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Oct 2020 00:17:58 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id h4so777354pjk.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 17:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q5OVoE3pJbhdauHqlTDobbIRkF4tseIWuc4U1qOzq+k=;
 b=A/Z6g0IJ6RJqvoV2/izYHd/zFI83zBsUvMQMKk+wJFD0U7iXs69ZqVHfm1gCLTtw1c
 jSXGeZxxttxmRx50ZBSCb8D+fru54qFF/caQxWmrmhVbbhq8KegiZLd150mvM7Eb+4wI
 7zh92ZN0K0zA3zociLwYzzbSzZbzd4P0iCwiUAkdHM/b+QFmSigWQ3A0S/WFaarzgIbl
 M5UlnQZjT6+dXqdDkSqwb3hW/fAuXH3exOe4A2Plkch6mSH8ZOcM3ewVfyRmy9Rvoyjr
 9k1K2GRsGyzkE0pQcl4J4Y5BDBGFuIH4Hhnq9aRv3TbZpxT6pQBHHVM2Ru7+8SIZx5UK
 lm4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q5OVoE3pJbhdauHqlTDobbIRkF4tseIWuc4U1qOzq+k=;
 b=clTPHXyoKRvHAnaKhlR4hW1ki+Lu7I/8vseLwRQk3TiJoanzzjm/t3z04ukOdCUdXW
 mbM1xOl7FPM4dxnkP4/KqOoRhO0zJy21g2/LxCVfnjK7lSgMesrVAbE1zYTDwfTYia3Q
 B2d3+zQTARCElTmQ7zNECx9eCEcsA0XTTtH4NXAqas9I5NtnZKZ69cGcRkG5fXA2Ousj
 90zbA80Om8i9ulGlthJCjAYRW8IebIgQ5aUHp+zCcc11KnrhVsqsfR7TjkOXzOPebTka
 mdHEFmuJYjl5gAy/gKhngneRtdG71QIlCDCmikvH3V6jBUFjTqQhN7iVWhRougtUW0NF
 gvig==
X-Gm-Message-State: AOAM531tbqHsH3gAZU1HWH1JxlQ4d0O2LYsWMRh2CA23sBiE7Hky9qbf
 LaJYXmNf9lPvdqxn28JlrJ8=
X-Google-Smtp-Source: ABdhPJyXZSnNq/7NhUpZFjrT3ftcuE/CUx4RBJZ4VuG77OQfBJ/DtHJujHyQvVgyCv8CE/jz89HZsA==
X-Received: by 2002:a17:902:be06:b029:d3:e6c5:52a0 with SMTP id
 r6-20020a170902be06b02900d3e6c552a0mr1392257pls.77.1602721078145; 
 Wed, 14 Oct 2020 17:17:58 -0700 (PDT)
Received: from localhost.localdomain ([45.118.167.204])
 by smtp.googlemail.com with ESMTPSA id j24sm738040pjn.9.2020.10.14.17.17.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2020 17:17:57 -0700 (PDT)
From: Anmol Karn <anmol.karan123@gmail.com>
To: ralf@linux-mips.org,
	davem@davemloft.net,
	kuba@kernel.org
Date: Thu, 15 Oct 2020 05:47:12 +0530
Message-Id: <20201015001712.72976-1-anmol.karan123@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org,
 syzbot+a1c743815982d9496393@syzkaller.appspotmail.com,
 linux-hams@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] net: rose: Fix Null pointer
	dereference in rose_send_frame()
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

In rose_send_frame(), when comparing two ax.25 addresses, it assigns rose_call to 
either global ROSE callsign or default port, but when the former block triggers and 
rose_call is assigned by (ax25_address *)neigh->dev->dev_addr, a NULL pointer is 
dereferenced by 'neigh' when dereferencing 'dev'.

- net/rose/rose_link.c
This bug seems to get triggered in this line:

rose_call = (ax25_address *)neigh->dev->dev_addr;

Prevent it by checking NULL condition for neigh->dev before comparing addressed for 
rose_call initialization.

Reported-by: syzbot+a1c743815982d9496393@syzkaller.appspotmail.com 
Link: https://syzkaller.appspot.com/bug?id=9d2a7ca8c7f2e4b682c97578dfa3f236258300b3 
Signed-off-by: Anmol Karn <anmol.karan123@gmail.com>
---
I am bit sceptical about the error return code, please suggest if anything else is 
appropriate in place of '-ENODEV'.

 net/rose/rose_link.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/rose/rose_link.c b/net/rose/rose_link.c
index f6102e6f5161..92ea6a31d575 100644
--- a/net/rose/rose_link.c
+++ b/net/rose/rose_link.c
@@ -97,6 +97,9 @@ static int rose_send_frame(struct sk_buff *skb, struct rose_neigh *neigh)
 	ax25_address *rose_call;
 	ax25_cb *ax25s;
 
+	if (!neigh->dev)
+		return -ENODEV;
+
 	if (ax25cmp(&rose_callsign, &null_ax25_address) == 0)
 		rose_call = (ax25_address *)neigh->dev->dev_addr;
 	else
-- 
2.28.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
