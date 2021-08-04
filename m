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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94E1BC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Aug 2021 15:48:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58EF160F14
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Aug 2021 15:48:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 58EF160F14
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B6E6404D1;
	Wed,  4 Aug 2021 15:48:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iUskveSojiYs; Wed,  4 Aug 2021 15:48:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 151FF40371;
	Wed,  4 Aug 2021 15:48:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E7A1AC0010;
	Wed,  4 Aug 2021 15:48:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 63494C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Aug 2021 15:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4225D40446
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Aug 2021 15:48:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zFvWeNOXFlY0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Aug 2021 15:48:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7E51540371
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Aug 2021 15:48:49 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id k2so3405014plk.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 04 Aug 2021 08:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wuePCI4FbrrQHwWiYSThmxmEPxR9cgsWrPSKODj9+7k=;
 b=Jk784znaiM1kGzC+vnzHdPjoAikvb+/ECITQ/3FZg8UstIATIWcr++9Q07PlDBGGUP
 NaZtAJZxRgmuzD+K9iINe2MVdgMb/mgSYE/C/Bj76UmTmdwi8fd4jpzmmZwJDsK1FOA/
 a6dIAUbVehG2bmaGv8ISzhb4xGtOcaZUzaalkdrxO2XVqvlcDExhETpIyboptcHOh8Cw
 XGe8dv2qSlS0DpWz90Zb4PazuyjhgB35oqbYaygVIa9pkCAPFPhgyAlKD7EyNJ7bk6Jj
 b5pKYzVPji6Uy6hl0KdqHbU2d3BwrafaePd/GBBvDmVkIUQ7XGPqigf2ODNoQWg3Ubwz
 Qe3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wuePCI4FbrrQHwWiYSThmxmEPxR9cgsWrPSKODj9+7k=;
 b=O1zZX0HSztwpnoXArPAuztJ9ldlHPUHojLTsnxYPuoSUcHytVIAzMVlZzWDUrGI0Hz
 AMMsbKZrsQ8LVZ8TF/wy4DjUQc5GfsAnK5S/FYWSwdC6cCKa/6mn1Um6wQUegWLEiK4s
 dCf5OhKFdNQz9Lnkrtvxu2OBcCLjFfh2kDXBeLT6RBWV7ljz2XKg3DQD6rZ2JuqywezG
 9WX6zeBdi+KcTBIzHdKutfBD0b8niyvmBAzRhkssZA7IRhJ1yj607SbQME51BANslddE
 dQO0nRdIeJFfFlnGpZoGKulWNwjWl+h2MsgdCJ15jiXvNmbDRQM7xJfSQdjvnK6F2m8G
 wO6A==
X-Gm-Message-State: AOAM533fCBcXls+u6lfzWWk5MBJFJZUSNPrq68Yld7NcC/CW5C8j93xF
 1RmTs3Ev2l3ZbaSFNLzPepg=
X-Google-Smtp-Source: ABdhPJzBS90sEosr/ccisMXoi2vHaMJWErjhjg312/0a223eplEcJU9XDsNw708hnm0IgxN4KHWaXA==
X-Received: by 2002:a17:90a:3fcc:: with SMTP id
 u12mr9997143pjm.5.1628092128953; 
 Wed, 04 Aug 2021 08:48:48 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id b15sm4007274pgj.60.2021.08.04.08.48.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 08:48:48 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 davem@davemloft.net, kuba@kernel.org, sudipm.mukherjee@gmail.com
Subject: [RESEND PATCH v5 4/6] Bluetooth: serialize calls to sco_sock_{set,
 clear}_timer
Date: Wed,  4 Aug 2021 23:47:10 +0800
Message-Id: <20210804154712.929986-5-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210804154712.929986-1-desmondcheongzx@gmail.com>
References: <20210804154712.929986-1-desmondcheongzx@gmail.com>
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
