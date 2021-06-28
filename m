Return-Path: <SRS0=s8/Q=LW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F2C1C49EAB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 28 Jun 2021 17:20:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB62361942
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 28 Jun 2021 17:20:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB62361942
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85D3582C8E;
	Mon, 28 Jun 2021 17:20:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MyjGNsOFSRgT; Mon, 28 Jun 2021 17:20:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id AEC5882C84;
	Mon, 28 Jun 2021 17:20:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 81D5DC0010;
	Mon, 28 Jun 2021 17:20:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D8156C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Jun 2021 17:20:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2612400FD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Jun 2021 17:20:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=google.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mw_6xqKwoSxA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Jun 2021 17:20:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com
 [IPv6:2607:f8b0:4864:20::e34])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C9713400F5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Jun 2021 17:20:38 +0000 (UTC)
Received: by mail-vs1-xe34.google.com with SMTP id o7so10460435vss.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Jun 2021 10:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WCfkgePdAXqOIxhYMCh7+nsE9UVEyCQyOezwXfK4jGU=;
 b=cnlUh8EZePV1fNVsbGOiqKW75J+KfI5/gEcMyctU0EmsvIcxkeYGl3T6oMfbhC+1zh
 sVJFonJ8gW+si52FHTLci4zSkwVuZnHN4Sp9B5z3h9nRXrHoa6Hd1S08ETGbo3hJwBB5
 da0vEcvoePuMHcOjRMvRfqoUSrevbVZjKbW39sNZA7o9JdW2Y19sA9F1kTxE+kH1WGOW
 2nuTex3S4aaKH0BljzW5nyVqfhWdJb+GiHYvx451BhzROMAlFaVKxzcZRQcH8vCfzyNo
 bVi+9DoiqCZqceYFGhQFY2D5PQT4456zvGJr33FA4JqNnkc+tljZ7EVQCsXZ5zmTrmHP
 nZcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WCfkgePdAXqOIxhYMCh7+nsE9UVEyCQyOezwXfK4jGU=;
 b=Uqc4daMOC2Q5Kcp2YI7Jxp+Q9tyhjpa+Ci2Z0gRJyeoHNIEoj3t3Hu/KQaIuk9r2Dg
 7agug3Y50Pa0tvhk0jj7EVsgwTHNdMRDkF9InokFBN3qQ6AbNF+yVsUp7QQvSh5RogO9
 vofLva+1qZYJWA7ktnS94IMlAiunKGbnTZXhcLT0tE9c3RtPmIohMjWFzpzFCOTbzE0x
 ynGqb6x755GQ5RJpiAARwvoh2ywuHQyX9oyLhLRnQ1jOBzaY7s0KzTsbSd/I4+N2Dcb+
 eHcn2F4uHx0KlPKporhGnHrWveJaXmC80F9bHBM0uqqAMXsZ0e0ydHIlF2bUL+XnXNZr
 3bkA==
X-Gm-Message-State: AOAM533qfvqp96DO37istVAkUiLUTq34hbAAwrYOxh6poG0tM5ugj6lM
 WmDAwU2nzThXJsWMOvTbXlqI2nNZzK9kY0mUpZE8sQ==
X-Google-Smtp-Source: ABdhPJxiKGOBlX6w0xH2HLn2GlsqI0HtgVj7rs+38+B/6UkhcME+/mVuUGZ1XtNhmjxXMIik+jcx5oyKhKQDcSRdi1o=
X-Received: by 2002:a67:7707:: with SMTP id s7mr20202441vsc.16.1624900837435; 
 Mon, 28 Jun 2021 10:20:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210628144908.881499-1-phind.uet@gmail.com>
 <CANn89iJ6M2WFS3B+sSOysekScUFmO9q5YHxgHGsbozbvkW9ivg@mail.gmail.com>
 <79490158-e6d1-aabf-64aa-154b71205c74@gmail.com>
 <CADVnQy=Q9W=Vxu81ctPLx08D=ALnHBXGr0c4BLtQGxwQE+yjRg@mail.gmail.com>
 <ee5ef69e-ee3f-1df0-2033-5adc06a46b9c@gmail.com>
In-Reply-To: <ee5ef69e-ee3f-1df0-2033-5adc06a46b9c@gmail.com>
Date: Mon, 28 Jun 2021 13:20:19 -0400
Message-ID: <CADVnQynqMQhO4cBON=xUCkne9-E1hze3naMZZ8tQ-a0k71kh8g@mail.gmail.com>
Subject: Re: [PATCH] tcp: Do not reset the icsk_ca_initialized in
 tcp_init_transfer.
To: Phi Nguyen <phind.uet@gmail.com>
Cc: Song Liu <songliubraving@fb.com>, Martin KaFai Lau <kafai@fb.com>,
 syzbot+f1e24a0594d4e3a895d3@syzkaller.appspotmail.com,
 Daniel Borkmann <daniel@iogearbox.net>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, netdev <netdev@vger.kernel.org>,
 David Ahern <dsahern@kernel.org>, John Fastabend <john.fastabend@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Yuchung Cheng <ycheng@google.com>,
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
From: Neal Cardwell via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Neal Cardwell <ncardwell@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

)

On Mon, Jun 28, 2021 at 1:15 PM Phi Nguyen <phind.uet@gmail.com> wrote:
>
> On 6/29/2021 12:24 AM, Neal Cardwell wrote:
>
> > Thanks.
> >
> > Can you also please provide a summary of the event sequence that
> > triggers the bug? Based on your Reported-by tag, I guess this is based
> > on the syzbot reproducer:
> >
> >   https://groups.google.com/g/syzkaller-bugs/c/VbHoSsBz0hk/m/cOxOoTgPCAAJ
> >
> > but perhaps you can give a summary of the event sequence that causes
> > the bug? Is it that the call:
> >
> > setsockopt$inet_tcp_TCP_CONGESTION(r0, 0x6, 0xd,
> > &(0x7f0000000000)='cdg\x00', 0x4)
> >
> > initializes the CC and happens before the connection is established,
> > and then when the connection is established, the line that sets:
> >    icsk->icsk_ca_initialized = 0;
> > is incorrect, causing the CC to be initialized again without first
> > calling the cleanup code that deallocates the CDG-allocated memory?
> >
> > thanks,
> > neal
> >
>
> Hi Neal,
>
> The gdb stack trace that lead to init_transfer_input() is as bellow, the
> current sock state is TCP_SYN_RECV.

Thanks. That makes sense as a snapshot of time for
tcp_init_transfer(), but I think what would be more useful would be a
description of the sequence of events, including when the CC was
initialized previous to that point (as noted above, was it that the
setsockopt(TCP_CONGESTION) completed before that point?).

thanks,
neal
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
