Return-Path: <SRS0=b7VJ=MU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DAD9C4320E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 28 Jul 2021 07:17:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C899360F91
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 28 Jul 2021 07:17:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C899360F91
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91462405B4;
	Wed, 28 Jul 2021 07:17:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mUGhVMPk26gp; Wed, 28 Jul 2021 07:17:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id AF856405AC;
	Wed, 28 Jul 2021 07:17:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 85CE6C0010;
	Wed, 28 Jul 2021 07:17:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D8F00C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Jul 2021 07:17:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B4B24405AC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Jul 2021 07:17:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IQUdVjgkndGr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Jul 2021 07:17:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CF9B7405B4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Jul 2021 07:17:54 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 pf12-20020a17090b1d8cb0290175c085e7a5so8662147pjb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Jul 2021 00:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3yaaS3JLY21cSUlUIBnVL92bVsoKHJcMONY3wQ1+GHg=;
 b=o4l+/yfZgd2HI4LgKpHeqUjSxsmR2lVYt+sIic+jht/iskxJnViUnmhIWd+TY2QAHk
 /WS8buct57FdOo/fwpaNUDEW0CkLl6uAa/yDutMeYVhEFTB8f1t9h7dQuIENHmZwsydt
 IcmfVH7bASlFLz6PpMXlOLd0oSqYJTRBv+5dNPSomM8JUePa/GALJALQ204XlzNGNQUg
 /4t1gplyO9ioinLXTqe75V7OCv8XshRQpEryqOmrzDRJuV4nn0dK6NICysQOalzQc7qf
 DxLx5NfQyLizTKUSPguMjcHBDQJYCP3Rvwdu+R7kLcYxYcwCBjsMuAqFZ7CYFgcJnVsd
 /q9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3yaaS3JLY21cSUlUIBnVL92bVsoKHJcMONY3wQ1+GHg=;
 b=XCHomzPRClUN4vS8gkCITms7b9/nuvhcIW1zJprY5tGNTYI+Nrwsqz/ISUg4oJ6WgE
 GOe7mPTqciWpR6Y006Ap8mkqMIuyjX9MRKzEoT2J/VP3mKiFwwkYlfrwtPjNAus5DYa7
 TbucxP3FIEKLufIXNx+RoUpNJ5FZISCyahiVC2idqOjwJjTSUf8pyIO3b+GNvFZIpxlC
 ZW0MOjfjOJQWbIeYWXAEQ+nl1dm5CWEBYF65f12UIUlGZFXGPzK2P2Fn6B1lTVZT5sxB
 irv2Fw7JcT31/Ar9BlE9SxVQ46UJYEc4s4vgqEiqEOmRPZQQC71vg3z69n1gpVcfqSU3
 ilpQ==
X-Gm-Message-State: AOAM533V6FVg4y1HTj09qT+UJHCRtB/2y7yIlx2fTR99LBaec3FVp49n
 yA+u1uGGjo2Fodo4Oc9xjcw=
X-Google-Smtp-Source: ABdhPJyQZb5uZe7dzb4A/dIPnDwIn9+KdPIj9WTtytNdpEyXgWlYNyGlzQUP1jcnM8V28jcOsAlXbg==
X-Received: by 2002:a65:4d4c:: with SMTP id j12mr27232288pgt.311.1627456674140; 
 Wed, 28 Jul 2021 00:17:54 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id i13sm6100563pfr.79.2021.07.28.00.17.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 00:17:53 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 davem@davemloft.net, kuba@kernel.org
Subject: [PATCH v4] Bluetooth: schedule SCO timeouts with delayed_work
Date: Wed, 28 Jul 2021 15:17:21 +0800
Message-Id: <20210728071721.411669-1-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: syzbot+2f6d7c28bb4bf7e82060@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
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

struct sock.sk_timer should be used as a sock cleanup timer. However,
SCO uses it to implement sock timeouts.

This causes issues because struct sock.sk_timer's callback is run in
an IRQ context, and the timer callback function sco_sock_timeout takes
a spin lock on the socket. However, other functions such as
sco_conn_del, sco_conn_ready, rfcomm_connect_ind, and
bt_accept_enqueue also take the spin lock with interrupts enabled.

