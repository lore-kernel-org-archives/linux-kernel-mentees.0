Return-Path: <SRS0=J4w3=L4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38A73C07E95
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  4 Jul 2021 13:53:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCEFC613C1
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  4 Jul 2021 13:53:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCEFC613C1
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 82A61400FD;
	Sun,  4 Jul 2021 13:53:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VmFQzzKz-7GR; Sun,  4 Jul 2021 13:53:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 74966400BE;
	Sun,  4 Jul 2021 13:53:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 48A62C001A;
	Sun,  4 Jul 2021 13:53:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AB8E0C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  4 Jul 2021 13:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 88E81605B1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  4 Jul 2021 13:53:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=google.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id raJGM3OXA4bB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  4 Jul 2021 13:53:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com
 [IPv6:2607:f8b0:4864:20::e30])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B85DE605A3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  4 Jul 2021 13:53:17 +0000 (UTC)
Received: by mail-vs1-xe30.google.com with SMTP id x15so7148006vsc.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 04 Jul 2021 06:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZQuAsDvrhcwPhVu4fBwG7UC8O9iGblBMS3S//3ZW4B4=;
 b=ut0iRLwtu/ZZvmHgjXmY0aDVHn2gPhjT73/Yxj6ZTSwZUvAINbPx0s6f7WzhiwXOS9
 EYUIl5AXaSPR38q7+7bDi03syUOco9ANLvRCqjFXdtfVt/u+PduNDkfE5rEzab8jiGsI
 7nlonr29WHw7itOXch0XFkw62sEFrEXeYh5I7O+VaiWjxQA19/Pcyy/j1CVJMBVTT65y
 Xjc7GwY2Xc8ZS4gtXzPvCl31K69OHuPx86+hNNqcxJ+HZC1QWvpmOq8H/CTmpx2z6Gdk
 b2jCpRuhWl7hFMGfUHzhsmL8q5M3tE6p0JZrWkMy6N6tG72poHxmKV90bDIz8AMvrBeP
 x0MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZQuAsDvrhcwPhVu4fBwG7UC8O9iGblBMS3S//3ZW4B4=;
 b=ICLqBueSKEI8c524ZlyujPbOtH+I5be01jwu9YDYjYgHI82wrbIEVAwrZNkXn6uLTq
 SXZ6j3GIHehvTVGEmuetdaeH4wU9HBUrvwOMp2aISHzQmf8bM0qQPr7t4HsSN5eMm/BH
 Xj54wjr3EQ1tUgUWNxM95lqE2xlZcUCRKsB7zq+OW/NnPcjLeDIxrRQXR0Lk/Q5Cixx7
 IeYvSjnRvCWf1gpyco4y4ZWzqTPpD33CRD/u450GerX65b4+Be9tsi4cF5WG3Pv07yd9
 r1m64fPiotOKBCTjfPW9yo6cyzqmKnhbpmXxZ5nAoSNHh8ZejpPj3uIG7sS52jxvbqap
 Z5EQ==
X-Gm-Message-State: AOAM5319sr7WTm4EiJeoC7S3NQSNAqDz5IlCUYwxq30IpBuPOP7MnQ+N
 6vxHqslT6pO2hLSM/6lyZ06rGLR0J9eZ4x12TCCSQA==
X-Google-Smtp-Source: ABdhPJyT/3jDaxBNa4Cn2oL07bjevDOUk417CSEFdPSxGTVvrSuhaWpHfrSLazyFeg/RZ7SljWdTWfS4oAL0yTTW3hw=
X-Received: by 2002:a67:804e:: with SMTP id b75mr6451764vsd.8.1625406796369;
 Sun, 04 Jul 2021 06:53:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210703093417.1569943-1-phind.uet@gmail.com>
 <20210703.144945.1327654903412498334.davem@davemloft.net>
In-Reply-To: <20210703.144945.1327654903412498334.davem@davemloft.net>
Date: Sun, 4 Jul 2021 09:52:59 -0400
Message-ID: <CADVnQynxFKthexWRFRGN_9enRt7cmgrNo7mpNOMpNVm_jJpt4w@mail.gmail.com>
Subject: Re: [PATCH v4] tcp: fix tcp_init_transfer() to not reset
 icsk_ca_initialized
To: David Miller <davem@davemloft.net>
Cc: songliubraving@fb.com,
 syzbot+f1e24a0594d4e3a895d3@syzkaller.appspotmail.com, daniel@iogearbox.net,
 yoshfuji@linux-ipv6.org, netdev@vger.kernel.org, dsahern@kernel.org,
 john.fastabend@gmail.com, ast@kernel.org, andrii@kernel.org,
 edumazet@google.com, yyd@google.com, ycheng@google.com, kuba@kernel.org,
 kpsingh@kernel.org, yhs@fb.com, bpf@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, kafai@fb.com,
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
Content-Type: multipart/mixed; boundary="===============4169453306100532422=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============4169453306100532422==
Content-Type: multipart/alternative; boundary="000000000000b6e87105c64c8216"

