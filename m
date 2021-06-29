Return-Path: <SRS0=TDrl=LX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10E9CC11F68
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 29 Jun 2021 16:00:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A78861DC8
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 29 Jun 2021 16:00:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A78861DC8
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 662B660829;
	Tue, 29 Jun 2021 16:00:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h_4OdHkJ72O4; Tue, 29 Jun 2021 16:00:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 6C8F0607E5;
	Tue, 29 Jun 2021 16:00:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4BCDCC001A;
	Tue, 29 Jun 2021 16:00:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B4EF8C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 16:00:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 96AF560818
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 16:00:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pnNUfRO9pua1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 16:00:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com
 [IPv6:2607:f8b0:4864:20::e2d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B253D607E5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 16:00:01 +0000 (UTC)
Received: by mail-vs1-xe2d.google.com with SMTP id u10so12387286vsu.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 09:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XhBLIZ8SeN0Q4YkyREg3OHNcuvIGJYM1mFWikBEBPjU=;
 b=FNLQ9Y+Fv5j4B6qlfvyZe82uBP23klCkWrC+zqTQCsIKE9CExq5Wu3RYv92l0WWnuX
 OZOi5q2iZAlkBZZONRziR9DxhUBzG9qRJIWj+85GGmVWGjSJESzhulPiLgA8E1cOS7gi
 Q6ybHlbpK/8HeKc4zyiPQXwNfl4mWqhmi0pJz3az+GiZzWjUqgAjXPbrZvmZTkkeFA9j
 MyzyZWHf2KRP14eJYRtPRi0l6A5wzUfiu689G7caqSon0tLYoLxQn9T9/7PbERYJ8Ysi
 Pb2WtmowmxRgENSjeCtuNeE/oir4tnyMBUjVkCwlvP+9tVCdhRe3IE3znOORbBtwhHn0
 7DsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XhBLIZ8SeN0Q4YkyREg3OHNcuvIGJYM1mFWikBEBPjU=;
 b=tIjo4WmesN0A8mOlAi7FvUAYuya/tcg/9zi1J+xUQXsLLeq6FMmMk1a5CmQ38YW2tW
 So/urLkl7o9g+vcz2cCyp9W8R/el62SbbNdRe7dxKcmUK44ybaQF3TGFvB3Hdjpvri8q
 /YnJxiKv51JtTBsUHfTeod8Bd8s8/c3ivTBkGUONJAaYBGljcNv2NGf7kxqiJA6J6Ixa
 Hxj34yQEStIvdr22ngm7L46Es0OSXeud6Jr0ywJkIAzN6Jldxo+ldUO7dJD0+VVMwn1b
 MpqhIm6vyvwlSvY39onJFEBlmufy7TQ/j9SuSYcVfn/nTWWWSK5OIKULFL9q0S+YlX6g
 Roow==
X-Gm-Message-State: AOAM530ZsKxha/ykWve6yy/3Eamvov4vrwzfK30jpN4S6iitugw5JHzw
 Lb1liLh9AHvYYB9nWvoi/Mf1EgJccbxR/udSRW8a+g==
X-Google-Smtp-Source: ABdhPJwobUDC1855lf1exKUJy1yWcCxV2mM/hLHb8peV3rSrtPvrKzHsicCp5dWdk4WZMrWLD9E2gkICoF7r5fVgRlY=
X-Received: by 2002:a05:6102:a33:: with SMTP id
 19mr24990687vsb.54.1624982400345; 
 Tue, 29 Jun 2021 09:00:00 -0700 (PDT)
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
In-Reply-To: <CANn89iK4Qwf0ezWac3Cn1xWN_Hw+-QL-+H8YmDm4cZP=FH+MTQ@mail.gmail.com>
Date: Tue, 29 Jun 2021 11:59:43 -0400
Message-ID: <CADVnQyk9maCc+tJ4-b6kufcBES9+Y2KpHPZadXssoVWX=Xr1Vw@mail.gmail.com>
Subject: Re: [PATCH] tcp: Do not reset the icsk_ca_initialized in
 tcp_init_transfer.
To: Eric Dumazet <edumazet@google.com>
Cc: Song Liu <songliubraving@fb.com>, Martin KaFai Lau <kafai@fb.com>,
 syzbot+f1e24a0594d4e3a895d3@syzkaller.appspotmail.com,
 Daniel Borkmann <daniel@iogearbox.net>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, netdev <netdev@vger.kernel.org>,
 David Ahern <dsahern@kernel.org>, John Fastabend <john.fastabend@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Yuchung Cheng <ycheng@google.com>, kpsingh@kernel.org,
 Jakub Kicinski <kuba@kernel.org>, bpf <bpf@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
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

  On Tue, Jun 29, 2021 at 8:58 AM Eric Dumazet <edumazet@google.com> wrote:
> > Because the problem only happens with CDG, is adding check in its tcp_cdg_init() function Ok? And about  icsk_ca_initialized, Could I expect it to be 0 in CC's init functions?
>
> I think icsk_ca_initialized  lost its strong meaning when CDG was
> introduced (since this is the only CC allocating memory)
>
> The bug really is that before clearing icsk_ca_initialized we should
> call cc->release()
>
> Maybe we missed this cleanup in commit
> 8919a9b31eb4fb4c0a93e5fb350a626924302aa6 ("tcp: Only init congestion
> control if not initialized already")

From my perspective, the bug was introduced when that 8919a9b31eb4
commit introduced icsk_ca_initialized and set icsk_ca_initialized to 0
in tcp_init_transfer(), missing the possibility that a process could
call setsockopt(TCP_CONGESTION)  in state TCP_SYN_SENT (i.e. after the
connect() or TFO open sendmsg()), which would call
tcp_init_congestion_control(). The 8919a9b31eb4 commit did not intend
to reset any initialization that the user had already explicitly made;
it just missed the possibility of that particular sequence (which
syzkaller managed to find!).

> Although I am not sure what happens at accept() time when the listener
> socket is cloned.

It seems that for listener sockets, they cannot initialize their CC
module state, because there is no way for them to reach
tcp_init_congestion_control(), since:

(a) tcp_set_congestion_control() -> tcp_reinit_congestion_control()
will not call tcp_init_congestion_control() on a socket in CLOSE or
LISTEN

(b) tcp_init_transfer() -> tcp_init_congestion_control() can only
happen for established sockets and successful TFO SYN_RECV sockets

So it seems my previously suggested change (yesterday in this thread)
to add icsk_ca_initialized=0 in tcp_ca_openreq_child() is not needed.

> If we make any hypothesis, we need to check all CC modules to make
> sure they respect it.

AFAICT the fix is correct; it just needs a Fixes: tag and a more clear
description in the commit message.

I have cherry-picked the patch into our kernel and verified it passes
all of our internal packetdrill tests.

So the diff seems OK, but I would suggest a commit message something
like the following:

--
[PATCH] tcp: fix tcp_init_transfer() to not reset icsk_ca_initialized

This commit fixes a bug (found by syzkaller) that could cause spurious
double-initializations for congestion control modules, which could cause memory
leaks orother problems for congestion control modules (like CDG) that allocate
memory in their init functions.

The buggy scenario constructed by syzkaller was something like:

(1) create a TCP socket
(2) initiate a TFO connect via sendto()
(3) while socket is in TCP_SYN_SENT, call setsockopt(TCP_CONGESTION),
    which calls:
       tcp_set_congestion_control() ->
         tcp_reinit_congestion_control() ->
           tcp_init_congestion_control()
(4) receive ACK, connection is established, call tcp_init_transfer(),
    set icsk_ca_initialized=0 (without first calling cc->release()),
    call tcp_init_congestion_control() again.

Note that in this sequence tcp_init_congestion_control() is called twice
without a cc->release() call in between. Thus, for CC modules that allocate
memory in their init() function, e.g, CDG, a memory leak may occur. The
syzkaller tool managed to find a reproducer that triggered such a leak in CDG.

The bug was introduced when that 8919a9b31eb4 commit introduced
icsk_ca_initialized and set icsk_ca_initialized to 0 in tcp_init_transfer(),
missing the possibility for a sequence like the one above, where a process
could call setsockopt(TCP_CONGESTION) in state TCP_SYN_SENT (i.e. after the
connect() or TFO open sendmsg()), which would call
tcp_init_congestion_control(). The 8919a9b31eb4 commit did not intend to reset
any initialization that the user had already explicitly made; it just missed
the possibility of that particular sequence (which syzkaller managed to find).

Fixes: 8919a9b31eb4 ("tcp: Only init congestion control if not
initialized already")
Reported-by: syzbot+f1e24a0594d4e3a895d3@syzkaller.appspotmail.com
Signed-off-by: Nguyen Dinh Phi <phind.uet@gmail.com>
--

neal
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
