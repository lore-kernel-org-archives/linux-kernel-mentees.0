Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98CECC32772
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 22 Aug 2022 11:30:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C9D3825CA;
	Mon, 22 Aug 2022 11:30:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C9D3825CA
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CIT9km6n
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4lWUbIrV8Uvx; Mon, 22 Aug 2022 11:30:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id EC4B1825B9;
	Mon, 22 Aug 2022 11:30:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC4B1825B9
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D11B0C0032;
	Mon, 22 Aug 2022 11:30:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 94D77C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Aug 2022 11:30:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61502415A6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Aug 2022 11:30:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61502415A6
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=CIT9km6n
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w3Oe52i-WGEq
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Aug 2022 11:30:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D38E415A4
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1D38E415A4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Aug 2022 11:30:38 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id u22so9627826plq.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Aug 2022 04:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=G4j/rqNYwfiq++D/E4+aj1Vom+udZl1vY41D0UqrHWo=;
 b=CIT9km6nhEi6sZnsN3AtxvN+UbmYD2586Yn+riuF/ZXbFpfmMuYtPVeJQBGTA9nI2V
 CmqQRQgofc3dwk9amoNfPXptPiZ8PumOvnE2/uGa7tpaRU+WrBZbs8Jv9MEAab2JWPTN
 QYsg9AjJ3xzeWuiCf8g/0jZsOqsYHng5ThNeuv0neQEGj3sdvl4XUga6hzjUf88FFzaq
 j/Qh1RWmKfF4krOOTBlLluuMi1GEyaR+Et6DwrsUqohDU5lGodSmpP7C6Xa6ItgpngnU
 2m/inLkSctLjZaN0jPNXsHFQOGdsV1zmtdd4yLOYthab9dPnJMcdcd2m5IVhSJmsmnr5
 1JAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=G4j/rqNYwfiq++D/E4+aj1Vom+udZl1vY41D0UqrHWo=;
 b=jlTgyURat8WZhOlt/KRY+a1qJDUfU70VjltDw5J7RUKmVnbdQjT6hfF4MI4PLuSCdG
 JbXJsRYN5HuYowH73EaifbYM7HieAtd1CwdS6T7x8nfNKXKxGBt7YxyWOFOB07WBLqoP
 kFU5nGnhtcQDwHtIzRl8ObeaBQlH17zz5JQw69Q330EnQqAyw8A2Od8+L8i0mayAP26p
 pBk8F+bR67LQDmr4op5EUBBQK6rNUbQuNddneEO+bH4qznv53/d10X26Crcq4UN8yHaH
 IXebLgkifm/a8IsQy4QD5uh5RBafna89rai2GZwNo/yn7QMo6ycULbCvivMOio7phLc9
 TC+g==
X-Gm-Message-State: ACgBeo0UhbNGtpHia0PwA+8Cv7Cyv3KIPi/cG5mqQf3tWD+l9RJgNbe7
 /AujsxSnsdHKmPNEf1TYX0g=
X-Google-Smtp-Source: AA6agR7y+Cf8+shJU1lBosyHfXcyCc16aZq3kbBZqTPdtK//EWTrJrX/hfVvvATCV3np2/Hfg7VvTg==
X-Received: by 2002:a17:903:2585:b0:172:9ac6:30f3 with SMTP id
 jb5-20020a170903258500b001729ac630f3mr20042388plb.0.1661167837386; 
 Mon, 22 Aug 2022 04:30:37 -0700 (PDT)
Received: from localhost ([36.112.86.8]) by smtp.gmail.com with ESMTPSA id
 v4-20020a626104000000b005327281cb8dsm8714072pfb.97.2022.08.22.04.30.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 04:30:37 -0700 (PDT)
From: Hawkins Jiawei <yin31149@gmail.com>
To: dhowells@redhat.com, Marc Dionne <marc.dionne@auristor.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH] rxrpc: fix bad unlock balance in rxrpc_do_sendmsg
Date: Mon, 22 Aug 2022 19:29:51 +0800
Message-Id: <20220822112952.2961-1-yin31149@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <992103.1661160093@warthog.procyon.org.uk>
References: <992103.1661160093@warthog.procyon.org.uk>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org,
 syzbot+7f0483225d0c94cb3441@syzkaller.appspotmail.com, paskripkin@gmail.com,
 yin31149@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-afs@lists.infradead.org
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

