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
	by smtp.lore.kernel.org (Postfix) with ESMTP id CADC7C2BA83
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 14 Feb 2020 15:43:19 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55AF52467D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 14 Feb 2020 15:43:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vMj82rqB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55AF52467D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0740B21FF6;
	Fri, 14 Feb 2020 15:43:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cQxFBtdk8YVJ; Fri, 14 Feb 2020 15:43:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 09688203DF;
	Fri, 14 Feb 2020 15:43:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F0DD1C0881;
	Fri, 14 Feb 2020 15:43:17 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ED5A5C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Feb 2020 15:43:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D4BC686640
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Feb 2020 15:43:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x80XJikA0_M6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Feb 2020 15:43:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 13B8E865C1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Feb 2020 15:43:16 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id a22so9759183oid.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Feb 2020 07:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DKIiXYq0cr8GMiq/b1mB7uuOYB4CW+XBrnhr7nbs4Oo=;
 b=vMj82rqBey1KlPOvQOK5vtzMdjJqFWpeHc9x6kjVCQ8bSLnailTFo9+DRqjfond1NM
 vJyk1p105gYgN4lp199B30L+38SNu5hS2YgZe0dNQPVkGcCQiYeEV81v+WMey4Al0qi6
 ZEWmo7xiZru12RbdIEsKQJDoGqxjuIngXrNt2hC/pTTmMQS6+4fSFzo3Fr5QNzF8hEGG
 L3YJH0b7fOYngiLIFGnptZCwBDgNozgNgpPCv9Y8QXk3xsTMqBuksKymE6eDhFOyjP9S
 15Z7EXQczuto8+C6C9RBsoEUNQ7vJHExwzldykmKOk9vleq7d6hzgpPkB4jqyrIZueXP
 utjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DKIiXYq0cr8GMiq/b1mB7uuOYB4CW+XBrnhr7nbs4Oo=;
 b=jdtEk+hNQqr8CpU2lAV3xgIjXLynxmLihWqzfCpEiJRlEyLl6nC//1dfQ40uEvqk4v
 wH6mDlzawkI9iParT4HqfURUxE7pwjHHZWBtRDgjEqG8thUWCRF/3mnY6n/6zwZSWYlH
 oUoLhIHuU5KzRGirah7FMGvqZsC95WToxxrTU60MIX8JduZAy3fIRggOHsxbkqzJhnM1
 eUsZ0m7KRAl6Zf+6ZF5RAbnsQ2VeqEcWaRgh1jftpR8dyJwhTPx3Coz3KsqEuYGIX8o/
 i7kYsvcRSUI4NbhpX1+UuSkB60ONA4huFczmdu6vtgXfcNOwFw5rrJGBvFwxwqe/GZ70
 rjxg==
X-Gm-Message-State: APjAAAXTdaL89q4bv368Tfu33FCcq7MQ2f5Ub5gHew76kM9Wn74mmPHx
 F1fv/zrHVXRl7rtXXVLaTTWfj1txiBTIEql+Gfo=
X-Google-Smtp-Source: APXvYqy3l9UayLfVGNXJno8mVCVxdgcXXba/gZEQ7kjw3EHkQ+VJNpc/vYg1NzksOAiit3//O/KfRYSXZ6gGXr7gpxI=
X-Received: by 2002:aca:5303:: with SMTP id h3mr2173010oib.109.1581694994984; 
 Fri, 14 Feb 2020 07:43:14 -0800 (PST)
MIME-Version: 1.0
References: <20200114162345.19995-1-madhuparnabhowmik04@gmail.com>
 <20200114165740.GB22037@ziepe.ca>
 <74adec84-ec5b-ea1b-7adf-3f8608838259@intel.com>
 <25133367-6544-d0af-ae30-5178909748b1@intel.com>
In-Reply-To: <25133367-6544-d0af-ae30-5178909748b1@intel.com>
From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
Date: Fri, 14 Feb 2020 21:13:03 +0530
Message-ID: <CAF65HP0RsW5FMRRf5Lia2=MTKex-KwO7-_NsCUef94YKBg+pfA@mail.gmail.com>
To: dennis.dalessandro@intel.com, Jason Gunthorpe <jgg@ziepe.ca>, 
 madhuparna bhowmik <madhuparnabhowmik04@gmail.com>
Cc: mike.marciniszyn@intel.com, "Paul E. McKenney" <paulmck@kernel.org>,
 linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
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
Content-Type: multipart/mixed; boundary="===============9027330073377473271=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============9027330073377473271==
Content-Type: multipart/alternative; boundary="00000000000051b389059e8b1030"

--00000000000051b389059e8b1030
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 15, 2020 at 12:05 AM <madhuparnabhowmik04@gmail.com> wrote:

