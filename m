Return-Path: <SRS0=hVmh=4C=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2A96C3B1A6
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 14 Feb 2020 17:33:00 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E00A2168B
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 14 Feb 2020 17:33:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="meyP0/EA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E00A2168B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 32519868D0;
	Fri, 14 Feb 2020 17:33:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NVs2-2QfX67x; Fri, 14 Feb 2020 17:32:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8B1FA868CE;
	Fri, 14 Feb 2020 17:32:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7AF7DC0881;
	Fri, 14 Feb 2020 17:32:59 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C577FC0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Feb 2020 17:32:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B367322219
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Feb 2020 17:32:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u-87SCNVtE+n
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Feb 2020 17:32:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by silver.osuosl.org (Postfix) with ESMTPS id D20AB2042D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Feb 2020 17:32:56 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id z2so10149085oih.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Feb 2020 09:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r3T/+drPqVBDzy4dDIKsoJJiAeaqJqa8gBBMU9TF0j8=;
 b=meyP0/EAE4xM0sWTSUZ+D1DR3ZKsnOGYERDXxQj5n3FFI6feJFFcdhsE6lPh/JOIhn
 WFpqZeJO0021eAOISu0vnKgG3G7qIScVoobWWqKTsDC0/FvfXMNp89KshorN8jyLeFb7
 vjhSJ0H7wZ1cGkahdBmLwdhOEW/ocmyTpMQxhwk5LZUw+njm80oegKl1tVEjXsllpfoa
 OlmHq5EG9MgOXGmGrGFRgJE5NQsqNTb19B3JZPJIlr6lEdo5xi4d7Wq1Lx4OHvexK//M
 3Cs2DWRscwGCewT1VBnkVPKkiSah129mRc6Ny/8YbGcmFN0Ucou99DLcHv4GanxRjsbt
 h+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r3T/+drPqVBDzy4dDIKsoJJiAeaqJqa8gBBMU9TF0j8=;
 b=m90eo6pJJNbwnGQGhHwhUkkVMmfmynOrCU/bP5wH7kSFaUal6PSEwvk837kXku38CE
 FgwtDmpcLf9wSZL0EIEjArD5xohRGgopadpnalpALR7bjMZ0kEGfXvZdFqbe92kQUqXc
 Q7shZ0zxyfFjdeSx2ADKmlBTCXiqqIGptj8wZG1ySnxvaRoZlvO/wAWEgy3DddIQBKh0
 1OgpQyVqwLUlkIObeDwmgiolIDb85srkShTSu0iBiu48p9VRfYrDAYxBn33tbbjLNao9
 c2sUQCSanJMeThTtpicIcQre56Q0XWsh2ZSmlvqS2gURmTlWjxUsZxMxmCI0c1hcUfhT
 RT+A==
X-Gm-Message-State: APjAAAVIzuRBI4xqcrWjJ8pMKGsRPm1ZggYJtcqnZAWAIOPq630n32K2
 H/40sSEoKoGoIujPf6NBgD/0g+W3ZPl9maMfk+Q=
X-Google-Smtp-Source: APXvYqwXFV3oz0Xk92Cy9yDHpWJY62JIDncdqegwNDG8SO9EX6zSwItBrB1gsyk1FKmbshGZVxHirQuyNLsrxwl7MY4=
X-Received: by 2002:aca:5303:: with SMTP id h3mr2532180oib.109.1581701575839; 
 Fri, 14 Feb 2020 09:32:55 -0800 (PST)
MIME-Version: 1.0
References: <20200114162345.19995-1-madhuparnabhowmik04@gmail.com>
 <20200114165740.GB22037@ziepe.ca>
 <74adec84-ec5b-ea1b-7adf-3f8608838259@intel.com>
 <25133367-6544-d0af-ae30-5178909748b1@intel.com>
 <CAF65HP0RsW5FMRRf5Lia2=MTKex-KwO7-_NsCUef94YKBg+pfA@mail.gmail.com>
 <c773894a-b011-2419-683a-3b851583fc73@intel.com>
In-Reply-To: <c773894a-b011-2419-683a-3b851583fc73@intel.com>
From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
Date: Fri, 14 Feb 2020 23:02:44 +0530
Message-ID: <CAF65HP2+4jPh+PKPfdFAwWNb+F7O44gZ86E6LUs+2i87r7A3Vw@mail.gmail.com>
To: Dennis Dalessandro <dennis.dalessandro@intel.com>
Cc: mike.marciniszyn@intel.com, "Paul E. McKenney" <paulmck@kernel.org>,
 linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Joel Fernandes <joel@joelfernandes.org>,
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
Content-Type: multipart/mixed; boundary="===============8940261057660517709=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============8940261057660517709==
Content-Type: multipart/alternative; boundary="00000000000091923c059e8c98e5"

