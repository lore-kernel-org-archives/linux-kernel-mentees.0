Return-Path: <SRS0=TDrl=LX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C504C11F66
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 29 Jun 2021 08:22:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB63B61D6E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 29 Jun 2021 08:22:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB63B61D6E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8366B40154;
	Tue, 29 Jun 2021 08:22:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XYR2LdSbeVLr; Tue, 29 Jun 2021 08:22:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 927194028E;
	Tue, 29 Jun 2021 08:22:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 777CDC0010;
	Tue, 29 Jun 2021 08:22:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2DD10C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 08:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1ACC04043B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 08:22:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=google.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cnq-xTG7XZhA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 08:22:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8CDAB403DB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 08:22:12 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id p22so9853415yba.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 01:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b86U7qOD9Go7UjAxHqjyMo73nkm6a/V5QTpw7IQUw/0=;
 b=SiX9r9dgg6r6z6VL+6XFCBA8PtLqqP8EjVjknH/LRrL0MsSzgzW6NoXOwoh0xQNgPV
 6zIu/InaqEx5zmydhC+QuLMT+UMrbsEXBw2JBgAPME4uXG67oygSZzmwUNSox69rlWOl
 MX8DDVzp8OTnMDPgbU3dYgjX+GSSPjCuZ14XCNAxPWIgvPccT/Hzd3IOYj+o0/eUUvdb
 Xp+he1Qspq+Fdop1raUQPjpzigswTnTn1q2/UJAdIYap8JNAzHw0+GAejHDASg54Q5bo
 S4TvOHlDZq/nWPxwgJroeOGnUqlY5YSG7WsfshaVlEH555kOnVTzX/B0chf7qEMnaXED
 hqOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b86U7qOD9Go7UjAxHqjyMo73nkm6a/V5QTpw7IQUw/0=;
 b=SxFrrXGsRGyWxIrXC+SXDX5DSHsnF9urX4A4lwuri0AO9mMSbgWHGUiHkvDckaHN6C
 cuOPZKFAOhTBSbMvrlT14I20AlCRPgVlkbjgvTYpO/x8urXVlK8kN8wwFvSBIGi/TJ+7
 gnEERHNccDCXw4wPlE1gReRI9tp1fkF4vM0997HoGCkeMAaTFWshPMhhg0MXFQrO1uA5
 MZHmo7Y9bkJ/7jQNr4aSDkAzYCry0uFm/ZN3+w+bax6pa8A+POvnE1Ov1BeeGRMDnI1u
 SCIiviCmzh3ZCj4NSwuvzQaNlwnifKt4inz8QldF5aCiF7ZB1VL8oacup6fzMgJ1TTEM
 CNKA==
X-Gm-Message-State: AOAM533+Xk5q1VSoo4SIgE8pdIKjIBNgYdQMbCJPugg8lvQwHcI0puq0
 d7EFkAtB6sK7RlukFd/UmzCW2XwLncwjVDY48/tgIw==
X-Google-Smtp-Source: ABdhPJxeB+P2TJ4vfKfTrwgdN9swrJc/3hVQCio5bE343GXZDKj6fcFsoFxiEZmmVoGyrBJ22yERCtdFyRrcpJD+H8o=
X-Received: by 2002:a25:f0b:: with SMTP id 11mr21678043ybp.518.1624954930973; 
 Tue, 29 Jun 2021 01:22:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210628144908.881499-1-phind.uet@gmail.com>
 <CANn89iJ6M2WFS3B+sSOysekScUFmO9q5YHxgHGsbozbvkW9ivg@mail.gmail.com>
 <79490158-e6d1-aabf-64aa-154b71205c74@gmail.com>
 <CADVnQy=Q9W=Vxu81ctPLx08D=ALnHBXGr0c4BLtQGxwQE+yjRg@mail.gmail.com>
 <ee5ef69e-ee3f-1df0-2033-5adc06a46b9c@gmail.com>
 <CADVnQynqMQhO4cBON=xUCkne9-E1hze3naMZZ8tQ-a0k71kh8g@mail.gmail.com>
 <205F52AB-4A5B-4953-B97E-17E7CACBBCD8@gmail.com>
