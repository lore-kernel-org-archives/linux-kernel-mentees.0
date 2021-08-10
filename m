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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09668C4320A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Aug 2021 04:17:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B66066054E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Aug 2021 04:17:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B66066054E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63757404F6;
	Tue, 10 Aug 2021 04:17:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I7ZJq6fEHLif; Tue, 10 Aug 2021 04:17:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 7BFB3404F7;
	Tue, 10 Aug 2021 04:17:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5D4A6C0010;
	Tue, 10 Aug 2021 04:17:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3DD65C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Aug 2021 04:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 20910607D1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Aug 2021 04:17:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mxgkn0FhGS-t
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Aug 2021 04:17:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 48238607C4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Aug 2021 04:17:15 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 u21-20020a17090a8915b02901782c36f543so2441489pjn.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 09 Aug 2021 21:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IWvKIG9SD/bGbMF6shXMTXm63IsfR0+DR+eSAYUvZ40=;
 b=D/69BGj8l3P7BWe+EGBQ4OFutdUxFPT8lRu7PwUOeXU6qKLRr7DGVNWmBwNxv3upiZ
 LjN3wCsQ/NS6E90qkfO3maKKchN9M8G64GJ1lekF7o+F6Hmog43xo8IYsOAWHwhMBX5M
 rl22iCKV1MLKp4iODeAgSihMCGPn0tchAlbg5VH54e5DbmjvYKD54UyYD1yjEDGQhOVj
 XvuNYWrbG5lGen5TvhrJiInRWpA46yvsiGHCtqDC1eZhmvd++hkJeRDXYZfBXPWHJQ5t
 8P4cXZiGdoQhGAp9dfR65XLucb4iq0ud5cvHNDoJDfpKdCaht9Yx/FBCk2jj6t1ts5y1
 LmCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IWvKIG9SD/bGbMF6shXMTXm63IsfR0+DR+eSAYUvZ40=;
 b=gBwwxDe/8HR9hlVwaZ1jGAiZKebOLaBB5Fjy56amz5fqlYiy5nqWmTFiU/jbRUXlUG
 VZoI0hhzGfkGEEMTEUSQdfDoEnx233IrSot3rPpkCdQfqkSM/ijSPcDgbtJIYzEUiqSa
 B4gpaAl/Zd/wOlE5jf46ZaVyexGfw6qrNJVuw0Tj2eybO29C5AMipZI9TJ9EkTHOCBHs
 z8wf0jeO7Maqsv764LybLUIQvmCRVvcgpND8j/7CKR7CpDEnEz9ePeRtWVpBek52LZfk
 oTVQqlyEXlhrX15LdXSiBpl23KUIstKOpAeQ6F/+GnL5LoXMl11n9RtEsW5Pg0hB/llg
 zO8A==
X-Gm-Message-State: AOAM532PbLaOu+RmQ0cxAHcCOTKLzCbrZRqwbBAh41PWh/NDBZ3jswKt
 G0ZEWfPfD37REI7VGQJCirI=
X-Google-Smtp-Source: ABdhPJwWMjha1++IWnizQ3wORteBy41K6YR7ISLDtCundlo8hcKTEmp9gNDou4phQXwUWDiXHi0IeQ==
X-Received: by 2002:a63:1504:: with SMTP id v4mr39208pgl.151.1628569034753;
 Mon, 09 Aug 2021 21:17:14 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id b8sm20132478pjo.51.2021.08.09.21.17.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 21:17:14 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 davem@davemloft.net, kuba@kernel.org, sudipm.mukherjee@gmail.com
Subject: [PATCH v6 2/6] Bluetooth: avoid circular locks in sco_sock_connect
Date: Tue, 10 Aug 2021 12:14:06 +0800
Message-Id: <20210810041410.142035-3-desmondcheongzx@gmail.com>
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

In a future patch, calls to bh_lock_sock in sco.c should be replaced
by lock_sock now that none of the functions are run in IRQ context.

However, doing so results in a circular locking dependency:

======================================================
WARNING: possible circular locking dependency detected
5.14.0-rc4-syzkaller #0 Not tainted
------------------------------------------------------
syz-executor.2/14867 is trying to acquire lock:
ffff88803e3c1120 (sk_lock-AF_BLUETOOTH-BTPROTO_SCO){+.+.}-{0:0}, at:
lock_sock include/net/sock.h:1613 [inline]
ffff88803e3c1120 (sk_lock-AF_BLUETOOTH-BTPROTO_SCO){+.+.}-{0:0}, at:
sco_conn_del+0x12a/0x2a0 net/bluetooth/sco.c:191