This inconsistent {SOFTIRQ-ON-W} -> {IN-SOFTIRQ-W} lock usage could
lead to deadlocks as reported by Syzbot [1]:
       CPU0
       ----
  lock(slock-AF_BLUETOOTH-BTPROTO_SCO);
  <Interrupt>
    lock(slock-AF_BLUETOOTH-BTPROTO_SCO);

To fix this, we use delayed work to implement SCO sock timouts
instead. This allows us to avoid taking the spin lock on the socket in
an IRQ context, and corrects the misuse of struct sock.sk_timer.

Link: https://syzkaller.appspot.com/bug?id=9089d89de0502e120f234ca0fc8a703f7368b31e [1]
Reported-by: syzbot+2f6d7c28bb4bf7e82060@syzkaller.appspotmail.com
Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---

Hi,

As suggested, this patch addresses the inconsistent lock state while
avoiding having to deal with local_bh_disable.

Now that sco_sock_timeout is no longer run in IRQ context, it might
be the case that bh_lock_sock is no longer needed to sync between
SOFTIRQ and user contexts, so we can switch to lock_sock.

I'm not too certain about this, or if there's any benefit to using
lock_sock instead, so I've left that out of this patch.

v3 -> v4:
- Switch to using delayed_work to schedule SCO sock timeouts instead
of using local_bh_disable. As suggested by Luiz Augusto von Dentz.

v2 -> v3:
- Split SCO and RFCOMM code changes, as suggested by Luiz Augusto von
Dentz.
- Simplify local bh disabling in SCO by using local_bh_disable/enable
inside sco_chan_del since local_bh_disable/enable pairs are reentrant.

v1 -> v2:
- Instead of pulling out the clean-up code out from sco_chan_del and
using it directly in sco_conn_del, disable local softirqs for relevant
sections.
- Disable local softirqs more thoroughly for instances of
bh_lock_sock/bh_lock_sock_nested in the bluetooth subsystem.
Specifically, the calls in af_bluetooth.c and rfcomm/sock.c are now made
with local softirqs disabled as well.

Best wishes,
Desmond

 net/bluetooth/sco.c | 39 ++++++++++++++++++++++++---------------
 1 file changed, 24 insertions(+), 15 deletions(-)

diff --git a/net/bluetooth/sco.c b/net/bluetooth/sco.c
index 3bd41563f118..b6dd16153d38 100644
--- a/net/bluetooth/sco.c
+++ b/net/bluetooth/sco.c
@@ -48,6 +48,8 @@ struct sco_conn {
 	spinlock_t	lock;
 	struct sock	*sk;
 
+	struct delayed_work	sk_timer;
+
 	unsigned int    mtu;
 };
 
