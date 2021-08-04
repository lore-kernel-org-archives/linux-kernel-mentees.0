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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1208C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Aug 2021 15:49:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B46F60F14
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Aug 2021 15:49:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6B46F60F14
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 388C960751;
	Wed,  4 Aug 2021 15:49:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J5FJhjgPMIhT; Wed,  4 Aug 2021 15:49:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 4BA516069C;
	Wed,  4 Aug 2021 15:49:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 36D0AC0010;
	Wed,  4 Aug 2021 15:49:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 24BC1C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Aug 2021 15:49:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0893D83BA7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Aug 2021 15:49:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LH1wQg8DJBjf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Aug 2021 15:48:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6EE1E83AD9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Aug 2021 15:48:59 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id nh14so3602626pjb.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 04 Aug 2021 08:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zIRbv5ZXxIid872Ol8a8JiBpz6JG4aviAWXZnPlaMDM=;
 b=rdJHyKNkVdzEDu+i17BA0ESSeSHw7WdgDcmPzNzHC5dNA/1Da4om9QYVZAQ4eTNOjp
 nE7CuugZzapfrdXloo+i/YUsSvvhPFb8bL/XF5p6FrBQ0OqA2vxwuuZ2sM5q1vxRpRue
 n0O0otg/gigaHc2qifkS2eW1v/eG19WJXQ/iS+t6g1Esnq/NqkYKxcYuQjkLbTq/6COt
 CAuJtvNvD3qolCfKL0fDxxGKxq6BLmjxxVeIP6P1H1GHP9ukH7cFRBxdeCgh2Iv4T8tC
 ukT5oftekjWfwOTmCOFM6YyyGyTXX/3a8wSbvliCRkgp6dtFCLUCCTzM5CrqfO7m9XU5
 Do0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zIRbv5ZXxIid872Ol8a8JiBpz6JG4aviAWXZnPlaMDM=;
 b=LLr+odCl/eEwS0MTWccG9dXQDfmfysyzoBrQX7meVOSX4mVezlnqqHeDkUXnV9B3SR
 THm2eZiBnpsk/l5hSoc1J/u8m0RHZwb57kECxqUnyY5AteVKvPsmWxIckZA6Tz3U4hry
 gMBHfD4yYlwRhAE/gAkzUgm7GKccxo3+6lZPBy53jYUoTGj9PZLZ0b2qN8iwNZ+DkXrX
 SDf+oEwOnCwdZd1EwWy/+6ezIQ9vHkU6DUI7O57Qegi1UfdhUj2uY05s3FexAuEXMtCo
 t7Knm7dQdP5V3O7qtcef095t6ps/lrxxMTXYN9+4zNlT38M1VWnk6CEPTK0/COmEVW0w
 uH4w==
X-Gm-Message-State: AOAM530GbNmvyo6XGKNLwqgPtF4GM5Pa+BXbEvFORo08MtYvt2mpngz0
 KViWEoeAKUMGLW9Z8c4x86A=
X-Google-Smtp-Source: ABdhPJwP+rVDzJk6NLCQWzc1MhjnFtm/lsX/BNe/Q5+lIAcE/FyZ6bVOH1EuWhB8m67xqjLUaSJHpA==
X-Received: by 2002:a17:90a:bd18:: with SMTP id
 y24mr10513325pjr.83.1628092138838; 
 Wed, 04 Aug 2021 08:48:58 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id b15sm4007274pgj.60.2021.08.04.08.48.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 08:48:58 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 davem@davemloft.net, kuba@kernel.org, sudipm.mukherjee@gmail.com
Subject: [RESEND PATCH v5 6/6] Bluetooth: fix repeated calls to sco_sock_kill
Date: Wed,  4 Aug 2021 23:47:12 +0800
Message-Id: <20210804154712.929986-7-desmondcheongzx@gmail.com>
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
