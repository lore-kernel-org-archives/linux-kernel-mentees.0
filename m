Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C84C28D13
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 22 Aug 2022 05:19:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D70A6410A9;
	Mon, 22 Aug 2022 05:19:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D70A6410A9
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Xyg+c3ML
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gBgcl3jJ72m3; Mon, 22 Aug 2022 05:19:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 70DE4409FD;
	Mon, 22 Aug 2022 05:19:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70DE4409FD
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 25A4DC0033;
	Mon, 22 Aug 2022 05:19:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D322CC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Aug 2022 05:19:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A08F5817FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Aug 2022 05:19:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A08F5817FF
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Xyg+c3ML
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GYK5VMyg6iof
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Aug 2022 05:19:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67DA781493
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 67DA781493
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Aug 2022 05:19:25 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id 83so3576844pfw.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Aug 2022 22:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=giyJvb5MceZvmd+O7/+oUKyqv96Z2OFMCAAIUudAKGg=;
 b=Xyg+c3MLt+j8GVAFZFpwninxt4lQlSHMK//4kJAKEPIHIHid6x6susbixn211WqNG/
 NpFzsY9hHF3bgVg6K0n+dMoJfyv753nns2sP4NOyRixOG8ixWot0Ot8PnK+zHABUs3b7
 IMfo1mrvQIzw2rBIhWpLbv8JBHN79TjG0bC0bw7LGgjA/gZhOX9E2qQvLvo+ef6giAIE
 f/cL7m/dYpWm5H+HwCcvk/9skMNPp2e8WM3F9yGd8S2ipbQK2OVXWbo3rXiOgYd7ZbfW
 4+tL1jwXHbeHr623zr4tStyNXcIfbN0fPggNqudDiBk0b8sQg9z5Wn28FrJFNwUR2AAN
 7bQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=giyJvb5MceZvmd+O7/+oUKyqv96Z2OFMCAAIUudAKGg=;
 b=fVjn91HxBH8oUMOZTIjOirDKfUNX1tRs6j4wDnBPcwfrQFCvMYGlNMAwRhA091C0ch
 Q4XcrFowlQA1P/MVlBqMIoanqph2VbtpogXknTumBwYc3u19r8MPDqhNrtIvfNSTqM0i
 uvYWFBVSSV+krhYZZSW5MnW8n6kPY7Wo1Aql6FoIOXKAJ8Pj0XdaIl6D9ClwALtzJKgc
 Dh++6D4MitRE9AaBiGBMWvJcAArDwOYSMmgXRHYWxU77F7VuP72r/IRXV0JKEdap/WiV
 mtkgG+9OfEB/NitIR3HKCq02To2llXm+FgBoPjVy2Bod/Ns2VnDrbGytWxVzubI7cIkT
 dZFQ==
X-Gm-Message-State: ACgBeo2DRkV0sxYPhQuMGj5JMwlptrg/GMAAk3FJ3LuvfEXHWXKKG6ZO
 AaSEfkMZvpVbAdXiqKJ4Wn0=
X-Google-Smtp-Source: AA6agR7YaKl/EFWBRm94AS2E4wLWUVRtwJh5qzuhEq/OkUV9lHc9qUF9gFkqO8X+fv/G2DiMxPO6dw==
X-Received: by 2002:a05:6a00:1393:b0:536:5b8a:c35b with SMTP id
 t19-20020a056a00139300b005365b8ac35bmr8330817pfg.5.1661145564683; 
 Sun, 21 Aug 2022 22:19:24 -0700 (PDT)
Received: from localhost ([36.112.86.8]) by smtp.gmail.com with ESMTPSA id
 y9-20020a634b09000000b004114cc062f0sm6387798pga.65.2022.08.21.22.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Aug 2022 22:19:24 -0700 (PDT)
From: Hawkins Jiawei <yin31149@gmail.com>
To: khalid.masum.92@gmail.com
Subject: Re: [PATCH] rxrpc: fix bad unlock balance in rxrpc_do_sendmsg
Date: Mon, 22 Aug 2022 13:19:07 +0800
Message-Id: <20220822051907.104443-1-yin31149@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CAABMjtHJX6Rm1Ndg+bECbERWkFYdWbDDYd1-5bVFTu-qwKW=sA@mail.gmail.com>
References: <CAABMjtHJX6Rm1Ndg+bECbERWkFYdWbDDYd1-5bVFTu-qwKW=sA@mail.gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-afs@lists.infradead.org,
 dhowells@redhat.com, syzbot+7f0483225d0c94cb3441@syzkaller.appspotmail.com,
 edumazet@google.com, yin31149@gmail.com, paskripkin@gmail.com,
 marc.dionne@auristor.com, kuba@kernel.org, pabeni@redhat.com,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net
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

