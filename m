Return-Path: <SRS0=w3Lu=NB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA163C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Aug 2021 04:17:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B24860FDA
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Aug 2021 04:17:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8B24860FDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62A3B607C4;
	Tue, 10 Aug 2021 04:17:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ivVzs-Mh0S1E; Tue, 10 Aug 2021 04:17:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 8EE6160795;
	Tue, 10 Aug 2021 04:17:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7C62EC0010;
	Tue, 10 Aug 2021 04:17:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 74910C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Aug 2021 04:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64A718340C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Aug 2021 04:17:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hTysLgAlXCHb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Aug 2021 04:17:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D3C4F833CD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Aug 2021 04:17:19 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 s22-20020a17090a1c16b0290177caeba067so2548041pjs.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 09 Aug 2021 21:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PIWCbgM5Czh7o4d4UfSqkTS5fg/4+RhME2M18GpOuag=;
 b=pwTexxRixX5EhmzkxTh7FMxGNvqV9ze34Qr4Bzn5NPPY6WnQRULpEnoir2DXVPpOxx
 6p+jOxunC6evidzVWTlVIcBcuRZNI8S2HWVo+bguvhlEQratAVPWIzj+KmLvqSrriqRG
 BMMdbiivUWz6RpLUp2RbojwpAugGFaUfOYbN533tcYnHY0GtnP1PHDaOlcAuurZbl9S9
 B0GDLf3tbs9KjVEL7LNnG/7WghpodWi/v6cnCfJCra5X30Emz8PyqHBCXo6u+GlkkoU3
 bp01ClAEqNzTLcXL1eiQbTqYIwZ3A7T9FM4Hp792CX0/7neCTWArq087lhcAnzkzdmgP
 JFvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PIWCbgM5Czh7o4d4UfSqkTS5fg/4+RhME2M18GpOuag=;
 b=H96o3Bh1t3ilPIuawTo5UCLEqhGrRpwSBDrPWRqjQzUJ6/ajD4rlM6vTY+1lHJl+S6
 INvlf96hWX/Oe+QTVJnLXQYEe6e7w1VsMwqxX2Q/jqrrHmVn+32fiV4xJKBXxs1ugmyu
 V002iPHPsIGOSjkwnsOvZooc7tEWrB3LowhKHoO4hRfueu9Zt6HAN6Z389mBHmL48Pbr
 7KJx70wM9cw8Csb0daODx2mp5Xr+gIzE9OWsdeFxYK3dtUVTqCKzoP3BEbwFVPJT3u/c
 Aek4qnamywWQZNYijU6pwfdfIyRXHUG3JfOBoQT8IWbTGTIKAeLHEnKPUmEzmGFVe2uA
 +xXw==
X-Gm-Message-State: AOAM5304xNGgFkrQDcBX9n1fe6Fp+hlOQkfjb3JD8d58A6WtmQt+balP
 kbjiEAu89ajpRE3uTYu9jtY=
X-Google-Smtp-Source: ABdhPJy81yXzWOUbPLBKMsCXP3TKxPGR2kEyBsjPiXG8i5OT0sgiNBZ7/dun7wF8qqDyV1S3rjlrzg==
X-Received: by 2002:a17:902:e890:b029:12c:d39d:20bb with SMTP id
 w16-20020a170902e890b029012cd39d20bbmr23680005plg.83.1628569039325; 
 Mon, 09 Aug 2021 21:17:19 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id b8sm20132478pjo.51.2021.08.09.21.17.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 21:17:18 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 davem@davemloft.net, kuba@kernel.org, sudipm.mukherjee@gmail.com
Subject: [PATCH v6 3/6] Bluetooth: switch to lock_sock in SCO
Date: Tue, 10 Aug 2021 12:14:07 +0800
Message-Id: <20210810041410.142035-4-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210810041410.142035-1-desmondcheongzx@gmail.com>
References: <20210810041410.142035-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
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

Since sco_sock_timeout is now scheduled using delayed work, it is no
longer run in SOFTIRQ context. Hence bh_lock_sock is no longer
necessary in SCO to synchronise between user contexts and SOFTIRQ
processing.

As such, calls to bh_lock_sock should be replaced with lock_sock to
synchronize with other concurrent processes that use lock_sock.

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 net/bluetooth/sco.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/net/bluetooth/sco.c b/net/bluetooth/sco.c
index 94a3aa686556..68b51e321e82 100644
--- a/net/bluetooth/sco.c
+++ b/net/bluetooth/sco.c
@@ -93,10 +93,10 @@ static void sco_sock_timeout(struct work_struct *work)
 
 	BT_DBG("sock %p state %d", sk, sk->sk_state);
 
-	bh_lock_sock(sk);
+	lock_sock(sk);
 	sk->sk_err = ETIMEDOUT;
 	sk->sk_state_change(sk);
-	bh_unlock_sock(sk);
+	release_sock(sk);
 
 	sco_sock_kill(sk);
 	sock_put(sk);
@@ -193,10 +193,10 @@ static void sco_conn_del(struct hci_conn *hcon, int err)
 
 	if (sk) {
 		sock_hold(sk);
-		bh_lock_sock(sk);
+		lock_sock(sk);
 		sco_sock_clear_timer(sk);
 		sco_chan_del(sk, err);
-		bh_unlock_sock(sk);
+		release_sock(sk);
 		sco_sock_kill(sk);
 		sock_put(sk);
 
@@ -1105,10 +1105,10 @@ static void sco_conn_ready(struct sco_conn *conn)
 
 	if (sk) {
 		sco_sock_clear_timer(sk);
-		bh_lock_sock(sk);
+		lock_sock(sk);
 		sk->sk_state = BT_CONNECTED;
 		sk->sk_state_change(sk);
-		bh_unlock_sock(sk);
+		release_sock(sk);
 	} else {
 		sco_conn_lock(conn);
 
@@ -1123,12 +1123,12 @@ static void sco_conn_ready(struct sco_conn *conn)
 			return;
 		}
 
-		bh_lock_sock(parent);
+		lock_sock(parent);
 
 		sk = sco_sock_alloc(sock_net(parent), NULL,
 				    BTPROTO_SCO, GFP_ATOMIC, 0);
 		if (!sk) {
-			bh_unlock_sock(parent);
+			release_sock(parent);
 			sco_conn_unlock(conn);
 			return;
 		}
@@ -1149,7 +1149,7 @@ static void sco_conn_ready(struct sco_conn *conn)
 		/* Wake up parent */
 		parent->sk_data_ready(parent);
 
-		bh_unlock_sock(parent);
+		release_sock(parent);
 
 		sco_conn_unlock(conn);
 	}
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
