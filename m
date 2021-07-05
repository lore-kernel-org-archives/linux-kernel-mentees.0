Return-Path: <SRS0=DYSW=L5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBCC8C07E99
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  5 Jul 2021 18:52:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F5AE6197B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  5 Jul 2021 18:52:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F5AE6197B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D70C82BE7;
	Mon,  5 Jul 2021 18:52:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r_ngrFu0eLWL; Mon,  5 Jul 2021 18:52:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 525A782B93;
	Mon,  5 Jul 2021 18:52:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 27FCFC0010;
	Mon,  5 Jul 2021 18:52:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D372FC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Jul 2021 18:52:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B431940129
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Jul 2021 18:52:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=google.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2gO9qW6be25z
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Jul 2021 18:52:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com
 [IPv6:2607:f8b0:4864:20::e2e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0A40E400D2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Jul 2021 18:52:41 +0000 (UTC)
Received: by mail-vs1-xe2e.google.com with SMTP id az11so301501vsb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 05 Jul 2021 11:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CsKdkHbuBPD2Gcdm0gZ0pxBBsvN9q/irczUpL7TbVnY=;
 b=s6NbtxjP8I9FIBgeUHiGzKWBeDfHtboUVcxG6y7xNCM9n5TMHRghpBkPNGMmBwW12B
 kGHI/yAkoiQl1PLnHvaxMDmccT3Y1m5cJm9PpOV98O90UzqBqjTOkb6ZnqdEVa4W+xNh
 Vp4JZ6nygBZG7A6lEvBrTDpsg3e4gpZASz6u8WDxIaWsS/dv4/ZCvKfPwpRZpn8+Q/we
 K0R3FtrUQeq6/BpXvMVXlft3pE/C1i9dEykhwTSHFKX9bfjoaUYp7l5LL2zP3ZIKmVdm
 LuJ+LyjC8pFHm3fMYf5dg4LrZZBc5ztnSx0UtIZZyASSbGPAltfVUaQtcgn45vn+U0fW
 9Fww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CsKdkHbuBPD2Gcdm0gZ0pxBBsvN9q/irczUpL7TbVnY=;
 b=ZFXtIayV4Z1Z9i8MBmPk9UbNrSmWY0X/ZfH1LFtZEmQnyT72tt7/CCD3yIXcUhNbsh
 AKODpXeu6FR4g30XR/MZICDJb6OpXlx2qKb+HfnV8nQG6153VfDaxkpJCnBvuhabzyVf
 2i7FuZJbnjTTzvyuAeBueSyOyczadRkSnAwegJ50pdF1koGGON5DzNX527La7OElRlEd
 g/gU8Yi19kWaDFtkannuzM80+yCo3q34lHycLKB6IH+gzgTdArIvmoYSLG2l1t16xv3U
 Qz1XUcGHSxv8v81FplfNBI7v0gQDUNiDBdMx6l0MKcICf09nIQck9aYOSHToKjkItIWb
 zN+A==
X-Gm-Message-State: AOAM533URcMV3P1LVT9/wObl+XZ20YCVjD6yR+8ZknWT2lH34NgRLk8t
 8Y92syrLIjHoPd42KxotLVoIr+UlVqBsDajglqzsnQ==
X-Google-Smtp-Source: ABdhPJwLm8mKpOQUltOsVP1fdOymZXdXyoMOgOViH4N34T5gMl2NCQhyeRjsXINy7mBVKAtCCYNbbjI4KYLHcwGaIKQ=
X-Received: by 2002:a67:f7c8:: with SMTP id a8mr5129788vsp.16.1625511160510;
 Mon, 05 Jul 2021 11:52:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210705171823.524171-1-phind.uet@gmail.com>
In-Reply-To: <20210705171823.524171-1-phind.uet@gmail.com>
Date: Mon, 5 Jul 2021 14:52:23 -0400
Message-ID: <CADVnQymo8xmN44zwvrpMLs0pxGt3XTT_vosR-1TJJURgVWO1ZA@mail.gmail.com>
Subject: Re: [PATCH v5] tcp: fix tcp_init_transfer() to not reset
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

On Mon, Jul 5, 2021 at 1:18 PM Nguyen Dinh Phi <phind.uet@gmail.com> wrote:
>
> This commit fixes a bug (found by syzkaller) that could cause spurious
> double-initializations for congestion control modules, which could cause
> memory leaks orother problems for congestion control modules (like CDG)

nit: typo: "orother" -> "or other"

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
> Fixes: 8919a9b31eb4 (tcp: Only init congestion control if not initialized already)

Style nit: I believe this Fixes line should have double quotes around
the commit title, like:

  Fixes: 8919a9b31eb4 ("tcp: Only init congestion control if not
initialized already")

Otherwise, this looks good to me, and it passes our internal packetdrill tests.

thanks,
neal
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
