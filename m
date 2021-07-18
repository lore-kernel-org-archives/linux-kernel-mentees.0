Return-Path: <SRS0=+xMb=MK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 408F3C636C8
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 18 Jul 2021 14:40:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD7C061183
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 18 Jul 2021 14:40:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD7C061183
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A49F40160;
	Sun, 18 Jul 2021 14:40:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8kVerzqbq2fI; Sun, 18 Jul 2021 14:40:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 9C18B4012E;
	Sun, 18 Jul 2021 14:40:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6C80DC001A;
	Sun, 18 Jul 2021 14:40:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C51A3C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jul 2021 14:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A47CF6071A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jul 2021 14:40:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A8G3QXoXbPta
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jul 2021 14:40:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E574E606E6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jul 2021 14:40:31 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id v14so8080798plg.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jul 2021 07:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5h/ouo57VgfmtTZNOxTlKh2p8kwjX4qlWDpeGeXNCSw=;
 b=I9+3sBMGCL2qvqLsDeceKsdItH6nNFMc79nKsZ0pwFBLBwJD/DD3RL+oL1Ce9El/+s
 qvU32SB4myxSHRnKqD6bafj8buTU5ezQtRy2Fyp+PeCsmguSpZCQLIrN/8qd99dnJ2K7
 AOaYe2aWcd7wPsIAA5epz1Bh41TxllTtZJoz6aWYJlBqyz/Fx8mSdejrlGg0b4HoEhBT
 MbJOEudVjEwZMNAjZ7l/6mjqP3GRnzriOdqLvbLR1+h/x4PpH79DtUtozA+S9sTJfhG1
 0ojhriragwCFkMaa1nEsOsOC/cH8JIb4tuYoNDsXe9ojYVcVeGZTGVtqnawVWVPC98kj
 sNaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5h/ouo57VgfmtTZNOxTlKh2p8kwjX4qlWDpeGeXNCSw=;
 b=dhoWzmZFt9GOjUbnygvRVs6dObnXj0ivsCEmCvD3RuHF7rK2CdTb9LQznePI9PFuF6
 zC9bHQK9fMVVJZ0VUs+wwsT5eRRICY2efbfufkeDCARZ0EFU+4isX2/a6uGNHGs+cJMx
 3RuPSIhotlZZkGizcjykvHtZrQt0Zgb6vuRiJ9sYpVn8MsHC6W6qQHWQX0+f0hE2yhSi
 i4W88tx0MSnJsEjUkkbk+UozUmJDzCyrnK46QoCaL90Cnr89+3Q/VT4Olqc0l6XRrjMf
 Gpkz8St0ZuJU3zLtgKEUiB37XgGr07YLGSoT36/qPfeTSo1Ozq2b55ui8xdvAo8fmc7X
 mgRA==
X-Gm-Message-State: AOAM531xuyasH/InyLps7LkV/CbaJ3JUNpE+C5qTCUkPXwh0bslgWiOH
 X/OypQ94oxpEG6LPRVU7g2g=
X-Google-Smtp-Source: ABdhPJxAC6fn/DP+PNyKXtUIZlqSaYt9k7413pykYoIs1F02KyvnCjQEDOYB4qFjkob/vbIs+8QZyg==
X-Received: by 2002:a17:90b:3652:: with SMTP id
 nh18mr20777647pjb.127.1626619231296; 
 Sun, 18 Jul 2021 07:40:31 -0700 (PDT)
Received: from localhost.localdomain (bb42-60-144-185.singnet.com.sg.
 [42.60.144.185])
 by smtp.gmail.com with ESMTPSA id 144sm18740439pgg.4.2021.07.18.07.40.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jul 2021 07:40:30 -0700 (PDT)
From: Nguyen Dinh Phi <phind.uet@gmail.com>
To: ralf@linux-mips.org, davem@davemloft.net, kuba@kernel.org,
 xiyou.wangcong@gmail.com
Subject: [PATCH] netrom: Decrease sock refcount when sock timers expire
Date: Sun, 18 Jul 2021 22:40:13 +0800
Message-Id: <20210718144013.753774-1-phind.uet@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzbot+10f1194569953b72f1ae@syzkaller.appspotmail.com,
 linux-hams@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
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

