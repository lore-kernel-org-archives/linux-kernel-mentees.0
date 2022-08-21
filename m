Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD7CC32772
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 21 Aug 2022 12:58:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27D1681BD6;
	Sun, 21 Aug 2022 12:58:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27D1681BD6
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DzldWQk3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sch05aN598jR; Sun, 21 Aug 2022 12:58:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 1EA0881BBD;
	Sun, 21 Aug 2022 12:58:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1EA0881BBD
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EAEDBC0032;
	Sun, 21 Aug 2022 12:58:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 771DAC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Aug 2022 12:58:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B02040132
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Aug 2022 12:58:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B02040132
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=DzldWQk3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sp8jffPJWDr9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Aug 2022 12:57:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10B11400BB
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 10B11400BB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Aug 2022 12:57:57 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id g18so8584266pju.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Aug 2022 05:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=ClDyou4gGsGQygKcng/+QxuCvSmLH/T0LzzWygeLDxo=;
 b=DzldWQk3w9CMSvh7wXhDSN2aWrVFsSkaBRGf4hK4iF8emTltMf6t9vv/FAHY7jMDtu
 el0UZKoheRtu+4Voxc4ucu9UeGmKyi36kc1ikmO3qZeg/IDmqUXbgu2+JIO5SYvgDsDV
 whKmYSSy4uCsEljwlCehrxkdvcU6yFnAz1DKRRGqEpCIzE0GDAtbEPqOMID3va+luviN
 jArWd8Y8HWPBo1CuVbX7o/n5GclujeIVWDaHTS/Hoe+Qom6y2Bu+4u7n0WnhO4/TU5fd
 xZ4A7e7akZ3DQmvbwVLiAQm3bhRqzJOUUzacClaY+nc7bmurtMaSveF/FlownKYUmxk6
 y9Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=ClDyou4gGsGQygKcng/+QxuCvSmLH/T0LzzWygeLDxo=;
 b=EDjVtpIZ+x9o7LrmKDlXxb42Doqvfxy5beVehfTyBem1BIOroCMq1VVVmvsDmUTnSG
 nIvXTe1k0q6pEFQhIHfdp/AQkZ95+Gz+WGgpSxIGPspDzJ5VUb5uFVNaQEyIjV+qpC5B
 A8SFfnRETmO37IThNlVCDKMjY4gN6bVDkxYsW813i27lbplVhuudihd5MIMioN/QkIca
 oILc2ZfCRvqYZslH8JEkisa4rjbnNYV2xtLo0QxTARoB9ObYJatpB/xSBhM5GrrSTA9i
 K7QLQHmuNY7mHei4/dD822x3cDjVZORR1oumvRAC9awCXT2PaQ4zwV+h6xd+bGW+tDYQ
 FBjw==
X-Gm-Message-State: ACgBeo1aqtm2dJas9jM+NPl/SrQe0ORIiLtTASlFNNa+ozxWVMDZAopg
 3VoYgf3HmLNtQpB2WdnWqZs=
X-Google-Smtp-Source: AA6agR5zia5vYqSnvV68J6GwqVaSGboCXGZgtlbolLgoa4BnlG/hWEgaBeCsm/Hs81I1xoN/q9BBAg==
X-Received: by 2002:a17:903:1246:b0:171:5033:85c with SMTP id
 u6-20020a170903124600b001715033085cmr15798412plh.146.1661086677425; 
 Sun, 21 Aug 2022 05:57:57 -0700 (PDT)
Received: from localhost ([36.112.204.208]) by smtp.gmail.com with ESMTPSA id
 iw11-20020a170903044b00b0016d150c6c6dsm6374211plb.45.2022.08.21.05.57.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Aug 2022 05:57:57 -0700 (PDT)
From: Hawkins Jiawei <yin31149@gmail.com>
To: syzbot+7f0483225d0c94cb3441@syzkaller.appspotmail.com,
 David Howells <dhowells@redhat.com>,
 Marc Dionne <marc.dionne@auristor.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH] rxrpc: fix bad unlock balance in rxrpc_do_sendmsg
Date: Sun, 21 Aug 2022 20:57:50 +0800
Message-Id: <20220821125751.4185-1-yin31149@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <000000000000ce327f05d537ebf7@google.com>
References: <000000000000ce327f05d537ebf7@google.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, paskripkin@gmail.com,
 Hawkins Jiawei <yin31149@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-afs@lists.infradead.org
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

Syzkaller reports bad unlock balance bug as follows:
------------[ cut here ]------------
WARNING: bad unlock balance detected!
syz-executor.0/4094 is trying to release lock (&call->user_mutex) at:
[<ffffffff87c1d8d1>] rxrpc_do_sendmsg+0x851/0x1110 net/rxrpc/sendmsg.c:754
but there are no more locks to release!

other info that might help us debug this:
no locks held by syz-executor.0/4094.

stack backtrace:
[...]
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x57/0x7d lib/dump_stack.c:106
 print_unlock_imbalance_bug include/trace/events/lock.h:69 [inline]
 __lock_release kernel/locking/lockdep.c:5333 [inline]
 lock_release.cold+0x49/0x4e kernel/locking/lockdep.c:5686
 __mutex_unlock_slowpath+0x99/0x5e0 kernel/locking/mutex.c:907
 rxrpc_do_sendmsg+0x851/0x1110 net/rxrpc/sendmsg.c:754
 sock_sendmsg_nosec net/socket.c:714 [inline]
 sock_sendmsg+0xab/0xe0 net/socket.c:734
 ____sys_sendmsg+0x5c2/0x7a0 net/socket.c:2485
 ___sys_sendmsg+0xdb/0x160 net/socket.c:2539
 __sys_sendmsg+0xc3/0x160 net/socket.c:2568
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
 [...]
 </TASK>
------------------------------------

When kernel wants to send a message through an RxRPC socket in
rxrpc_do_sendmsg(), kernel should hold the call->user_mutex lock,
or it will triggers bug when releasing this lock before returning
from rxrpc_do_sendmsg().

Yet the problem is that during rxrpc_do_sendmsg(), kernel may call
rxrpc_wait_for_tx_window_intr() to wait for space to appear in the
tx queue or a signal to occur. When kernel fails the
mutex_lock_interruptible(), kernel will returns from the
rxrpc_wait_for_tx_window_intr() without acquiring the mutex lock, then
triggers bug when releasing the mutex lock in rxrpc_do_sendmsg().

This patch solves it by acquiring the call->user_mutex lock, when
kernel fails the mutex_lock_interruptible() before returning from
the rxrpc_wait_for_tx_window_intr().

Reported-and-tested-by: syzbot+7f0483225d0c94cb3441@syzkaller.appspotmail.com
Signed-off-by: Hawkins Jiawei <yin31149@gmail.com>
---
 net/rxrpc/sendmsg.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/rxrpc/sendmsg.c b/net/rxrpc/sendmsg.c
index 1d38e279e2ef..e13043d357d5 100644
--- a/net/rxrpc/sendmsg.c
+++ b/net/rxrpc/sendmsg.c
@@ -53,8 +53,10 @@ static int rxrpc_wait_for_tx_window_intr(struct rxrpc_sock *rx,
 		trace_rxrpc_transmit(call, rxrpc_transmit_wait);
 		mutex_unlock(&call->user_mutex);
 		*timeo = schedule_timeout(*timeo);
-		if (mutex_lock_interruptible(&call->user_mutex) < 0)
+		if (mutex_lock_interruptible(&call->user_mutex) < 0) {
+			mutex_lock(&call->user_mutex);
 			return sock_intr_errno(*timeo);
+		}
 	}
 }
 
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
