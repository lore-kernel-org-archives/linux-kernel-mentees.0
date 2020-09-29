Return-Path: <SRS0=644b=DG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5765DC4741F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 29 Sep 2020 18:58:39 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C7C42076D
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 29 Sep 2020 18:58:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cjUBSlhZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C7C42076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0D6C7844FB;
	Tue, 29 Sep 2020 18:58:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O4HxQmAOKZ16; Tue, 29 Sep 2020 18:58:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A8931844DA;
	Tue, 29 Sep 2020 18:58:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 97852C0889;
	Tue, 29 Sep 2020 18:58:37 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A7B59C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 18:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9E51720504
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 18:58:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2dJsbKL38x1E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 18:58:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by silver.osuosl.org (Postfix) with ESMTPS id B1647204D1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 18:58:33 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id d6so5490637pfn.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 11:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XZ/FToa3AtOQUQOsb9qJSrILRh6kvTTOmkZ8BW0o6ag=;
 b=cjUBSlhZ6UxY7zZ/tL81xKJQC2TvgjdO4HRMZp3UP623ayNyff2RcBVkImm4i/gX1Y
 E8vN0otEvcaBRFSvMH/7soYlnd5nbvxUCwZiewdQ789yRXxCxeqL0HHuwKDShVWwBbjG
 CcStVRVo9N/N4rKWTUeopfKxnOwrkQt+BlooeaaK37C1LnAdCoHAFc4MczSgufDDutTJ
 Ovvoyd5BK7T+1oLdqoqvykgugZ+bLrEj8TZDSE9zeuXYI8b4/OCvevAvRbsSX0lLIisS
 dWP4oThRfkB5OqpoWbRCxOsxBF2h3ISeP9WCV37vpSgm4XAzqICdiZzrrbrM5Flm/Dds
 b33w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XZ/FToa3AtOQUQOsb9qJSrILRh6kvTTOmkZ8BW0o6ag=;
 b=hMA+m0nQsJf0TShYxTuX/OJsWnW2HI4QqibtG9gPkVTQU/Q77B/qxII2cAh0Efec2b
 4xgLMGX34VJ243hpQXIV7bHn1vAnqPmXwT3Ou7/hgqCjNKr/xv2um0dP7bJ7FPJ1mECO
 qfjnqbAfix4uSVkBj9eZYqWtDufepyUcJ//d5eyuqJQCs73gMoGj7b6+KcIauh6FsL3M
 9FZ9ji7a4YXvGc1rPN/av57TvCLy3eb1y+YNvIy4Ywh7enVF136iooqaHwSuyq7YLOiD
 xh9uGO4Y014YTbfQo0ovP6rjQ9zRc8vq8+2vyPUU8y9cor1sO+UUaM4UY3nE/MhbmtRB
 Osgg==
X-Gm-Message-State: AOAM533ILU/mji9mER8Xty/1CiTf9SMl8unfb0rZ5Gtog+9BvDtUPMGv
 WufRyEfOAAzg2UpzGSuorffbesgJJzXAyuCpJrA=
X-Google-Smtp-Source: ABdhPJyKwhZR3c4Ipym8Bpt1caw0vWJ1Z4f6NSyMSqvkGi3xTPgpjdLmkGO66H3GJheo+MBVnsaTKQ==
X-Received: by 2002:a17:902:74ca:b029:d2:ad1b:332 with SMTP id
 f10-20020a17090274cab02900d2ad1b0332mr3471411plt.7.1601405912614; 
 Tue, 29 Sep 2020 11:58:32 -0700 (PDT)
Received: from localhost.localdomain ([49.207.218.220])
 by smtp.gmail.com with ESMTPSA id c3sm6350181pfn.23.2020.09.29.11.58.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 11:58:31 -0700 (PDT)
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
To: 
Date: Wed, 30 Sep 2020 00:28:15 +0530
Message-Id: <20200929185815.12879-1-anant.thazhemadam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Anant Thazhemadam <anant.thazhemadam@gmail.com>,
 syzbot+6ce141c55b2f7aafd1c4@syzkaller.appspotmail.com,
 Johan Hedberg <johan.hedberg@gmail.com>, Marcel Holtmann <marcel@holtmann.org>,
 linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] bluetooth: hci_h5: close serdev
	device and free hu in h5_close
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

When h5_close() gets called, the memory allocated for the hu gets 
freed only if hu->serdev doesn't exist. This leads to a memory leak.
So when h5_close() is requested, close the serdev device instance and
free the memory allocated to the hu entirely instead.

Fixes: https://syzkaller.appspot.com/bug?extid=6ce141c55b2f7aafd1c4
Reported-by: syzbot+6ce141c55b2f7aafd1c4@syzkaller.appspotmail.com
Tested-by: syzbot+6ce141c55b2f7aafd1c4@syzkaller.appspotmail.com
Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
---
 drivers/bluetooth/hci_h5.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/hci_h5.c b/drivers/bluetooth/hci_h5.c
index e41854e0d79a..3d1585add572 100644
--- a/drivers/bluetooth/hci_h5.c
+++ b/drivers/bluetooth/hci_h5.c
@@ -248,8 +248,12 @@ static int h5_close(struct hci_uart *hu)
 	if (h5->vnd && h5->vnd->close)
 		h5->vnd->close(h5);
 
-	if (!hu->serdev)
-		kfree(h5);
+	if (hu->serdev)
+		serdev_device_close(hu->serdev);
+
+	kfree_skb(h5->rx_skb);
+	kfree(h5);
+	h5 = NULL;
 
 	return 0;
 }
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
