Return-Path: <SRS0=QgwC=L2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 188EBC07E95
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  2 Jul 2021 20:32:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3BE0613BC
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  2 Jul 2021 20:32:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3BE0613BC
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70D6584343;
	Fri,  2 Jul 2021 20:32:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UK2Ttn-wCYEx; Fri,  2 Jul 2021 20:32:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 847D784335;
	Fri,  2 Jul 2021 20:32:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5F573C0010;
	Fri,  2 Jul 2021 20:32:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 05E73C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Jul 2021 20:32:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E95AB84343
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Jul 2021 20:32:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MRLErPjLzJpz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Jul 2021 20:32:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com
 [IPv6:2607:f8b0:4864:20::933])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F09A384335
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Jul 2021 20:32:00 +0000 (UTC)
Received: by mail-ua1-x933.google.com with SMTP id e20so4278878ual.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 02 Jul 2021 13:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iGOVo0v3XCUiMjAb3ZKMCET9+F7mgGvVi8d4kWAB/nQ=;
 b=PIFD2PkAcBtdfGneD9rdOJGSbRlyUuSajHo5rEdUXjADsabsK9eaOyFu3SMjmK39Fs
 MYrFqCKI2Kd4ntd9AaXV8eU9jGb+yNTC9Ku5Qxr0uNu2sboax8qlfTjSn/Lmx+xndcXD
 WNQg85BnCQ55UBKyglFn2HSsvvbLEEozt5WIjhlPlFsgzopHUNiXv/A9mOlJZkJPwv5G
 fWGxW7MifwodbKAKIly274PrM3e2FWqdiz/YcZ644HkCHK88cGVrftnRUIe1tHBK8tUx
 ENvkbjIC3xpUgG5SZbZvGlS5n2oB19kmyL+Du1wgrdbBysCAj+KHsV9I+KrkT7JCM5LW
 Allg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iGOVo0v3XCUiMjAb3ZKMCET9+F7mgGvVi8d4kWAB/nQ=;
 b=L7EdQCJpQPKra3O1qjPJQMxgJm5d3E5OPSpN/jFGxFD9hKzBaLGHeaUVvWf5x/sQtz
 +QQa7QBlG27qSJt5ynVKY2nFGzbpVXtpQvVGGzT5sbHELQBloOUHDQavK4YAMrmwZLj5
 czQObAqhLr3go/1lQSgR/xLO7UcFl8Jj45/045KWg6rPs13bwbk3qkJKTx4SWPzLQtwr
 BDjbPacC+Es3XWeSGYYYkj/wDgiqxb2tkJHwAyC06/oSdasCR0k5BOBvzvK8rVe0zcra
 YFe4zdb5GEC6g4gTiokq2WLvi5jE9JrylfNdfe3kq/izqoSPdYkQ3bivRosLL3pEPuRI
 d4QA==
X-Gm-Message-State: AOAM530MCwpcpTUvGgtSefRKvgQ5bbr/DfESqfE5PZjDtK8fZdj+lfa+
 BZlOQajFzoVuj8qbJRC102ZMv7k4xFygkFH1VEVCYw==
X-Google-Smtp-Source: ABdhPJz4axXxYgNaw6qv30zYaVckpnHi/S38bZVet4scjqfWTYa4pK51kVkcebfSQ3hnZ/OxwnV3PR1gwx3ni/HCqUw=
X-Received: by 2002:ab0:77d0:: with SMTP id y16mr2408304uar.46.1625257919512; 
 Fri, 02 Jul 2021 13:31:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210702194033.1370634-1-phind.uet@gmail.com>
In-Reply-To: <20210702194033.1370634-1-phind.uet@gmail.com>
Date: Fri, 2 Jul 2021 16:31:42 -0400
Message-ID: <CADVnQynvWsD2qWfw4qJsNhyyPXbFGfhZmhMzaggfJ8JtUUt9VA@mail.gmail.com>
Subject: Re: [PATCH v2] tcp: fix tcp_init_transfer() to not reset
 icsk_ca_initialized
To: Nguyen Dinh Phi <phind.uet@gmail.com>
Cc: songliubraving@fb.com, kafai@fb.com,
 syzbot+f1e24a0594d4e3a895d3@syzkaller.appspotmail.com, daniel@iogearbox.net,
 yoshfuji@linux-ipv6.org, netdev@vger.kernel.org, dsahern@kernel.org,
 john.fastabend@gmail.com, ast@kernel.org, andrii@kernel.org,
 edumazet@google.com, kpsingh@kernel.org, kuba@kernel.org, bpf@vger.kernel.org,
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

On Fri, Jul 2, 2021 at 3:41 PM Nguyen Dinh Phi <phind.uet@gmail.com> wrote:
>
> This commit fixes a bug (found by syzkaller) that could cause spurious
> double-initializations for congestion control modules, which could cause
> memory leaks orother problems for congestion control modules (like CDG)
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
> Fixes: commit 8919a9b31eb4 ("tcp: Only init congestion control if not
> initialized already")

Please note that the patchwork tools have found a style/formatting
issue with your Fixes tag:

You can find them at:
https://patchwork.kernel.org/project/netdevbpf/list/
 ->
 https://patchwork.kernel.org/project/netdevbpf/patch/20210702194033.1370634-1-phind.uet@gmail.com/
  ->
   https://patchwork.hopto.org/static/nipa/510221/12356435/verify_fixes/stdout

The error is:
---
Fixes tag: Fixes: commit 8919a9b31eb4 ("tcp: Only init congestion control if not
Has these problem(s):
- leading word 'commit' unexpected
- Subject has leading but no trailing parentheses
- Subject has leading but no trailing quotes
---

Basically, please omit the "commit" and don't wrap the text (it's OK
if it's longer than 80 or 100 characters).

thanks,
neal
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
