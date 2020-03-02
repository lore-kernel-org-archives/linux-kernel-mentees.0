Return-Path: <SRS0=MxuE=4T=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB6F5C3F2D1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Mar 2020 12:34:12 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EA3C2173E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Mar 2020 12:34:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hP667QrN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EA3C2173E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4A12485CCF;
	Mon,  2 Mar 2020 12:34:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QNl+tSMN5hyV; Mon,  2 Mar 2020 12:34:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5D5E5810A9;
	Mon,  2 Mar 2020 12:34:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 47D41C1AE2;
	Mon,  2 Mar 2020 12:34:10 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4D12BC013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Mar 2020 12:34:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3B69B8709D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Mar 2020 12:34:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mew67D8YREgA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Mar 2020 12:34:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 185FF84FFF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Mar 2020 12:34:08 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id e18so11536612ljn.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 02 Mar 2020 04:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mpqUsHjGOOocQsgmaDI/ZibOUmxTZqFYR2vYBPWQlpI=;
 b=hP667QrNrIkWxRYb/S4I92CGyokH0VFTT77sLc1/LYhqjU8XvusVlKWUqOZwibtdDh
 N8PCmt9eY175BZbEbzyWqBKWbNJ/TPoP7qVnAKqWL5iWITJTjjyDgD0WhoZbmXavTsFN
 Da+u783C9bCWu7hfAo4lswSR2p89JAGqpfaS0kfNziAzZXIc7Yq6t+VpwBhP554IVWfp
 /dTtRhDB4T+uX1Ckul6w+xxBmN5e5BZ6pUs+POjkBgu3kQVg3DdpxAFwaQXt8IITO9dO
 lNg3bmq3CsAe+tc6y2rSl8tDXrZg9sDOoo1cbpsLNCLdkfXFtJLlS8uQXjopaRNYNWq4
 T02w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mpqUsHjGOOocQsgmaDI/ZibOUmxTZqFYR2vYBPWQlpI=;
 b=fCnD/kjcWKbJO+LMgSJNoWtdOWJAxqJ5BMlOA7roZhn7q6mhjbdS4c0pgxMOyYBYF7
 yXnCJ7nKAaFe/59mTwRakEyTa0Ntqs3+euC2/iMxaRFL36URWVKhPNAgxIOAECOqAnJa
 Ka8I7a4h1H3bHANBXzrimsy1v59/RLKOEnTtNH5JvKJFBlgykJZX259dz7j2Ew9yDT1E
 YZVKrWrU8csnOTVO16UbLnIRIcEFntuSVHHnOOMNWk60A3j90VcBMTf0ToRhWQ8P9M9q
 baMofSbegA6bvImTq/ub5Uoy7igjFWOCv83scrt608vNrjxev3TnM9VT36dYPlamCVp1
 CxCw==
X-Gm-Message-State: ANhLgQ1IFN3M1CIsWv7fR5ompOvjhyR8wk84iHbU76H4yDpboghqf5ao
 9i5TUGnSIf/Ei69tCGAXZnLVYOkrN5KyXIFwcA==
X-Google-Smtp-Source: ADFU+vuBN9jhbbS/0qo/bBTHA/ECAVOzSaxKeP/N7oMTKeqTygCezXhzPY4nbjHEE+4tmuvovZj+bVS1b/qaWTwpvzY=
X-Received: by 2002:a2e:7204:: with SMTP id n4mr7424538ljc.184.1583152446155; 
 Mon, 02 Mar 2020 04:34:06 -0800 (PST)
MIME-Version: 1.0
References: <20200228174630.8989-1-madhuparnabhowmik10@gmail.com>
 <CAJZ5v0jhw+cVm=ViiOtZgKr+a1L_PbeVPNXpsPbgghUvMPODSA@mail.gmail.com>
 <C2E57D31-A459-4F5F-8ECF-484FBB26C065@joelfernandes.org>
 <CAJZ5v0jTSKd_23fJhM+XUmFX_yTjcD+c_s1Jvi3HA1EmXPkzZw@mail.gmail.com>
 <CAEXW_YRL0kum5yVm+9V8i_PK2FcHfPeUOxJKZ+T8P3zqhATxJg@mail.gmail.com>
