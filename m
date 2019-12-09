Return-Path: <SRS0=LNDZ=Z7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_FONT_LOW_CONTRAST,HTML_IMAGE_ONLY_28,
	HTML_MESSAGE,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9808BC43603
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  9 Dec 2019 19:30:50 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DD48205ED
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  9 Dec 2019 19:30:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ve+HjEhL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DD48205ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 205DA87FFF;
	Mon,  9 Dec 2019 19:30:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UW3-7bCAZ1My; Mon,  9 Dec 2019 19:30:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7EEF387FE9;
	Mon,  9 Dec 2019 19:30:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 69418C1D7D;
	Mon,  9 Dec 2019 19:30:49 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6666FC0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Dec 2019 19:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 55583868AF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Dec 2019 19:30:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sLLWafEgiV9X
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Dec 2019 19:30:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1E733868A6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Dec 2019 19:30:47 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id g18so13201656otj.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 09 Dec 2019 11:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hIx9b7l73nlvQesDGQPk4JKXIccriRYuD6v/K424Dbk=;
 b=ve+HjEhLchF6ycpviIg1i+x7lD2B+1l901NCyKTUHWHAdKL74c008cB8OOCRAiVH08
 9ZKTuslSO4JJeAP5+dKYAUiN4c3a0PU6HBaNnfF5MdmasEjgAS+MF4Bk5EF5n9+M1HfM
 OJ+OQ+OJ6H5k/FyNs0vHlcRshuWoj62sNFT9Q7pq7iozZFxxXGKnKTi0kXu9gv7ROlPe
 KtO7wm3ApCAeWJ2I5hwDzxoDR8PXu7iJjmLYtjPcU34SSpL6hFgQPkOQF1MvW5Y0PEge
 O5Tz11YDI+0f7OmoBASUaVPkIpT/zdu3GNiX6EAXQlIDX8Xkxf8SAKJ1MLpGxNTK9nHI
 xm2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hIx9b7l73nlvQesDGQPk4JKXIccriRYuD6v/K424Dbk=;
 b=PWes3mJdNMcqUNo3CRHYxnb2F/KJv6YyZN1MhmUS6T/rbt4KKsgzW54jZzV6uJbpnL
 9Z5N0hS/lfxPEubbRLVv/C8FpRoJq23SN3xoJCJTlcPr/s4jfu6L/JonKjuiodkDPVUk
 aGyfJdT5i9kS5HgGUmYqlYxEcIQ+YTz5Zlt/Yo79QnK6Ym/S8zRHImg8yKtBcSdsb5U4
 ZW/drUtOy9ppVvZEdrx6C/9BfXwhxMU4yCuC1GGZ5uJjK+4YYLlD6zX+1uAQe9Jalw0Y
 ijZ1/lQ/AF+t2z3MitYDYKWScznATctWpT8DrwiSM2UjNvgDMmZLS98t7TESP8zHMW6R
 D3rQ==
X-Gm-Message-State: APjAAAUGgY5XjjrSVynMjfH0EyFyWzkWRToMPZa1DNYb50fMzQ0+A/n7
 k7/FbQEEtmiargQ818DR11MUN6eKDDx+5nSnsnYX97B8
X-Google-Smtp-Source: APXvYqzXU8POfqj5NbpaNSiNu6znPZi8T5pq77cosiYprcC80UIn7wHebBDQ7SlJvQh6QFZjyFj5cmtsIj9l2t17qHE=
X-Received: by 2002:a9d:549:: with SMTP id 67mr21160739otw.175.1575919845876; 
 Mon, 09 Dec 2019 11:30:45 -0800 (PST)
MIME-Version: 1.0
References: <20191209075043.17947-1-madhuparnabhowmik04@gmail.com>
 <20191209183313.GL2889@paulmck-ThinkPad-P72>
In-Reply-To: <20191209183313.GL2889@paulmck-ThinkPad-P72>
From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
Date: Tue, 10 Dec 2019 01:00:34 +0530
Message-ID: <CAF65HP2SC89k9HJZfcLgeOMRPBKRyasCMiLo2gZgBKycjHuU6A@mail.gmail.com>
To: paulmck@kernel.org
Cc: Joel Fernandes <joel@joelfernandes.org>, rcu@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] rculist.h: Add list_tail_rcu()
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
Content-Type: multipart/mixed; boundary="===============6358916527095083631=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============6358916527095083631==
Content-Type: multipart/alternative; boundary="0000000000009bab5005994a6e6a"

--0000000000009bab5005994a6e6a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2019 at 12:03 AM Paul E. McKenney <paulmck@kernel.org>
wrote:

> On Mon, Dec 09, 2019 at 01:20:43PM +0530, madhuparnabhowmik04@gmail.com
> wrote:
> > From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> >
> > This patch adds the macro list_tail_rcu() and document it.
> >
> > Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
>
> Queued with slight edits, thank you very much!
>
> Thank you!