--000000000000b6e87105c64c8216
Content-Type: text/plain; charset="UTF-8"

On Sat, Jul 3, 2021 at 5:49 PM David Miller <davem@davemloft.net> wrote:
>
> From: Nguyen Dinh Phi <phind.uet@gmail.com>
> Date: Sat,  3 Jul 2021 17:34:17 +0800
>
> > diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> > index 7d5e59f688de..855ada2be25e 100644
> > --- a/net/ipv4/tcp_input.c
> > +++ b/net/ipv4/tcp_input.c
> > @@ -5922,7 +5922,6 @@ void tcp_init_transfer(struct sock *sk, int
bpf_op, struct sk_buff *skb)
> >               tp->snd_cwnd = tcp_init_cwnd(tp, __sk_dst_get(sk));
> >       tp->snd_cwnd_stamp = tcp_jiffies32;
> >
> > -     icsk->icsk_ca_initialized = 0;
> >       bpf_skops_established(sk, bpf_op, skb);
> >       if (!icsk->icsk_ca_initialized)
> >               tcp_init_congestion_control(sk);
>
> Don't you have to make the tcp_init_congestion_control() call
unconditional now?

I think we want to keep it conditional, to avoid double-initialization if
the BPF code sets the congestion control algorithm and initializes it. But
that's relatively new and subtle, so it might be nice for this patch to add
a comment about that, since it's touching this part of the code anyway:

-       icsk->icsk_ca_initialized = 0;
        bpf_skops_established(sk, bpf_op, skb);
+       /* Initialize congestion control unless a BPF op initialized it
already: */
        if (!icsk->icsk_ca_initialized)
                tcp_init_congestion_control(sk);

neal

--000000000000b6e87105c64c8216
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Sat, Jul 3, 2021 at 5:49 PM David Miller &lt;<a=
 href=3D"mailto:davem@davemloft.net">davem@davemloft.net</a>&gt; wrote:<br>=
&gt;<br>&gt; From: Nguyen Dinh Phi &lt;<a href=3D"mailto:phind.uet@gmail.co=
m">phind.uet@gmail.com</a>&gt;<br>&gt; Date: Sat, =C2=A03 Jul 2021 17:34:17=
 +0800<br>&gt;<br>&gt; &gt; diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tc=
p_input.c<br>&gt; &gt; index 7d5e59f688de..855ada2be25e 100644<br>&gt; &gt;=
 --- a/net/ipv4/tcp_input.c<br>&gt; &gt; +++ b/net/ipv4/tcp_input.c<br>&gt;=
 &gt; @@ -5922,7 +5922,6 @@ void tcp_init_transfer(struct sock *sk, int bpf=
_op, struct sk_buff *skb)<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 tp-&gt;snd_cwnd =3D tcp_init_cwnd(tp, __sk_dst_get(sk));<br>&=
gt; &gt; =C2=A0 =C2=A0 =C2=A0 tp-&gt;snd_cwnd_stamp =3D tcp_jiffies32;<br>&=
gt; &gt;<br>&gt; &gt; - =C2=A0 =C2=A0 icsk-&gt;icsk_ca_initialized =3D 0;<b=
r>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 bpf_skops_established(sk, bpf_op, skb);<br=
>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 if (!icsk-&gt;icsk_ca_initialized)<br>&gt; =
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcp_init_congestion_c=
ontrol(sk);<br>&gt;<br>&gt; Don&#39;t you have to make the tcp_init_congest=
ion_control() call unconditional now?<div><br></div><div>I think we want to=
 keep it conditional, to avoid double-initialization if the BPF code sets t=
he congestion control algorithm and initializes it. But that&#39;s relative=
ly new and subtle, so it might be nice for this patch to add a comment abou=
t that, since it&#39;s touching this part of the code anyway:</div><div><br=
></div><div>-=C2=A0 =C2=A0 =C2=A0 =C2=A0icsk-&gt;icsk_ca_initialized =3D 0;=
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 bpf_skops_established(sk, bpf_op, skb);</di=
v><div>+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Initialize congestion control unless =
a BPF op initialized it already: */</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
f (!icsk-&gt;icsk_ca_initialized)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 tcp_init_congestion_control(sk);<br></div><div><br></div>=
<div>neal</div><div><br></div></div>

--000000000000b6e87105c64c8216--

--===============4169453306100532422==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============4169453306100532422==--