In-Reply-To: <CAEXW_YRL0kum5yVm+9V8i_PK2FcHfPeUOxJKZ+T8P3zqhATxJg@mail.gmail.com>
From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
Date: Mon, 2 Mar 2020 18:00:45 +0530
Message-ID: <CAD=jOEZ3vdNC4qTMxptaXLjs7i8TCTYjeiv9vXhcapLSkrr9RQ@mail.gmail.com>
To: Joel Fernandes <joel@joelfernandes.org>
Cc: Len Brown <len.brown@intel.com>, "Paul E. McKenney" <paulmck@kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Pavel Machek <pavel@ucw.cz>, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH 1/2] drivers: base: power: main:
	Use built-in RCU list checking
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
Content-Type: multipart/mixed; boundary="===============5008286094081325806=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============5008286094081325806==
Content-Type: multipart/alternative; boundary="0000000000002dada2059fde67d9"

--0000000000002dada2059fde67d9
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Mar, 2020, 3:48 AM Joel Fernandes, <joel@joelfernandes.org> wrote:

> On Sun, Mar 1, 2020 at 4:23 PM Rafael J. Wysocki <rafael@kernel.org>
> wrote:
> >
> > On Sun, Mar 1, 2020 at 9:53 PM <joel@joelfernandes.org> wrote:
> > >
> > >
> > >
> > > On March 1, 2020 3:12:53 PM EST, "Rafael J. Wysocki" <
> rafael@kernel.org> wrote:
> > > >On Fri, Feb 28, 2020 at 6:47 PM <madhuparnabhowmik10@gmail.com>
> wrote:
> > > >>
> > > >> From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> > > >>
> > > >> This patch passes the cond argument to list_for_each_entry_rcu()
> > > >> to fix the following false-positive lockdep warnings:
> > > >>
> > > >> [  330.302784] =============================
> > > >> [  330.302789] WARNING: suspicious RCU usage
> > > >> [  330.302796] 5.6.0-rc1+ #5 Not tainted
> > > >> [  330.302801] -----------------------------
> > > >> [  330.302808] drivers/base/power/main.c:326 RCU-list traversed in
> > > >non-reader section!!
> > > >>
> > > >> [  330.303303] =============================
> > > >> [  330.303307] WARNING: suspicious RCU usage
> > > >> [  330.303311] 5.6.0-rc1+ #5 Not tainted
> > > >> [  330.303315] -----------------------------
> > > >> [  330.303319] drivers/base/power/main.c:1698 RCU-list traversed in
> > > >non-reader section!!
> > > >>
> > > >> [  331.934969] =============================
> > > >> [  331.934971] WARNING: suspicious RCU usage
> > > >> [  331.934973] 5.6.0-rc1+ #5 Not tainted
> > > >> [  331.934975] -----------------------------
> > > >> [  331.934977] drivers/base/power/main.c:1238 RCU-list traversed in
> > > >non-reader section!!
> > > >>
> > > >> [  332.467772] WARNING: suspicious RCU usage
> > > >> [  332.467775] 5.6.0-rc1+ #5 Not tainted
> > > >> [  332.467775] -----------------------------
> > > >> [  332.467778] drivers/base/power/main.c:269 RCU-list traversed in
> > > >non-reader section!!
> > > >
> > > >I don't see these warnings in the kernels run locally here.
> > > >
> > > >What do you do to get them?
> > > >
> > > >Joel, any comments here?
> > >
> > > You have to enable lockdep in your config. Does your setup have that?
> >
> > CONFIG_LOCK_DEBUGGING_SUPPORT=y
> > CONFIG_PROVE_LOCKING=y
> > CONFIG_DEBUG_SPINLOCK=y
> > CONFIG_DEBUG_LOCK_ALLOC=y
> > CONFIG_LOCKDEP=y
>
>
> I had CONFIG_PROVE_RCU_LIST = y and I think these warnings were triggered
when I had closed my laptop (like just close without shutting down).

>
> This should be it. I am not sure what else Madhuparna did to trigger
> it. Madhuparna, could you elaborate?
>
> thanks,
>
>  - Joel
>

