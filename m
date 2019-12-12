Return-Path: <SRS0=PP36=2C=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_FONT_LOW_CONTRAST,HTML_IMAGE_ONLY_24,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12190C43603
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 12 Dec 2019 19:48:51 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D54D12077B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 12 Dec 2019 19:48:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DPPjxzL8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D54D12077B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B06E8888C2;
	Thu, 12 Dec 2019 19:48:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xs0e8YHjWHM2; Thu, 12 Dec 2019 19:48:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3D7D0888BE;
	Thu, 12 Dec 2019 19:48:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2853DC1D81;
	Thu, 12 Dec 2019 19:48:50 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BC666C0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Dec 2019 19:48:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id AAFDF86F4E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Dec 2019 19:48:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HN9MLcGqlZ0V
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Dec 2019 19:48:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6198186EFF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Dec 2019 19:48:47 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id i1so49701oie.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Dec 2019 11:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J7Ud72WI466qsftOP7JQ50KB+lJebsDWAyFkChWRoN0=;
 b=DPPjxzL8yYBNY4albLs/s8eJRP9il386/eZhVoDuFHlSpdRZlGS9TlNkZJ68hYnjI6
 I0yBGkMCE2i+D2kN8H0KB4jmfHmtiywX5jewm8WngdKCORbqhCIadsBxR3+HKFUAIl8/
 +k3xQYRY60bUs5dhV59i615pOXI3joVaSzyER13MmqNxiaPDJViFlD+xkh+SGXKIeJPY
 nXbJciICco4zTHuM8khu3W2tElk0dBCe2ftZ5Pf+B2mekOX+IMN8sO2e3zq1ComLu0yE
 c7m0S43FT3WaU+mP1tRpOuk2+asswlqXQ1rHSslNvK1PqBJsaP8NMhESQuBttNQQYaV3
 h3sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J7Ud72WI466qsftOP7JQ50KB+lJebsDWAyFkChWRoN0=;
 b=Ms1+Y6o6SZVuq045hILq4L1z1iLjcbLRqcB9scp5Wn9kTK/Y+srY+60iRlMtHZTkpN
 RJMtazbvWm9F/Al083pQprmO9bqmz4iyF2rDMjTosTmaAdXKjE4T8GS0DZaFbrNYTHv1
 Kdu862907KZkw/8BTMDFPwkEsJcGAc4Qth6GWLnFAMnl/e7bVTp+UKQt0UyT6JA1gZqW
 qww4BEKhrReOHyY3PLcKxgFouwtzf5cgl2HfLIpm6MM6OC8CBiNRwgjDQlLIRxUDJUX5
 dolk4PlBNpUIdnDpy/nPqqwutK4HfJVhaDfDHXlbEXH18h5/DjBNZHUL3h+VaYUY+8ju
 V/Ww==
X-Gm-Message-State: APjAAAWxiAE2QrRckuWU5C5v6F2ayksRDzoXeRjC77rZs9Qqcx997C8x
 LoLgmNfHru/TK6n/8RCgJc0failf64oj2erT0JA=
X-Google-Smtp-Source: APXvYqxJo/kzcBIFB8jl/XGL+b0QHJZX5hhcnyj5MuEN301Kw6Ql/jB7HKdBlKXkvP3kNTwTj3HT27WAVpN+ThjpgYk=
X-Received: by 2002:aca:5303:: with SMTP id h3mr5862925oib.109.1576180126437; 
 Thu, 12 Dec 2019 11:48:46 -0800 (PST)
MIME-Version: 1.0
References: <201912110621.WJ6oENgf%lkp@intel.com>
 <20191211074842.21400-1-madhuparnabhowmik04@gmail.com>
 <20191212041406.GT2889@paulmck-ThinkPad-P72>
 <5614739335088d3e9baff43b752df04b84a8ad14.camel@hammerspace.com>
 <20191212180358.GX2889@paulmck-ThinkPad-P72>
