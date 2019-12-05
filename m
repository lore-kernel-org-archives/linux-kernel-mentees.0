Return-Path: <SRS0=8tby=Z3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_FONT_LOW_CONTRAST,HTML_MESSAGE,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0234C2D0BF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  5 Dec 2019 05:55:55 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92A102053B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  5 Dec 2019 05:55:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jAB56I3p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92A102053B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 71F1F86FD8;
	Thu,  5 Dec 2019 05:55:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wy3z2vWyZmmb; Thu,  5 Dec 2019 05:55:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3A05D86FD7;
	Thu,  5 Dec 2019 05:55:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1C371C1DD7;
	Thu,  5 Dec 2019 05:55:54 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E3173C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Dec 2019 05:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C971488062
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Dec 2019 05:55:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oOB67UlKfWn4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Dec 2019 05:55:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1B0D387672
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Dec 2019 05:55:52 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id h20so1596472otn.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 04 Dec 2019 21:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4tr4pPEFN9PUSwCn2qJ7S47vO9ZrWNyFNj6jmwkPZNo=;
 b=jAB56I3pp0H44YvmpYsjBv2m5mpdB27lNo5FQRTNZMr/6jDjA3YTC0+0IOJJdVSA8E
 uFRYnfni6R+q/wLYxlUgg6KOvpTbxi/WvowDHRfhBESmV4UIG9XzlYqX5RgSSKZzgJQC
 uq5QBARSwY8f40EETuyABtPhZw8WqjKFZTOIv/8d010WlO1S8SqzCdurGQFqoUXf/yC1
 FxZYuu36pjGkBL5hCsUkhX96kyRWk7y4vYH5j/Kn3C+XjlPda6hbU3yApl214t6g3Y6k
 jDifcEucLNP8DidlKBVyU9ofPsaL6V0/USLyTJYdlbbCKcfcfakTz+3yZBtGXLsHYMDN
 uhsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4tr4pPEFN9PUSwCn2qJ7S47vO9ZrWNyFNj6jmwkPZNo=;
 b=OHr5RwRviYRPcPTQP9qujPipphj+zrlr5iRKQbhI/BQrzFKXwcyw2QNeGgtkwpq9oK
 mR5rg20O58n9et9XwYzMPnF8z60OGs/MCl46lHEe+BWlfCQ+1gag3VrXAxAinSUmzxqQ
 y6+skXJEtmnm6J7GLCRh+jyPpCR5ooCCc6rMhmIFwn2DP3DJHNl5aPf2pKJwVx+dayy9
 T7jWb8ze/ExBAea/cjMJz/nF7tlDVVOodzo7foLxDJAcgIOhx84NCnP8/AHCArliF3Yw
 USgyPx/7XixB2SPawyqDArmeWMxWMUyCrxhrQ6NYdZ1Q+Fb03T0lWSsoIDlA6MnnZ583
 zqyQ==
X-Gm-Message-State: APjAAAVkxs0GwjZ8zqnlSV1zww84gTXED39UGc8AxJWCB4dpwV0qlgX6
 /31rON9O3gGTxyQecxWFlZkCs6TyADIeQQWoBRc=
X-Google-Smtp-Source: APXvYqwx38pQtQMvHZDAgt16DXaPjao5PxnxL0xhRVLurdFMYUhwTNqJHmwwBqtG3w8cJMJxPRlt8/IvFrtjszcVm2U=
X-Received: by 2002:a9d:51ca:: with SMTP id d10mr5208200oth.76.1575525350867; 
 Wed, 04 Dec 2019 21:55:50 -0800 (PST)
MIME-Version: 1.0
References: <20191204120357.11658-1-madhuparnabhowmik04@gmail.com>
 <20191205002518.GP2889@paulmck-ThinkPad-P72>
In-Reply-To: <20191205002518.GP2889@paulmck-ThinkPad-P72>
From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
Date: Thu, 5 Dec 2019 11:25:39 +0530
Message-ID: <CAF65HP1WL2yw8nVZi-j9=eehkUJP-eKUy+w9unFXddmPf7_Hqg@mail.gmail.com>
To: paulmck@kernel.org
Cc: Joel Fernandes <joel@joelfernandes.org>, rcu@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] Include: Linux: rculist_nulls:
	Add docbook comment headers
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
Content-Type: multipart/mixed; boundary="===============0164743301671751737=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============0164743301671751737==
Content-Type: multipart/alternative; boundary="000000000000df87350598ee947c"

--000000000000df87350598ee947c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 5, 2019 at 5:55 AM Paul E. McKenney <paulmck@kernel.org> wrote:

> On Wed, Dec 04, 2019 at 05:33:57PM +0530, madhuparnabhowmik04@gmail.com
> wrote:
> > From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> >
> > This patch adds docbook comment headers for hlist_nulls_first_rcu
> > and hlist_nulls_next_rcu in rculist_nulls.h.
> >
> > Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> > ---
>
> Good to see, thank you!  A few grammar nits below -- could you please
> update and re-send?
>
> Thank you, I will send the updated patch soon.


