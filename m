Return-Path: <SRS0=2i/r=M3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8701CC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Aug 2021 11:04:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35C7760F43
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Aug 2021 11:04:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 35C7760F43
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00A5E403F0;
	Wed,  4 Aug 2021 11:04:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nhRpx1R6pzHP; Wed,  4 Aug 2021 11:04:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id E9FDD403EF;
	Wed,  4 Aug 2021 11:04:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D4BBAC001A;
	Wed,  4 Aug 2021 11:04:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6B8AFC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Aug 2021 11:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E23E83C5B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Aug 2021 11:04:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GQdXaOoMQbIn
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Aug 2021 11:04:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B90CE83C3D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Aug 2021 11:04:09 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 e2-20020a17090a4a02b029016f3020d867so2987432pjh.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 04 Aug 2021 04:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TRKYkdOIgWJ5EiGOGovL7BoCL888xKaE/ywEpPEztaE=;
 b=Nnd8twf4rEgY2TlB+F0iTD+c7owlni5fLgZW89siB3upvnIKQhe1SVLxBm6ttpBBKQ
 zYMGghl8Dr6byrvyPW/fGv9Mz8OeXmaE0eux/tauYcYCPVcNUTP5z+Kc7kPM/9pCU4EU
 7aIJVDH4IC/egfbrCULR7SNLwJZaQqlFQjAnxNBE24KOsGSydQ8uftEs8A157SgvMfRC
 9XYoRlA2Mv2Zkc3lmQSRKjo7KjZsFnRcSk6hJGEGkJWzq9iLY/xr8xUteH0HzQ4cJkNt
 oLcYfUZpO8KAdwPA7n3pE8lkaLjzNMVFtT9yvEoXjOltgPiqSxE/r7At3QGWGISwcdp9
 laaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TRKYkdOIgWJ5EiGOGovL7BoCL888xKaE/ywEpPEztaE=;
 b=S52iO5+cvPuQ/yJmINDR/qSqr4QwFmXhQbgd0G221s74qFg+orjEfWk6Fva1VFwtTr
 pbSTD4liNb0AFXBu+BGSrNUnArBvkZ2cvsk2cXu7HJjEWKa8LWnm1h0Bu33HuDLtbcbJ
 +qjHCZeUXidkss+tLerHlX7qpjh0DGMFyYvDXCFXE7isGb5+CCTAo831tQUEOOAdsAoO
 2WyTfd7kHyAvTIunzYLqMqJAUCQfkk+e9HroZ+iCmfYxPfN8Ejcg1zgdSl8Iaago9iLk
 vNwclxPZ0QbWI/fpTMfsQNcJ8rXPHv4ldZCDgfftCr5yKWEfFQIk7j7yKmjz77rpX//L
 QxZQ==
X-Gm-Message-State: AOAM530kaBMmEUdd2HUVtSFUo62w6MXGOnzvsgrpwvA/M8XWJaZ5FpuF
 jcWFJYx3PvN+eBw1RqcqiF8=
X-Google-Smtp-Source: ABdhPJyyxVGnR/0AchNWivoqpbLq+TyM45ed7PlSNndLnq22S/qQ5HnA87pIpqEOgWKXrrN+gBtL0Q==
X-Received: by 2002:a62:17d8:0:b029:3b1:c2b0:287c with SMTP id
 207-20020a6217d80000b02903b1c2b0287cmr23906446pfx.23.1628075049278; 
 Wed, 04 Aug 2021 04:04:09 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id k4sm2206147pjs.55.2021.08.04.04.04.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 04:04:08 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 davem@davemloft.net, kuba@kernel.org, sudipm.mukherjee@gmail.com
Subject: [PATCH v5 3/6] Bluetooth: switch to lock_sock in SCO
Date: Wed,  4 Aug 2021 19:03:05 +0800
Message-Id: <20210804110308.910744-4-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210804110308.910744-1-desmondcheongzx@gmail.com>
References: <20210804110308.910744-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
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
index 558f8874b65e..1246e6bc09fe 100644
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
@@ -199,10 +199,10 @@ static void sco_conn_del(struct hci_conn *hcon, int err)
 
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
 
@@ -1111,10 +1111,10 @@ static void sco_conn_ready(struct sco_conn *conn)
 
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
 
@@ -1129,12 +1129,12 @@ static void sco_conn_ready(struct sco_conn *conn)
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
@@ -1155,7 +1155,7 @@ static void sco_conn_ready(struct sco_conn *conn)
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