--00000000000091923c059e8c98e5
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 14, 2020 at 10:55 PM Dennis Dalessandro <
dennis.dalessandro@intel.com> wrote:

> On 2/14/2020 10:43 AM, Madhuparna Bhowmik wrote:
> >
> >
> > On Wed, Jan 15, 2020 at 12:05 AM <madhuparnabhowmik04@gmail.com
> > <mailto:madhuparnabhowmik04@gmail.com>> wrote:
> >
> >     From: Dennis Dalessandro <dennis.dalessandro@intel.com
> >     <mailto:dennis.dalessandro@intel.com>>
> >
> >     On 1/14/2020 12:00 PM, Dennis Dalessandro wrote:
> >      > On 1/14/2020 11:57 AM, Jason Gunthorpe wrote:
> >      >> On Tue, Jan 14, 2020 at 09:53:45PM +0530,
> >      >> madhuparnabhowmik04@gmail.com
> >     <mailto:madhuparnabhowmik04@gmail.com> wrote:
> >      >>> From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com
> >     <mailto:madhuparnabhowmik04@gmail.com>>
> >      >>>
> >      >>> list_for_each_entry_rcu has built-in RCU and lock checking.
> >      >>> Pass cond argument to list_for_each_entry_rcu.
> >      >>>
> >      >>> Signed-off-by: Madhuparna Bhowmik
> >     <madhuparnabhowmik04@gmail.com <mailto:madhuparnabhowmik04@gmail.com
> >>
> >      >>>   drivers/infiniband/hw/hfi1/verbs.c | 2 +-
> >      >>>   1 file changed, 1 insertion(+), 1 deletion(-)
> >      >>>
> >      >>> diff --git a/drivers/infiniband/hw/hfi1/verbs.c
> >      >>> b/drivers/infiniband/hw/hfi1/verbs.c
> >      >>> index 089e201d7550..22f2d4fd2577 100644
> >      >>> +++ b/drivers/infiniband/hw/hfi1/verbs.c
> >      >>> @@ -515,7 +515,7 @@ static inline void hfi1_handle_packet(struct
> >      >>> hfi1_packet *packet,
> >      >>>                          opa_get_lid(packet->dlid, 9B));
> >      >>>           if (!mcast)
> >      >>>               goto drop;
> >      >>> -        list_for_each_entry_rcu(p, &mcast->qp_list, list) {
> >      >>> +        list_for_each_entry_rcu(p, &mcast->qp_list, list,
> >      >>> lockdep_is_held(&(ibp->rvp.lock))) {
> >      >>
> >      >> Okay, this looks reasonable
> >      >>
> >      >> Mike, Dennis, is this the right lock to test?
> >      >>
> >      >
> >      > I'm looking at that right now actually, I don't think this is
> >     correct.
> >      > Wanted to talk to Mike before I send a response though.
> >      >
> >      > -Denny
> >
> >     That's definitely going to throw a ton of lock dep messages. It's not
> >     really the right lock either. Instead what we probably need to do is
> >     what we do in the non-multicast part of the code and take the
> >     rcu_read_lock().
> >
> >     I'd say hold off on this and we'll fix it right. Same goes for the
> >     qib one.
> >
> >     Alright, thank you for reviewing.
> >
> >     The rdmavt one though looks to be OK. I'll give it a test.
> >
> > Hi,
> > I just wanted to follow up on this.
> > Any updates?
> > Also, is the bug fixed now?
> >
> > Thank you,
> > Madhuparna
> >
> >     Thank you,
> >     Madhuparna
> >
> >     -Denny
> >
>
> I've got a patch going through internal discussion and testing for
> adding rcu read locking.
>
> The RDMAVT patch, I was OK with going in, I guess I just mentioned that
> in a reply rather than adding an RB tag. Let me go ahead and do that.
>
> Thank you very much for the update and Reviewed By.

Regards,
Madhuparna

-Denny
>

--00000000000091923c059e8c98e5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 14, 2020 at 10:55 PM Denn=
is Dalessandro &lt;<a href=3D"mailto:dennis.dalessandro@intel.com">dennis.d=
alessandro@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">On 2/14/2020 10:43 AM, Madhuparna Bhowmik wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Wed, Jan 15, 2020 at 12:05 AM &lt;<a href=3D"mailto:madhuparnabhowm=
ik04@gmail.com" target=3D"_blank">madhuparnabhowmik04@gmail.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:madhuparnabhowmik04@gmail.com" target=3D"=
_blank">madhuparnabhowmik04@gmail.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0From: Dennis Dalessandro &lt;<a href=3D"mailto:denn=
is.dalessandro@intel.com" target=3D"_blank">dennis.dalessandro@intel.com</a=
><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:dennis.dalessandro@int=
el.com" target=3D"_blank">dennis.dalessandro@intel.com</a>&gt;&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 1/14/2020 12:00 PM, Dennis Dalessandro wrote:<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; On 1/14/2020 11:57 AM, Jason Gunthorpe wrote:=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; On Tue, Jan 14, 2020 at 09:53:45PM +0530,=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; <a href=3D"mailto:madhuparnabhowmik04@gma=
il.com" target=3D"_blank">madhuparnabhowmik04@gmail.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:madhuparnabhowmik04@gm=
ail.com" target=3D"_blank">madhuparnabhowmik04@gmail.com</a>&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; From: Madhuparna Bhowmik &lt;<a href=
=3D"mailto:madhuparnabhowmik04@gmail.com" target=3D"_blank">madhuparnabhowm=
ik04@gmail.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:madhuparnabhowmik04@gm=
ail.com" target=3D"_blank">madhuparnabhowmik04@gmail.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; list_for_each_entry_rcu has built-in =
RCU and lock checking.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; Pass cond argument to list_for_each_e=
ntry_rcu.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; Signed-off-by: Madhuparna Bhowmik<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:madhuparnabhowmik04@gmail.com=
" target=3D"_blank">madhuparnabhowmik04@gmail.com</a> &lt;mailto:<a href=3D=
"mailto:madhuparnabhowmik04@gmail.com" target=3D"_blank">madhuparnabhowmik0=
4@gmail.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; =C2=A0 drivers/infiniband/hw/hfi1/ver=
bs.c | 2 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; =C2=A0 1 file changed, 1 insertion(+)=
, 1 deletion(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; diff --git a/drivers/infiniband/hw/hf=
i1/verbs.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; b/drivers/infiniband/hw/hfi1/verbs.c<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; index 089e201d7550..22f2d4fd2577 1006=
44<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; +++ b/drivers/infiniband/hw/hfi1/verb=
s.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; @@ -515,7 +515,7 @@ static inline voi=
d hfi1_handle_packet(struct<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; hfi1_packet *packet,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 opa_get_lid(packet-&gt;dlid, 9B));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 if (!mcast)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto drop;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 list_for_each_entry_rcu(p, &amp;mcast-&gt;qp_list, list) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 list_for_each_entry_rcu(p, &amp;mcast-&gt;qp_list, list,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; lockdep_is_held(&amp;(ibp-&gt;rvp.loc=
k))) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; Okay, this looks reasonable<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; Mike, Dennis, is this the right lock to t=
est?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; I&#39;m looking at that right now actually, I=
 don&#39;t think this is<br>
&gt;=C2=A0 =C2=A0 =C2=A0correct.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Wanted to talk to Mike before I send a respon=
se though.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -Denny<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0That&#39;s definitely going to throw a ton of lock =
dep messages. It&#39;s not<br>
&gt;=C2=A0 =C2=A0 =C2=A0really the right lock either. Instead what we proba=
bly need to do is<br>
&gt;=C2=A0 =C2=A0 =C2=A0what we do in the non-multicast part of the code an=
d take the<br>
&gt;=C2=A0 =C2=A0 =C2=A0rcu_read_lock().<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I&#39;d say hold off on this and we&#39;ll fix it r=
ight. Same goes for the<br>
&gt;=C2=A0 =C2=A0 =C2=A0qib one.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Alright, thank you for reviewing.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0The rdmavt one though looks to be OK. I&#39;ll give=
 it a test.<br>
&gt; <br>
&gt; Hi,<br>
&gt; I just wanted to follow up on this.<br>
&gt; Any updates?<br>
&gt; Also, is the bug fixed now?<br>
&gt; <br>
&gt; Thank you,<br>
&gt; Madhuparna<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Thank you,<br>
&gt;=C2=A0 =C2=A0 =C2=A0Madhuparna<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0-Denny<br>
&gt; <br>
<br>
I&#39;ve got a patch going through internal discussion and testing for <br>
adding rcu read locking.<br>
<br>
The RDMAVT patch, I was OK with going in, I guess I just mentioned that <br=
>
in a reply rather than adding an RB tag. Let me go ahead and do that.<br>
<br></blockquote><div>Thank you very much for the update and Reviewed By.</=
div><div><br></div><div>Regards,</div><div>Madhuparna</div><div><br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
-Denny<br>
</blockquote></div></div>

--00000000000091923c059e8c98e5--

--===============8940261057660517709==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============8940261057660517709==--
