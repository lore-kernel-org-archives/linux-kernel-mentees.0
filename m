Return-Path: <SRS0=gjYE=ND=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D75C3C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 12 Aug 2021 07:07:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B8DD6103E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 12 Aug 2021 07:07:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7B8DD6103E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44DFF80B39;
	Thu, 12 Aug 2021 07:07:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9EbjthuWkEi8; Thu, 12 Aug 2021 07:07:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 5884980B3A;
	Thu, 12 Aug 2021 07:07:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3209EC0010;
	Thu, 12 Aug 2021 07:07:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0D712C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Aug 2021 07:07:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA01880B3A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Aug 2021 07:07:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sj3OTWUoGwJE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Aug 2021 07:07:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3E18F80B39
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Aug 2021 07:07:38 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id p4so9809192yba.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Aug 2021 00:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qNbadYpEdJVuH8IgME6HLnqMP9VEAKKImPC7HomiMdE=;
 b=EZh5Vi7dnJV+CsZFIWmVlgH8ElUJ+2gtNAZh5NOT7HwuyPBTzLSN1M5eX/k0PSey87
 E3sObwmwcGZaXoaW1c8/RW7SUPRYJbu6iL6EwjeP0wTiE24/siJnc7Lhj5CF/KeZVCtP
 fBaG66NmQ6h6FTRheBv+pz1Tu0n1reibJy9QdvO4uOxnrwxf2AO/MMafwAJNWVT/ocxX
 2Tiz3AWP8qeJ8JlFry8IvgiW1h2wTtZl4Bp3qULM2EbcWtU7EHOfVtnPuoeaVNe988l6
 4LXMPCrCBPTynZFuDZf6q03wNx+20itUZrEcihJ9TQNSkaq/GIDEyeeoy0+90D3egGDn
 6Nhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qNbadYpEdJVuH8IgME6HLnqMP9VEAKKImPC7HomiMdE=;
 b=c5Mt5XMebD7UP+z/c6Kjc6JsxsXmdVgCe28X064wOY9v0jt/Qnj2KnR2/1FKrZUnd0
 zoJjVdzkkkd/NLT314xoU5P4H6NO2qhtOlWmnj2YFDsA18mGa1yOJSuEslUvb773tgRI
 LsYZC5ylLtw8dLWbEjlmgjx3lRn4okII28A23F0J+p688mqxuutFE6H4VFdxewYHtXm2
 EcblOWUsqUkW+lBfsHyR5ZqSGinT6l/g+c9LRbdatRyesflBtWAsoLbaBdn3t6NSA2Hw
 pdAd9uz6clKB1E7jUUVynBVCF2ABLiVX+HxKm9YyIEz/vJMZFjwQq5g+ZBhtggmAIWKx
 ukOQ==
X-Gm-Message-State: AOAM533zwBexfwLBkkcr7w4TjTUcrtUli5vQuzKDVPol4eBns8+r/nBd
 53SwVXMjAPcHdpzje1nLQ3o6FyW+UNw3ivMpf4nbzA==
X-Google-Smtp-Source: ABdhPJz4R9WwiWRLBaxIdLeSpTQe1Orbq+PuyORfqX/1JHJwCICUFP6LIBDpoLgZ9L+Z5WysNNJSVOWKhNAHK6H7dZo=
X-Received: by 2002:a25:ea51:: with SMTP id o17mr2748444ybe.253.1628752056761; 
 Thu, 12 Aug 2021 00:07:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210811235959.1099333-1-phind.uet@gmail.com>
In-Reply-To: <20210811235959.1099333-1-phind.uet@gmail.com>
Date: Thu, 12 Aug 2021 09:07:25 +0200
Message-ID: <CANn89iLQj4Xm-6Bcygtkd5QqDzmJBDALznL8mEJrF1Fh_W32iQ@mail.gmail.com>
Subject: Re: [PATCH] net: drop skbs in napi->rx_list when removing the napi
 context.
To: Nguyen Dinh Phi <phind.uet@gmail.com>
Cc: Song Liu <songliubraving@fb.com>, Alexander Lobakin <alobakin@pm.me>,
 syzbot+989efe781c74de1ddb54@syzkaller.appspotmail.com,
 Alexei Starovoitov <ast@kernel.org>, Wei Wang <weiwan@google.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 Yonghong Song <yhs@fb.com>, linux-kernel-mentees@lists.linuxfoundation.org,
 Jesper Dangaard Brouer <hawk@kernel.org>, kpsingh@kernel.org, memxor@gmail.com,
 Jakub Kicinski <kuba@kernel.org>, netdev <netdev@vger.kernel.org>,
 Antoine Tenart <atenart@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 David Miller <davem@davemloft.net>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, bpf <bpf@vger.kernel.org>,
 Martin KaFai Lau <kafai@fb.com>, Taehee Yoo <ap420073@gmail.com>
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

On Thu, Aug 12, 2021 at 2:00 AM Nguyen Dinh Phi <phind.uet@gmail.com> wrote:
>
> The napi->rx_list is used to hold the GRO_NORMAL skbs before passing
> them to the stack, these skbs only passed to stack at the flush time or
> when the list's weight matches the predefined condition. In case the
> rx_list contains pending skbs when we remove the napi context, we need
> to clean out this list, otherwise, a memory leak will happen.
>
> Signed-off-by: Nguyen Dinh Phi <phind.uet@gmail.com>
> Reported-by: syzbot+989efe781c74de1ddb54@syzkaller.appspotmail.com

Thank you for working on this.

Please add a Fixes: tag, otherwise you are asking maintainers and
stable teams to find the original bug,
while you are in a much better position, since you spent time on
fixing the issue.

Also I object to this fix.

If packets have been stored temporarily in GRO, they should be
released at some point,
normally at the end of a napi poll.

By released, I mean that these packets should reach the upper stack,
instead of being dropped without
any notification.

It seems a call to gro_normal_list() is missing somewhere.

Can you find where ?

Thanks !

> ---
>  net/core/dev.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/net/core/dev.c b/net/core/dev.c
> index b51e41d0a7fe..319fffc62ce6 100644
> --- a/net/core/dev.c
> +++ b/net/core/dev.c
> @@ -7038,6 +7038,13 @@ void __netif_napi_del(struct napi_struct *napi)
>         list_del_rcu(&napi->dev_list);
>         napi_free_frags(napi);
>
> +       if (napi->rx_count) {
> +               struct sk_buff *skb, *n;
> +
> +               list_for_each_entry_safe(skb, n, &napi->rx_list, list)
> +                       kfree_skb(skb);
> +       }
> +
>         flush_gro_hash(napi);
>         napi->gro_bitmask = 0;
>
> --
> 2.25.1
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
