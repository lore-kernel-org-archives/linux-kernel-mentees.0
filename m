Return-Path: <SRS0=tCTQ=BK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7653CC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 31 Jul 2020 06:31:15 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 419A5208E4
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 31 Jul 2020 06:31:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AUuoVexf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 419A5208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1F1CE88643;
	Fri, 31 Jul 2020 06:31:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RzHpzt97MP1z; Fri, 31 Jul 2020 06:31:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 017728863B;
	Fri, 31 Jul 2020 06:31:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EC288C0050;
	Fri, 31 Jul 2020 06:31:13 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B76E0C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 06:31:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B335988726
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 06:31:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tpcx7OQMDMKZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 06:31:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id F323E88724
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 06:31:10 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id e22so6868488pjt.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 23:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=OkHrzkvqQOkNnIMfLCTjwGd6pAzwS2PRgrU3IEyCHzY=;
 b=AUuoVexf2t32j1I8FxrcXS3p1JwUsWxr3Iyv6KR5VyDoJMaK91gR4qzPFhui24CMw1
 aSNozAILzSRNs3LTMcNtZIJr782CJscWGqxnmncr5kO2VrJxWSsdnhwh+udiH3M7uZWx
 jDlU0VdThEGsUfOOlavyHtpeUzSJ5bjTu/7MLQZlC1vp2tS1kV9o77DVc7hWqO9+92NM
 FUF91OQkrgHArv6yty6tp8MpQ+e+NAcpMHgiLTAII6apFDGsjijnJwInPfSAE/7VvvWL
 5BXGRVHtmM7syAIlT7mc4iHf2ynZ0hyxk0ta76T1zeBtj50ND/LeEjM7tHnG570ZkKw+
 n/8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=OkHrzkvqQOkNnIMfLCTjwGd6pAzwS2PRgrU3IEyCHzY=;
 b=bNW8/WQs9tyKE7/3f63OeN2IzyAKYR9HS4WZHoGPw8K8ta/S6a6DLfgJUNT07tnM2m
 GL8bwaUmswpbhqcYryv6RQBIP0fu/YFDgK3dBdLw1QVLSDlO0GO45rkTVxJbjKB7+GcI
 iAARBK3P6WfMIK+g7wMgQrsAp1NJr+lrzP99br+dwLldAHne8Lbblh5IQx8sfb5sE4o0
 LFOtNqeOk+Z3dBL43xXwbXF2zCEVWdtQwQ5KlR6qnAWiVCk5AeGgFpN/VJiGnjm01XMc
 jQXi7a4k8D5VCKm8xKDdzx5I9OI1/eWvbzvNQ47NJDBcBWpepTlqQM5oqTnsyLYhGjVI
 q90Q==
X-Gm-Message-State: AOAM5318RECC7OZS66NTnq1hhQQ1h9BUpnhOEsbdO/IV65fKWNE4AwQG
 TcHPZPNIiN7c45sMbYqRb7sNR5g4XeZ7Ye8uysG6wLIs
X-Google-Smtp-Source: ABdhPJzN9XE6Z0IrUoFRAiP7KUkVpJeiBm48VNRy+Cse7Sj8NL/n54c6pVrNMQ/1f1iHbtfkrK+LZd+hOqMnRjuDo/c=
X-Received: by 2002:a17:90a:fa06:: with SMTP id
 cm6mr2755718pjb.129.1596177070610; 
 Thu, 30 Jul 2020 23:31:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90b:17d1:0:0:0:0 with HTTP; Thu, 30 Jul 2020 23:31:09
 -0700 (PDT)
In-Reply-To: <20200731045301.GI75549@unreal>
References: <20200730192026.110246-1-yepeilin.cs@gmail.com>
 <20200731045301.GI75549@unreal>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 31 Jul 2020 09:31:09 +0300
Message-ID: <CAHp75VcfhO+hZyp7hDGdaPOnfu3Js3VNAO7fcnRHcvTa=s6SLw@mail.gmail.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: "rds-devel@oss.oracle.com" <rds-devel@oss.oracle.com>,
 Arnd Bergmann <arnd@arndb.de>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 Santosh Shilimkar <santosh.shilimkar@oracle.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 Peilin Ye <yepeilin.cs@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [Linux-kernel-mentees] [PATCH net] rds: Prevent kernel-infoleak
 in rds_notify_queue_get()
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
Content-Type: multipart/mixed; boundary="===============8257293792539002728=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============8257293792539002728==
Content-Type: multipart/alternative; boundary="0000000000004add7405abb6effb"

--0000000000004add7405abb6effb
Content-Type: text/plain; charset="UTF-8"

On Friday, July 31, 2020, Leon Romanovsky <leon@kernel.org> wrote:

