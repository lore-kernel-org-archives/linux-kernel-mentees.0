Return-Path: <SRS0=ODY0=L6=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_RED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87FADC07E96
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  6 Jul 2021 14:41:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B0366135C
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  6 Jul 2021 14:41:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B0366135C
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB4E2605D6;
	Tue,  6 Jul 2021 14:41:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8JVW5pJleGN4; Tue,  6 Jul 2021 14:41:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id DB507605B1;
	Tue,  6 Jul 2021 14:41:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BA6A1C001A;
	Tue,  6 Jul 2021 14:41:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6C109C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Jul 2021 14:41:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A50940182
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Jul 2021 14:41:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=google.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id laBSRg5uCvsD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Jul 2021 14:41:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com
 [IPv6:2607:f8b0:4864:20::e35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8179340022
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Jul 2021 14:41:14 +0000 (UTC)
Received: by mail-vs1-xe35.google.com with SMTP id u11so7271962vsl.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 06 Jul 2021 07:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JTSN/TsZ42ihyFJIr7SrTpDTYHBxd5pPWJlGP+shcyw=;
 b=YAK+YCFdhvDT27LvdTUG0jEZsORIgDDD1T1cNq5wMoOogkZ4FrhJge5A4Cx5NHW/j/
 tlnqS8u76bv04yyu8b0Fo0rTNn4lNJShq1gtKsW6bWGNUb7+jqDauxhVpZ8eO38MCRkS
 o+4DqskC3HE8YdB0nYrwkUiQafHsLRRB+2IogRDM7saPS3ZijLB6rkRyyY5PF2VjMiCC
 N67du1djLw4xcL7Y50ia2FC51dcVvA3ePfTMX2YefWPQ80hqprwq5Fh3aPO7EUvW8OD0
 jFe8zRKSO8/OAw/VE8I0DIEOpQYGapTdX2vzo+qN5lUFUxb0HUukDPDIGyYyQWAhm66s
 P1tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JTSN/TsZ42ihyFJIr7SrTpDTYHBxd5pPWJlGP+shcyw=;
 b=hjTX1myY22V1vt1cp5yvlJxm87z6xnTJxAdz09ZW2h8dHwrCWK1Vv7p4+LbWdbelTH
 vvGrXKgVvM7JtrMN/icxJRQq5lq7xt/RD0ME6jD5nGqzkxt3o7uewTw8w4AhVKwUGdeI
 yZSDYZBlev6r0fdauHeJZqZpJ2tCXdpYJuq2RbwExmDwuQZsnLAriqDFfMoEBepMkFUt
 7jFkyNpyiBotWiA68rwBlnsTng2egd02Qmb0oA3o+fVZt59Hm0bFjrPwIiEs5F+0yZX7
 lFKMcsVzGjRPyBMn11TC6vwRDPX8TApgejXw+1mdblFkKVILYQfATI228INfsMI7VbHH
 54gQ==
X-Gm-Message-State: AOAM531Am6u9ipHB3rLsUSbL9RkV5nrAFhfr0+b6+o9dA7ULFPeuiHkd
 58WtSmUjTRahWW00hF9Sb4Uaw2k7dvkT4b8jdNzy4w==
X-Google-Smtp-Source: ABdhPJw/aK0Qk0RnZ6WI52y3rp230jVwtgYhkwbx8aS/wBE4hQmIpJ8D0FLgvjVDorBlpsEN4ImUxrnLulBTYwhJetc=
X-Received: by 2002:a67:f7c8:: with SMTP id a8mr9683316vsp.16.1625582473140;
 Tue, 06 Jul 2021 07:41:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210705231912.532186-1-phind.uet@gmail.com>
In-Reply-To: <20210705231912.532186-1-phind.uet@gmail.com>
Date: Tue, 6 Jul 2021 10:40:56 -0400
Message-ID: <CADVnQy=vjHrBB=cD7FNedUMi6pOagEovO=H1no3A27fK9-yQAA@mail.gmail.com>
Subject: Re: [PATCH v6] tcp: fix tcp_init_transfer() to not reset
 icsk_ca_initialized
To: Nguyen Dinh Phi <phind.uet@gmail.com>
Cc: songliubraving@fb.com, kafai@fb.com,
 syzbot+f1e24a0594d4e3a895d3@syzkaller.appspotmail.com, daniel@iogearbox.net,
 yoshfuji@linux-ipv6.org, netdev@vger.kernel.org, dsahern@kernel.org,
 john.fastabend@gmail.com, ast@kernel.org, andrii@kernel.org,
 edumazet@google.com, yyd@google.com, ycheng@google.com, kuba@kernel.org,
 kpsingh@kernel.org, yhs@fb.com, bpf@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net,
 linux-kernel@vger.kernel.org
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

On Mon, Jul 5, 2021 at 7:19 PM Nguyen Dinh Phi <phind.uet@gmail.com> wrote:
>
> This commit fixes a bug (found by syzkaller) that could cause spurious
> double-initializations for congestion control modules, which could cause
> memory leaks or other problems for congestion control modules (like CDG)
> that allocate memory in their init functions.
>
> The buggy scenario constructed by syzkaller was something like:
>
> (1) create a TCP socket
> (2) initiate a TFO connect via sendto()
> (3) while socket is in TCP_SYN_SENT, call setsockopt(TCP_CONGESTION),
>     which calls:
>        tcp_set_congestion_control() ->
>          tcp_reinit_congestion_control() ->
>            tcp_init_congestion_control()
> (4) receive ACK, connection is established, call tcp_init_transfer(),
>     set icsk_ca_initialized=0 (without first calling cc->release()),
>     call tcp_init_congestion_control() again.
>
> Note that in this sequence tcp_init_congestion_control() is called
> twice without a cc->release() call in between. Thus, for CC modules
> that allocate memory in their init() function, e.g, CDG, a memory leak
> may occur. The syzkaller tool managed to find a reproducer that
> triggered such a leak in CDG.
>
> The bug was introduced when that commit 8919a9b31eb4 ("tcp: Only init
> congestion control if not initialized already")
> introduced icsk_ca_initialized and set icsk_ca_initialized to 0 in
> tcp_init_transfer(), missing the possibility for a sequence like the
> one above, where a process could call setsockopt(TCP_CONGESTION) in
> state TCP_SYN_SENT (i.e. after the connect() or TFO open sendmsg()),
> which would call tcp_init_congestion_control(). It did not intend to
> reset any initialization that the user had already explicitly made;
> it just missed the possibility of that particular sequence (which
> syzkaller managed to find).
>
> Fixes: 8919a9b31eb4 ("tcp: Only init congestion control if not initialized already")
> Reported-by: syzbot+f1e24a0594d4e3a895d3@syzkaller.appspotmail.com
> Signed-off-by: Nguyen Dinh Phi <phind.uet@gmail.com>
> ---
> V2:     - Modify the Subject line.
>         - Adjust the commit message.
>         - Add Fixes: tag.
> V3:     - Fix netdev/verify_fixes format error.
> V4:     - Add blamed authors to receiver list.
> V5:     - Add comment about the congestion control initialization.
> V6:     - Fix typo in commit message.
>  net/ipv4/tcp_input.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> index 7d5e59f688de..84c70843b404 100644
> --- a/net/ipv4/tcp_input.c
> +++ b/net/ipv4/tcp_input.c
> @@ -5922,8 +5922,8 @@ void tcp_init_transfer(struct sock *sk, int bpf_op, struct sk_buff *skb)
>                 tp->snd_cwnd = tcp_init_cwnd(tp, __sk_dst_get(sk));
>         tp->snd_cwnd_stamp = tcp_jiffies32;
>
> -       icsk->icsk_ca_initialized = 0;
>         bpf_skops_established(sk, bpf_op, skb);
> +       /* Initialize congestion control unless BPF initialized it already: */
>         if (!icsk->icsk_ca_initialized)
>                 tcp_init_congestion_control(sk);
>         tcp_init_buffer_space(sk);
> --

Acked-by: Neal Cardwell <ncardwell@google.com>
Tested-by: Neal Cardwell <ncardwell@google.com>

Looks good to me.  Thanks for the fix!

neal
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
