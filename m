Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 396B8C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 17 Jul 2022 13:38:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD21A4099E;
	Sun, 17 Jul 2022 13:38:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD21A4099E
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=D8MVRPT8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j2oa08OjnNK2; Sun, 17 Jul 2022 13:38:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 90E2340999;
	Sun, 17 Jul 2022 13:38:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90E2340999
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 61851C0035;
	Sun, 17 Jul 2022 13:38:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D3949C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 17 Jul 2022 13:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ADFEA40412
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 17 Jul 2022 13:38:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADFEA40412
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=D8MVRPT8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kobdXhFPCPoy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 17 Jul 2022 13:38:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CF2E400DD
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0CF2E400DD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 17 Jul 2022 13:38:14 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id z1so6924795plb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 17 Jul 2022 06:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pjCptrwTCqzyeOFeqcjeBA84+aupixrF+Oo0LbeI1pA=;
 b=D8MVRPT8Eb3HOVIq+fyV26qLXpi3Zy/EAKcQbh9oVpIobBFwBWKecS4bDBRio8cg6N
 V3vDXu80PjakXJM12wXxipbS+T2rgwnHcRzrFmj/vfp0FRPM/TZcUd2j6ai6ztPl/dla
 /xNGAUEQktbnjz6pwVLz5SFgmdOmnxEInGv2Lg2zscmDls6wgtqAmMSs8c4QdDBHHwSu
 hyukifsrUsJdewr5wIYSIezsSkTM6FTN8GYfTXVYlTtmbtBNC5jrdjZjhtCazWkF2E58
 h6lO1qA4uOs6p6pyxafaO5xnFBXCryWdUHwfaqQVGGQGNwwloGqweU7c0AJrRTyWlE6l
 WpNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pjCptrwTCqzyeOFeqcjeBA84+aupixrF+Oo0LbeI1pA=;
 b=wme9q4zSwgrVBzDtcurswCMfXLjd85vqjgngn6z+TDl490TgKanlProN5Ic45pwwqb
 M7AzEZTxWdR0+lcos8sxFyOZfKNITFxF6tqoiME8wP+3t/sr27zqr2cX9A1wFRXMPGBl
 qZwSYVfZIwsChW+uGypH6znRlTZgA60BwrD9oON3PqfnqhKm0Naa+hFdCb50Fs63Fhq1
 wWqy/diR8r99EEGLL7358n+yeUMu03zmE2fCWV7NvmjyJrI/lP7n9v6IkMIET19lAT49
 jNdqH0sIfpVnie7PRqECyOPhrR0O50BAEUHLf6VzYRwWSeSSdoY8+z+G4IDpLAEaE3td
 ZzQw==
X-Gm-Message-State: AJIora8ZhZcBlIQ6APB+AOlUsc0wARlPuW16DwuFXwu/C0ZbxlYC+peP
 U9tGs2Y4q0UjS5xUb4ljjJAyXzUN3GJIa5xF
X-Google-Smtp-Source: AGRyM1u3D5EsZy5ThFn9Gz06wyR2U7uyzcynnndletJOt8PrBO5LQm0fCb7NVZ1yb/88RWcymkKJIw==
X-Received: by 2002:a17:90b:3807:b0:1f0:a86:6875 with SMTP id
 mq7-20020a17090b380700b001f00a866875mr33281553pjb.103.1658065094159; 
 Sun, 17 Jul 2022 06:38:14 -0700 (PDT)
Received: from fedora.. ([103.159.189.134]) by smtp.gmail.com with ESMTPSA id
 r16-20020aa79890000000b005254e44b748sm7279166pfl.84.2022.07.17.06.38.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 06:38:13 -0700 (PDT)
From: Khalid Masum <khalid.masum.92@gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] Bluetooth: hci_core: Use ERR_PTR instead of NULL
Date: Sun, 17 Jul 2022 19:37:58 +0600
Message-Id: <20220717133759.8479-1-khalid.masum.92@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Cc: Johan Hedberg <johan.hedberg@gmail.com>,
 Pavel Skripkin <paskripkin@gmail.com>, Marcel Holtmann <marcel@holtmann.org>,
 linux-bluetooth@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 netdev@vger.kernel.org, Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>
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

Failure of kzalloc to allocate memory is not reported. Return Error
pointer to ENOMEM if memory allocation fails. This will increase
readability and will make the function easier to use in future.

Signed-off-by: Khalid Masum <khalid.masum.92@gmail.com>
---
 drivers/bluetooth/btusb.c | 4 ++--
 net/bluetooth/hci_core.c  | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index e25fcd49db70..3407762b3b15 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -3692,8 +3692,8 @@ static int btusb_probe(struct usb_interface *intf,
 	data->recv_acl = hci_recv_frame;
 
 	hdev = hci_alloc_dev_priv(priv_size);
-	if (!hdev)
-		return -ENOMEM;
+	if (IS_ERR(hdev))
+		return PTR_ERR(hdev);
 
 	hdev->bus = HCI_USB;
 	hci_set_drvdata(hdev, data);
diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index a0f99baafd35..ea50767e02bf 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -2419,7 +2419,7 @@ struct hci_dev *hci_alloc_dev_priv(int sizeof_priv)
 
 	hdev = kzalloc(alloc_size, GFP_KERNEL);
 	if (!hdev)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	hdev->pkt_type  = (HCI_DM1 | HCI_DH1 | HCI_HV1);
 	hdev->esco_type = (ESCO_HV1);
-- 
2.36.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