Regards,
Madhuparna

>                                                         Thanx, Paul
>
> > ---
> >  include/linux/rculist.h | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/include/linux/rculist.h b/include/linux/rculist.h
> > index 4b7ae1bf50b3..9f21efa525ab 100644
> > --- a/include/linux/rculist.h
> > +++ b/include/linux/rculist.h
> > @@ -40,6 +40,16 @@ static inline void INIT_LIST_HEAD_RCU(struct
> list_head *list)
> >   */
> >  #define list_next_rcu(list)  (*((struct list_head __rcu
> **)(&(list)->next)))
> >
> > +/**
> > + * list_tail_rcu - returns the prev pointer of the head of the list
> > + * @head: the head of the list
> > + *
> > + * Note: This should only be used with the list header,
> > + * but only if list_del() and similar primitives are not
> > + * also used on the list header.
> > + */
> > +#define list_tail_rcu(head)  (*((struct list_head __rcu
> **)(&(head)->prev)))
> > +
> >  /*
> >   * Check during list traversal that we are within an RCU reader
> >   */
> > --
> > 2.17.1
> >
>
=E1=90=A7

--0000000000009bab5005994a6e6a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Dec 10, 2019 at 12:03 AM Paul=
 E. McKenney &lt;<a href=3D"mailto:paulmck@kernel.org">paulmck@kernel.org</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On=
 Mon, Dec 09, 2019 at 01:20:43PM +0530, <a href=3D"mailto:madhuparnabhowmik=
04@gmail.com" target=3D"_blank">madhuparnabhowmik04@gmail.com</a> wrote:<br=
>
&gt; From: Madhuparna Bhowmik &lt;<a href=3D"mailto:madhuparnabhowmik04@gma=
il.com" target=3D"_blank">madhuparnabhowmik04@gmail.com</a>&gt;<br>
&gt; <br>
&gt; This patch adds the macro list_tail_rcu() and document it.<br>
&gt; <br>
&gt; Signed-off-by: Madhuparna Bhowmik &lt;<a href=3D"mailto:madhuparnabhow=
mik04@gmail.com" target=3D"_blank">madhuparnabhowmik04@gmail.com</a>&gt;<br=
>
<br>
Queued with slight edits, thank you very much!<br>
<br></blockquote><div>Thank you!</div><div><br></div><div>Regards,</div><di=
v>Madhuparna=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Thanx, Paul<br>
<br>
&gt; ---<br>
&gt;=C2=A0 include/linux/rculist.h | 10 ++++++++++<br>
&gt;=C2=A0 1 file changed, 10 insertions(+)<br>
&gt; <br>
&gt; diff --git a/include/linux/rculist.h b/include/linux/rculist.h<br>
&gt; index 4b7ae1bf50b3..9f21efa525ab 100644<br>
&gt; --- a/include/linux/rculist.h<br>
&gt; +++ b/include/linux/rculist.h<br>
&gt; @@ -40,6 +40,16 @@ static inline void INIT_LIST_HEAD_RCU(struct list_h=
ead *list)<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt;=C2=A0 #define list_next_rcu(list)=C2=A0 (*((struct list_head __rcu **)=
(&amp;(list)-&gt;next)))<br>
&gt;=C2=A0 <br>
&gt; +/**<br>
&gt; + * list_tail_rcu - returns the prev pointer of the head of the list<b=
r>
&gt; + * @head: the head of the list<br>
&gt; + *<br>
&gt; + * Note: This should only be used with the list header,<br>
&gt; + * but only if list_del() and similar primitives are not<br>
&gt; + * also used on the list header.<br>
&gt; + */<br>
&gt; +#define list_tail_rcu(head)=C2=A0 (*((struct list_head __rcu **)(&amp=
;(head)-&gt;prev)))<br>
&gt; +<br>
&gt;=C2=A0 /*<br>
&gt;=C2=A0 =C2=A0* Check during list traversal that we are within an RCU re=
ader<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt; -- <br>
&gt; 2.17.1<br>
&gt; <br>
</blockquote></div></div><div hspace=3D"streak-pt-mark" style=3D"max-height=
:1px"><img alt=3D"" style=3D"width:0px;max-height:0px;overflow:hidden" src=
=3D"https://mailfoogae.appspot.com/t?sender=3DabWFkaHVwYXJuYWJob3dtaWswNEBn=
bWFpbC5jb20%3D&amp;type=3Dzerocontent&amp;guid=3D9f376a5a-0080-4476-85b6-1a=
97970d40ec"><font color=3D"#ffffff" size=3D"1">=E1=90=A7</font></div>

--0000000000009bab5005994a6e6a--

--===============6358916527095083631==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============6358916527095083631==--
