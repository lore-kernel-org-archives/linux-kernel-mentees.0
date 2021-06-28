Return-Path: <SRS0=s8/Q=LW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BFAAC2B9F4
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 28 Jun 2021 14:52:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE32061353
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 28 Jun 2021 14:52:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE32061353
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B16C56077A;
	Mon, 28 Jun 2021 14:52:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2cPmtCZ2kaY9; Mon, 28 Jun 2021 14:52:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id CFA3060705;
	Mon, 28 Jun 2021 14:52:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AFA5DC001A;
	Mon, 28 Jun 2021 14:52:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CCEC0C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Jun 2021 14:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B39A6400DB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Jun 2021 14:52:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=google.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y0uv9XM0Sy7L
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Jun 2021 14:52:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6C4E840003
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Jun 2021 14:52:54 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id b64so18959656yba.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Jun 2021 07:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HYLutEvMYIfZinEiWGKyAJ7H0pxGUzBzdhu6yQBXQiU=;
 b=NNF8m9YHL731PTEUPT9jRJ1Q0bYi8Dyl/M7BYPqCO+0H3vFGAs5Hqvl3J3EJnfOsso
 6bkDsTJuI/EWf8udfG+br3cHu4MejupGkv2/7O7skXXp01Ey8kfO40Tb0It515+isBNq
 4/T7/n5TxteHuz4zEqJTGEbWr0Dpma+7TvlX7WtGfIJU729OKb/9K5qv4QQILEDaIwPb
 fkzRkLrChufF4zO+J5QEHdba2lT9gLTcuk+Q4TfD+58vXL0BchXwE+pRy3T0K+bv/EFf
 8Wh/3EnR8QnO3x/LCM31UoPK1WHlacIn7QoUiKnv49U5D2wn3z3Eg3t+YSSsWOQVOeUC
 bAbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HYLutEvMYIfZinEiWGKyAJ7H0pxGUzBzdhu6yQBXQiU=;
 b=jeyiZQ0V0zX8Q1Ek4VNvDTbjpV8TUBuITitGCobMwoZhUwMB+J8Y6z6ex6gdMukvEf
 Oz6+jMFskkcRSqSCsOf3fneDb/9iic3zUPi1xR6uIBThH+5UBQPBaphDQamnv17o/ZTs
 FheMI8t2t6pfPiwASIeHUEmivfmmhT2QUJaDbz4zIgpEdOv6SiRmS3X/nF4bnWykjEEc
 vyGbOQ26lUe88PcsNtjb3xFh3RnxNrwkODh0LilGwtIei3Z4gM2WYO2FVQl0pGFzMnB0
 puMLH8kdAfW5EVPtPuSFd9HhBzkRQYnJoRduyJM//LqcYn2K0vWsVs4en+G8iu5qXf0x
 EhWw==
X-Gm-Message-State: AOAM531ti5M6cVxNBGe1gLEBG5wyDmOgItNpkePFfWm8uSxKsN2vPoIi
 Gqh1aXXM8b20MCceJDXYnlZkpGdxm0ukwbQMNa9jPA==
X-Google-Smtp-Source: ABdhPJwfm4cGKBTTeOHl72F6wYi6baCmzltv8WAuECamcwIZ0w//hv+00frei2DspO51IU3sskbzVXzu42YbZD6/7ks=
X-Received: by 2002:a25:8081:: with SMTP id n1mr34237963ybk.253.1624891973002; 
 Mon, 28 Jun 2021 07:52:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210628144908.881499-1-phind.uet@gmail.com>
In-Reply-To: <20210628144908.881499-1-phind.uet@gmail.com>
Date: Mon, 28 Jun 2021 16:52:41 +0200
Message-ID: <CANn89iJ6M2WFS3B+sSOysekScUFmO9q5YHxgHGsbozbvkW9ivg@mail.gmail.com>
Subject: Re: [PATCH] tcp: Do not reset the icsk_ca_initialized in
 tcp_init_transfer.
To: Nguyen Dinh Phi <phind.uet@gmail.com>
Cc: Song Liu <songliubraving@fb.com>, Martin KaFai Lau <kafai@fb.com>,
 syzbot+f1e24a0594d4e3a895d3@syzkaller.appspotmail.com,
 Daniel Borkmann <daniel@iogearbox.net>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, netdev <netdev@vger.kernel.org>,
 David Ahern <dsahern@kernel.org>, John Fastabend <john.fastabend@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Yuchung Cheng <ycheng@google.com>, Neal Cardwell <ncardwell@google.com>,
 kpsingh@kernel.org, Jakub Kicinski <kuba@kernel.org>,
 bpf <bpf@vger.kernel.org>, linux-kernel-mentees@lists.linuxfoundation.org,
 David Miller <davem@davemloft.net>, LKML <linux-kernel@vger.kernel.org>
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
From: Eric Dumazet via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Eric Dumazet <edumazet@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Mon, Jun 28, 2021 at 4:49 PM Nguyen Dinh Phi <phind.uet@gmail.com> wrote:
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

Unfortunately this patch might break things.

We keep changing this CC switching, with eBPF being mixed in the equation.

I would suggest you find a Fixes: tag first, so that we can continue
the discussion.

Thank you.

>         bpf_skops_established(sk, bpf_op, skb);
>         if (!icsk->icsk_ca_initialized)
>                 tcp_init_congestion_control(sk);
> --
> 2.25.1
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
