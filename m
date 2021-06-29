Return-Path: <SRS0=TDrl=LX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B7B7C11F66
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 29 Jun 2021 06:03:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C73BD61D7E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 29 Jun 2021 06:03:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C73BD61D7E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8EC7B4027E;
	Tue, 29 Jun 2021 06:03:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t0XkEmvBqwUS; Tue, 29 Jun 2021 06:03:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 7561F40272;
	Tue, 29 Jun 2021 06:03:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 46B9AC0010;
	Tue, 29 Jun 2021 06:03:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0F696C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 06:03:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E43D04027E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 06:03:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QmJT5Xgw1pxL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 06:03:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EAC8040272
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 06:03:46 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id 22so19012297oix.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Jun 2021 23:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GaCwd0jzDU1Kn8q/ck7uijDsSE6ODEl2bIRRPi5gt8g=;
 b=ajF2KyFS5CpDvhd7c2XGFQVe0e4EvqE7Un69VXabDLGT6/soH1/UnXDVVTgOX0tAZy
 o/DrnuissBmhnGVgGC0aMcHj5qjzQOsvuBKahpH5oRWfgdXDN/FJ6X5NQc31WGktiWk9
 3dwb4Ss6QMT1K/A+JEuwjd3zSuoFhKIfdyV7pNtxBdbVpqX7+RE58M9S1osW4N3pjXlD
 tAdm3+qAzojLQa3r9RErq6MlfmlHVahFsp/9t1Eew8jvcTAx36kaZLqdTKphfqaAbhDp
 PPgrLEUKdIZ971jieg2UrKNO+MBFW5t2j/Pjh214s1fa1svSlsq3MXIU+AgRzlq4MKSk
 OIJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GaCwd0jzDU1Kn8q/ck7uijDsSE6ODEl2bIRRPi5gt8g=;
 b=oaK5Bi7RqbdyNT1HUwKcAPlUb7UUxYWVJ534+w4XlR2TRS9GWOERYgzW6EmTedIZz1
 P6Bzo0yYF+5+SK2Rl+pgmA9eYnv0h1iOrup6KHy9Kx08brHoQ4XjSabDMEZdpFZFADPQ
 7oD6J8FSO6mvc1dgPLWTb+zyn4bwi9i402XNbOmWz8inGL8ihXLOVza6F3j+3Wzk05hK
 tTpcw6wfpi3X5f5wWByVI80CAwo9lI5ZYd39zCcsdSbXcfGMpYuRrkpw+dxbDViR8Vy7
 7d2CyZm2sV+ZmUOZVahqSZBPPC8Sm3NidkKxiClfQqxvZmUg2L2N+bKiJZz/ng5xfccv
 2AGg==
X-Gm-Message-State: AOAM5309cXKf373wq4uvSKRG7sQ3qJap18XAj6OgWAgbUIhQPKNR/lfh
 MRArM6qGdc5LCZY75hyqIXTPVEoi20ywXr4n8Ng=
X-Google-Smtp-Source: ABdhPJzEdSfeEkoJj38vnLeRuy8Yj9sj/5F4DrQ+9tf5XReHkp8o3/X90CAbmyue83lYTSTJVC3RCuMjfz6jS+nlh/s=
X-Received: by 2002:a05:6808:9b7:: with SMTP id
 e23mr9528344oig.2.1624946625888; 
 Mon, 28 Jun 2021 23:03:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210628144908.881499-1-phind.uet@gmail.com>
 <CANn89iJ6M2WFS3B+sSOysekScUFmO9q5YHxgHGsbozbvkW9ivg@mail.gmail.com>
 <79490158-e6d1-aabf-64aa-154b71205c74@gmail.com>
 <CADVnQy=Q9W=Vxu81ctPLx08D=ALnHBXGr0c4BLtQGxwQE+yjRg@mail.gmail.com>
 <ee5ef69e-ee3f-1df0-2033-5adc06a46b9c@gmail.com>
 <CADVnQynqMQhO4cBON=xUCkne9-E1hze3naMZZ8tQ-a0k71kh8g@mail.gmail.com>
In-Reply-To: <CADVnQynqMQhO4cBON=xUCkne9-E1hze3naMZZ8tQ-a0k71kh8g@mail.gmail.com>
From: Phi Nguyen Dinh <phind.uet@gmail.com>
Date: Tue, 29 Jun 2021 14:03:34 +0800
Message-ID: <CAL5WHMKsbztFj6sRknCuA7XTt2i9pG=8Ui3uTeB-1rwpbtC-KQ@mail.gmail.com>
Subject: Re: [PATCH] tcp: Do not reset the icsk_ca_initialized in
 tcp_init_transfer.
To: Neal Cardwell <ncardwell@google.com>
Cc: Song Liu <songliubraving@fb.com>, Martin KaFai Lau <kafai@fb.com>,
 syzbot <syzbot+f1e24a0594d4e3a895d3@syzkaller.appspotmail.com>,
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
Content-Type: multipart/mixed; boundary="===============6823569143354648338=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============6823569143354648338==
Content-Type: multipart/alternative; boundary="0000000000006a486305c5e15eb9"

--0000000000006a486305c5e15eb9
Content-Type: text/plain; charset="UTF-8"

Yes, the CC had been initialized by setsockopt, after that, it was
intialized again in function tcp_init_transfer() because of
setting icsk_ca_initialized to 0.

Regards,