> On Thu, Jul 30, 2020 at 03:20:26PM -0400, Peilin Ye wrote:
> > rds_notify_queue_get() is potentially copying uninitialized kernel stack
> > memory to userspace since the compiler may leave a 4-byte hole at the end
> > of `cmsg`.
> >
> > In 2016 we tried to fix this issue by doing `= { 0 };` on `cmsg`, which
> > unfortunately does not always initialize that 4-byte hole. Fix it by
> using
> > memset() instead.
>
> Of course, this is the difference between "{ 0 }" and "{}" initializations.
>
> >
> > Cc: stable@vger.kernel.org
> > Fixes: f037590fff30 ("rds: fix a leak of kernel memory")
> > Fixes: bdbe6fbc6a2f ("RDS: recv.c")
> > Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> > ---
> > Note: the "real" copy_to_user() happens in put_cmsg(), where
> > `cmlen - sizeof(*cm)` equals to `sizeof(cmsg)`.
> >
> > Reference: https://lwn.net/Articles/417989/
> >
> > $ pahole -C "rds_rdma_notify" net/rds/recv.o
> > struct rds_rdma_notify {
> >       __u64                      user_token;           /*     0     8 */
> >       __s32                      status;               /*     8     4 */
> >
> >       /* size: 16, cachelines: 1, members: 2 */
> >       /* padding: 4 */
> >       /* last cacheline: 16 bytes */
> > };
> >
> >  net/rds/recv.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/net/rds/recv.c b/net/rds/recv.c
> > index c8404971d5ab..aba4afe4dfed 100644
> > --- a/net/rds/recv.c
> > +++ b/net/rds/recv.c
> > @@ -450,12 +450,13 @@ static int rds_still_queued(struct rds_sock *rs,
> struct rds_incoming *inc,
> >  int rds_notify_queue_get(struct rds_sock *rs, struct msghdr *msghdr)
> >  {
> >       struct rds_notifier *notifier;
> > -     struct rds_rdma_notify cmsg = { 0 }; /* fill holes with zero */
> > +     struct rds_rdma_notify cmsg;
> >       unsigned int count = 0, max_messages = ~0U;
> >       unsigned long flags;
> >       LIST_HEAD(copy);
> >       int err = 0;
> >
> > +     memset(&cmsg, 0, sizeof(cmsg)); /* fill holes with zero */
>
> It works, but the right solution is to drop 0 from cmsg initialization
> and write "struct rds_rdma_notify cmsg = {};" without any memset.



No, the right solution is to use memset() over gcc extension.


>
> Thanks
>


-- 
With Best Regards,
Andy Shevchenko

--0000000000004add7405abb6effb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Friday, July 31, 2020, Leon Romanovsky &lt;<a href=3D"mailto:leo=
n@kernel.org">leon@kernel.org</a>&gt; wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">On Thu, Jul 30, 2020 at 03:20:26PM -0400, Peilin Ye wrote:<br>
&gt; rds_notify_queue_get() is potentially copying uninitialized kernel sta=
ck<br>
&gt; memory to userspace since the compiler may leave a 4-byte hole at the =
end<br>
&gt; of `cmsg`.<br>
&gt;<br>
&gt; In 2016 we tried to fix this issue by doing `=3D { 0 };` on `cmsg`, wh=
ich<br>
&gt; unfortunately does not always initialize that 4-byte hole. Fix it by u=
sing<br>
&gt; memset() instead.<br>
<br>
Of course, this is the difference between &quot;{ 0 }&quot; and &quot;{}&qu=
ot; initializations.<br>
<br>
&gt;<br>
&gt; Cc: <a href=3D"mailto:stable@vger.kernel.org">stable@vger.kernel.org</=
a><br>
&gt; Fixes: f037590fff30 (&quot;rds: fix a leak of kernel memory&quot;)<br>
&gt; Fixes: bdbe6fbc6a2f (&quot;RDS: recv.c&quot;)<br>
&gt; Suggested-by: Dan Carpenter &lt;<a href=3D"mailto:dan.carpenter@oracle=
.com">dan.carpenter@oracle.com</a>&gt;<br>
&gt; Signed-off-by: Peilin Ye &lt;<a href=3D"mailto:yepeilin.cs@gmail.com">=
yepeilin.cs@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; Note: the &quot;real&quot; copy_to_user() happens in put_cmsg(), where=
<br>
&gt; `cmlen - sizeof(*cm)` equals to `sizeof(cmsg)`.<br>
&gt;<br>
&gt; Reference: <a href=3D"https://lwn.net/Articles/417989/" target=3D"_bla=
nk">https://lwn.net/Articles/<wbr>417989/</a><br>
&gt;<br>
&gt; $ pahole -C &quot;rds_rdma_notify&quot; net/rds/recv.o<br>
&gt; struct rds_rdma_notify {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 user_token;=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0/*=C2=A0 =C2=A0 =C2=A00=C2=A0 =C2=A0 =C2=A08 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0__s32=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0/*=C2=A0 =C2=A0 =C2=A08=C2=A0 =C2=A0 =C2=A04 */<=
br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* size: 16, cachelines: 1, members: 2 */<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* padding: 4 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* last cacheline: 16 bytes */<br>
&gt; };<br>
&gt;<br>
&gt;=C2=A0 net/rds/recv.c | 3 ++-<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/net/rds/recv.c b/net/rds/recv.c<br>
&gt; index c8404971d5ab..aba4afe4dfed 100644<br>
&gt; --- a/net/rds/recv.c<br>
&gt; +++ b/net/rds/recv.c<br>
&gt; @@ -450,12 +450,13 @@ static int rds_still_queued(struct rds_sock *rs,=
 struct rds_incoming *inc,<br>
&gt;=C2=A0 int rds_notify_queue_get(struct rds_sock *rs, struct msghdr *msg=
hdr)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct rds_notifier *notifier;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct rds_rdma_notify cmsg =3D { 0 }; /* fill ho=
les with zero */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct rds_rdma_notify cmsg;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int count =3D 0, max_messages =3D ~=
0U;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long flags;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0LIST_HEAD(copy);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int err =3D 0;<br>
&gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0memset(&amp;cmsg, 0, sizeof(cmsg)); /* fill holes=
 with zero */<br>
<br>
It works, but the right solution is to drop 0 from cmsg initialization<br>
and write &quot;struct rds_rdma_notify cmsg =3D {};&quot; without any memse=
t.</blockquote><div><br></div><div><br></div><div>No, the right solution is=
 to use memset() over gcc extension.</div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">
<br>
Thanks<br>
</blockquote><br><br>-- <br>With Best Regards,<br>Andy Shevchenko<br><br><b=
r>

--0000000000004add7405abb6effb--

--===============8257293792539002728==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============8257293792539002728==--