On Mon, 22 Aug 2022 at 00:42, Khalid Masum <khalid.masum.92@gmail.com> wrote:
>
> On Sun, Aug 21, 2022 at 9:58 PM Khalid Masum <khalid.masum.92@gmail.com> wrote:
> >
> > On Sun, Aug 21, 2022 at 6:58 PM Hawkins Jiawei <yin31149@gmail.com> wrote:
> > >
> > The interruptible version fails to acquire the lock. So why is it okay to
> > force it to acquire the mutex_lock since we are in the interrupt context?
>
> Sorry, I mean, won't the function lose its ability of being interruptible?
> Since we are forcing it to acquire the lock.
> > >                         return sock_intr_errno(*timeo);
> > > +               }
> > >         }
> > >  }
> >
> > thanks,
> >   -- Khalid Masum
Hi, Khalid

In my opinion, _intr in rxrpc_wait_for_tx_window_intr() seems referring
that, the loop in function should be interrupted when a signal
arrives(Please correct me if I am wrong):
> /*
>  * Wait for space to appear in the Tx queue or a signal to occur.
>  */
> static int rxrpc_wait_for_tx_window_intr(struct rxrpc_sock *rx,
> 					 struct rxrpc_call *call,
> 					 long *timeo)
> {
> 	for (;;) {
> 		set_current_state(TASK_INTERRUPTIBLE);
> 		if (rxrpc_check_tx_space(call, NULL))
> 			return 0;
> 
> 		if (call->state >= RXRPC_CALL_COMPLETE)
> 			return call->error;
> 
> 		if (signal_pending(current))
> 			return sock_intr_errno(*timeo);
> 
> 		trace_rxrpc_transmit(call, rxrpc_transmit_wait);
> 		mutex_unlock(&call->user_mutex);
> 		*timeo = schedule_timeout(*timeo);
> 		if (mutex_lock_interruptible(&call->user_mutex) < 0)
> 			return sock_intr_errno(*timeo);
> 	}
> }

To be more specific, when a signal arrives,
rxrpc_wait_for_tx_window_intr() should know when executing
mutex_lock_interruptible() and get a non-zero value. Then
rxrpc_wait_for_tx_window_intr() should be interrupted, which means
function should be returned.

So I think, acquiring mutex_lock() seems won't effect its ability
of being interruptible.(Please correct me if I am wrong).

What's more, when the kernel return from
rxrpc_wait_for_tx_window_intr(), it will only handles the error case
before unlocking the call->user_mutex, which won't cost a long time.
So I think it seems Ok to acquire the call->user_mutex when
rxrpc_wait_for_tx_window_intr() is interrupted by a signal.


On Mon, 22 Aug 2022 at 03:18, Khalid Masum <khalid.masum.92@gmail.com> wrote:
>
> Maybe we do not need to lock since no other timer_schedule needs
> it.
>
> Test if this fixes the issue.
> ---
> diff --git a/net/rxrpc/sendmsg.c b/net/rxrpc/sendmsg.c
> index 1d38e279e2ef..640e2ab2cc35 100644
> --- a/net/rxrpc/sendmsg.c
> +++ b/net/rxrpc/sendmsg.c
> @@ -51,10 +51,8 @@ static int rxrpc_wait_for_tx_window_intr(struct rxrpc_sock *rx,
>                         return sock_intr_errno(*timeo);
>
>                 trace_rxrpc_transmit(call, rxrpc_transmit_wait);
> -               mutex_unlock(&call->user_mutex);
>                 *timeo = schedule_timeout(*timeo);
> -               if (mutex_lock_interruptible(&call->user_mutex) < 0)
> -                       return sock_intr_errno(*timeo);
> +               return sock_intr_errno(*timeo);
>         }
>  }
>
> --
> 2.37.1
>

If it is still improper to patch this bug by acquiring the
call->user_mutex, I wonder if it is better to check before unlocking the lock
in rxrpc_do_sendmsg(), because kernel will always unlocking the call->user_mutex
in the end of the rxrpc_do_sendmsg():
> int rxrpc_do_sendmsg(struct rxrpc_sock *rx, struct msghdr *msg, size_t len)
> 	__releases(&rx->sk.sk_lock.slock)
> 	__releases(&call->user_mutex)
> {
> 	...
> out_put_unlock:
> 	mutex_unlock(&call->user_mutex);
> error_put:
> 	rxrpc_put_call(call, rxrpc_call_put);
> 	_leave(" = %d", ret);
> 	return ret;
> 
> error_release_sock:
> 	release_sock(&rx->sk);
> 	return ret;
> }
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