> From: Dennis Dalessandro <dennis.dalessandro@intel.com>
>
> On 1/14/2020 12:00 PM, Dennis Dalessandro wrote:
> > On 1/14/2020 11:57 AM, Jason Gunthorpe wrote:
> >> On Tue, Jan 14, 2020 at 09:53:45PM +0530,
> >> madhuparnabhowmik04@gmail.com wrote:
> >>> From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> >>>
> >>> list_for_each_entry_rcu has built-in RCU and lock checking.
> >>> Pass cond argument to list_for_each_entry_rcu.
> >>>
> >>> Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> >>>   drivers/infiniband/hw/hfi1/verbs.c | 2 +-
> >>>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/infiniband/hw/hfi1/verbs.c
> >>> b/drivers/infiniband/hw/hfi1/verbs.c
> >>> index 089e201d7550..22f2d4fd2577 100644
> >>> +++ b/drivers/infiniband/hw/hfi1/verbs.c
> >>> @@ -515,7 +515,7 @@ static inline void hfi1_handle_packet(struct
> >>> hfi1_packet *packet,
> >>>                          opa_get_lid(packet->dlid, 9B));
> >>>           if (!mcast)
> >>>               goto drop;
> >>> -        list_for_each_entry_rcu(p, &mcast->qp_list, list) {
> >>> +        list_for_each_entry_rcu(p, &mcast->qp_list, list,
> >>> lockdep_is_held(&(ibp->rvp.lock))) {
> >>
> >> Okay, this looks reasonable
> >>
> >> Mike, Dennis, is this the right lock to test?
> >>
> >
> > I'm looking at that right now actually, I don't think this is correct.
> > Wanted to talk to Mike before I send a response though.
> >
> > -Denny
>
> That's definitely going to throw a ton of lock dep messages. It's not
> really the right lock either. Instead what we probably need to do is
> what we do in the non-multicast part of the code and take the
> rcu_read_lock().
>
> I'd say hold off on this and we'll fix it right. Same goes for the qib one.
>
> Alright, thank you for reviewing.
>
> The rdmavt one though looks to be OK. I'll give it a test.
>
> Hi,
I just wanted to follow up on this.
Any updates?
Also, is the bug fixed now?

Thank you,
Madhuparna



> Thank you,
> Madhuparna
>
> -Denny
>

--00000000000051b389059e8b1030
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div class=3D"gmail_attr" dir=3D"ltr">On Wed, Jan 15, 2020 at 12:05 AM &lt;=
<a href=3D"mailto:madhuparnabhowmik04@gmail.com">madhuparnabhowmik04@gmail.=
com</a>&gt; wrote:<br></div><blockquote style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex" class=3D"gmail_quot=
e">From: Dennis Dalessandro &lt;<a target=3D"_blank" href=3D"mailto:dennis.=
dalessandro@intel.com">dennis.dalessandro@intel.com</a>&gt;<br>
<br>
On 1/14/2020 12:00 PM, Dennis Dalessandro wrote:<br>
&gt; On 1/14/2020 11:57 AM, Jason Gunthorpe wrote:<br>
&gt;&gt; On Tue, Jan 14, 2020 at 09:53:45PM +0530, <br>
&gt;&gt; <a target=3D"_blank" href=3D"mailto:madhuparnabhowmik04@gmail.com"=
>madhuparnabhowmik04@gmail.com</a> wrote:<br>
&gt;&gt;&gt; From: Madhuparna Bhowmik &lt;<a target=3D"_blank" href=3D"mail=
to:madhuparnabhowmik04@gmail.com">madhuparnabhowmik04@gmail.com</a>&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; list_for_each_entry_rcu has built-in RCU and lock checking.<br=
>
&gt;&gt;&gt; Pass cond argument to list_for_each_entry_rcu.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Madhuparna Bhowmik &lt;<a target=3D"_blank" hre=
f=3D"mailto:madhuparnabhowmik04@gmail.com">madhuparnabhowmik04@gmail.com</a=
>&gt;<br>
&gt;&gt;&gt; =C2=A0 drivers/infiniband/hw/hfi1/verbs.c | 2 +-<br>
&gt;&gt;&gt; =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; diff --git a/drivers/infiniband/hw/hfi1/verbs.c <br>
&gt;&gt;&gt; b/drivers/infiniband/hw/hfi1/verbs.c<br>
&gt;&gt;&gt; index 089e201d7550..22f2d4fd2577 100644<br>
&gt;&gt;&gt; +++ b/drivers/infiniband/hw/hfi1/verbs.c<br>
&gt;&gt;&gt; @@ -515,7 +515,7 @@ static inline void hfi1_handle_packet(stru=
ct <br>
&gt;&gt;&gt; hfi1_packet *packet,<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 opa_get_lid(packet-&gt;dlid, 9B));<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!mc=
ast)<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 goto drop;<br>
&gt;&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 list_for_each_entr=
y_rcu(p, &amp;mcast-&gt;qp_list, list) {<br>
&gt;&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 list_for_each_entr=
y_rcu(p, &amp;mcast-&gt;qp_list, list, <br>
&gt;&gt;&gt; lockdep_is_held(&amp;(ibp-&gt;rvp.lock))) {<br>
&gt;&gt;<br>
&gt;&gt; Okay, this looks reasonable<br>
&gt;&gt;<br>
&gt;&gt; Mike, Dennis, is this the right lock to test?<br>
&gt;&gt;<br>
&gt; <br>
&gt; I&#39;m looking at that right now actually, I don&#39;t think this is =
correct. <br>
&gt; Wanted to talk to Mike before I send a response though.<br>
&gt; <br>
&gt; -Denny<br>
<br>
That&#39;s definitely going to throw a ton of lock dep messages. It&#39;s n=
ot <br>
really the right lock either. Instead what we probably need to do is <br>
what we do in the non-multicast part of the code and take the <br>
rcu_read_lock().<br>
<br>
I&#39;d say hold off on this and we&#39;ll fix it right. Same goes for the =
qib one.<br>
<br>
Alright, thank you for reviewing.<br>
<br>
The rdmavt one though looks to be OK. I&#39;ll give it a test.<br>
<br></blockquote><div>Hi,</div><div>I just wanted to follow up on this.</di=
v><div>Any updates?</div><div>Also, is the bug fixed now?</div><div><br></d=
iv><div>Thank you,</div><div>Madhuparna</div><div><br></div><div>=C2=A0</di=
v><blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex" class=3D"gmail_quote">
Thank you,<br>
Madhuparna<br>
<br>
-Denny<br>
</blockquote></div></div>

--00000000000051b389059e8b1030--

--===============9027330073377473271==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============9027330073377473271==--