but task is already holding lock:
ffffffff8d2dc7c8 (hci_cb_list_lock){+.+.}-{3:3}, at:
hci_disconn_cfm include/net/bluetooth/hci_core.h:1497 [inline]
ffffffff8d2dc7c8 (hci_cb_list_lock){+.+.}-{3:3}, at:
hci_conn_hash_flush+0xda/0x260 net/bluetooth/hci_conn.c:1608

which lock already depends on the new lock.

the existing dependency chain (in reverse order) is:

-> #2 (hci_cb_list_lock){+.+.}-{3:3}:
       __mutex_lock_common kernel/locking/mutex.c:959 [inline]
       __mutex_lock+0x12a/0x10a0 kernel/locking/mutex.c:1104
       hci_connect_cfm include/net/bluetooth/hci_core.h:1482 [inline]
       hci_remote_features_evt net/bluetooth/hci_event.c:3263 [inline]
       hci_event_packet+0x2f4d/0x7c50 net/bluetooth/hci_event.c:6240
       hci_rx_work+0x4f8/0xd30 net/bluetooth/hci_core.c:5122
       process_one_work+0x98d/0x1630 kernel/workqueue.c:2276
       worker_thread+0x658/0x11f0 kernel/workqueue.c:2422
       kthread+0x3e5/0x4d0 kernel/kthread.c:319
       ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295

-> #1 (&hdev->lock){+.+.}-{3:3}:
       __mutex_lock_common kernel/locking/mutex.c:959 [inline]
       __mutex_lock+0x12a/0x10a0 kernel/locking/mutex.c:1104
       sco_connect net/bluetooth/sco.c:245 [inline]
       sco_sock_connect+0x227/0xa10 net/bluetooth/sco.c:601
       __sys_connect_file+0x155/0x1a0 net/socket.c:1879
       __sys_connect+0x161/0x190 net/socket.c:1896
       __do_sys_connect net/socket.c:1906 [inline]
       __se_sys_connect net/socket.c:1903 [inline]
       __x64_sys_connect+0x6f/0xb0 net/socket.c:1903
       do_syscall_x64 arch/x86/entry/common.c:50 [inline]
       do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
       entry_SYSCALL_64_after_hwframe+0x44/0xae

-> #0 (sk_lock-AF_BLUETOOTH-BTPROTO_SCO){+.+.}-{0:0}:
       check_prev_add kernel/locking/lockdep.c:3051 [inline]
       check_prevs_add kernel/locking/lockdep.c:3174 [inline]
       validate_chain kernel/locking/lockdep.c:3789 [inline]
       __lock_acquire+0x2a07/0x54a0 kernel/locking/lockdep.c:5015
       lock_acquire kernel/locking/lockdep.c:5625 [inline]
       lock_acquire+0x1ab/0x510 kernel/locking/lockdep.c:5590
       lock_sock_nested+0xca/0x120 net/core/sock.c:3170
       lock_sock include/net/sock.h:1613 [inline]
       sco_conn_del+0x12a/0x2a0 net/bluetooth/sco.c:191
       sco_disconn_cfm+0x71/0xb0 net/bluetooth/sco.c:1202
       hci_disconn_cfm include/net/bluetooth/hci_core.h:1500 [inline]
       hci_conn_hash_flush+0x127/0x260 net/bluetooth/hci_conn.c:1608
       hci_dev_do_close+0x528/0x1130 net/bluetooth/hci_core.c:1778
       hci_unregister_dev+0x1c0/0x5a0 net/bluetooth/hci_core.c:4015
       vhci_release+0x70/0xe0 drivers/bluetooth/hci_vhci.c:340
       __fput+0x288/0x920 fs/file_table.c:280
       task_work_run+0xdd/0x1a0 kernel/task_work.c:164
       exit_task_work include/linux/task_work.h:32 [inline]
       do_exit+0xbd4/0x2a60 kernel/exit.c:825
       do_group_exit+0x125/0x310 kernel/exit.c:922
       get_signal+0x47f/0x2160 kernel/signal.c:2808
       arch_do_signal_or_restart+0x2a9/0x1c40 arch/x86/kernel/signal.c:865
       handle_signal_work kernel/entry/common.c:148 [inline]
       exit_to_user_mode_loop kernel/entry/common.c:172 [inline]
       exit_to_user_mode_prepare+0x17d/0x290 kernel/entry/common.c:209
       __syscall_exit_to_user_mode_work kernel/entry/common.c:291 [inline]
       syscall_exit_to_user_mode+0x19/0x60 kernel/entry/common.c:302
       ret_from_fork+0x15/0x30 arch/x86/entry/entry_64.S:288

other info that might help us debug this:

Chain exists of:
  sk_lock-AF_BLUETOOTH-BTPROTO_SCO --> &hdev->lock --> hci_cb_list_lock

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(hci_cb_list_lock);
                               lock(&hdev->lock);
                               lock(hci_cb_list_lock);
  lock(sk_lock-AF_BLUETOOTH-BTPROTO_SCO);

 *** DEADLOCK ***

