Return-Path: <SRS0=MteQ=24=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_FONT_LOW_CONTRAST,HTML_IMAGE_ONLY_28,
	HTML_MESSAGE,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04714C282DD
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  7 Jan 2020 18:35:51 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B942620656
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  7 Jan 2020 18:35:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="acTx62eD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B942620656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 94B1B860D1;
	Tue,  7 Jan 2020 18:35:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CGoLc-ZJoggT; Tue,  7 Jan 2020 18:35:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 84519860A2;
	Tue,  7 Jan 2020 18:35:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 78F93C1D82;
	Tue,  7 Jan 2020 18:35:48 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9E951C0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jan 2020 18:35:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 89E8E87884
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jan 2020 18:35:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PDraM-vJfuhZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jan 2020 18:35:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id EE07E8788B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jan 2020 18:35:44 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id p8so929243oth.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 07 Jan 2020 10:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7SRg5HIZ1Sn0Nrfy7Y7aAniykhOc4DfsrZ4D5RyemTg=;
 b=acTx62eDrG3/c5R24UNlZyIsvxhpbnGWcK1il0wSUn9nW7arDdoKACOHGTGcB8WgXE
 tms56ry3BFMSzleBvMNrf25moBIVOEDC0VDV9Is3uL5DOVxr4jZZZBT33qpIQD9lTJ5S
 vB6+co15C10TKcOWV0iaYmMKGTqgri+mrJNSBZiiyys+5Y/gOtREZgTtWqjimAJT+xDc
 CzVWCw4lGyRFmaqkOeuRAVAUG4rO3JEyNyTEWDCot7nLQHXhU+Uj8a0DbQXH4PWDXwCs
 cEjbEwakNmYHXTZ6seOU1GEO8VDj9RjgrpcLvlCsoveTA1EemIdleXE/4JCcbDopqxoe
 vV4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7SRg5HIZ1Sn0Nrfy7Y7aAniykhOc4DfsrZ4D5RyemTg=;
 b=HcCP0gSPrA7BXQmmTwU3okP6n8PW9r46PPIq54ATBAap2ubcjMZ7s8tdvlFeM9N144
 lRp2dmfIxScKXq3jhJYzGdcCR45IWY9Fbg4hUel3dZ61sUCwJ0+u3nTw4h7ooVdX7xl6
 q1ZVbv6hVfmKmnMHd6Du/4r+2v4J/R1QdUIF4/AapvMzjeTB77tHgiqNw5AMi7UIKR54
 6SLxdM2OFUKEKlVtFn+Gb56vy3T0OsXT05AqBWHQ+bj2dBe3h5lditxUzTeCKJ+/2hG6
 X+xenAzWRwLJlKiFFAlEOlxDtdQW5K+l8HxRxOklDmGr4nu/bg+yuU3kXVAudRx3FdHD
 BrMw==
X-Gm-Message-State: APjAAAW20Wy2/F23ys1dqTJi6gmqbf2jrIG9MSjchJwotH9z2AZ7YXLB
 mwYqMKkYOnQDrRVA7d5rTPutLc+ufom3eyA2qrIHLU10
X-Google-Smtp-Source: APXvYqzwBinSskmOQWlK7Iua5Moua96wCE0c4uWjYF3jZQbt+QSVURAFXyxPYW0oF7kB5G5wpCqsnAZqQbQGkR9pFbI=
X-Received: by 2002:a9d:2965:: with SMTP id d92mr1098891otb.175.1578422143884; 
 Tue, 07 Jan 2020 10:35:43 -0800 (PST)
MIME-Version: 1.0
References: <20200107173510.20320-1-madhuparnabhowmik04@gmail.com>
 <20200107182640.GC26174@ziepe.ca>
In-Reply-To: <20200107182640.GC26174@ziepe.ca>
From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
Date: Wed, 8 Jan 2020 00:05:31 +0530
Message-ID: <CAF65HP3JNE-pZRdHpzCA442yorgfSd3Aqkk4ux+9xPTx81+aPg@mail.gmail.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: mike.marciniszyn@intel.com, "Paul E. McKenney" <paulmck@kernel.org>,
 linux-rdma@vger.kernel.org, dennis.dalessandro@intel.com,
 linux-kernel@vger.kernel.org, rcu@vger.kernel.org, dledford@redhat.com,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH 1/3] infiniband: hw: hfi1:
	verbs.c: Use built-in RCU list checking
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
Content-Type: multipart/mixed; boundary="===============1771903614076698675=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============1771903614076698675==
Content-Type: multipart/alternative; boundary="0000000000003121a4059b910be4"