Commit 63346650c1a9 ("netrom: switch to sock timer API") switched to use
sock timer API. It replaces mod_timer() by sk_reset_timer(), and
del_timer() by sk_stop_timer().

Function sk_reset_timer() will increase the refcount of sock if it is
called on an inactive timer, hence, in case the timer expires, we need to
decrease the refcount ourselves in the handler, otherwise, the sock
refcount will be unbalanced and the sock will never be freed.

Signed-off-by: Nguyen Dinh Phi <phind.uet@gmail.com>
Reported-by: syzbot+10f1194569953b72f1ae@syzkaller.appspotmail.com
Fixes: 63346650c1a9 ("netrom: switch to sock timer API")
---
 net/netrom/nr_timer.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/net/netrom/nr_timer.c b/net/netrom/nr_timer.c
index 9115f8a7dd45..a8da88db7893 100644
--- a/net/netrom/nr_timer.c
+++ b/net/netrom/nr_timer.c
@@ -121,11 +121,9 @@ static void nr_heartbeat_expiry(struct timer_list *t)
 		   is accepted() it isn't 'dead' so doesn't get removed. */
 		if (sock_flag(sk, SOCK_DESTROY) ||
 		    (sk->sk_state == TCP_LISTEN && sock_flag(sk, SOCK_DEAD))) {
-			sock_hold(sk);
 			bh_unlock_sock(sk);
 			nr_destroy_socket(sk);
-			sock_put(sk);
-			return;
+			goto out;
 		}
 		break;

@@ -146,6 +144,8 @@ static void nr_heartbeat_expiry(struct timer_list *t)

 	nr_start_heartbeat(sk);
 	bh_unlock_sock(sk);
+out:
+	sock_put(sk);
 }

 static void nr_t2timer_expiry(struct timer_list *t)
@@ -159,6 +159,7 @@ static void nr_t2timer_expiry(struct timer_list *t)
 		nr_enquiry_response(sk);
 	}
 	bh_unlock_sock(sk);
+	sock_put(sk);
 }

 static void nr_t4timer_expiry(struct timer_list *t)
@@ -169,6 +170,7 @@ static void nr_t4timer_expiry(struct timer_list *t)
 	bh_lock_sock(sk);
 	nr_sk(sk)->condition &= ~NR_COND_PEER_RX_BUSY;
 	bh_unlock_sock(sk);
+	sock_put(sk);
 }

 static void nr_idletimer_expiry(struct timer_list *t)
@@ -197,6 +199,7 @@ static void nr_idletimer_expiry(struct timer_list *t)
 		sock_set_flag(sk, SOCK_DEAD);
 	}
 	bh_unlock_sock(sk);
+	sock_put(sk);
 }

 static void nr_t1timer_expiry(struct timer_list *t)
@@ -209,8 +212,7 @@ static void nr_t1timer_expiry(struct timer_list *t)
 	case NR_STATE_1:
 		if (nr->n2count == nr->n2) {
 			nr_disconnect(sk, ETIMEDOUT);
-			bh_unlock_sock(sk);
-			return;
+			goto out;
 		} else {
 			nr->n2count++;
 			nr_write_internal(sk, NR_CONNREQ);
@@ -220,8 +222,7 @@ static void nr_t1timer_expiry(struct timer_list *t)
 	case NR_STATE_2:
 		if (nr->n2count == nr->n2) {
 			nr_disconnect(sk, ETIMEDOUT);
-			bh_unlock_sock(sk);
-			return;
+			goto out;
 		} else {
 			nr->n2count++;
 			nr_write_internal(sk, NR_DISCREQ);
@@ -231,8 +232,7 @@ static void nr_t1timer_expiry(struct timer_list *t)
 	case NR_STATE_3:
 		if (nr->n2count == nr->n2) {
 			nr_disconnect(sk, ETIMEDOUT);
-			bh_unlock_sock(sk);
-			return;
+			goto out;
 		} else {
 			nr->n2count++;
 			nr_requeue_frames(sk);
@@ -241,5 +241,7 @@ static void nr_t1timer_expiry(struct timer_list *t)
 	}

 	nr_start_t1timer(sk);
+out:
 	bh_unlock_sock(sk);
+	sock_put(sk);
 }
--
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
