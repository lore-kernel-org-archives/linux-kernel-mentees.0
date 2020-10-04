Return-Path: <SRS0=vwAy=DL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E880C4727D
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  4 Oct 2020 05:19:24 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAB5A206DD
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  4 Oct 2020 05:19:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QUEuRNL2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAB5A206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5EF13853E5;
	Sun,  4 Oct 2020 05:19:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Xu6i3BwaBSa; Sun,  4 Oct 2020 05:19:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DB04C8488E;
	Sun,  4 Oct 2020 05:19:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D4006C0889;
	Sun,  4 Oct 2020 05:19:22 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 19551C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  4 Oct 2020 05:19:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0EA02853E5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  4 Oct 2020 05:19:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QrSTskY5whQS
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  4 Oct 2020 05:19:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 80F338488E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  4 Oct 2020 05:19:21 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id k8so4334068pfk.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 03 Oct 2020 22:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YY5pMYpevGR839B5cx54Fulu2YjKsLgJpNccuay8eNE=;
 b=QUEuRNL2/f0vNDU811IkT8oJy65EEA5RLHx/EyzEou/dIw7Lgap4gMEklNC57gOplN
 l8xHJPahvprG2NoUvBsKTxugOIajPKlLNe4hUz3uTfYvznGIqSnlILhN/Jr5ev8iKq4F
 +y95QpfGDXoFfakhC46uVWWING9y39BpumyjKdZWKuhlDWyNCeRwxDaINRf/lm+7Mv52
 Fur8S5xlSIVKZcdcgUptMXD6aK72qo3mc/HYciHrbSqXpzNmHpIMdUNd4FbvcPY/n4BH
 CMKEMLzgi3TsqIZKnbBy8AnPpCQQigMtYEx9rFqzqW7c4TRylecFScgYdI+JiWHF69VF
 dZmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YY5pMYpevGR839B5cx54Fulu2YjKsLgJpNccuay8eNE=;
 b=aNlBoIe7Ak6CCCwBVD0rw4yK1XE54379VO2KoEwHtqQGdnK2tttq8s24Ai/HtfQvEp
 gJS/uoSaeAe6bmyUV3DzXfBrvGfkqQIZQ12nM30GIbrdeT4zfPe7lvuynHpKc+2BNNLe
 TOshfQ753L9tCrb0fY1oEcXVpMjC0jfCvbLGkls+bQmcteIfdHLaqO+WiI/Bfvd8Z3gW
 TzfQkQAN0Z2xUfsN+UZKuLzsFwfzzxk06FhCuuMTDs0Psj3acz3YjSbspsx9NbCB5pbK
 1TUWRw3vMw+Z2GgBemBL+3AnWlpLvulhJKjd0I1ClToWngj5V4bBml/sbSJqrb8yDWIX
 z/tw==
X-Gm-Message-State: AOAM533nalBiWiQoqOspiU31/zSZVSXf4AtQVgLRtHjA/uI8eqBtWJk0
 YmMghqj1mbKuiQQS6InvTA+vrbxRbKqsDnMPQk0=
X-Google-Smtp-Source: ABdhPJyskOIiX+/6se3/zqc3U0Q28Gujo8gH9xebEuSsgrqq8f7Y8JyUZFinX4uREXcqoI6J6OpzQQ==
X-Received: by 2002:a63:f345:: with SMTP id t5mr8807996pgj.147.1601788760553; 
 Sat, 03 Oct 2020 22:19:20 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.69])
 by smtp.gmail.com with ESMTPSA id d9sm6263859pjx.47.2020.10.03.22.19.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2020 22:19:19 -0700 (PDT)
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
To: 
Date: Sun,  4 Oct 2020 10:47:08 +0530
Message-Id: <20201004051708.21985-1-anant.thazhemadam@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201001194329.9328-1-anant.thazhemadam@gmail.com>
References: <20201001194329.9328-1-anant.thazhemadam@gmail.com>
MIME-Version: 1.0
Cc: Anant Thazhemadam <anant.thazhemadam@gmail.com>,
 syzbot+6ce141c55b2f7aafd1c4@syzkaller.appspotmail.com,
 Johan Hedberg <johan.hedberg@gmail.com>, linux-bluetooth@vger.kernel.org,
 Marcel Holtmann <marcel@holtmann.org>, linux-kernel@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3] bluetooth: hci_h5: fix memory
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

When h5_close() is called and !hu->serdev, h5 is directly freed.
However, h5->rx_skb is not freed before h5 is freed, which causes
a memory leak.
Freeing h5->rx_skb (when !hu->serdev) fixes this memory leak before
freeing h5.

Fixes: ce945552fde4 ("Bluetooth: hci_h5: Add support for serdev enumerated devices")
Reported-by: syzbot+6ce141c55b2f7aafd1c4@syzkaller.appspotmail.com
Tested-by: syzbot+6ce141c55b2f7aafd1c4@syzkaller.appspotmail.com
Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
---
Changes in v3:
	* Free h5->rx_skb when !hu->serdev, and fix the memory leak
	* Do not incorrectly and unnecessarily call serdev_device_close()

Changes in v2:
	* Fixed the Fixes tag

Hans de Goede also suggested calling h5_reset_rx() on close (for both, !hu->serdev
and hu->serdev cases). 
However, doing so seems to lead to a null-ptr-dereference error,
        https://syzkaller.appspot.com/text?tag=CrashReport&x=136a9a5d900000,
and for this reason, it has not been implemented.

Instead, directly freeing h5->rx_skb seems to suffice in preventing the memory leak
reported. 
And since h5 is freed immediately after freeing h5->rx_skb, assigning h5->rx_skb to
be NULL isn't necessary.

 drivers/bluetooth/hci_h5.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/hci_h5.c b/drivers/bluetooth/hci_h5.c
index e41854e0d79a..171e55c080ce 100644
--- a/drivers/bluetooth/hci_h5.c
+++ b/drivers/bluetooth/hci_h5.c
@@ -248,8 +248,10 @@ static int h5_close(struct hci_uart *hu)
 	if (h5->vnd && h5->vnd->close)
 		h5->vnd->close(h5);
 
-	if (!hu->serdev)
+	if (!hu->serdev){
+		kfree_skb(h5->rx_skb);
 		kfree(h5);
+	}
 
 	return 0;
 }
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