--0000000000002dada2059fde67d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, 2 Mar, 2020, 3:48 AM Joel Fernandes, &lt;<a hr=
ef=3D"mailto:joel@joelfernandes.org">joel@joelfernandes.org</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">On Sun, Mar 1, 2020 at 4:23 PM Rafa=
el J. Wysocki &lt;<a href=3D"mailto:rafael@kernel.org" target=3D"_blank" re=
l=3D"noreferrer">rafael@kernel.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Sun, Mar 1, 2020 at 9:53 PM &lt;<a href=3D"mailto:joel@joelfernande=
s.org" target=3D"_blank" rel=3D"noreferrer">joel@joelfernandes.org</a>&gt; =
wrote:<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; On March 1, 2020 3:12:53 PM EST, &quot;Rafael J. Wysocki&quot; &l=
t;<a href=3D"mailto:rafael@kernel.org" target=3D"_blank" rel=3D"noreferrer"=
>rafael@kernel.org</a>&gt; wrote:<br>
&gt; &gt; &gt;On Fri, Feb 28, 2020 at 6:47 PM &lt;<a href=3D"mailto:madhupa=
rnabhowmik10@gmail.com" target=3D"_blank" rel=3D"noreferrer">madhuparnabhow=
mik10@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; From: Madhuparna Bhowmik &lt;<a href=3D"mailto:madhuparn=
abhowmik10@gmail.com" target=3D"_blank" rel=3D"noreferrer">madhuparnabhowmi=
k10@gmail.com</a>&gt;<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; This patch passes the cond argument to list_for_each_ent=
ry_rcu()<br>
&gt; &gt; &gt;&gt; to fix the following false-positive lockdep warnings:<br=
>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; [=C2=A0 330.302784] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; &gt; &gt;&gt; [=C2=A0 330.302789] WARNING: suspicious RCU usage<br>
&gt; &gt; &gt;&gt; [=C2=A0 330.302796] 5.6.0-rc1+ #5 Not tainted<br>
&gt; &gt; &gt;&gt; [=C2=A0 330.302801] -----------------------------<br>
&gt; &gt; &gt;&gt; [=C2=A0 330.302808] drivers/base/power/main.c:326 RCU-li=
st traversed in<br>
&gt; &gt; &gt;non-reader section!!<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; [=C2=A0 330.303303] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; &gt; &gt;&gt; [=C2=A0 330.303307] WARNING: suspicious RCU usage<br>
&gt; &gt; &gt;&gt; [=C2=A0 330.303311] 5.6.0-rc1+ #5 Not tainted<br>
&gt; &gt; &gt;&gt; [=C2=A0 330.303315] -----------------------------<br>
&gt; &gt; &gt;&gt; [=C2=A0 330.303319] drivers/base/power/main.c:1698 RCU-l=
ist traversed in<br>
&gt; &gt; &gt;non-reader section!!<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; [=C2=A0 331.934969] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; &gt; &gt;&gt; [=C2=A0 331.934971] WARNING: suspicious RCU usage<br>
&gt; &gt; &gt;&gt; [=C2=A0 331.934973] 5.6.0-rc1+ #5 Not tainted<br>
&gt; &gt; &gt;&gt; [=C2=A0 331.934975] -----------------------------<br>
&gt; &gt; &gt;&gt; [=C2=A0 331.934977] drivers/base/power/main.c:1238 RCU-l=
ist traversed in<br>
&gt; &gt; &gt;non-reader section!!<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; [=C2=A0 332.467772] WARNING: suspicious RCU usage<br>
&gt; &gt; &gt;&gt; [=C2=A0 332.467775] 5.6.0-rc1+ #5 Not tainted<br>
&gt; &gt; &gt;&gt; [=C2=A0 332.467775] -----------------------------<br>
&gt; &gt; &gt;&gt; [=C2=A0 332.467778] drivers/base/power/main.c:269 RCU-li=
st traversed in<br>
&gt; &gt; &gt;non-reader section!!<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;I don&#39;t see these warnings in the kernels run locally her=
e.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;What do you do to get them?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;Joel, any comments here?<br>
&gt; &gt;<br>
&gt; &gt; You have to enable lockdep in your config. Does your setup have t=
hat?<br>
&gt;<br>
&gt; CONFIG_LOCK_DEBUGGING_SUPPORT=3Dy<br>
&gt; CONFIG_PROVE_LOCKING=3Dy<br>
&gt; CONFIG_DEBUG_SPINLOCK=3Dy<br>
&gt; CONFIG_DEBUG_LOCK_ALLOC=3Dy<br>
&gt; CONFIG_LOCKDEP=3Dy<br>
<br><br></blockquote></div></div><div dir=3D"auto">I had CONFIG_PROVE_RCU_L=
IST =3D y and I think these warnings were triggered when I had closed my la=
ptop (like just close without shutting down).=C2=A0</div><div dir=3D"auto">=
<div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
This should be it. I am not sure what else Madhuparna did to trigger<br>
it. Madhuparna, could you elaborate?<br>
<br>
thanks,<br>
<br>
=C2=A0- Joel<br>
</blockquote></div></div></div>

--0000000000002dada2059fde67d9--

--===============5008286094081325806==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============5008286094081325806==--
