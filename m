Return-Path: <SRS0=5SPK=LZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31DCFC11F6A
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Jul 2021 14:23:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A53B9613FE
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Jul 2021 14:23:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A53B9613FE
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 711F2405BA;
	Thu,  1 Jul 2021 14:23:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yh5vs-cVtY1g; Thu,  1 Jul 2021 14:23:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 60ACF4049F;
	Thu,  1 Jul 2021 14:23:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 481B3C0010;
	Thu,  1 Jul 2021 14:23:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 963A1C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Jul 2021 14:23:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 835104049F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Jul 2021 14:23:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S6MQukbBeH5d
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Jul 2021 14:23:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com
 [IPv6:2607:f8b0:4864:20::936])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 85C024048A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Jul 2021 14:23:31 +0000 (UTC)
Received: by mail-ua1-x936.google.com with SMTP id n61so2519461uan.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 01 Jul 2021 07:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8ZYZZPLtxm0D8wKCq6t4+Fy+RhxhZRnjK7G5sIibVAY=;
 b=kBv9cdGrIayWfMzZazwxNI9/duBTp2RkiZ5RCpTGoMmI4sxwPfmxtyqijgoC6eFaHP
 vuY6nQPmSg0rBx1F6AnU3iGjJXVrIv6hMPT5BDZnXtJ8kZ6ta2AKfwvSzsQiBoGDBLxe
 Dmi2eQ+66de1aSZjyItIFwNWh1cy7b6EjIO393RJPGKNXebp3P4Yx/mAegF28z7zxu3H
 LLjGSN1TkEEC2gynwHgOJdUg1KIDxVmNmxUfSOg+YNg1SDUVOYC9QVrLdvNk9oHHIut5
 NEaw07sNcTuAQPUw2+IKV8UcC+TCiR2ZQmvtrZRt2mROer1FgbKX1f54BG6f/nPVo19B
 +X5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8ZYZZPLtxm0D8wKCq6t4+Fy+RhxhZRnjK7G5sIibVAY=;
 b=jD2iIkiIwv3b4G+dhrkgostTldnqeg7q4MSWAGKhxKm9W2g60ZXgqzfzvA+h5WcWRJ
 1uGenC5MB6KDE49nAxQxWwY8lV2Xzf+RTQFn9Rr42qgVS7KmupJ0sI+GkBpUTK6uF8Sr
 QoKFy1IdlUkK84qzHgZOVguADrD6XabLApjnvIsHXx963aif7woDCbkKr9CWaESkUPka
 7okv5uH7Ad7jK6ycRJoO8pbWJsc52xoPDAtn2Jhslbadi/an9qn6FoqL1hVaYPKshEnN
 FQOHtiXn8bvccInDnZd9+M+HPaIaBzPp179rMeUT8IkI6OwwPbeRVGYxC5T1YrL6Vi4P
 ZwIA==
X-Gm-Message-State: AOAM533QyVKFMSfLzGaxIkJh50QckrRDmw1JsvQgv58hddpvwunB44t/
 EmoTKJsRyVt+T9H924iDLSXwiETYal15cednLfs19A==
X-Google-Smtp-Source: ABdhPJx2oBw+TeBECEm0/q5V+pChm69gVODCsQXZeTvzl9jaJ3WWW/V23J8lrJcxwiS1GyjoBORkKFEfajqRXSJj0AE=
X-Received: by 2002:ab0:3ae:: with SMTP id 43mr211048uau.63.1625149409711;
 Thu, 01 Jul 2021 07:23:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210628144908.881499-1-phind.uet@gmail.com>
 <CANn89iJ6M2WFS3B+sSOysekScUFmO9q5YHxgHGsbozbvkW9ivg@mail.gmail.com>
 <79490158-e6d1-aabf-64aa-154b71205c74@gmail.com>
 <CADVnQy=Q9W=Vxu81ctPLx08D=ALnHBXGr0c4BLtQGxwQE+yjRg@mail.gmail.com>
 <ee5ef69e-ee3f-1df0-2033-5adc06a46b9c@gmail.com>
 <CADVnQynqMQhO4cBON=xUCkne9-E1hze3naMZZ8tQ-a0k71kh8g@mail.gmail.com>
 <205F52AB-4A5B-4953-B97E-17E7CACBBCD8@gmail.com>
 <CANn89iJbquZ=tVBRg7JNR8pB106UY4Xvi7zkPVn0Uov9sj8akg@mail.gmail.com>
 <1786BBEE-9C7B-45B2-B451-F535ABB804EF@gmail.com>
 <CANn89iK4Qwf0ezWac3Cn1xWN_Hw+-QL-+H8YmDm4cZP=FH+MTQ@mail.gmail.com>
 <CADVnQyk9maCc+tJ4-b6kufcBES9+Y2KpHPZadXssoVWX=Xr1Vw@mail.gmail.com>
 <30527e25-dd66-da7a-7344-494b4539abf7@gmail.com>