@@ -74,9 +76,11 @@ struct sco_pinfo {
 #define SCO_CONN_TIMEOUT	(HZ * 40)
 #define SCO_DISCONN_TIMEOUT	(HZ * 2)
 
-static void sco_sock_timeout(struct timer_list *t)
+static void sco_sock_timeout(struct work_struct *work)
 {
-	struct sock *sk = from_timer(sk, t, sk_timer);
+	struct sco_conn *conn = container_of(work, struct sco_conn,
+					     sk_timer.work);
+	struct sock *sk = conn->sk;
 
 	BT_DBG("sock %p state %d", sk, sk->sk_state);
 
@@ -89,16 +93,18 @@ static void sco_sock_timeout(struct timer_list *t)
 	sock_put(sk);
 }
 
-static void sco_sock_set_timer(struct sock *sk, long timeout)
+static void sco_sock_set_timer(struct sock *sk, struct delayed_work *work,
+			       long timeout)
 {
 	BT_DBG("sock %p state %d timeout %ld", sk, sk->sk_state, timeout);
-	sk_reset_timer(sk, &sk->sk_timer, jiffies + timeout);
+	cancel_delayed_work(work);
+	schedule_delayed_work(work, timeout);
 }
 
-static void sco_sock_clear_timer(struct sock *sk)
+static void sco_sock_clear_timer(struct sock *sk, struct delayed_work *work)
 {
 	BT_DBG("sock %p state %d", sk, sk->sk_state);
-	sk_stop_timer(sk, &sk->sk_timer);
+	cancel_delayed_work(work);
 }
 
 /* ---- SCO connections ---- */
@@ -174,7 +180,7 @@ static void sco_conn_del(struct hci_conn *hcon, int err)
 	if (sk) {
 		sock_hold(sk);
 		bh_lock_sock(sk);
-		sco_sock_clear_timer(sk);
+		sco_sock_clear_timer(sk, &conn->sk_timer);
 		sco_chan_del(sk, err);
 		bh_unlock_sock(sk);
 		sco_sock_kill(sk);
@@ -193,6 +199,8 @@ static void __sco_chan_add(struct sco_conn *conn, struct sock *sk,
 	sco_pi(sk)->conn = conn;
 	conn->sk = sk;
 
+	INIT_DELAYED_WORK(&conn->sk_timer, sco_sock_timeout);
+
 	if (parent)
 		bt_accept_enqueue(parent, sk, true);
 }
@@ -260,11 +268,11 @@ static int sco_connect(struct sock *sk)
 		goto done;
 
 	if (hcon->state == BT_CONNECTED) {
-		sco_sock_clear_timer(sk);
+		sco_sock_clear_timer(sk, &conn->sk_timer);
 		sk->sk_state = BT_CONNECTED;
 	} else {
 		sk->sk_state = BT_CONNECT;
-		sco_sock_set_timer(sk, sk->sk_sndtimeo);
+		sco_sock_set_timer(sk, &conn->sk_timer, sk->sk_sndtimeo);
 	}
 
 done:
@@ -419,7 +427,8 @@ static void __sco_sock_close(struct sock *sk)
 	case BT_CONFIG:
 		if (sco_pi(sk)->conn->hcon) {
 			sk->sk_state = BT_DISCONN;
-			sco_sock_set_timer(sk, SCO_DISCONN_TIMEOUT);
+			sco_sock_set_timer(sk, &sco_pi(sk)->conn->sk_timer,
+					   SCO_DISCONN_TIMEOUT);
 			sco_conn_lock(sco_pi(sk)->conn);
 			hci_conn_drop(sco_pi(sk)->conn->hcon);
 			sco_pi(sk)->conn->hcon = NULL;
@@ -443,7 +452,8 @@ static void __sco_sock_close(struct sock *sk)
 /* Must be called on unlocked socket. */
 static void sco_sock_close(struct sock *sk)
 {
-	sco_sock_clear_timer(sk);
+	if (sco_pi(sk)->conn)
+		sco_sock_clear_timer(sk, &sco_pi(sk)->conn->sk_timer);
 	lock_sock(sk);
 	__sco_sock_close(sk);
 	release_sock(sk);
@@ -500,8 +510,6 @@ static struct sock *sco_sock_alloc(struct net *net, struct socket *sock,
 
 	sco_pi(sk)->setting = BT_VOICE_CVSD_16BIT;
 
-	timer_setup(&sk->sk_timer, sco_sock_timeout, 0);
-
 	bt_sock_link(&sco_sk_list, sk);
 	return sk;
 }
@@ -1036,7 +1044,8 @@ static int sco_sock_shutdown(struct socket *sock, int how)
 
 	if (!sk->sk_shutdown) {
 		sk->sk_shutdown = SHUTDOWN_MASK;
-		sco_sock_clear_timer(sk);
+		if (sco_pi(sk)->conn)
+			sco_sock_clear_timer(sk, &sco_pi(sk)->conn->sk_timer);
 		__sco_sock_close(sk);
 
 		if (sock_flag(sk, SOCK_LINGER) && sk->sk_lingertime &&
@@ -1083,7 +1092,7 @@ static void sco_conn_ready(struct sco_conn *conn)
 	BT_DBG("conn %p", conn);
 
 	if (sk) {
-		sco_sock_clear_timer(sk);
+		sco_sock_clear_timer(sk, &conn->sk_timer);
 		bh_lock_sock(sk);
 		sk->sk_state = BT_CONNECTED;
 		sk->sk_state_change(sk);
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