In-Reply-To: <205F52AB-4A5B-4953-B97E-17E7CACBBCD8@gmail.com>
Date: Tue, 29 Jun 2021 10:21:59 +0200
Message-ID: <CANn89iJbquZ=tVBRg7JNR8pB106UY4Xvi7zkPVn0Uov9sj8akg@mail.gmail.com>
Subject: Re: [PATCH] tcp: Do not reset the icsk_ca_initialized in
 tcp_init_transfer.
To: Nguyen Dinh Phi <phind.uet@gmail.com>
Cc: Song Liu <songliubraving@fb.com>, Martin KaFai Lau <kafai@fb.com>,
 syzbot+f1e24a0594d4e3a895d3@syzkaller.appspotmail.com,
 Daniel Borkmann <daniel@iogearbox.net>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, netdev <netdev@vger.kernel.org>,
 David Ahern <dsahern@kernel.org>, John Fastabend <john.fastabend@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Yuchung Cheng <ycheng@google.com>, kpsingh@kernel.org,
 Jakub Kicinski <kuba@kernel.org>, bpf <bpf@vger.kernel.org>,
 Neal Cardwell <ncardwell@google.com>, David Miller <davem@davemloft.net>,
 LKML <linux-kernel@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

On Tue, Jun 29, 2021 at 9:17 AM Nguyen Dinh Phi <phind.uet@gmail.com> wrote:
>
> On June 29, 2021 1:20:19 AM GMT+08:00, Neal Cardwell <ncardwell@google.com> wrote:
> >)
> >
> >On Mon, Jun 28, 2021 at 1:15 PM Phi Nguyen <phind.uet@gmail.com> wrote:
> >>
> >> On 6/29/2021 12:24 AM, Neal Cardwell wrote:
> >>
> >> > Thanks.
> >> >
> >> > Can you also please provide a summary of the event sequence that
> >> > triggers the bug? Based on your Reported-by tag, I guess this is
> >based
> >> > on the syzbot reproducer:
> >> >
> >> >
> >https://groups.google.com/g/syzkaller-bugs/c/VbHoSsBz0hk/m/cOxOoTgPCAAJ
> >> >
> >> > but perhaps you can give a summary of the event sequence that
> >causes
> >> > the bug? Is it that the call:
> >> >
> >> > setsockopt$inet_tcp_TCP_CONGESTION(r0, 0x6, 0xd,
> >> > &(0x7f0000000000)='cdg\x00', 0x4)
> >> >
> >> > initializes the CC and happens before the connection is
> >established,
> >> > and then when the connection is established, the line that sets:
> >> >    icsk->icsk_ca_initialized = 0;
> >> > is incorrect, causing the CC to be initialized again without first
> >> > calling the cleanup code that deallocates the CDG-allocated memory?
> >> >
> >> > thanks,
> >> > neal
> >> >
> >>
> >> Hi Neal,
> >>
> >> The gdb stack trace that lead to init_transfer_input() is as bellow,
> >the
> >> current sock state is TCP_SYN_RECV.
> >
> >Thanks. That makes sense as a snapshot of time for
> >tcp_init_transfer(), but I think what would be more useful would be a
> >description of the sequence of events, including when the CC was
> >initialized previous to that point (as noted above, was it that the
> >setsockopt(TCP_CONGESTION) completed before that point?).
> >
> >thanks,
> >neal
>
> I resend my message because I accidently used html format in last one. I am very sorry for the inconvenience caused.
> ---
> Yes, the CC had been initialized by the setsockopt, after that, it was initialized again in function tcp_init_transfer() because of setting isck_ca_initialized to 0.

"the setsockopt" is rather vague, sorry.


The hard part is that all scenarios have to be considered.

TCP flows can either be passive and active.

CC can be set :

1) Before the connect() or accept()
2) After the connect() or accept()
3) after the connect() but before 3WHS is completed.

So we need to make sure all cases will still work with any combination
of CDG CC (before/after) in the picture.

Note that a memory leak for a restricted CC (CDG can only be used by
CAP_NET_ADMIN privileged user)
 is a small problem compared to more serious bug that could be added
by an incomplete fix.

I also note that if icsk_ca_priv] was increased from 104 to 120 bytes,
tcp_cdg would no longer need a dynamic memory allocation.

Thank you.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
