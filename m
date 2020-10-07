Return-Path: <SRS0=isT2=DO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45E32C4363C
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  7 Oct 2020 03:48:18 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96E89208C7
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  7 Oct 2020 03:48:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sQhdUYRD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96E89208C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4E71886A03;
	Wed,  7 Oct 2020 03:48:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NbYf3WAV057e; Wed,  7 Oct 2020 03:48:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id DC0F086812;
	Wed,  7 Oct 2020 03:48:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C1AA2C016F;
	Wed,  7 Oct 2020 03:48:16 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 33465C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Oct 2020 03:48:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 26FEE86A03
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Oct 2020 03:48:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pPGAtfnfdy8c
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Oct 2020 03:48:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 94A9086812
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Oct 2020 03:48:14 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id u3so366142pjr.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 06 Oct 2020 20:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9Qdx62KWZf1nPo9Ih2aKKNk8LPzzmbhXJHycwoOuA94=;
 b=sQhdUYRDBs+nsw5SJqm5Q2foj91zdZpv1W/j4vfiedoA/PfPCnbPG7OXVuMuF6Kwr3
 uSxwR9Xkp1HYKXlchub92cPfqpseYSI1MAnE4ODpSYF/B/joerweJ1w38V/AxcGE91OW
 RdoatsmerFtzvht9u4MwhVk48nUhu76DYS3RVaEJNHDooQK4mYLX5DNH/kLqfakP9o5q
 XYzDXd0XWE+SvYFS5BUf87Cgr8XpwtMuqRkOm42EgNy00fU+Fn5jY5ycrwWzsyxmah+U
 7B3pEN2Y+fA7/vD+TQF3O7Izte3W73b4ttksh/A/Qko/blrJ3gVouQd2jvz7b9K1ahwe
 JmRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9Qdx62KWZf1nPo9Ih2aKKNk8LPzzmbhXJHycwoOuA94=;
 b=myncOJHTrmRtV2aSRkaZCUmfUqf8llRHiEkVpFRGJDeyeJpTXEIWLt85e8HP451m6a
 E8tvIWdBSzBHCBBSl/OjdLYC5LT9Qo0hRpU6K4NEHX69VUDcff4rzsmLwHwXLMjEzAct
 9U63EJqeV38nm3igrINwUiwt+BUTHzqBtZkgY8KyYo3qTR0P2/KWKxTVXiUH1pS/jD/K
 i5LSYM7yAQobXyuQvOlHrpqbd+eHQLYNhrQRU1HI0cMdtWVobhvZIxRiBHHkAhALibMj
 u1h5Xjncd1oSoxYAH/HuAWRMRTJj777XzaJicpWz3i1Q0KaSe7MDa3ps+86xdXAR5clu
 PnaQ==
X-Gm-Message-State: AOAM532xLFovOge7lymH58QFe0mswG7U8WUpcv2zOSDKd3e7rXiivhde
 D3J5UxWVPZVFbKm7o3XuM0nI1SjRGYyithxp7C4=
X-Google-Smtp-Source: ABdhPJxOc5OSXQScJCLtc+Envon1PPr2mfos8ODF5ioLMG+tMdMiIhiZss/3wC1NRmm9HXJ/g8sW4Q==
X-Received: by 2002:a17:902:a9cc:b029:d3:77f7:3ca9 with SMTP id
 b12-20020a170902a9ccb02900d377f73ca9mr1051026plr.75.1602042493511; 
 Tue, 06 Oct 2020 20:48:13 -0700 (PDT)
Received: from localhost.localdomain ([49.207.207.135])
 by smtp.gmail.com with ESMTPSA id k206sm867586pfd.126.2020.10.06.20.48.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 20:48:12 -0700 (PDT)
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
To: 
Date: Wed,  7 Oct 2020 09:18:03 +0530
Message-Id: <20201007034803.7554-1-anant.thazhemadam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Anant Thazhemadam <anant.thazhemadam@gmail.com>,
 syzbot+6ce141c55b2f7aafd1c4@syzkaller.appspotmail.com,
 Johan Hedberg <johan.hedberg@gmail.com>, linux-bluetooth@vger.kernel.org,
 Marcel Holtmann <marcel@holtmann.org>, linux-kernel@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v4] bluetooth: hci_h5: fix memory
	leak in h5_close
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

If h5_close is called when !hu->serdev, h5 is directly freed.
However, h5->rx_skb is not freed, which causes a memory leak.

Freeing h5->rx_skb fixes this memory leak.

In case hu->serdev exists, h5->rx_skb is then set to NULL,
since we do not want to risk a potential NULL pointer 
dereference.

Fixes: ce945552fde4 ("Bluetooth: hci_h5: Add support for serdev enumerated devices")
Reported-by: syzbot+6ce141c55b2f7aafd1c4@syzkaller.appspotmail.com
Tested-by: syzbot+6ce141c55b2f7aafd1c4@syzkaller.appspotmail.com
Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>h5_close v4
---
Changes in v4:
	* Free h5->rx_skb even when hu->serdev
	(Suggested by Hans de Goede <hdegoede@redhat.com>)
	* If hu->serdev, then assign h5->rx_skb = NULL

Changes in v3:
	* Free h5->rx_skb when !hu->serdev, and fix the memory leak
	* Do not incorrectly and unnecessarily call serdev_device_close()

Changes in v2:
	* Fixed the Fixes tag

 drivers/bluetooth/hci_h5.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/bluetooth/hci_h5.c b/drivers/bluetooth/hci_h5.c
index e41854e0d79a..39f9553caa5c 100644
--- a/drivers/bluetooth/hci_h5.c
+++ b/drivers/bluetooth/hci_h5.c
@@ -245,11 +245,15 @@ static int h5_close(struct hci_uart *hu)
 	skb_queue_purge(&h5->rel);
 	skb_queue_purge(&h5->unrel);
 
+	kfree_skb(h5->rx_skb);
+
 	if (h5->vnd && h5->vnd->close)
 		h5->vnd->close(h5);
 
 	if (!hu->serdev)
 		kfree(h5);
+	else
+		h5->rx_skb = NULL;
 
 	return 0;
 }
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