On Tue, Jun 29, 2021, 01:20 Neal Cardwell <ncardwell@google.com> wrote:

> )
>
> On Mon, Jun 28, 2021 at 1:15 PM Phi Nguyen <phind.uet@gmail.com> wrote:
> >
> > On 6/29/2021 12:24 AM, Neal Cardwell wrote:
> >
> > > Thanks.
> > >
> > > Can you also please provide a summary of the event sequence that
> > > triggers the bug? Based on your Reported-by tag, I guess this is based
> > > on the syzbot reproducer:
> > >
> > >
> https://groups.google.com/g/syzkaller-bugs/c/VbHoSsBz0hk/m/cOxOoTgPCAAJ
> > >
> > > but perhaps you can give a summary of the event sequence that causes
> > > the bug? Is it that the call:
> > >
> > > setsockopt$inet_tcp_TCP_CONGESTION(r0, 0x6, 0xd,
> > > &(0x7f0000000000)='cdg\x00', 0x4)
> > >
> > > initializes the CC and happens before the connection is established,
> > > and then when the connection is established, the line that sets:
> > >    icsk->icsk_ca_initialized = 0;
> > > is incorrect, causing the CC to be initialized again without first
> > > calling the cleanup code that deallocates the CDG-allocated memory?
> > >
> > > thanks,
> > > neal
> > >
> >
> > Hi Neal,
> >
> > The gdb stack trace that lead to init_transfer_input() is as bellow, the
> > current sock state is TCP_SYN_RECV.
>
> Thanks. That makes sense as a snapshot of time for
> tcp_init_transfer(), but I think what would be more useful would be a
> description of the sequence of events, including when the CC was
> initialized previous to that point (as noted above, was it that the
> setsockopt(TCP_CONGESTION) completed before that point?).
>
> thanks,
> neal
>

--0000000000006a486305c5e15eb9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div style=3D"font-family:sans-serif;font-size:12.8px" di=
r=3D"auto">Yes, the CC had been initialized by setsockopt, after that, it w=
as intialized again in function tcp_init_transfer() because of setting=C2=
=A0icsk_ca_initialized to 0.</div><div dir=3D"auto" style=3D"font-family:sa=
ns-serif;font-size:12.8px"><font face=3D"sans-serif"><br></font></div><div =
dir=3D"auto" style=3D"font-family:sans-serif;font-size:12.8px"><font face=
=3D"sans-serif">Regards,</font></div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 29, 2021, 01:20 Neal Cardw=
ell &lt;<a href=3D"mailto:ncardwell@google.com">ncardwell@google.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">)<br>
<br>
On Mon, Jun 28, 2021 at 1:15 PM Phi Nguyen &lt;<a href=3D"mailto:phind.uet@=
gmail.com" target=3D"_blank" rel=3D"noreferrer">phind.uet@gmail.com</a>&gt;=
 wrote:<br>
&gt;<br>
&gt; On 6/29/2021 12:24 AM, Neal Cardwell wrote:<br>
&gt;<br>
&gt; &gt; Thanks.<br>
&gt; &gt;<br>
&gt; &gt; Can you also please provide a summary of the event sequence that<=
br>
&gt; &gt; triggers the bug? Based on your Reported-by tag, I guess this is =
based<br>
&gt; &gt; on the syzbot reproducer:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0<a href=3D"https://groups.google.com/g/syzkaller-bugs=
/c/VbHoSsBz0hk/m/cOxOoTgPCAAJ" rel=3D"noreferrer noreferrer" target=3D"_bla=
nk">https://groups.google.com/g/syzkaller-bugs/c/VbHoSsBz0hk/m/cOxOoTgPCAAJ=
</a><br>
&gt; &gt;<br>
&gt; &gt; but perhaps you can give a summary of the event sequence that cau=
ses<br>
&gt; &gt; the bug? Is it that the call:<br>
&gt; &gt;<br>
&gt; &gt; setsockopt$inet_tcp_TCP_CONGESTION(r0, 0x6, 0xd,<br>
&gt; &gt; &amp;(0x7f0000000000)=3D&#39;cdg\x00&#39;, 0x4)<br>
&gt; &gt;<br>
&gt; &gt; initializes the CC and happens before the connection is establish=
ed,<br>
&gt; &gt; and then when the connection is established, the line that sets:<=
br>
&gt; &gt;=C2=A0 =C2=A0 icsk-&gt;icsk_ca_initialized =3D 0;<br>
&gt; &gt; is incorrect, causing the CC to be initialized again without firs=
t<br>
&gt; &gt; calling the cleanup code that deallocates the CDG-allocated memor=
y?<br>
&gt; &gt;<br>
&gt; &gt; thanks,<br>
&gt; &gt; neal<br>
&gt; &gt;<br>
&gt;<br>
&gt; Hi Neal,<br>
&gt;<br>
&gt; The gdb stack trace that lead to init_transfer_input() is as bellow, t=
he<br>
&gt; current sock state is TCP_SYN_RECV.<br>
<br>
Thanks. That makes sense as a snapshot of time for<br>
tcp_init_transfer(), but I think what would be more useful would be a<br>
description of the sequence of events, including when the CC was<br>
initialized previous to that point (as noted above, was it that the<br>
setsockopt(TCP_CONGESTION) completed before that point?).<br>
<br>
thanks,<br>
neal<br>
</blockquote></div>

--0000000000006a486305c5e15eb9--

--===============6823569143354648338==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============6823569143354648338==--
