Return-Path: <SRS0=s8/Q=LW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2108DC2B9F4
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 28 Jun 2021 07:50:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B28366198A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 28 Jun 2021 07:50:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B28366198A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 664D0401EA;
	Mon, 28 Jun 2021 07:50:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H2TP8mF-XDfp; Mon, 28 Jun 2021 07:50:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 4BFE9400BE;
	Mon, 28 Jun 2021 07:50:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 20130C0010;
	Mon, 28 Jun 2021 07:50:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ADBBDC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Jun 2021 07:50:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 86FC140146
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Jun 2021 07:50:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DP__puBDY-iM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Jun 2021 07:50:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ABD5C400BE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Jun 2021 07:50:13 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id a127so13390143pfa.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Jun 2021 00:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a9SnhaSC0KGtJA4jbcNzI1RmFExj/PoChJSbMbViqHo=;
 b=SlBZfW/vVWkuCoPhugNlcjB4fJuggEiyWrFbzXOSBp0G7zrKUI/R531RyHgcoG8efT
 xMZRK6yAyqGWqh6LYzljI4DeFQA6oX0HXvbVZiflZqrioI0gcIFrYOmwvNwC+87d4SbO
 NJBa4WTI/IOXtT7RPXxYE5OfokS/CmNnGGm8fCay/OWPwkl7L3GQ27x0aeMElR28679S
 jmhnHhLXd6cdg+2kzk9jbWHc4Djt1aagDnGCpDyux6srGhw/DsjbElHyZkCzY1B+UOMK
 prjZCWbYlh6BlTl6D0YBgmoYDCpNn/zSsUvf9ifiRhd2nQzDTtjAjpJRJVd6DAU21lzH
 QC1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a9SnhaSC0KGtJA4jbcNzI1RmFExj/PoChJSbMbViqHo=;
 b=HAquYv0PEHqRNR/bifiqALlQIhS0eqyiGP7vAgFhaf17NY4Y/FNTWARPFnVt5zoBde
 o8cG57GnHfVMkzrDB07IyQ78s0dseh3gRMfu2RePRhamNGPNk9pu+4RtVtFElimLcNnz
 HWfll/XjaKF9hnKUzQitkqxGGo4HMS5guLCeSp1259i/hfcriz8XltPTZ+8+63V/JVgH
 3ngd3nUsC3//qz/qv4WXP2KTXUm528M3mqGHevZK+GXGAG7BCam6+HCIN55RKizgMEDr
 d4FSxyVDKur4m+q2tcwYxhkbJj/ddMh5MFa0PxdHyQaa0kIT8miShYmJ2/yxjmImucub
 M+Ew==
X-Gm-Message-State: AOAM53135S6ECVVvN70pVHKcWQ9QcHDY9BA9rtvh/bzg8Q/CtxEDCG8w
 g2IOf0kAlVguR5J2AcrI0SE=
X-Google-Smtp-Source: ABdhPJzmLptl5YBBhs4A80NLCSgl3oM4vlhA0HLGNblaK7RuNiVK3F/VD3Cb07Y/TvBgBZzt9AUuaw==
X-Received: by 2002:a65:6555:: with SMTP id a21mr5312004pgw.53.1624866613181; 
 Mon, 28 Jun 2021 00:50:13 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id c24sm14519028pgj.11.2021.06.28.00.50.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 00:50:12 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 davem@davemloft.net, kuba@kernel.org
Subject: [PATCH] Bluetooth: fix inconsistent lock state in sco
Date: Mon, 28 Jun 2021 15:48:34 +0800
Message-Id: <20210628074834.161640-1-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: syzbot+2f6d7c28bb4bf7e82060@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 netdev@vger.kernel.org, Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

Syzbot reported an inconsistent {SOFTIRQ-ON-W} -> {IN-SOFTIRQ-W} lock
usage in sco_conn_del and sco_sock_timeout that could lead to
deadlocks:
https://syzkaller.appspot.com/bug?id=9089d89de0502e120f234ca0fc8a703f7368b31e

This inconsistent lock state can also happen between sco_conn_ready
and sco_sock_timeout.

