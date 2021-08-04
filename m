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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45572C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Aug 2021 11:04:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED9EF61029
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Aug 2021 11:04:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ED9EF61029
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB82160650;
	Wed,  4 Aug 2021 11:04:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uX6ToBMhSfTF; Wed,  4 Aug 2021 11:04:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 1656660667;
	Wed,  4 Aug 2021 11:04:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 02F40C001A;
	Wed,  4 Aug 2021 11:04:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 76A8BC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Aug 2021 11:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6025E403EF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Aug 2021 11:04:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LSWcT_mjagO7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Aug 2021 11:04:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AA5B740241
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Aug 2021 11:04:16 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id i10so2611500pla.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 04 Aug 2021 04:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wuePCI4FbrrQHwWiYSThmxmEPxR9cgsWrPSKODj9+7k=;
 b=ZeyQaebz+I8qQT4Ub6+aQ5HL2PbtkM9sacpF80+Jy0H271i/JeWa/dDeOv10raNNGj
 AQrWEBvfXjqQKBlptoFQ/AskMbzPCIGXHxHEaKtsfmWzHE4LKFMoA9EWLirBZgdfvNyG
 klhLqfChZFDcLVl5F/JK3IY/PqUevXvLL02X+29OTWs5j9jnPeZX6tz+K9wkKvDkbiX7
 wPZjZ6K2E+10FGA5ofXJ7EJtdYHm5qdIRAXjpSXR3Ec+r0axCxkH0KGTdZHyGRzg5ZCr
 uOLz/ncGQyGSPIoA90c22XumSeSxWzqGnhYsExyWXTVFDqELt4ZCq0/T9Y5O+F2yzfUf
 q1RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wuePCI4FbrrQHwWiYSThmxmEPxR9cgsWrPSKODj9+7k=;
 b=GvRZ6gyWmJHqUSAESlNiHiqEAMM0yuILNzr/Gie35iS/ePZYeHJMNNicaozmBw5Cw9
 98dvlfTazem1xk0FfW2bXEx7eUYN+ZaGZvyPLC7BjQGWVhBFKM/ytQXfzIf/v4gmPFuO
 WgEIckBJLA2idwF5Jhs5Ce2ABv59xDaRH6QFcuymsctvnRi5Rccb8ZGfVeojl6bhE/+A
 MHkbYU5x78rO1zrzQY40wwZr8I48dV8tYXltxo8f2Gd/4uvvHGXU+6mcA+gGsMCnCnBi
 dqmfXxjWrnCIzPGXcZkEJxOMI1bGbwUhwH0RLKaMubB1e64RErvRZeO+rLbDZlmyii2d
 l0FQ==
X-Gm-Message-State: AOAM531/F8clwd2sVl1VWbN9jkAbJIya3ZvMcmitTqDDcjn8BoKR8b78
 pOhb8oMxqtMjV1ptwiVEsHA=
X-Google-Smtp-Source: ABdhPJzUKNNoQeqTm8yohHsjU8iT18AjzrgmdBaUfF7PHoha5iGqKI206C2n/5zO8ebm2SRAk8NvzA==
X-Received: by 2002:a17:90a:2c05:: with SMTP id
 m5mr3335774pjd.32.1628075055960; 
 Wed, 04 Aug 2021 04:04:15 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id k4sm2206147pjs.55.2021.08.04.04.04.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 04:04:15 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 davem@davemloft.net, kuba@kernel.org, sudipm.mukherjee@gmail.com
Subject: [PATCH v5 4/6] Bluetooth: serialize calls to sco_sock_{set,
 clear}_timer
Date: Wed,  4 Aug 2021 19:03:06 +0800
Message-Id: <20210804110308.910744-5-desmondcheongzx@gmail.com>
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

Currently, calls to sco_sock_set_timer are made under the locked
socket, but this does not apply to all calls to sco_sock_clear_timer.

Both sco_sock_{set,clear}_timer should be serialized by lock_sock to
prevent unexpected concurrent clearing/setting of timers.

Additionally, since sco_pi(sk)->conn is only cleared under the locked
socket, this change allows us to avoid races between
sco_sock_clear_timer and the call to kfree(conn) in sco_conn_del.

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 net/bluetooth/sco.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/bluetooth/sco.c b/net/bluetooth/sco.c
index 1246e6bc09fe..418543c390b3 100644
--- a/net/bluetooth/sco.c
+++ b/net/bluetooth/sco.c
@@ -459,8 +459,8 @@ static void __sco_sock_close(struct sock *sk)
 /* Must be called on unlocked socket. */
 static void sco_sock_close(struct sock *sk)
 {
-	sco_sock_clear_timer(sk);
 	lock_sock(sk);
+	sco_sock_clear_timer(sk);
 	__sco_sock_close(sk);
 	release_sock(sk);
 	sco_sock_kill(sk);
@@ -1110,8 +1110,8 @@ static void sco_conn_ready(struct sco_conn *conn)
 	BT_DBG("conn %p", conn);
 
 	if (sk) {
-		sco_sock_clear_timer(sk);
 		lock_sock(sk);
+		sco_sock_clear_timer(sk);
 		sk->sk_state = BT_CONNECTED;
 		sk->sk_state_change(sk);
 		release_sock(sk);
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