>                                                         Thanx, Paul
>
> >  include/linux/rculist_nulls.h | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/include/linux/rculist_nulls.h
> b/include/linux/rculist_nulls.h
> > index 517a06f36c7a..d796ef18ec52 100644
> > --- a/include/linux/rculist_nulls.h
> > +++ b/include/linux/rculist_nulls.h
> > @@ -38,9 +38,17 @@ static inline void hlist_nulls_del_init_rcu(struct
> hlist_nulls_node *n)
> >       }
> >  }
> >
> > +/**
> > + * hlist_nulls_first_rcu - returns the first element of the hash list.
> > + * @head: the head for your list.
>
> Could you please say something like "The head of the list."?
> Just to keep point of view more consistent through the documentation.
>
> Sure, I will change it to "head of the list".
Moreover, in the rest of the docbook comments in the same file
(rculist_nulls.h), "head for your list" is used.
So, should I change that as well in a separate patch, such that it is
consistent throughout the file?



> > + */
> >  #define hlist_nulls_first_rcu(head) \
> >       (*((struct hlist_nulls_node __rcu __force **)&(head)->first))
> >
> > +/**
> > + * hlist_nulls_next_rcu - returns the element of the list next to @nod=
e.
>
> Here, could you please change "next to" to "after"?  This removes the
> ambiguity where both the prior and the subsequent elements might be
> thought of as "next to".
>
> Sure, I will do it. Thank you for pointing out.

Regards,
Madhuparna


> > + * @node: Element of the list.
> > + */
> >  #define hlist_nulls_next_rcu(node) \
> >       (*((struct hlist_nulls_node __rcu __force **)&(node)->next))
> >
> > --
> > 2.17.1
> >
>
=E1=90=A7

--000000000000df87350598ee947c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 5, 2019 at 5:55 AM Paul E=
. McKenney &lt;<a href=3D"mailto:paulmck@kernel.org">paulmck@kernel.org</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On W=
ed, Dec 04, 2019 at 05:33:57PM +0530, <a href=3D"mailto:madhuparnabhowmik04=
@gmail.com" target=3D"_blank">madhuparnabhowmik04@gmail.com</a> wrote:<br>
&gt; From: Madhuparna Bhowmik &lt;<a href=3D"mailto:madhuparnabhowmik04@gma=
il.com" target=3D"_blank">madhuparnabhowmik04@gmail.com</a>&gt;<br>
&gt; <br>
&gt; This patch adds docbook comment headers for hlist_nulls_first_rcu<br>
&gt; and hlist_nulls_next_rcu in rculist_nulls.h.<br>
&gt; <br>
&gt; Signed-off-by: Madhuparna Bhowmik &lt;<a href=3D"mailto:madhuparnabhow=
mik04@gmail.com" target=3D"_blank">madhuparnabhowmik04@gmail.com</a>&gt;<br=
>
&gt; ---<br>
<br>
Good to see, thank you!=C2=A0 A few grammar nits below -- could you please<=
br>
update and re-send?<br>
<br></blockquote><div>Thank you, I will send the updated patch soon.</div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Thanx, Paul<br>
<br>
&gt;=C2=A0 include/linux/rculist_nulls.h | 8 ++++++++<br>
&gt;=C2=A0 1 file changed, 8 insertions(+)<br>
&gt; <br>
&gt; diff --git a/include/linux/rculist_nulls.h b/include/linux/rculist_nul=
ls.h<br>
&gt; index 517a06f36c7a..d796ef18ec52 100644<br>
&gt; --- a/include/linux/rculist_nulls.h<br>
&gt; +++ b/include/linux/rculist_nulls.h<br>
&gt; @@ -38,9 +38,17 @@ static inline void hlist_nulls_del_init_rcu(struct =
hlist_nulls_node *n)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; +/**<br>
&gt; + * hlist_nulls_first_rcu - returns the first element of the hash list=
.<br>
&gt; + * @head: the head for your list.<br>
<br>
Could you please say something like &quot;The head of the list.&quot;?<br>
Just to keep point of view more consistent through the documentation.<br>
<br></blockquote><div>Sure, I will change it to &quot;head of the list&quot=
;.</div><div>Moreover, in the rest of the docbook comments in the same file=
 (rculist_nulls.h), &quot;head for your list&quot; is used.</div><div>So, s=
hould I change that as well in a separate patch, such that it is consistent=
 throughout the file?</div><div><br></div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
&gt; + */<br>
&gt;=C2=A0 #define hlist_nulls_first_rcu(head) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0(*((struct hlist_nulls_node __rcu __force **=
)&amp;(head)-&gt;first))<br>
&gt;=C2=A0 <br>
&gt; +/**<br>
&gt; + * hlist_nulls_next_rcu - returns the element of the list next to @no=
de.<br>
<br>
Here, could you please change &quot;next to&quot; to &quot;after&quot;?=C2=
=A0 This removes the<br>
ambiguity where both the prior and the subsequent elements might be<br>
thought of as &quot;next to&quot;.<br>
<br></blockquote><div>Sure, I will do it. Thank you for pointing out.</div>=
<div><br></div><div>Regards,</div><div>Madhuparna</div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
&gt; + * @node: Element of the list.<br>
&gt; + */<br>
&gt;=C2=A0 #define hlist_nulls_next_rcu(node) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0(*((struct hlist_nulls_node __rcu __force **=
)&amp;(node)-&gt;next))<br>
&gt;=C2=A0 <br>
&gt; -- <br>
&gt; 2.17.1<br>
&gt; <br>
</blockquote></div></div><div hspace=3D"streak-pt-mark" style=3D"max-height=
:1px"><img alt=3D"" style=3D"width:0px;max-height:0px;overflow:hidden" src=
=3D"https://mailfoogae.appspot.com/t?sender=3DabWFkaHVwYXJuYWJob3dtaWswNEBn=
bWFpbC5jb20%3D&amp;type=3Dzerocontent&amp;guid=3De7fa3ab2-d7d0-4485-851b-06=
8fa90bc91b"><font color=3D"#ffffff" size=3D"1">=E1=90=A7</font></div>

--000000000000df87350598ee947c--

--===============0164743301671751737==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============0164743301671751737==--
