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
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE525C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Aug 2021 11:04:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A093161029
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Aug 2021 11:04:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A093161029
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8116782894;
	Wed,  4 Aug 2021 11:04:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TzaTNdARkt8y; Wed,  4 Aug 2021 11:04:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 84934826A8;
	Wed,  4 Aug 2021 11:04:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 63372C001A;
	Wed,  4 Aug 2021 11:04:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D7932C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Aug 2021 11:04:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4348403F0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Aug 2021 11:04:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 76LMOK2VWv6G
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Aug 2021 11:04:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ECA5940122
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Aug 2021 11:04:28 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 dw2-20020a17090b0942b0290177cb475142so8146632pjb.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 04 Aug 2021 04:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zIRbv5ZXxIid872Ol8a8JiBpz6JG4aviAWXZnPlaMDM=;
 b=dkqVASp2vIm2+9eG8qv+AApsyYt3ZndFWyEGeg91xxlutOvj87XPa41NO4TcugMcMK
 qJtVwlAOK9GBt4h0MMZRsUPha8YZWIN0rxsPHOkkk1I81w3VUe07s7cJA5OLVyldzBF1
 +45RYhc4C3xNEwMIWp4n6o6miZNZSe3qMNMwtoS3Xp4l54BebRxP6MxrsS622bfEmjQN
 6X7nMmR0Jgpot93puCvPpPHMNzZQI7YSpQuGcl99zTiIb0ZCEvxNKwzjUmQUi88LlCn9
 uXfYRPoK+Qx3LRgo1GHEWOoBit+QggDmBLBgDMaqbhJBK9BqG+6sFoTe4AHpzwCYW/6+
 MfBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zIRbv5ZXxIid872Ol8a8JiBpz6JG4aviAWXZnPlaMDM=;
 b=lglH/44jQixHuxQs70X/e/CF0dC/51Ud91FXQ2kHHcP4kGJjuVsOQESNwBB+/kn2sr
 5AOKiSILeNFvJlNqHTiXa0JME7nTUb/iGbGzcfpyXyMW7r17eJ2B6WGs6YSS21ua4h9w
 YhJgW8bXY3mFYJ7TvBhqN2jEgdt08qH1mjqJ4wew02I3KIbhQb/yfUEPMwgWf2Uzh2k+
 oWwvQIXm6abqQbE3XTs52/K6uTc+g8+MT55b7V/plRoTZS6kf8n/gc9G6stqSRFzPj8e
 Oe/b9MtBaxwNRsOsYi/cN4oL9fZqUVyzkVhZCcwgt1NU3EU5EUCBw8wuMCrWR8lOTmK0
 1P9w==
X-Gm-Message-State: AOAM532mjLDcytCshRBPDQf1hfOyplbIXX/d6ulaoTTYPOjULtTDmA1I
 iE5osI8p2dm+ZSNupBrPqKE=
X-Google-Smtp-Source: ABdhPJxYdG55SlPSNbYcL/QxOycARXWHFDr5RrHwa46cfambF1NpTtyt6+IEGe95qXWmdnXH+tNQBw==
X-Received: by 2002:a63:171d:: with SMTP id x29mr1357294pgl.418.1628075068468; 
 Wed, 04 Aug 2021 04:04:28 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id k4sm2206147pjs.55.2021.08.04.04.04.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 04:04:28 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 davem@davemloft.net, kuba@kernel.org, sudipm.mukherjee@gmail.com
Subject: [PATCH v5 6/6] Bluetooth: fix repeated calls to sco_sock_kill
Date: Wed,  4 Aug 2021 19:03:08 +0800
Message-Id: <20210804110308.910744-7-desmondcheongzx@gmail.com>
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

In commit 4e1a720d0312 ("Bluetooth: avoid killing an already killed
socket"), a check was added to sco_sock_kill to skip killing a socket
if the SOCK_DEAD flag was set.

This was done after a trace for a use-after-free bug showed that the
same sock pointer was being killed twice.

Unfortunately, this check prevents sco_sock_kill from running on any
socket. sco_sock_kill kills a socket only if it's zapped and orphaned,
however sock_orphan announces that the socket is dead before detaching
it. i.e., orphaned sockets have the SOCK_DEAD flag set.

To fix this, we remove the check for SOCK_DEAD, and avoid repeated
calls to sco_sock_kill by removing incorrect calls in:

1. sco_sock_timeout. The socket should not be killed on timeout as
further processing is expected to be done. For example,
sco_sock_connect sets the timer then waits for the socket to be
connected or for an error to be returned.

2. sco_conn_del. This function should clean up resources for the
connection, but the socket itself should be cleaned up in
sco_sock_release.

3. sco_sock_close. Calls to sco_sock_close in sco_sock_cleanup_listen
and sco_sock_release are followed by sco_sock_kill. Hence the
duplicated call should be removed.

Fixes: 4e1a720d0312 ("Bluetooth: avoid killing an already killed socket")
Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 net/bluetooth/sco.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/net/bluetooth/sco.c b/net/bluetooth/sco.c
index 418543c390b3..cf43ccb50573 100644
--- a/net/bluetooth/sco.c
+++ b/net/bluetooth/sco.c
@@ -97,8 +97,6 @@ static void sco_sock_timeout(struct work_struct *work)
 	sk->sk_err = ETIMEDOUT;
 	sk->sk_state_change(sk);
 	release_sock(sk);
-
-	sco_sock_kill(sk);
 	sock_put(sk);
 }
 
@@ -203,7 +201,6 @@ static void sco_conn_del(struct hci_conn *hcon, int err)
 		sco_sock_clear_timer(sk);
 		sco_chan_del(sk, err);
 		release_sock(sk);
-		sco_sock_kill(sk);
 		sock_put(sk);
 
 		/* Ensure no more work items will run before freeing conn. */
@@ -410,8 +407,7 @@ static void sco_sock_cleanup_listen(struct sock *parent)
  */
 static void sco_sock_kill(struct sock *sk)
 {
-	if (!sock_flag(sk, SOCK_ZAPPED) || sk->sk_socket ||
-	    sock_flag(sk, SOCK_DEAD))
+	if (!sock_flag(sk, SOCK_ZAPPED) || sk->sk_socket)
 		return;
 
 	BT_DBG("sk %p state %d", sk, sk->sk_state);
@@ -463,7 +459,6 @@ static void sco_sock_close(struct sock *sk)
 	sco_sock_clear_timer(sk);
 	__sco_sock_close(sk);
 	release_sock(sk);
-	sco_sock_kill(sk);
 }
 
 static void sco_skb_put_cmsg(struct sk_buff *skb, struct msghdr *msg,
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