The issue is that these three functions take a spin lock on the
socket, but sco_sock_timeout is called from an IRQ context. Since
bh_lock_sock calls spin_lock but does not disable softirqs, this could
lead to deadlocks:

       CPU0
       ----
  lock(slock-AF_BLUETOOTH-BTPROTO_SCO);
  <Interrupt>
    lock(slock-AF_BLUETOOTH-BTPROTO_SCO);

 *** DEADLOCK ***

We fix this by replacing bh_lock_sock with spin_lock_bh in
sco_conn_del and sco_conn_ready.

Additionally, to avoid regressions, we pull the clean-up code out from
sco_chan_del and use it directly in sco_conn_del. This is necessary
because sco_chan_del makes a call to sco_conn_lock which takes an
SOFTIRQ-unsafe lock. This means that calling sco_chan_del while
holding the socket lock would result in a SOFTIRQ-safe ->
SOFTIRQ-unsafe lock hierarchy between slock-AF_BLUETOOTH-BTPROTO_SCO
and &conn->lock#2. This could lead to a deadlock as well:

        CPU0                    CPU1
        ----                    ----
   lock(&conn->lock#2);
                                local_irq_disable();
                                lock(slock-AF_BLUETOOTH-BTPROTO_SCO);
                                lock(&conn->lock#2);
   <Interrupt>
     lock(slock-AF_BLUETOOTH-BTPROTO_SCO);

  *** DEADLOCK ***

Pulling out the code from sco_chan_del allows us to avoid this lock
dependency by holding the two locks for only their required critical
sections.

Reported-and-tested-by: syzbot+2f6d7c28bb4bf7e82060@syzkaller.appspotmail.com
Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 net/bluetooth/sco.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/net/bluetooth/sco.c b/net/bluetooth/sco.c
index 3bd41563f118..d05629d7cc55 100644
--- a/net/bluetooth/sco.c
+++ b/net/bluetooth/sco.c
@@ -173,10 +173,22 @@ static void sco_conn_del(struct hci_conn *hcon, int err)
 
 	if (sk) {
 		sock_hold(sk);
-		bh_lock_sock(sk);
+
+		spin_lock_bh(&sk->sk_lock.slock);
 		sco_sock_clear_timer(sk);
-		sco_chan_del(sk, err);
-		bh_unlock_sock(sk);
+		sco_pi(sk)->conn = NULL;
+		if (conn->hcon)
+			hci_conn_drop(conn->hcon);
+		sk->sk_state = BT_CLOSED;
+		sk->sk_err   = err;
+		sk->sk_state_change(sk);
+		sock_set_flag(sk, SOCK_ZAPPED);
+		spin_unlock_bh(&sk->sk_lock.slock);
+
+		sco_conn_lock(conn);
+		conn->sk = NULL;
+		sco_conn_unlock(conn);
+
 		sco_sock_kill(sk);
 		sock_put(sk);
 	}
@@ -1084,10 +1096,10 @@ static void sco_conn_ready(struct sco_conn *conn)
 
 	if (sk) {
 		sco_sock_clear_timer(sk);
-		bh_lock_sock(sk);
+		spin_lock_bh(&sk->sk_lock.slock);
 		sk->sk_state = BT_CONNECTED;
 		sk->sk_state_change(sk);
-		bh_unlock_sock(sk);
+		spin_unlock_bh(&sk->sk_lock.slock);
 	} else {
 		sco_conn_lock(conn);
 
@@ -1102,12 +1114,12 @@ static void sco_conn_ready(struct sco_conn *conn)
 			return;
 		}
 
-		bh_lock_sock(parent);
+		spin_lock_bh(&parent->sk_lock.slock);
 
 		sk = sco_sock_alloc(sock_net(parent), NULL,
 				    BTPROTO_SCO, GFP_ATOMIC, 0);
 		if (!sk) {
-			bh_unlock_sock(parent);
+			spin_unlock_bh(&parent->sk_lock.slock);
 			sco_conn_unlock(conn);
 			return;
 		}
@@ -1128,7 +1140,7 @@ static void sco_conn_ready(struct sco_conn *conn)
 		/* Wake up parent */
 		parent->sk_data_ready(parent);
 
-		bh_unlock_sock(parent);
+		spin_unlock_bh(&parent->sk_lock.slock);
 
 		sco_conn_unlock(conn);
 	}
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
