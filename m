Return-Path: <SRS0=1ou+=O3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED680C433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  7 Oct 2021 19:04:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94D106101E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  7 Oct 2021 19:04:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 94D106101E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 682D4607CF;
	Thu,  7 Oct 2021 19:04:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FkrLnpfAvhYu; Thu,  7 Oct 2021 19:04:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 9BBF36071A;
	Thu,  7 Oct 2021 19:04:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 82A53C0011;
	Thu,  7 Oct 2021 19:04:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 005A3C000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  7 Oct 2021 19:04:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D597C84054
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  7 Oct 2021 19:04:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FeUPcAc8c8cG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  7 Oct 2021 19:04:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF5FC84015
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  7 Oct 2021 19:04:29 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id q201so681538pgq.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 07 Oct 2021 12:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mOdDUK0yJ3uQFwhSQJDO4d6YpI2NOJDULvWFd8/xqZY=;
 b=GkoBh4jHzExfAoI2V8vm59ZJ5Z9aLcMgolxvOnW+rm8JECz817t83MuEYgfDe+lAyt
 C0whHGQ30eX0BFyj3sJl78AdyrJ8TUpzVm0aQ8bUxFiPONoDDuKqAHDGpeLdvrauipRb
 S3Ex+eKYknMsL8syMwQAmPnaoWsy7e9RYMj+d4j9MNZaB2tr4bou3joYgY8AA6MNiCz9
 lazUxjvJw2Qu3t8WdglF9pD6U/uQdYSp/uW53VD9AGkV6Ez9BQvGwqWn+2wUcNMY5M/l
 Paz0/ivEX7NJZ5jwhRY+X5frNsX6Azdz9ohkPk+Uja9RyC0zjJQu7hUBPwf1jnebmZL+
 Ug3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mOdDUK0yJ3uQFwhSQJDO4d6YpI2NOJDULvWFd8/xqZY=;
 b=QwadxSDUbC17FDB9lLQRPGQ4q1TSRPyTGKdlyVnBMn5cNPubiOexDgHOHKbFiaKLgf
 AgHnXUz40YinPDrmA/O5Yiqf/5fVXkMWWtKW3XkFKEE9dfr0PlAfnWN1bkxKowtU3Brf
 O1DfxpkSz0qod+MKIUaMmbI6iyEwxirzzcO9fWw6NcobMpt8kzgE12gz061zihLuraom
 TX6gm3tAGcooevEoaSpPuKW64XIhpTGeTeLt9wEgX/a0WJSz1Re6ixC0GLrtJMGdkQz0
 hTlyV9DAlF5Dp9N93g0AQs1vATq++oBOPGXpfVeB/6/auWkpiifqRbZ4rf9X6XiiVvlY
 ZGug==
X-Gm-Message-State: AOAM530Y/O+Bkn7wv9bS9KcKYqrbq97c7ioOrZVGb/nk77lvCnhEX34i
 2CEk4ALbfadP88c7fbrrBpU=
X-Google-Smtp-Source: ABdhPJy4Z/2SFAtOCnw2xD5a1CT70zeopUGODXNuEOeu0pDOEGOOfA3IR+mf/iA/Rq6Zd2KlPDwvsg==
X-Received: by 2002:a63:2b8c:: with SMTP id r134mr1049130pgr.420.1633633469149; 
 Thu, 07 Oct 2021 12:04:29 -0700 (PDT)
Received: from localhost.localdomain (bb42-60-144-185.singnet.com.sg.
 [42.60.144.185])
 by smtp.gmail.com with ESMTPSA id k190sm164396pfd.211.2021.10.07.12.04.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 12:04:28 -0700 (PDT)
From: Nguyen Dinh Phi <phind.uet@gmail.com>
To: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 davem@davemloft.net, kuba@kernel.org
Subject: [PATCH] Bluetooth: hci_sock: purge socket queues in the destruct()
 callback
Date: Fri,  8 Oct 2021 03:04:24 +0800
Message-Id: <20211007190424.196281-1-phind.uet@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-bluetooth@vger.kernel.org,
 syzbot+4c4ffd1e1094dae61035@syzkaller.appspotmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
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

The receive path may take the socket right before hci_sock_release(),
but it may enqueue the packets to the socket queues after the call to
skb_queue_purge(), therefore the socket can be destroyed without clear
its queues completely.

Moving these skb_queue_purge() to the hci_sock_destruct() will fix this
issue, because nothing is referencing the socket at this point.

Signed-off-by: Nguyen Dinh Phi <phind.uet@gmail.com>
Reported-by: syzbot+4c4ffd1e1094dae61035@syzkaller.appspotmail.com
---
 net/bluetooth/hci_sock.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/net/bluetooth/hci_sock.c b/net/bluetooth/hci_sock.c
index d0dad1fafe07..446573a12571 100644
--- a/net/bluetooth/hci_sock.c
+++ b/net/bluetooth/hci_sock.c
@@ -889,10 +889,6 @@ static int hci_sock_release(struct socket *sock)
 	}
 
 	sock_orphan(sk);
-
-	skb_queue_purge(&sk->sk_receive_queue);
-	skb_queue_purge(&sk->sk_write_queue);
-
 	release_sock(sk);
 	sock_put(sk);
 	return 0;
@@ -2058,6 +2054,12 @@ static int hci_sock_getsockopt(struct socket *sock, int level, int optname,
 	return err;
 }
 
+static void hci_sock_destruct(struct sock *sk)
+{
+	skb_queue_purge(&sk->sk_receive_queue);
+	skb_queue_purge(&sk->sk_write_queue);
+}
+
 static const struct proto_ops hci_sock_ops = {
 	.family		= PF_BLUETOOTH,
 	.owner		= THIS_MODULE,
@@ -2111,6 +2113,7 @@ static int hci_sock_create(struct net *net, struct socket *sock, int protocol,
 
 	sock->state = SS_UNCONNECTED;
 	sk->sk_state = BT_OPEN;
+	sk->sk_destruct = hci_sock_destruct;
 
 	bt_sock_link(&hci_sk_list, sk);
 	return 0;
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
