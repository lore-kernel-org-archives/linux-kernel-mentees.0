Return-Path: <SRS0=ILBb=BO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51870C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  4 Aug 2020 09:39:46 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 432C22075D
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  4 Aug 2020 09:39:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZSzidZsF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 432C22075D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B125B857EB;
	Tue,  4 Aug 2020 09:39:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 28dlavMUStbJ; Tue,  4 Aug 2020 09:39:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 39CCD85582;
	Tue,  4 Aug 2020 09:39:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 36087C0050;
	Tue,  4 Aug 2020 09:39:45 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8B442C004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 Aug 2020 09:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 86727877D1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 Aug 2020 09:39:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7lRPsfiNVNmC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 Aug 2020 09:39:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 00703878F0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 Aug 2020 09:39:42 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id e8so21777952pgc.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 04 Aug 2020 02:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lVM8DPgIzaCBPlmdMpwhgrG6jaxJmkvPn7CWbb/dTlA=;
 b=ZSzidZsFNsMMcg+cnTYShgZHrAbKJaPoiT7zCW38D6fUKoVYti7+S11nWF1L/y22/K
 5O7K9aLgn3BSCNFjxZTFrEzTrHmTJHSk8gTaXqXQ1FPLgTWo8DxJUfWESFwARo9lxQ1T
 uDtL8eOVZcusQBHPWuCd/buOUyrenWARwMZil8qP9aqxHbE+T60lvxWB30PgrSVhno7G
 CsShOmJJbW+kIOifBJ7v998dwBRt5blF45VskwRTPMGoYvlvMHMSdbZ750T3Qcpx0/BU
 AKRhsxk14RqUJ0pPO/A05gRWr1+za0kHkGbvc1SmWvfe1N9Vy0q6lS7LzINrAZDgCtrK
 RUkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lVM8DPgIzaCBPlmdMpwhgrG6jaxJmkvPn7CWbb/dTlA=;
 b=hMX3xPEy4LszyXvrvmPvx5J2lP7a2A7wVoBtHE4z6Onm+0+WoXB3YMSGYWGMBb+5mb
 dxf9MeAz1hfId7feS2MNfKd1JZKaJuXYhXul5CxvTJr+mvB6dFBphnsySKRgZp6PfNhI
 fA0RKLF145/x1A65uzjpiDGM4Z4QvP8fXkX5AAvJT1GEqbWcsxKHRmzgd1NjnN5tD9eN
 VOrsP/W3/wkys976rftxZarZ7oq6CKbSWuXat7Kaj7PmiJSLDARzhXVeWstWFVYJRDsE
 Y18x3r/4IZtTsMtbKUN9uYEmo2iqZe54UcHL3GmCamamkIDKQh65NkaZ8UfcEySXHGJx
 1c9A==
X-Gm-Message-State: AOAM533A0mjOOantKnOMqv5nsKMOIDYnV1IcildaUxZO6/KSI9oDKyaq
 gZYnbl7CgsRLxp827y3Y0mA=
X-Google-Smtp-Source: ABdhPJwEx8K2nBJam5PzEaCRjHbdokQrFW8yhQuhwwD2yzjx1fHT5E4IzG/zJp8W+PCj2IQgjapvhw==
X-Received: by 2002:a62:2c48:: with SMTP id s69mr19348795pfs.63.1596533982563; 
 Tue, 04 Aug 2020 02:39:42 -0700 (PDT)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
 by smtp.gmail.com with ESMTPSA id f3sm3514155pfj.206.2020.08.04.02.39.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2020 02:39:41 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: linux-bluetooth@vger.kernel.org
Date: Tue,  4 Aug 2020 17:39:37 +0800
Message-Id: <20200804093937.772961-1-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: Johan Hedberg <johan.hedberg@gmail.com>,
 "open list:NETWORKING \[GENERAL\]" <netdev@vger.kernel.org>,
 Marcel Holtmann <marcel@holtmann.org>,
 open list <linux-kernel@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 syzbot+fadfba6a911f6bf71842@syzkaller.appspotmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-kernel-mentees] [PATCH] Bluetooth: Initialize the TX queue
	lock when creating struct l2cap_chan in 6LOWPAN
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

When L2CAP channel is destroyed by hci_unregister_dev, it will
acquire the spin lock of the (struct l2cap_chan *)->tx_q list to
delete all the buffers. But sometimes when hci_unregister_dev is
being called, this lock may have not bee initialized. Initialize
the TX queue lock when creating struct l2cap_chan in 6LOWPAN to fix
this problem.

Reported-by: syzbot+fadfba6a911f6bf71842@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=fadfba6a911f6bf71842
Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 net/bluetooth/6lowpan.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/bluetooth/6lowpan.c b/net/bluetooth/6lowpan.c
index bb55d92691b0..713c618a73df 100644
--- a/net/bluetooth/6lowpan.c
+++ b/net/bluetooth/6lowpan.c
@@ -651,6 +651,7 @@ static struct l2cap_chan *chan_create(void)
 
 	l2cap_chan_set_defaults(chan);
 
+	skb_queue_head_init(&chan->tx_q);
 	chan->chan_type = L2CAP_CHAN_CONN_ORIENTED;
 	chan->mode = L2CAP_MODE_LE_FLOWCTL;
 	chan->imtu = 1280;
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
