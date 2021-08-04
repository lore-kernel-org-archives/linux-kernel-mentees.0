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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24209C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Aug 2021 15:48:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAE0E60F38
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Aug 2021 15:48:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CAE0E60F38
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF811608BA;
	Wed,  4 Aug 2021 15:48:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FV-PdQoo5KDD; Wed,  4 Aug 2021 15:48:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id EA2FC605EF;
	Wed,  4 Aug 2021 15:48:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CABDEC0010;
	Wed,  4 Aug 2021 15:48:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 91766C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Aug 2021 15:48:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 734DE60A92
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Aug 2021 15:48:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zrNwQAZK2MCb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Aug 2021 15:48:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D2508608BA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Aug 2021 15:48:44 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id t3so3429243plg.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 04 Aug 2021 08:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TRKYkdOIgWJ5EiGOGovL7BoCL888xKaE/ywEpPEztaE=;
 b=nGMnEBdsX4+MpiNfdvpcYZqkEXFJ4tGdh6hc/ltfFv7odyfHgRyqi3UYjNi9PRnx67
 YiVXS1xjUN9bFFrqHRt2ROQzvhtI9acxdZfguDZsnIA/Vf9kKZQGTyjuQXqcZhNvjF7j
 9xecdG/MkBcM/0CCWaBmiC5IvKJW+hXe5Hi09/awZOGg2YGlYNTOV3QPiPikv7QzChTA
 rwTdzsmSNMzcbyTFvR9QM1rcpiKsDcxxGASQRz+brZIY5M7vIVMQyj2zadSk/FXtMfP2
 zV8SY7Tr4vL8lZLL7MQ9JZ5oke67NmQnJwH/h9FdEdDq3mrSxfbzRozaDiJJ836PZSt9
 +ekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TRKYkdOIgWJ5EiGOGovL7BoCL888xKaE/ywEpPEztaE=;
 b=pncb6Ox+Yv+1hWp1EXlsXKosIn7lYZHyG24T/b8PitwCC2t8Ve9m12eIYgKrD7/rjT
 QxgnZd5/9twiZWT9W5XT936Jsl9IVPfXke36pcdiEcDzaC97IdVam6Ra5w2v4u//ma7H
 FV/t+Z0t6kxSo6OKSFEHs6zsdXU12OXHgx4TZm6PLsGBiH4E60mdMGr3yltMj7ZG5jyC
 piilo01gQ1JIGeDyhjHbGh9HgbtD/33/kJROcw9uWgy/95VFAbB6WoSY2+2iccOJCAzo
 c4yUdwH2tagn6KX0hKeieO3CUXEtUfh8rJvYOFOO77dZYImQBictfGZrq8hIAS4Ik9A7
 XKkA==
X-Gm-Message-State: AOAM531x6WJOYhoDdGOyVVMaXWEnhk7jbP8qryKtmt4PpJfPTjCentRZ
 kE4/TsnhfhKp/+voMm2lqUE=
X-Google-Smtp-Source: ABdhPJx42+g+x6dssj4TwISrbE5rseWzNenVqgOxng0l8sgY84Zpv57p0+bxmSe2pIZp5b98W4jm0w==
X-Received: by 2002:a05:6a00:888:b029:3c3:ff1:38e with SMTP id
 q8-20020a056a000888b02903c30ff1038emr10350145pfj.17.1628092124217; 
 Wed, 04 Aug 2021 08:48:44 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id b15sm4007274pgj.60.2021.08.04.08.48.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 08:48:43 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 davem@davemloft.net, kuba@kernel.org, sudipm.mukherjee@gmail.com
Subject: [RESEND PATCH v5 3/6] Bluetooth: switch to lock_sock in SCO
Date: Wed,  4 Aug 2021 23:47:09 +0800
Message-Id: <20210804154712.929986-4-desmondcheongzx@gmail.com>
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
