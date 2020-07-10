Return-Path: <SRS0=4Ypl=AV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24A77C433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jul 2020 16:11:10 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1BFF206F4
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jul 2020 16:11:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wo/NdRrr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1BFF206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B827188909;
	Fri, 10 Jul 2020 16:11:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i5RlmSMWxDCS; Fri, 10 Jul 2020 16:11:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 88BAE888D4;
	Fri, 10 Jul 2020 16:11:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6F53BC077B;
	Fri, 10 Jul 2020 16:11:08 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 17D8CC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 16:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id F1F6D89A01
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 16:11:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8OhavgGn-K3o
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 16:11:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2AF5A89A3B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 16:11:06 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id a32so4839259qtb.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 09:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y861TMCTvpy5racGqaIyx07iIXHTPCR4jkREHmo0X5A=;
 b=Wo/NdRrrqJwONxOj542PxpeohJSIuPR2d8D8UJ1NhigILOhHqNScqYXo4FuVZW2m3/
 4RPeZrUFgFC2r6OcczdiXafs3KAFyuFac9hPAx3VIFAquc2YLN5wZfJR2/AZuPOe/1IB
 80KfxaoKKw1yQV2CGz+SqD5mNjW2/O6nfzxTVu+Rj1AiYHvNEG5AMiv3ZGINdzhcZQFi
 i24JSldDuvZ+7xCh4BqUniylYKz/mZrnfDtPiG32tlf5xy6WYBzVSuI3/TBYee1hqDwc
 kYBrYUkhB0uSwY/2RQ0g13WfbTUrqPAhz991mdMZprIDnTXUlkHEb6evurkptYXEuxON
 7XdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y861TMCTvpy5racGqaIyx07iIXHTPCR4jkREHmo0X5A=;
 b=d1mZxRzUycnJURuM4b1Prc9nBx4MAMGnOx+V+x2WOfc/u6ZthIuWM5nUw3bNz3zRbc
 9l3o+GIkEg9YxY5ReOkiGAr39MMjuShaEaieItRtpA1AFGolFNJZO/9rl8ElGFxVO84I
 emHAVuJTHjwawLTJ2tn7gIkwgSfZBytFrv+m3G9tBWAmT56kd63D5PiG3pxkIV/UpWsY
 omT88l/zm3parLeIBVLNXjQwuliRvZyHEkQGtKvXQRD7RgwAO5f/sYJuj90EnCeZ61FB
 76nHC7LeijaVGrinazHDeWPsIrYfBDY/MjRZSsUdqqxUN5UbG++11hEdaujjUUhsxDV+
 ysPA==
X-Gm-Message-State: AOAM530jpkqsayxEXQqqPu18XZOAdHRZ5FvQoKcTUXggLjD13MVJP1qV
 Uyq9hxVa4JaS4VNtlFeIaw==
X-Google-Smtp-Source: ABdhPJzpzxl71N47ydC8eo3OOanW2bRGZsq9dHQ51PlHyGRFUZjTOqsaik7xr3g2ncxiofZqEgzKxA==
X-Received: by 2002:ac8:7454:: with SMTP id h20mr26634878qtr.84.1594397465192; 
 Fri, 10 Jul 2020 09:11:05 -0700 (PDT)
Received: from localhost.localdomain (c-76-119-149-155.hsd1.ma.comcast.net.
 [76.119.149.155])
 by smtp.gmail.com with ESMTPSA id o18sm7360586qkk.91.2020.07.10.09.11.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 09:11:04 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>
Date: Fri, 10 Jul 2020 12:09:15 -0400
Message-Id: <20200710160915.228980-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200709130224.214204-1-yepeilin.cs@gmail.com>
References: <20200709130224.214204-1-yepeilin.cs@gmail.com>
MIME-Version: 1.0
Cc: syzkaller-bugs@googlegroups.com, Russell King <linux@armlinux.org.uk>,
 "David S . Miller" <davem@davemloft.net>, linux-bluetooth@vger.kernel.org,
 netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Peilin Ye <yepeilin.cs@gmail.com>, linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v3] net/bluetooth: Fix
	slab-out-of-bounds read in hci_extended_inquiry_result_evt()
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

Check upon `num_rsp` is insufficient. A malformed event packet with a
large `num_rsp` number makes hci_extended_inquiry_result_evt() go out
of bounds. Fix it.

This patch fixes the following syzbot bug:

    https://syzkaller.appspot.com/bug?id=4bf11aa05c4ca51ce0df86e500fce486552dc8d2

Reported-by: syzbot+d8489a79b781849b9c46@syzkaller.appspotmail.com
Cc: stable@vger.kernel.org
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
Change in v3:
    - Minimum `skb->len` requirement was 1 byte inaccurate since `info`
      starts from `skb->data + 1`. Fix it.

Changes in v2:
    - Use `skb->len` instead of `skb->truesize` as the length limit.
    - Leave `num_rsp` as of type `int`.

 net/bluetooth/hci_event.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index 03a0759f2fc2..13d8802b8137 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -4375,7 +4375,7 @@ static void hci_extended_inquiry_result_evt(struct hci_dev *hdev,
 
 	BT_DBG("%s num_rsp %d", hdev->name, num_rsp);
 
-	if (!num_rsp)
+	if (!num_rsp || skb->len < num_rsp * sizeof(*info) + 1)
 		return;
 
 	if (hci_dev_test_flag(hdev, HCI_PERIODIC_INQ))
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
