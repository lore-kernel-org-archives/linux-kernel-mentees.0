Return-Path: <SRS0=Dbq6=DA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24F90C4727E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Sep 2020 09:06:13 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E0642075B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Sep 2020 09:06:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rPYT1Oan"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E0642075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1402D8679D;
	Wed, 23 Sep 2020 09:06:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PRNfbz60Bm4M; Wed, 23 Sep 2020 09:06:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id AAD4186730;
	Wed, 23 Sep 2020 09:06:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 96D03C0889;
	Wed, 23 Sep 2020 09:06:11 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B2E07C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 09:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A01E8860D1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 09:06:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SUDCR8CMtdld
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 09:06:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 902B78607A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 09:06:09 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id d19so6517431pld.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 02:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=wmyY5XpgcNpj2CzR3rp96YCOt1z4gBJ/8Zy+qlXjkUo=;
 b=rPYT1OansxEM1lD9H7pOWAhXSVBopghvDdtGsmfmfU36gTCwwAwK8KmFGWqUIy2mC+
 CEL6zjZ4FfebYe+WFovSsYiUhxdj9GtpH8pf/bQ7kpysLFcX1n0O87gL37sLkBU6qvjk
 HT1dQJX1LSwg/MZOGu4J4XU8l4tNP6/cTGsdOjgRCieTYWO+f6/BKf4VLffe6RWDPaFU
 vb/yAB6/lBSfN7+1KELo1XuLw+c03GjWHu0ueW1bb2UlZlnRBbN5Kcq2SQrl43v0hiNI
 JinvjkrPmnh8bBIYVjWiYTmPXjVVu6KrIxaJhzBU+VMgbuNK6UjjFCcLyEkkAwV5qvq2
 bpsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=wmyY5XpgcNpj2CzR3rp96YCOt1z4gBJ/8Zy+qlXjkUo=;
 b=XOCpyX24v4nBaopoKyo8YsWfU2AHgn2T/Zqo+HnxYXLRHsytYNT5Ztw+1bihWVz8Uy
 +YxmzHRVlDw0DR1hCu6KWS68PKJZO0HwpVlO5XbrXcOuw4aCTyA9GOy3Z8OKaruXJ3CV
 nn1XMiUf7Cr/w4rSchH2INaBTw8U/6P9w1xmqH/csQCMhcfERnea7GKMbyBizoN6oDOi
 dLO5wP7n5V7jrhcm7khCceONPz/OUJsoctLwOu8SzMRTxkmdWM50DbAXAgtxWNaHi/xH
 SGtfpYUv0WEfYJv3atpDBdSvaDD2YFU7oPjuZLAPQ07pv/ppGPiw8fpi49eiEvplgmnm
 Bejg==
X-Gm-Message-State: AOAM531g8DXsJ+ppdFBq8gyQ7ZerurSCbh3n+jv2m8g5HieRVNX6vgGc
 UlH2GlqJ3O+w1sbdWdu3h5U=
X-Google-Smtp-Source: ABdhPJzd4xTYSZZ2phKNaD2FrJKt2AqeoD5MuNiHRdhxUAkHsNGQkCtu4z32V9SndvXr6zfsM3rGJA==
X-Received: by 2002:a17:90a:ad48:: with SMTP id
 w8mr7309913pjv.179.1600851969127; 
 Wed, 23 Sep 2020 02:06:09 -0700 (PDT)
Received: from localhost.localdomain ([2405:205:c8e3:4b96:985a:95b9:e0cd:1d5e])
 by smtp.gmail.com with ESMTPSA id a13sm16496226pgq.41.2020.09.23.02.06.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 02:06:08 -0700 (PDT)
From: Himadri Pandya <himadrispandya@gmail.com>
To: davem@davemloft.net, kuba@kernel.org, oneukum@suse.com,
 pankaj.laxminarayan.bharadiya@intel.com, keescook@chromium.org,
 yuehaibing@huawei.com, petkan@nucleusys.com, ogiannou@gmail.com
Date: Wed, 23 Sep 2020 14:35:15 +0530
Message-Id: <20200923090519.361-1-himadrispandya@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 0/4] net: usb: avoid using
	usb_control_msg() directly
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

A recent bug-fix shaded light on possible incorrect use of
usb_control_msg() without proper error check. This resulted in
introducing new usb core api wrapper functions usb_control_msg_send()
and usb_control_msg_recv() by Greg KH. This patch series continue the
clean-up using the new functions.

Himadri Pandya (4):
  net: usbnet: use usb_control_msg_recv() and usb_control_msg_send()
  net: sierra_net: use usb_control_msg_recv()
  net: usb: rtl8150: use usb_control_msg_recv() and
    usb_control_msg_send()
  net: rndis_host: use usb_control_msg_recv() and usb_control_msg_send()

 drivers/net/usb/rndis_host.c | 44 +++++++++++++---------------------
 drivers/net/usb/rtl8150.c    | 32 +++++--------------------
 drivers/net/usb/sierra_net.c | 17 ++++++-------
 drivers/net/usb/usbnet.c     | 46 ++++--------------------------------
 4 files changed, 34 insertions(+), 105 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
