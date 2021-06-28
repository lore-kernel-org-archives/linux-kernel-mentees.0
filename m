Return-Path: <SRS0=s8/Q=LW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6BD1C49EAB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 28 Jun 2021 17:10:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BD42619AD
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 28 Jun 2021 17:10:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BD42619AD
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D3FE82BC5;
	Mon, 28 Jun 2021 17:10:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gapLoLcPiTiA; Mon, 28 Jun 2021 17:10:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 27B2182BC4;
	Mon, 28 Jun 2021 17:10:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 05BAAC0010;
	Mon, 28 Jun 2021 17:10:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DB3EAC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Jun 2021 17:10:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD211400FD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Jun 2021 17:10:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=google.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aFo99wUyL5Pw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Jun 2021 17:10:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com
 [IPv6:2607:f8b0:4864:20::e2a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 054E0400F5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Jun 2021 17:10:01 +0000 (UTC)
Received: by mail-vs1-xe2a.google.com with SMTP id x141so5799666vsx.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Jun 2021 10:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Mo3OdiLTZvGcXxBpncIESoNRczm8dPaHap71ZY+M2V0=;
 b=vIIyxo7OmqipykkX5c7TZY0dBl2DBO3LJAsvk6kupavZ/V87biwTFvAdI+3oiiDJX+
 EzSvGXjyp22IIwsK7mBLNaYK555SXWp/BRJ0EhlU636KrVcvtIAssh5/qazVZqfrqcuF
 92aIwWe3w8N96gfULh0Ql+FKm+XbNgVhqm0e/M2O3+0TR6w6FCUycRXn0Jw4F/JcKgUk
 LsF/f8FZNQLv+CpRz5a7Ruq6qCmvTmH/c5Fy8hb8bLFq18kpNQ74EBh7HGgcau3OuQoq
 XAiVrjqI5gMizAgWSksVHOLw/nOB4/PnbeLua3/N28XxnwCnK6rVI0SCLJ4q4CN3/5hk
 tr7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Mo3OdiLTZvGcXxBpncIESoNRczm8dPaHap71ZY+M2V0=;
 b=C+uGurMNGbVMdwXf6BgVZBNj2L9FTBKQlPZcyvG/ZPTvbdyvRUB4HEG8TGI3KeIR+p
 srdvPOD/euJCdekE4FUoyl3b/bxqNmCNyTQTgHMCqfX4znCWGMwgGr6gjO1MpsAlOS3z
 KWynui+LCUyhx6Z5bksPBys7B5bahj5c1ai65Objc8NTwkKCSC1G/Z6mNppjHx+4Dyu+
 5wGcS0J9j/QLvCnNxhS/+1Z5ulU6NIUG5joq9u3F3G7ssWzRYEbcKLnyZbkLjuKmWsuU
 wD5Y4KmxgB0uX2ZrrPOF7L5oU48s+EU0sE/YC8jHROZVqyakVIEADTUi9Cx/26i52HYL
 MKnQ==
X-Gm-Message-State: AOAM533WHersACXK5d2HqXYurPnGWK6OvbDVkYYUvhgCR1l98kNNqhrT
 YHQVqplf4+ivBpEjVqah7QXBLr53da3U0sTY9nknSQ==
X-Google-Smtp-Source: ABdhPJxZvUL4IYU2328Efy3AR47Zraw12zY2/+WkyDw8j3H3zqpchIbYSF4iWNXEHqJseW4aHy4U7rx1BK2J5qYZGL4=
X-Received: by 2002:a67:f244:: with SMTP id y4mr20182870vsm.52.1624900200466; 
 Mon, 28 Jun 2021 10:10:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210628144908.881499-1-phind.uet@gmail.com>
In-Reply-To: <20210628144908.881499-1-phind.uet@gmail.com>
Date: Mon, 28 Jun 2021 13:09:43 -0400
Message-ID: <CADVnQy=QDCFi8mj249krPyPZmPickEaC+3z_7-tCSvsde65xOw@mail.gmail.com>
Subject: Re: [PATCH] tcp: Do not reset the icsk_ca_initialized in
 tcp_init_transfer.
To: Nguyen Dinh Phi <phind.uet@gmail.com>
Cc: songliubraving@fb.com, kafai@fb.com,
 syzbot+f1e24a0594d4e3a895d3@syzkaller.appspotmail.com, daniel@iogearbox.net,
 yoshfuji@linux-ipv6.org, netdev@vger.kernel.org, dsahern@kernel.org,
 john.fastabend@gmail.com, ast@kernel.org, andrii@kernel.org,
 edumazet@google.com, Kevin Yang <yyd@google.com>,
 Yuchung Cheng <ycheng@google.com>, kpsingh@kernel.org, kuba@kernel.org,
 bpf@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 davem@davemloft.net, linux-kernel@vger.kernel.org
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
From: Neal Cardwell via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Neal Cardwell <ncardwell@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Mon, Jun 28, 2021 at 11:39 AM Nguyen Dinh Phi <phind.uet@gmail.com> wrote:
>
> icsk_ca_initialized be always set to zero before we examine it in if
> block, this makes the congestion control module's initialization be
> called even if the CC module was initialized already.
> In case the CC module allocates and setups its dynamically allocated
> private data in its init() function, e.g, CDG, the memory leak may occur.
>
> Reported-by: syzbot+f1e24a0594d4e3a895d3@syzkaller.appspotmail.com
>
> Signed-off-by: Nguyen Dinh Phi <phind.uet@gmail.com>
> ---
>  net/ipv4/tcp_input.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> index 7d5e59f688de..855ada2be25e 100644
> --- a/net/ipv4/tcp_input.c
> +++ b/net/ipv4/tcp_input.c
> @@ -5922,7 +5922,6 @@ void tcp_init_transfer(struct sock *sk, int bpf_op, struct sk_buff *skb)
>                 tp->snd_cwnd = tcp_init_cwnd(tp, __sk_dst_get(sk));
>         tp->snd_cwnd_stamp = tcp_jiffies32;
>
> -       icsk->icsk_ca_initialized = 0;

If this patch removes that line, then AFAICT the patch should also
insert a corresponding:

  icsk->icsk_ca_initialized = 0;

in tcp_ca_openreq_child(), so that any non-zero icsk_ca_initialized
value in a listener socket (on which setsockopt(TCP_CONGESTION) was
called)  is not erroneously inherited by a child socket due to the
tcp_create_openreq_child() -> inet_csk_clone_lock() -> sock_copy()
call chain. Something like:

diff --git a/net/ipv4/tcp_minisocks.c b/net/ipv4/tcp_minisocks.c
index c48d8336f26d..4d6a76dfa1c4 100644
--- a/net/ipv4/tcp_minisocks.c
+++ b/net/ipv4/tcp_minisocks.c
@@ -446,6 +446,7 @@ void tcp_ca_openreq_child(struct sock *sk, const
struct dst_entry *dst)
        }

        /* If no valid choice made yet, assign current system default ca. */
+       icsk->icsk_ca_initialized = 0;
        if (!ca_got_dst &&
            (!icsk->icsk_ca_setsockopt ||
             !bpf_try_module_get(icsk->icsk_ca_ops, icsk->icsk_ca_ops->owner)))

thanks,
neal
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
