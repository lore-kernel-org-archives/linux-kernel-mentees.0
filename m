Return-Path: <SRS0=39L3=CB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8C74C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 23 Aug 2020 01:00:40 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F4C4204FD
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 23 Aug 2020 01:00:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rx6aRGdc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F4C4204FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5CD7A87A22;
	Sun, 23 Aug 2020 01:00:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ijCq64fRw-TE; Sun, 23 Aug 2020 01:00:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E6AC5879E1;
	Sun, 23 Aug 2020 01:00:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B1547C0889;
	Sun, 23 Aug 2020 01:00:39 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EFCB1C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Aug 2020 01:00:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D3CC488091
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Aug 2020 01:00:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P1b0Vkur2kff
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Aug 2020 01:00:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id F344C8807A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Aug 2020 01:00:37 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id p37so2801274pgl.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 18:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5+TanUjx4aTdxJYsMsMUFdiokbTUr43+JM8xsRSY+0I=;
 b=rx6aRGdcfWR0o7pmQXw8pzwtdAHGaRLCgCMimwem4zB0IThITtZDpAl4mr7GQM5ABv
 l1Xav6doj4OTLnwA4WdMcHEbD88JHGA94UnRMXKLOFYYtKEK9V+IYzcoAfzLlFLkkIZY
 c+M50sOOGpNS3D89y06E83Ur0YIMmT1+h/ZfNYjOT8pBg/wWehqtd6D4jkUFAEmJZYKB
 XbAqvmLPMWCwlgh0+4ZmlL2fdeGndIKC6Z3FxKiJGeU60XbTnI596i7sUNUHzyJMpqz1
 E4oshkUJ9vHj2h+CgJqIGlXgpPaoG7gDkPCmf+Y4RJZ8CyPClaU/OCI306cSS4xNrpIK
 1l7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5+TanUjx4aTdxJYsMsMUFdiokbTUr43+JM8xsRSY+0I=;
 b=P88JplAWJLXIzFjvrt9uACJJhnf3W8tEM0JHoDS+0AvsU0Y/veFJbITxVjzXu9hEcI
 aPQcWwp60Tj1RnjW8bnnuA1RwoT5O2QjSQ+qHwqvdUVgWbII+M1J4zmMEE+HuO5g0ny0
 3a+dRlqI1p7nSRdh7ekBoGM+jG5IZM53yZ6adiv1mrGRi2jhUE39i3u8Fkd5jFQWDIO6
 tePkc7zqDkQ1KXJY85CePtyNKDKNsFpjooarBTfIPfWoHp2Yxs9OS5dHkiz2CNNUYY99
 Of+sfhr460j4CyjexB9tscwrHoU1RVtYeja2Xe8WkO5TIV3yFcHeESIwYBObzcsxo0Ur
 KC/Q==
X-Gm-Message-State: AOAM5336m2jaDCt3Jiu2nGCxgqANFCinzoi27J1nbbwD/iZ9Ji7M7KpH
 /+QQRqC2YnJl/sGSmgqHrrc=
X-Google-Smtp-Source: ABdhPJz1cfAq4nmjDpSF4+magItyeRjS9uG2hW1AoMBR1/nYYEIytOx/aCMpULiCkbyufqWuEEBc5A==
X-Received: by 2002:a65:60ce:: with SMTP id r14mr6742305pgv.85.1598144436460; 
 Sat, 22 Aug 2020 18:00:36 -0700 (PDT)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
 by smtp.gmail.com with ESMTPSA id x15sm6875701pfr.208.2020.08.22.18.00.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Aug 2020 18:00:35 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: linux-bluetooth@vger.kernel.org
Date: Sun, 23 Aug 2020 09:00:22 +0800
Message-Id: <20200823010022.938532-1-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <000000000000c57f2d05ac4c5b8e@google.com>
References: <000000000000c57f2d05ac4c5b8e@google.com>
MIME-Version: 1.0
Cc: syzbot+dd768a260f7358adbaf9@syzkaller.appspotmail.com,
 Johan Hedberg <johan.hedberg@gmail.com>, Marcel Holtmann <marcel@holtmann.org>,
 syzkaller-bugs@googlegroups.com, open list <linux-kernel@vger.kernel.org>,
 "open list:NETWORKING \[GENERAL\]" <netdev@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-kernel-mentees] [PATCH] Bluetooth: fix "list_add double add"
	in hci_conn_complete_evt
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

When two HCI_EV_CONN_COMPLETE event packets with status=0 of the same
HCI connection are received, device_add would be called twice which
leads to kobject_add being called twice. Thus duplicate
(struct hci_conn *conn)->dev.kobj.entry would be inserted into
(struct hci_conn *conn)->dev.kobj.kset->list.

This issue can be fixed by checking (struct hci_conn *conn)->debugfs.
If it's not NULL, it means the HCI connection has been completed and we
won't duplicate the work as for processing the first
HCI_EV_CONN_COMPLETE event.

Reported-and-tested-by: syzbot+dd768a260f7358adbaf9@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=dd768a260f7358adbaf9
Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 net/bluetooth/hci_event.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index 4b7fc430793c..1233739ce760 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -2605,6 +2605,11 @@ static void hci_conn_complete_evt(struct hci_dev *hdev, struct sk_buff *skb)
 	}

 	if (!ev->status) {
+		if (conn->debugfs) {
+			bt_dev_err(hdev, "The connection has been completed");
+			goto unlock;
+		}
+
 		conn->handle = __le16_to_cpu(ev->handle);

 		if (conn->type == ACL_LINK) {
--
2.28.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