In-Reply-To: <30527e25-dd66-da7a-7344-494b4539abf7@gmail.com>
Date: Thu, 1 Jul 2021 10:23:13 -0400
Message-ID: <CADVnQyn_965EHdQke_S7FUySiamyyRx-3b8o+cm+=4jYxG_GOw@mail.gmail.com>
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

On Wed, Jun 30, 2021 at 2:25 PM Phi Nguyen <phind.uet@gmail.com> wrote:
>
> On 6/29/2021 11:59 PM, Neal Cardwell wrote:
> >    On Tue, Jun 29, 2021 at 8:58 AM Eric Dumazet <edumazet@google.com> wrote:
> >  From my perspective, the bug was introduced when that 8919a9b31eb4
> > commit introduced icsk_ca_initialized and set icsk_ca_initialized to 0
> > in tcp_init_transfer(), missing the possibility that a process could
> > call setsockopt(TCP_CONGESTION)  in state TCP_SYN_SENT (i.e. after the
> > connect() or TFO open sendmsg()), which would call
> > tcp_init_congestion_control(). The 8919a9b31eb4 commit did not intend
> > to reset any initialization that the user had already explicitly made;
> > it just missed the possibility of that particular sequence (which
> > syzkaller managed to find!).
> >
> >> Although I am not sure what happens at accept() time when the listener
> >> socket is cloned.
> >
> > It seems that for listener sockets, they cannot initialize their CC
> > module state, because there is no way for them to reach
> > tcp_init_congestion_control(), since:
> >
> > (a) tcp_set_congestion_control() -> tcp_reinit_congestion_control()
> > will not call tcp_init_congestion_control() on a socket in CLOSE or
> > LISTEN
> >
> > (b) tcp_init_transfer() -> tcp_init_congestion_control() can only
> > happen for established sockets and successful TFO SYN_RECV sockets
> Is this what was mentioned in this commit ce69e563b325(tcp: make sure
> listeners don't initialize congestion-control state)

Yes, exactly.

> > --
> > [PATCH] tcp: fix tcp_init_transfer() to not reset icsk_ca_initialized
> >
> > This commit fixes a bug (found by syzkaller) that could cause spurious
> > double-initializations for congestion control modules, which could cause memory
> > leaks orother problems for congestion control modules (like CDG) that allocate
> > memory in their init functions.
> >
> > The buggy scenario constructed by syzkaller was something like:
> >
> > (1) create a TCP socket
> > (2) initiate a TFO connect via sendto()
> > (3) while socket is in TCP_SYN_SENT, call setsockopt(TCP_CONGESTION),
> >      which calls:
> >         tcp_set_congestion_control() ->
> >           tcp_reinit_congestion_control() ->
> >             tcp_init_congestion_control()
> > (4) receive ACK, connection is established, call tcp_init_transfer(),
> >      set icsk_ca_initialized=0 (without first calling cc->release()),
> >      call tcp_init_congestion_control() again.
> >
> > Note that in this sequence tcp_init_congestion_control() is called twice
> > without a cc->release() call in between. Thus, for CC modules that allocate
> > memory in their init() function, e.g, CDG, a memory leak may occur. The
> > syzkaller tool managed to find a reproducer that triggered such a leak in CDG.
> >
> > The bug was introduced when that 8919a9b31eb4 commit introduced
> > icsk_ca_initialized and set icsk_ca_initialized to 0 in tcp_init_transfer(),
> > missing the possibility for a sequence like the one above, where a process
> > could call setsockopt(TCP_CONGESTION) in state TCP_SYN_SENT (i.e. after the
> > connect() or TFO open sendmsg()), which would call
> > tcp_init_congestion_control(). The 8919a9b31eb4 commit did not intend to reset
> > any initialization that the user had already explicitly made; it just missed
> > the possibility of that particular sequence (which syzkaller managed to find).
>
> Could I use your commit message when I resubmit patch?

Yes, feel free to use that commit message verbatim or modified.

thanks,
neal
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
