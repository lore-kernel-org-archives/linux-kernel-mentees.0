Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD121C3F6B0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 21 Aug 2022 15:58:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46EC860BAB;
	Sun, 21 Aug 2022 15:58:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46EC860BAB
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gSYXLG0m
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 52UFlYuhaJ1E; Sun, 21 Aug 2022 15:58:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 0A4EF608B7;
	Sun, 21 Aug 2022 15:58:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A4EF608B7
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E034FC0033;
	Sun, 21 Aug 2022 15:58:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 859E7C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Aug 2022 15:58:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F9A14055D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Aug 2022 15:58:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F9A14055D
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=gSYXLG0m
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XYjM8OhUYP6n
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Aug 2022 15:58:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D92C14051E
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D92C14051E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Aug 2022 15:58:14 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id y187so6619093iof.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Aug 2022 08:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=jl057+Trbv3ToeVWTsybg5kXr0sDHbVCziecNl2AV6Y=;
 b=gSYXLG0m3nEyXiI/Jq1RB2mepjUqkocLXXiGtLSoFgwxJXH6PuvYrv3JFLRtpkE4yZ
 vN6bnu/cPzJoMtTuKFQHGchDqvdDZjqdZ58E9y1CaVo5LT3VPiKNDzhRagQgK0WedDMK
 2XRBWjPM4VMrwuYmj3a18rCuajEHRbCQvLKPEsLdtoMW2knsGotQHF1ipXy4uxCEcmfx
 zkEoy9u0MWc1br52yfE0eyLXElhZuvhG2yXaFrwcpgAV43unHMsYaRdsJakz3KIHxguc
 p7vVa6wMNNUxzgUDi1Sfb8kSj1gScc0zmfn2LtBOR5mwFhy7DR8mgddZ3M79p7D9MhJt
 AP2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=jl057+Trbv3ToeVWTsybg5kXr0sDHbVCziecNl2AV6Y=;
 b=qLZp/ZgGoMjiZwQrHn2zeDLqCua7hnLNcq3GRdkmwzDZUgrgQWGd27/O0Q88Uafc6N
 MCwj2XtyXI6zjFV4kRnvV1z6WKFa3DPeg2HxapDombAn5Qz1j6eaXLYteNDX/LBCGESK
 pbGlxe9ljINsDvg7bQznzX2g14QZfqSGUEVKSnzL/tzC6uIVIVsrylbEAPH5e/Q4Hz6Z
 EfTtF6sUBQGHpeDw0+AAT94cPY0STqxJZBOqgD4mDoJ8mpllC4xbqWExYcUEYUjBABSU
 FWo7Kdemt2mD4QB7E61LNtMqQlpZHVsLNtezJ+vCu9N176CN1c36Zl2ExevyxbNEngSY
 uODw==
X-Gm-Message-State: ACgBeo2fpMamjOPOZsQjVIE7KVTmwj36oze49IS5FvpAfhOlZmo4OkC+
 UozJbck/POB977hMIvPg2DnOg2tVQu+FusjZmbc=
X-Google-Smtp-Source: AA6agR6eQf/e2pEF818vApDCSFB8aXweqxuUn+lxjrAQ5KWz/mhdyriIpsoGD5KP2qmT9XOsR02iY8GYLa4BmuoYFfE=
X-Received: by 2002:a05:6602:1343:b0:689:2942:9b57 with SMTP id
 i3-20020a056602134300b0068929429b57mr6999688iov.75.1661097493907; Sun, 21 Aug
 2022 08:58:13 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000ce327f05d537ebf7@google.com>
 <20220821125751.4185-1-yin31149@gmail.com>
In-Reply-To: <20220821125751.4185-1-yin31149@gmail.com>
From: Khalid Masum <khalid.masum.92@gmail.com>
Date: Sun, 21 Aug 2022 21:58:02 +0600
Message-ID: <CAABMjtF2GeNyTf6gQ1hk0BiXKY9HWQStBAk_R3w6MCFQ3bOYzA@mail.gmail.com>
Subject: Re: [PATCH] rxrpc: fix bad unlock balance in rxrpc_do_sendmsg
To: Hawkins Jiawei <yin31149@gmail.com>
Cc: "open list:NETWORKING \[GENERAL\]" <netdev@vger.kernel.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-afs@lists.infradead.org, David Howells <dhowells@redhat.com>,
 syzbot+7f0483225d0c94cb3441@syzkaller.appspotmail.com,
 Eric Dumazet <edumazet@google.com>, Pavel Skripkin <paskripkin@gmail.com>,
 Marc Dionne <marc.dionne@auristor.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>,
 "David S. Miller" <davem@davemloft.net>
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