--0000000000003121a4059b910be4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 7, 2020 at 11:56 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:

> On Tue, Jan 07, 2020 at 11:05:08PM +0530, madhuparnabhowmik04@gmail.com
> wrote:
> > From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> >
> > list_for_each_entry_rcu has built-in RCU and lock checking.
> > Pass cond argument to list_for_each_entry_rcu.
> >
> > Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> >  drivers/infiniband/hw/hfi1/verbs.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/infiniband/hw/hfi1/verbs.c
> b/drivers/infiniband/hw/hfi1/verbs.c
> > index 089e201d7550..cab2ff185240 100644
> > +++ b/drivers/infiniband/hw/hfi1/verbs.c
> > @@ -515,7 +515,8 @@ static inline void hfi1_handle_packet(struct
> hfi1_packet *packet,
> >                                      opa_get_lid(packet->dlid, 9B));
> >               if (!mcast)
> >                       goto drop;
> > -             list_for_each_entry_rcu(p, &mcast->qp_list, list) {
> > +             list_for_each_entry_rcu(p, &mcast->qp_list, list
> > +
>  lock_is_held(&(ibp->rvp.lock).dep_map)) {
>
> This is missing a ',' and isn't indented properly. Does it even
> compile?
>
> I am really sorry about this, I will resend this patch.
Yes, it compiles, though I guess after testing I edited it by mistake.

Thanks,
Madhuparna


> The idea seems sound though.
>
> Jason
>
=E1=90=A7

--0000000000003121a4059b910be4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 7, 2020 at 11:56 PM Jason=
 Gunthorpe &lt;<a href=3D"mailto:jgg@ziepe.ca">jgg@ziepe.ca</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, Jan 07, =
2020 at 11:05:08PM +0530, <a href=3D"mailto:madhuparnabhowmik04@gmail.com" =
target=3D"_blank">madhuparnabhowmik04@gmail.com</a> wrote:<br>
&gt; From: Madhuparna Bhowmik &lt;<a href=3D"mailto:madhuparnabhowmik04@gma=
il.com" target=3D"_blank">madhuparnabhowmik04@gmail.com</a>&gt;<br>
&gt; <br>
&gt; list_for_each_entry_rcu has built-in RCU and lock checking.<br>
&gt; Pass cond argument to list_for_each_entry_rcu.<br>
&gt; <br>
&gt; Signed-off-by: Madhuparna Bhowmik &lt;<a href=3D"mailto:madhuparnabhow=
mik04@gmail.com" target=3D"_blank">madhuparnabhowmik04@gmail.com</a>&gt;<br=
>
&gt;=C2=A0 drivers/infiniband/hw/hfi1/verbs.c | 3 ++-<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/drivers/infiniband/hw/hfi1/verbs.c b/drivers/infiniband/h=
w/hfi1/verbs.c<br>
&gt; index 089e201d7550..cab2ff185240 100644<br>
&gt; +++ b/drivers/infiniband/hw/hfi1/verbs.c<br>
&gt; @@ -515,7 +515,8 @@ static inline void hfi1_handle_packet(struct hfi1_=
packet *packet,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 opa_get_lid(=
packet-&gt;dlid, 9B));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!mcast)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0goto drop;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0list_for_each_entry_r=
cu(p, &amp;mcast-&gt;qp_list, list) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0list_for_each_entry_r=
cu(p, &amp;mcast-&gt;qp_list, list<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lo=
ck_is_held(&amp;(ibp-&gt;rvp.lock).dep_map)) {<br>
<br>
This is missing a &#39;,&#39; and isn&#39;t indented properly. Does it even=
<br>
compile?<br>
<br></blockquote><div>I am really sorry about this, I will resend this patc=
h.</div><div>Yes, it compiles, though I guess after testing I edited it by =
mistake.</div><div><br></div><div>Thanks,</div><div>Madhuparna</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
The idea seems sound though.<br>
<br>
Jason<br>
</blockquote></div></div><div hspace=3D"streak-pt-mark" style=3D"max-height=
:1px"><img alt=3D"" style=3D"width:0px;max-height:0px;overflow:hidden" src=
=3D"https://mailfoogae.appspot.com/t?sender=3DabWFkaHVwYXJuYWJob3dtaWswNEBn=
bWFpbC5jb20%3D&amp;type=3Dzerocontent&amp;guid=3D1d0a4aad-2a9e-4301-b60e-98=
b484865aa5"><font color=3D"#ffffff" size=3D"1">=E1=90=A7</font></div>

--0000000000003121a4059b910be4--

--===============1771903614076698675==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============1771903614076698675==--
