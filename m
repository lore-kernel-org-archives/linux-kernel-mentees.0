Return-Path: <SRS0=/QuR=MN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08BE7C07E9B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Jul 2021 10:17:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A548260C40
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Jul 2021 10:17:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A548260C40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6641A823EB;
	Wed, 21 Jul 2021 10:17:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CkwFqx-gNG0n; Wed, 21 Jul 2021 10:17:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 544B081C71;
	Wed, 21 Jul 2021 10:17:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 24D52C0010;
	Wed, 21 Jul 2021 10:17:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 448C5C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jul 2021 10:17:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 33C4560678
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jul 2021 10:17:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G6EFfdEQ2Rbc
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jul 2021 10:17:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 553946062A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jul 2021 10:17:29 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id j199so1861886pfd.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jul 2021 03:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GmFXEsAxbG8KZfMM+UsqBDrbJkHUFiGmqFsibv1XO4g=;
 b=Fx32sue3mQepTLN9Ttrt6nLPas35qhyRkAnEpea2Mouer4p+Cp6rthrsL0RXkc9o1M
 s4xuwkH74RNoERSESufIhVW5eNQj38mMmrHQXEDWSVGjLfLVy2TSkuvNab0maOwEyAmH
 vhtKcsVhXIv3VHE2dy7Bxv3e2XjJSjApiub4YZQWmmJ3hpaLjd4pxLNhfMeBjBfkFE6G
 wcs16zGFHsiqGI2ZwZeZ7hjkkP8Xgozod55VlGfbMi6U4GR0+/ul1sFKsHzpeZ/Mw/kQ
 1RbnVd1EOtTJRIQcbHlan6TIBFQKtiHCYvWczkApNzkSqtUKeY9mFElQvgqpoxLK/XyU
 8Mzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GmFXEsAxbG8KZfMM+UsqBDrbJkHUFiGmqFsibv1XO4g=;
 b=aKWAokFJbxcEbt+dh2PYof6nwhmlAONvuaTK8/6DvRRZ0H+fGnWdY2HScIXAL1vjZ/
 /KIL0kOdZF3/TIf27RYUtBmh2BBdssefiDecOu9YdJ9uCPRVX72PuIeX3m83xIohCw3n
 i9qev/VtPOiRpgapN1CatLa2D7N/tIKygGJQ+z1AVC+lUdJaMj6ZZ5AE97PN7lcNQjWa
 wbX5j+8j3iZV9OyQDKUA1WFIy2BDgYuQCidM24jtSfG/hm7ehvwT5KcGSsTUqO2h0d0o
 fVwVrPgoMyl4sG6VsXHJgA4joRuKm8fYTa/0Ruu8L+Jf2asuJrOcceU3Cq3HKqP6/kym
 OZQA==
X-Gm-Message-State: AOAM532wv2mytwTiT+b47tIE8Aa079GeXF4NiW0j7OwhehZUQbCvRm66
 CCh7DqoJFL9bfrW/z1Qlf+Y=
X-Google-Smtp-Source: ABdhPJxabd+8ymM2NRg2/JRi5E0kd2wtw9dI2cxAd5OZTNoNwxYd09wBP09f+o8F+RdDtGAnclFeIQ==
X-Received: by 2002:a62:160a:0:b029:328:56b9:b1ee with SMTP id
 10-20020a62160a0000b029032856b9b1eemr36090473pfw.52.1626862648751; 
 Wed, 21 Jul 2021 03:17:28 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id p33sm26481068pfw.40.2021.07.21.03.17.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 03:17:28 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 davem@davemloft.net, kuba@kernel.org
Subject: [PATCH] Bluetooth: skip invalid hci_sync_conn_complete_evt
Date: Wed, 21 Jul 2021 18:17:10 +0800
Message-Id: <20210721101710.82974-1-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 netdev@vger.kernel.org, Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+66264bf2fd0476be7e6c@syzkaller.appspotmail.com
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

Syzbot reported a corrupted list in kobject_add_internal [1]. This
happens when multiple HCI_EV_SYNC_CONN_COMPLETE event packets with
status 0 are sent for the same HCI connection. This causes us to
register the device more than once which corrupts the kset list.

To fix this, in hci_sync_conn_complete_evt, we check whether we're
trying to process the same HCI_EV_SYNC_CONN_COMPLETE event multiple
times for one connection. If that's the case, the event is invalid, so
we skip further processing and exit.

Link: https://syzkaller.appspot.com/bug?extid=66264bf2fd0476be7e6c [1]
Reported-by: syzbot+66264bf2fd0476be7e6c@syzkaller.appspotmail.com
Tested-by: syzbot+66264bf2fd0476be7e6c@syzkaller.appspotmail.com
Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 net/bluetooth/hci_event.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index 016b2999f219..091a92338492 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -4373,6 +4373,8 @@ static void hci_sync_conn_complete_evt(struct hci_dev *hdev,
 
 	switch (ev->status) {
 	case 0x00:
+		if (conn->state == BT_CONNECTED)
+			goto unlock;  /* Already connected, event not valid */
 		conn->handle = __le16_to_cpu(ev->handle);
 		conn->state  = BT_CONNECTED;
 		conn->type   = ev->link_type;
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
