Return-Path: <SRS0=1TFu=BR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12848C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  7 Aug 2020 13:59:31 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0981221E2
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  7 Aug 2020 13:59:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gDMavG5S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0981221E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 88B0A88A71;
	Fri,  7 Aug 2020 13:59:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YvlPKOfnIDmI; Fri,  7 Aug 2020 13:59:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1AAC488A64;
	Fri,  7 Aug 2020 13:59:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 005C8C0051;
	Fri,  7 Aug 2020 13:59:30 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 785B5C004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 Aug 2020 13:59:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7470F887DE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 Aug 2020 13:59:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lWPmRSe+o2XF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 Aug 2020 13:59:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 926A0887BF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 Aug 2020 13:59:25 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 74so1023248pfx.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 07 Aug 2020 06:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KkgC/IfZgfpRrHJateeuAuB7TNckjX9ScGM6wvRUKgI=;
 b=gDMavG5S3kcl1rHlmaIoh4h3AYKDs61EYZN8cDWB74dcRQJBQd0+pzoVYEOzovxZ6h
 eJWijr6Xw5aNrN6uqIKECi/C3CMLum49xD4ayGZU5SCqKI5EIhok9ewLtPGgHhEd19uT
 /EYlh//DysbcBPh9myNWMQzxHPisMLRScDsNeoOsup5vA4gWdGhGu8be8vzbdTD8VZaS
 TVS6/qccykmKkXJN8moBVApR9dpm8+L+Ifu5XZwHri5sFP3sqGK5xxLy+2p6JmvH7M+9
 0IBgfEunDLgdwJAg64hXWLJ3rTkUD542IaGzrBdHgqq/MtvSXsQAdXcgy5CbwBggVq2/
 FgMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KkgC/IfZgfpRrHJateeuAuB7TNckjX9ScGM6wvRUKgI=;
 b=UofoZMj7j/uxCMiW7mbKi4IUq6aFlDlJBQRwIvoE4mLzrcBRXKe6zss4TrTKUFK2+2
 NoBoyuMHZ59AYTBSBFxhXCiw5fJ88vJ1patxiTcBIFTWqrRw9iYyvnn5Wp/tuipphl8s
 2EdlK0+PYFhziKZTldZ0r6PTptw9Egelc7uJMgiVp0T31mAkfAIreldjqHt0QAhMYGDU
 FOnPSc+/X222aZshF0M074h/MM39P/cOJPHloi1gZ9GkrPwsUuHQTmz3XEJGTvjmBEFR
 aYXNH1usGq9FLYL1MiDt9Y0yoBUomrddpVcezc6vcrEw/mndgqqExBBonkNQfTQ8r8OM
 vk/A==
X-Gm-Message-State: AOAM532CSgVsNneaROyLer3WCXrLach6G9NlfjY2S23SMhwB2z6TVDN/
 nANVQ7tEXjoGaJRw112R32Q=
X-Google-Smtp-Source: ABdhPJz4Wsqd8oawH81Y8HKewsfkWQhSxRPY2Ov5elBmaChRBM6h41G4JBnG2tm9eAT+qNWOK3v2Lw==
X-Received: by 2002:aa7:8a4d:: with SMTP id n13mr14406135pfa.143.1596808765226; 
 Fri, 07 Aug 2020 06:59:25 -0700 (PDT)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
 by smtp.gmail.com with ESMTPSA id u15sm11212157pju.42.2020.08.07.06.59.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Aug 2020 06:59:24 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: linux-bluetooth@vger.kernel.org
Date: Fri,  7 Aug 2020 21:59:17 +0800
Message-Id: <20200807135918.1177869-1-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: Johan Hedberg <johan.hedberg@gmail.com>,
 "open list:NETWORKING \[GENERAL\]" <netdev@vger.kernel.org>,
 Marcel Holtmann <marcel@holtmann.org>, syzkaller-bugs@googlegroups.com,
 open list <linux-kernel@vger.kernel.org>,
 syzbot+305a91e025a73e4fd6ce@syzkaller.appspotmail.com,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-kernel-mentees] [PATCH] Bluetooth: Delete both L2CAP
	connction and HCI channel when completing destroying logical
	link in AMP
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

When destroying a logical link (HCI_EV_DISCONN_LOGICAL_LINK_COMPLETE) in
AMP, L2CAP connection (struct l2cap_conn) should be deleted together with
HCI channel (struct hci_chan). Otherwise HCI channel will be deleted twice
when unregistering a HCI device.

`static void l2cap_conn_del(struct hci_conn *hcon, int err)` could
achieve this purpose. Make it a public function.

Reported-and-tested-by: syzbot+305a91e025a73e4fd6ce@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=305a91e025a73e4fd6ce
Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 include/net/bluetooth/l2cap.h | 1 +
 net/bluetooth/amp.c           | 2 +-
 net/bluetooth/l2cap_core.c    | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/net/bluetooth/l2cap.h b/include/net/bluetooth/l2cap.h
index 8f1e6a7a2df8..8508a433d6ac 100644
--- a/include/net/bluetooth/l2cap.h
+++ b/include/net/bluetooth/l2cap.h
@@ -988,6 +988,7 @@ void __l2cap_chan_add(struct l2cap_conn *conn, struct l2cap_chan *chan);
 typedef void (*l2cap_chan_func_t)(struct l2cap_chan *chan, void *data);
 void l2cap_chan_list(struct l2cap_conn *conn, l2cap_chan_func_t func,
 		     void *data);
+void l2cap_conn_del(struct hci_conn *hcon, int err);
 void l2cap_chan_del(struct l2cap_chan *chan, int err);
 void l2cap_send_conn_req(struct l2cap_chan *chan);
 void l2cap_move_start(struct l2cap_chan *chan);
diff --git a/net/bluetooth/amp.c b/net/bluetooth/amp.c
index 9c711f0dfae3..cee02f009cef 100644
--- a/net/bluetooth/amp.c
+++ b/net/bluetooth/amp.c
@@ -584,5 +584,5 @@ void amp_destroy_logical_link(struct hci_chan *hchan, u8 reason)
 {
 	BT_DBG("hchan %p", hchan);

-	hci_chan_del(hchan);
+	l2cap_conn_del(hchan->conn, bt_to_errno(reason));
 }
diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
index fe913a5c754a..38f60fb9b515 100644
--- a/net/bluetooth/l2cap_core.c
+++ b/net/bluetooth/l2cap_core.c
@@ -1851,7 +1851,7 @@ static void l2cap_unregister_all_users(struct l2cap_conn *conn)
 	}
 }

-static void l2cap_conn_del(struct hci_conn *hcon, int err)
+void l2cap_conn_del(struct hci_conn *hcon, int err)
 {
 	struct l2cap_conn *conn = hcon->l2cap_data;
 	struct l2cap_chan *chan, *l;
--
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