In-Reply-To: <20191212180358.GX2889@paulmck-ThinkPad-P72>
From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
Date: Fri, 13 Dec 2019 01:18:35 +0530
Message-ID: <CAF65HP0GGndGEc01P7oqUHDfLre=UafDJt3i7PkPAvErgahCug@mail.gmail.com>
To: paulmck@kernel.org
Cc: "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
 "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rcu@vger.kernel.org" <rcu@vger.kernel.org>,
 Trond Myklebust <trondmy@hammerspace.com>,
 "joel@joelfernandes.org" <joel@joelfernandes.org>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 "anna.schumaker@netapp.com" <anna.schumaker@netapp.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] fs: nfs: dir.c: Fix sparse error
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
Content-Type: multipart/mixed; boundary="===============4508245843234235526=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============4508245843234235526==
Content-Type: multipart/alternative; boundary="00000000000089d6650599870826"

--00000000000089d6650599870826
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 12, 2019 at 11:33 PM Paul E. McKenney <paulmck@kernel.org>
wrote:

> On Thu, Dec 12, 2019 at 01:45:29PM +0000, Trond Myklebust wrote:
> > On Wed, 2019-12-11 at 20:14 -0800, Paul E. McKenney wrote:
> > > On Wed, Dec 11, 2019 at 01:18:42PM +0530,
> > > madhuparnabhowmik04@gmail.com wrote:
> > > > This build error is because the macro list_tail_rcu() is
> > > > not yet present in the mainline kernel.
> > > >
> > > > This patch is dependent on the patch :
> > > >
> https://lore.kernel.org/linux-kernel-mentees/CAF65HP2SC89k9HJZfcLgeOMRPBK=
RyasCMiLo2gZgBKycjHuU6A@mail.gmail.com/T/#t
> > >
> > > If the NFS folks are OK with it, I would be happy to take it in -rcu,
> > > where the list_tail_rcu() patch is currently located.
> >
> > That would be fine with me.
>
> Very good!  I have queued it.
>
> Thank you very much!

Regards,
Madhuparna

>                                                         Thanx, Paul
>
=E1=90=A7

--00000000000089d6650599870826
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 12, 2019 at 11:33 PM Paul=
 E. McKenney &lt;<a href=3D"mailto:paulmck@kernel.org" target=3D"_blank">pa=
ulmck@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">On Thu, Dec 12, 2019 at 01:45:29PM +0000, Trond Myklebust w=
rote:<br>
&gt; On Wed, 2019-12-11 at 20:14 -0800, Paul E. McKenney wrote:<br>
&gt; &gt; On Wed, Dec 11, 2019 at 01:18:42PM +0530, <br>
&gt; &gt; <a href=3D"mailto:madhuparnabhowmik04@gmail.com" target=3D"_blank=
">madhuparnabhowmik04@gmail.com</a> wrote:<br>
&gt; &gt; &gt; This build error is because the macro list_tail_rcu() is<br>
&gt; &gt; &gt; not yet present in the mainline kernel.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; This patch is dependent on the patch : <br>
&gt; &gt; &gt; <a href=3D"https://lore.kernel.org/linux-kernel-mentees/CAF6=
5HP2SC89k9HJZfcLgeOMRPBKRyasCMiLo2gZgBKycjHuU6A@mail.gmail.com/T/#t" rel=3D=
"noreferrer" target=3D"_blank">https://lore.kernel.org/linux-kernel-mentees=
/CAF65HP2SC89k9HJZfcLgeOMRPBKRyasCMiLo2gZgBKycjHuU6A@mail.gmail.com/T/#t</a=
><br>
&gt; &gt; <br>
&gt; &gt; If the NFS folks are OK with it, I would be happy to take it in -=
rcu,<br>
&gt; &gt; where the list_tail_rcu() patch is currently located.<br>
&gt; <br>
&gt; That would be fine with me.<br>
<br>
Very good!=C2=A0 I have queued it.<br>
<br></blockquote><div>Thank you very much!</div><div><br></div><div>Regards=
,</div><div>Madhuparna=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Thanx, Paul<br>
</blockquote></div></div><div hspace=3D"streak-pt-mark" style=3D"max-height=
:1px"><img alt=3D"" style=3D"width:0px;max-height:0px;overflow:hidden" src=
=3D"https://mailfoogae.appspot.com/t?sender=3DabWFkaHVwYXJuYWJob3dtaWswNEBn=
bWFpbC5jb20%3D&amp;type=3Dzerocontent&amp;guid=3D840d5ca7-da0f-4d99-a009-25=
6f36edec4f"><font color=3D"#ffffff" size=3D"1">=E1=90=A7</font></div>

--00000000000089d6650599870826--

--===============4508245843234235526==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============4508245843234235526==--