On Mon, 22 Aug 2022 at 16:48, David Howells <dhowells@redhat.com> wrote:
>
> Hawkins Jiawei <yin31149@gmail.com> wrote:
>
> > -             if (mutex_lock_interruptible(&call->user_mutex) < 0)
> > +             if (mutex_lock_interruptible(&call->user_mutex) < 0) {
> > +                     mutex_lock(&call->user_mutex);
>
> Yeah, as Khalid points out that kind of makes the interruptible lock
> pointless.  Either rxrpc_send_data() needs to return a separate indication
> that we returned without the lock held or it needs to always drop the lock on
> error (at least for ERESTARTSYS/EINTR) which can be checked for higher up.
Hi David,

For second option, I think it may meet some difficulty, because we
cannot figure out whether rxrpc_send_data() meets lock error.
To be more specific, rxrpc_send_data() may still returns the number
it has copied even rxrpc_send_data() meets lock error, if
rxrpc_send_data() has successfully dealed some data.(Please correct me
if I am wrong)

So I think the first option seems better. I wonder if we can add an
argument in rxrpc_send_data() as an indication you pointed out? Maybe:

diff --git a/net/rxrpc/sendmsg.c b/net/rxrpc/sendmsg.c
index 1d38e279e2ef..0801325a7c7f 100644
--- a/net/rxrpc/sendmsg.c
+++ b/net/rxrpc/sendmsg.c
@@ -284,13 +284,18 @@ static int rxrpc_queue_packet(struct rxrpc_sock *rx, struct rxrpc_call *call,
 
 /*
  * send data through a socket
+ * @holding_mutex: rxrpc_send_data() will assign this pointer with True
+ * if functions still holds the call user access mutex when returned to caller.
+ * This argument can be NULL, which will effect nothing.
+ *
  * - must be called in process context
  * - The caller holds the call user access mutex, but not the socket lock.
  */
 static int rxrpc_send_data(struct rxrpc_sock *rx,
 			   struct rxrpc_call *call,
 			   struct msghdr *msg, size_t len,
-			   rxrpc_notify_end_tx_t notify_end_tx)
+			   rxrpc_notify_end_tx_t notify_end_tx,
+			   bool *holding_mutex)
 {
 	struct rxrpc_skb_priv *sp;
 	struct sk_buff *skb;
@@ -299,6 +304,9 @@ static int rxrpc_send_data(struct rxrpc_sock *rx,
 	bool more;
 	int ret, copied;
 
+	if (holding_mutex)
+		*holding_mutex = true;
+
 	timeo = sock_sndtimeo(sk, msg->msg_flags & MSG_DONTWAIT);
 
 	/* this should be in poll */
@@ -338,8 +346,11 @@ static int rxrpc_send_data(struct rxrpc_sock *rx,
 				ret = rxrpc_wait_for_tx_window(rx, call,
 							       &timeo,
 							       msg->msg_flags & MSG_WAITALL);
-				if (ret < 0)
+				if (ret < 0) {
+					if (holding_mutex)
+						*holding_mutex = false;
 					goto maybe_error;
+				}
 			}
 
 			/* Work out the maximum size of a packet.  Assume that
@@ -630,6 +641,7 @@ int rxrpc_do_sendmsg(struct rxrpc_sock *rx, struct msghdr *msg, size_t len)
 	struct rxrpc_call *call;
 	unsigned long now, j;
 	int ret;
+	bool holding_user_mutex;
 
 	struct rxrpc_send_params p = {
 		.call.tx_total_len	= -1,
@@ -747,7 +759,9 @@ int rxrpc_do_sendmsg(struct rxrpc_sock *rx, struct msghdr *msg, size_t len)
 		/* Reply phase not begun or not complete for service call. */
 		ret = -EPROTO;
 	} else {
-		ret = rxrpc_send_data(rx, call, msg, len, NULL);
+		ret = rxrpc_send_data(rx, call, msg, len, NULL, &holding_user_mutex);
+		if (!holding_user_mutex)
+			goto error_put;
 	}
 
 out_put_unlock:
@@ -796,7 +810,7 @@ int rxrpc_kernel_send_data(struct socket *sock, struct rxrpc_call *call,
 	case RXRPC_CALL_SERVER_ACK_REQUEST:
 	case RXRPC_CALL_SERVER_SEND_REPLY:
 		ret = rxrpc_send_data(rxrpc_sk(sock->sk), call, msg, len,
-				      notify_end_tx);
+				      notify_end_tx, NULL);
 		break;
 	case RXRPC_CALL_COMPLETE:
 		read_lock_bh(&call->state_lock);


On Mon, 22 Aug 2022 at 17:21, David Howells <dhowells@redhat.com> wrote:
>
> Actually, there's another bug here too: if rxrpc_wait_for_tx_window() drops
> the call mutex then it needs to reload the pending packet state in
> rxrpc_send_data() as it may have raced with another sendmsg().
>
> David
>
After applying the above patch, kernel still panic, but seems not the
bad unlock balance bug before. yet I am not sure if this is the same bug you
mentioned. Kernel output as below:
[   39.115966][ T6508] ====================================
[   39.116940][ T6508] WARNING: syz/6508 still has locks held!
[   39.117978][ T6508] 6.0.0-rc1-00066-g3b06a2755758-dirty #186 Not tainted
[   39.119353][ T6508] ------------------------------------
[   39.120321][ T6508] 1 lock held by syz/6508:
[   39.121122][ T6508]  #0: ffff88801f472b20 (&call->user_mutex){....}-{3:3}0
[   39.123014][ T6508] 
[   39.123014][ T6508] stack backtrace:
[   39.123925][ T6508] CPU: 0 PID: 6508 Comm: syz Not tainted 6.0.0-rc1-00066
[   39.125304][ T6508] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996)4
[   39.125304][ T6508] Call Trace:
[   39.125304][ T6508]  <TASK>
[   39.125304][ T6508]  dump_stack_lvl+0x8e/0xdd
[   39.125304][ T6508]  get_signal+0x1866/0x24d0
[   39.125304][ T6508]  ? lock_acquire+0x172/0x310
[   39.125304][ T6508]  ? exit_signals+0x7b0/0x7b0
[   39.125304][ T6508]  arch_do_signal_or_restart+0x82/0x23f0
[   39.125304][ T6508]  ? __sanitizer_cov_trace_pc+0x1a/0x40
[   39.125304][ T6508]  ? __fget_light+0x20d/0x270
[   39.125304][ T6508]  ? get_sigframe_size+0x10/0x10
[   39.125304][ T6508]  ? __sanitizer_cov_trace_pc+0x1a/0x40
[   39.125304][ T6508]  ? __sys_sendmsg+0x11a/0x1c0
[   39.125304][ T6508]  ? __sys_sendmsg_sock+0x30/0x30
[   39.125304][ T6508]  exit_to_user_mode_prepare+0x146/0x1b0
[   39.125304][ T6508]  syscall_exit_to_user_mode+0x12/0x30
[   39.125304][ T6508]  do_syscall_64+0x42/0xb0
[   39.125304][ T6508]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[   39.125304][ T6508] RIP: 0033:0x44fbad
[   39.125304][ T6508] Code: c3 e8 97 29 00 00 0f 1f 80 00 00 00 00 f3 0f 1e8
[   39.125304][ T6508] RSP: 002b:00007f4b8ae22d48 EFLAGS: 00000246 ORIG_RAX:e
[   39.125304][ T6508] RAX: fffffffffffffffc RBX: 0000000000000000 RCX: 0000d
[   39.125304][ T6508] RDX: 0000000000000186 RSI: 0000000020000000 RDI: 00003
[   39.125304][ T6508] RBP: 00007f4b8ae22d80 R08: 00007f4b8ae23700 R09: 00000
[   39.125304][ T6508] R10: 00007f4b8ae23700 R11: 0000000000000246 R12: 0000e
[   39.125304][ T6508] R13: 00007ffe483304af R14: 00007ffe48330550 R15: 00000
[   39.125304][ T6508]  </TASK>
====================================

I will make a deeper look and try to patch it.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