The issue is that the lock hierarchy should go from &hdev->lock -->
hci_cb_list_lock --> sk_lock-AF_BLUETOOTH-BTPROTO_SCO. For example,
one such call trace is:

  hci_dev_do_close():
    hci_dev_lock();
    hci_conn_hash_flush():
      hci_disconn_cfm():
        mutex_lock(&hci_cb_list_lock);
        sco_disconn_cfm():
        sco_conn_del():
          lock_sock(sk);

However, in sco_sock_connect, we call lock_sock before calling
hci_dev_lock inside sco_connect, thus inverting the lock hierarchy.

We fix this by pulling the call to hci_dev_lock out from sco_connect.

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 net/bluetooth/sco.c | 39 ++++++++++++++++-----------------------
 1 file changed, 16 insertions(+), 23 deletions(-)

diff --git a/net/bluetooth/sco.c b/net/bluetooth/sco.c
index 62e638f971a9..94a3aa686556 100644
--- a/net/bluetooth/sco.c
+++ b/net/bluetooth/sco.c
@@ -237,44 +237,32 @@ static int sco_chan_add(struct sco_conn *conn, struct sock *sk,
 	return err;
 }
 
-static int sco_connect(struct sock *sk)
+static int sco_connect(struct hci_dev *hdev, struct sock *sk)
 {
 	struct sco_conn *conn;
 	struct hci_conn *hcon;
-	struct hci_dev  *hdev;
 	int err, type;
 
 	BT_DBG("%pMR -> %pMR", &sco_pi(sk)->src, &sco_pi(sk)->dst);
 
-	hdev = hci_get_route(&sco_pi(sk)->dst, &sco_pi(sk)->src, BDADDR_BREDR);
-	if (!hdev)
-		return -EHOSTUNREACH;
-
-	hci_dev_lock(hdev);
-
 	if (lmp_esco_capable(hdev) && !disable_esco)
 		type = ESCO_LINK;
 	else
 		type = SCO_LINK;
 
 	if (sco_pi(sk)->setting == BT_VOICE_TRANSPARENT &&
-	    (!lmp_transp_capable(hdev) || !lmp_esco_capable(hdev))) {
-		err = -EOPNOTSUPP;
-		goto done;
-	}
+	    (!lmp_transp_capable(hdev) || !lmp_esco_capable(hdev)))
+		return -EOPNOTSUPP;
 
 	hcon = hci_connect_sco(hdev, type, &sco_pi(sk)->dst,
 			       sco_pi(sk)->setting);
-	if (IS_ERR(hcon)) {
-		err = PTR_ERR(hcon);
-		goto done;
-	}
+	if (IS_ERR(hcon))
+		return PTR_ERR(hcon);
 
 	conn = sco_conn_add(hcon);
 	if (!conn) {
 		hci_conn_drop(hcon);
-		err = -ENOMEM;
-		goto done;
+		return -ENOMEM;
 	}
 
 	/* Update source addr of the socket */
@@ -282,7 +270,7 @@ static int sco_connect(struct sock *sk)
 
 	err = sco_chan_add(conn, sk, NULL);
 	if (err)
-		goto done;
+		return err;
 
 	if (hcon->state == BT_CONNECTED) {
 		sco_sock_clear_timer(sk);
@@ -292,9 +280,6 @@ static int sco_connect(struct sock *sk)
 		sco_sock_set_timer(sk, sk->sk_sndtimeo);
 	}
 
-done:
-	hci_dev_unlock(hdev);
-	hci_dev_put(hdev);
 	return err;
 }
 
@@ -589,6 +574,7 @@ static int sco_sock_connect(struct socket *sock, struct sockaddr *addr, int alen
 {
 	struct sockaddr_sco *sa = (struct sockaddr_sco *) addr;
 	struct sock *sk = sock->sk;
+	struct hci_dev  *hdev;
 	int err;
 
 	BT_DBG("sk %p", sk);
@@ -603,12 +589,19 @@ static int sco_sock_connect(struct socket *sock, struct sockaddr *addr, int alen
 	if (sk->sk_type != SOCK_SEQPACKET)
 		return -EINVAL;
 
+	hdev = hci_get_route(&sa->sco_bdaddr, &sco_pi(sk)->src, BDADDR_BREDR);
+	if (!hdev)
+		return -EHOSTUNREACH;
+	hci_dev_lock(hdev);
+
 	lock_sock(sk);
 
 	/* Set destination address and psm */
 	bacpy(&sco_pi(sk)->dst, &sa->sco_bdaddr);
 
-	err = sco_connect(sk);
+	err = sco_connect(hdev, sk);
+	hci_dev_unlock(hdev);
+	hci_dev_put(hdev);
 	if (err)
 		goto done;
 
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