On Sun, Aug 21, 2022 at 6:58 PM Hawkins Jiawei <yin31149@gmail.com> wrote:
>
> Syzkaller reports bad unlock balance bug as follows:
> ------------[ cut here ]------------
> WARNING: bad unlock balance detected!
> syz-executor.0/4094 is trying to release lock (&call->user_mutex) at:
> [<ffffffff87c1d8d1>] rxrpc_do_sendmsg+0x851/0x1110 net/rxrpc/sendmsg.c:754
> but there are no more locks to release!
>
> other info that might help us debug this:
> no locks held by syz-executor.0/4094.
>
> stack backtrace:
> [...]
> Call Trace:
>  <TASK>
>  __dump_stack lib/dump_stack.c:88 [inline]
>  dump_stack_lvl+0x57/0x7d lib/dump_stack.c:106
>  print_unlock_imbalance_bug include/trace/events/lock.h:69 [inline]
>  __lock_release kernel/locking/lockdep.c:5333 [inline]
>  lock_release.cold+0x49/0x4e kernel/locking/lockdep.c:5686
>  __mutex_unlock_slowpath+0x99/0x5e0 kernel/locking/mutex.c:907
>  rxrpc_do_sendmsg+0x851/0x1110 net/rxrpc/sendmsg.c:754
>  sock_sendmsg_nosec net/socket.c:714 [inline]
>  sock_sendmsg+0xab/0xe0 net/socket.c:734
>  ____sys_sendmsg+0x5c2/0x7a0 net/socket.c:2485
>  ___sys_sendmsg+0xdb/0x160 net/socket.c:2539
>  __sys_sendmsg+0xc3/0x160 net/socket.c:2568
>  do_syscall_x64 arch/x86/entry/common.c:50 [inline]
>  do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
>  entry_SYSCALL_64_after_hwframe+0x63/0xcd
>  [...]
>  </TASK>
> ------------------------------------
>
> When kernel wants to send a message through an RxRPC socket in
> rxrpc_do_sendmsg(), kernel should hold the call->user_mutex lock,
> or it will triggers bug when releasing this lock before returning
> from rxrpc_do_sendmsg().
>
> Yet the problem is that during rxrpc_do_sendmsg(), kernel may call
> rxrpc_wait_for_tx_window_intr() to wait for space to appear in the
> tx queue or a signal to occur. When kernel fails the
> mutex_lock_interruptible(), kernel will returns from the
> rxrpc_wait_for_tx_window_intr() without acquiring the mutex lock, then
> triggers bug when releasing the mutex lock in rxrpc_do_sendmsg().
>
> This patch solves it by acquiring the call->user_mutex lock, when
> kernel fails the mutex_lock_interruptible() before returning from
> the rxrpc_wait_for_tx_window_intr().
>
> Reported-and-tested-by: syzbot+7f0483225d0c94cb3441@syzkaller.appspotmail.com
> Signed-off-by: Hawkins Jiawei <yin31149@gmail.com>
> ---
>  net/rxrpc/sendmsg.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/net/rxrpc/sendmsg.c b/net/rxrpc/sendmsg.c
> index 1d38e279e2ef..e13043d357d5 100644
> --- a/net/rxrpc/sendmsg.c
> +++ b/net/rxrpc/sendmsg.c
> @@ -53,8 +53,10 @@ static int rxrpc_wait_for_tx_window_intr(struct rxrpc_sock *rx,
>                 trace_rxrpc_transmit(call, rxrpc_transmit_wait);
>                 mutex_unlock(&call->user_mutex);
>                 *timeo = schedule_timeout(*timeo);
> -               if (mutex_lock_interruptible(&call->user_mutex) < 0)
> +               if (mutex_lock_interruptible(&call->user_mutex) < 0) {
> +                       mutex_lock(&call->user_mutex);

The interruptible version fails to acquire the lock. So why is it okay to
force it to acquire the mutex_lock since we are in the interrupt context?
>                         return sock_intr_errno(*timeo);
> +               }
>         }
>  }

thanks,
  -- Khalid Masum
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
