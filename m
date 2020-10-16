Return-Path: <SRS0=ah7H=DX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A532C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 16 Oct 2020 13:16:04 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFEEC20874
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 16 Oct 2020 13:16:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D5961oYo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFEEC20874
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 39347882FD;
	Fri, 16 Oct 2020 13:16:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9xNwKPmSgaSO; Fri, 16 Oct 2020 13:16:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B9377882D6;
	Fri, 16 Oct 2020 13:16:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A9E47C0052;
	Fri, 16 Oct 2020 13:16:02 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7C7B1C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Oct 2020 13:16:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6A5842E367
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Oct 2020 13:16:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kmfN+XMyJKRF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Oct 2020 13:16:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 82E542E2E3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Oct 2020 13:16:00 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id p11so1268152pld.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Oct 2020 06:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ywZMHMoa9Z2/Mz63aoLeLWbP5S3RUkcpUs/A8T6Yyeg=;
 b=D5961oYoWjrbxsHHTMOeZKBQ/TRF4he+KTOpPZPu0q9sMdCFZxI2NJkuWh8DjpTdbK
 Nb5w+7ClTeSeXk/73DZv3Ng3yS/dPJntdavYpMrP62XQwzAJ/WvlX3XPyEh4iQC9M4am
 HQYBvBfJdwdGYHfnKJC+NGj3FTpdC+uZeSFePGF/Wl6IWdZEJb96qzzH1Qtwg+DHQJvF
 TwjoIySOE2x9Oz2SP9vf2lY8iBBGmGzkfyv+wQoKccbgN43y38sFaZc57A7hWtvqoe3D
 Lfjjml5Pr8c3prYFdzy8gGZAxg1b5pQI1P1L3eCV+MGlQQ5YvmRlY1bGRrGAqgwcQFoc
 B7cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ywZMHMoa9Z2/Mz63aoLeLWbP5S3RUkcpUs/A8T6Yyeg=;
 b=Ar3ojSAncFhDEPOhVrqe9CF4M+Xp3K128L+YZp6eJHvwOPlyvuSA2EUIe0xQlAUzf7
 plCC+uHGP3G1/53e2GswX0XEBWled46Ym5tdSAe3DveRO7K/jDve+jsd6kNih1hnsJbO
 qv6o6mil+U6AH7euJQFnjBeMsUsgTlvl3m/vnJoLQZFJl0CFyvUuLu4gjH7TdQFmTtz9
 YJj7b/J2JKS6nILrV9z6xoMcitBsTW5zLQj2Yl6vq2L4O3gheJtxSPEP462jLyZHX1FV
 oQTj4RLPQ+TMedOjG4d3kEsDEgBOd/gmJzLSJRzZjedGmo8Dp9HACNdDDAZo+A+DYWyk
 5PFA==
X-Gm-Message-State: AOAM532UxSPEqWx0X69MnXTQzpXWr70/cRv80SvYLzKAOCDoFQsZVLo0
 i9t/WYCBD9td1eeUZM7i3BM=
X-Google-Smtp-Source: ABdhPJzZiFySSHjmf9JkgTm5CVtdFe+1MqqCGZN0AwBdYN0l1fJfu9gdvZmcESsUknwi1zG7/fqlYA==
X-Received: by 2002:a17:902:c254:b029:d4:c2d4:15f with SMTP id
 20-20020a170902c254b02900d4c2d4015fmr4055633plg.18.1602854159966; 
 Fri, 16 Oct 2020 06:15:59 -0700 (PDT)
Received: from localhost.localdomain ([49.207.207.75])
 by smtp.gmail.com with ESMTPSA id q8sm2988144pfl.100.2020.10.16.06.15.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 06:15:59 -0700 (PDT)
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>
Date: Fri, 16 Oct 2020 18:44:47 +0530
Message-Id: <20201016131447.32107-1-anant.thazhemadam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-bluetooth@vger.kernel.org,
 Anant Thazhemadam <anant.thazhemadam@gmail.com>,
 syzbot+6ce141c55b2f7aafd1c4@syzkaller.appspotmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v5] bluetooth: hci_h5: fix memory
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

When h5_close() is called, h5 is directly freed when !hu->serdev.
However, h5->rx_skb is not freed, which causes a memory leak.

Freeing h5->rx_skb and setting it to NULL, fixes this memory leak.

Fixes: ce945552fde4 ("Bluetooth: hci_h5: Add support for serdev enumerated devices")
Reported-by: syzbot+6ce141c55b2f7aafd1c4@syzkaller.appspotmail.com
Tested-by: syzbot+6ce141c55b2f7aafd1c4@syzkaller.appspotmail.com
Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
---
Changes in v5:
	* Set h5->rx_skb = NULL unconditionally - to improve code
	  readability
	* Update commit message accordingly

Changes in v4:
	* Free h5->rx_skb even when hu->serdev
	(Suggested by Hans de Goede <hdegoede@redhat.com>)
	* If hu->serdev, then assign h5->rx_skb = NULL

Changes in v3:
	* Free h5->rx_skb when !hu->serdev, and fix the memory leak
	* Do not incorrectly and unnecessarily call serdev_device_close()

Changes in v2:
	* Fixed the Fixes tag


 drivers/bluetooth/hci_h5.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/bluetooth/hci_h5.c b/drivers/bluetooth/hci_h5.c
index e41854e0d79a..0ef253136b06 100644
--- a/drivers/bluetooth/hci_h5.c
+++ b/drivers/bluetooth/hci_h5.c
@@ -245,6 +245,9 @@ static int h5_close(struct hci_uart *hu)
 	skb_queue_purge(&h5->rel);
 	skb_queue_purge(&h5->unrel);
 
+	kfree_skb(h5->rx_skb);
+	h5->rx_skb = NULL;
+
 	if (h5->vnd && h5->vnd->close)
 		h5->vnd->close(h5);
 
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
