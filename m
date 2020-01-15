Return-Path: <SRS0=QLdQ=3E=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AFE0C33CB1
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 15 Jan 2020 15:46:50 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 334682072B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 15 Jan 2020 15:46:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AjsV29LT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 334682072B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id EEAB785B1D;
	Wed, 15 Jan 2020 15:46:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YwIh2StZnNpD; Wed, 15 Jan 2020 15:46:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2C983857D6;
	Wed, 15 Jan 2020 15:46:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1920EC1D83;
	Wed, 15 Jan 2020 15:46:45 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 90EFDC077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jan 2020 15:46:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8C5C3204CC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jan 2020 15:46:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9HwcyLseT6Dn
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jan 2020 15:46:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 8A2A320517
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jan 2020 15:46:33 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id 13so15755187oij.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jan 2020 07:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8/BollNXFyqT/cepZYeE+wLWDM3dv1lO6PKhmKCFjP0=;
 b=AjsV29LTZILt+Wi6pF8lx8pQGcAjahEeD+b/nX3OlPUmbm9vpq3DxwuMAEoqab3oYn
 ZH/XJxFWed5LpRdLiMWm1Z7Yy5CdDcuD24HNKvDq9ATEkzDUuhSnLAh/WixOZ63hLss6
 wzmW3OEKsmoaRmkJlodPsG96aokJxmN0G3xs24NlcZXTuTb72iyp4uznqkeIDk2zuxj5
 XNa96XzGdulksUS2EW5wJrp6zqjSE9OuqCU21JFH+YoylZgOA+0XvdWotYm9bOy/Pz/7
 Di410upJv7hYDpEFTwCOInlT4qbDWMCK/zYkV4d0wmEArNyS6SkT2ST0gedArukDAmB+
 OyYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8/BollNXFyqT/cepZYeE+wLWDM3dv1lO6PKhmKCFjP0=;
 b=Q864v30k4aOC2EsEHRJUzoKzjyvlIoYBYVdKc4djtqXrvqqDkY6zCwHfG7xmRzRfjM
 bDDh7crG9Cvlu6SkIvCQ4oNa+xNcrU7eTmc8cB/8fWG2AavoSqd10hEwUj4wB6IDO8Ya
 ZQ2rzYRax8Vyfj7e5bRd3+IHM0zQJDlt0ZoFzj/pJMWERLwpH/vJYzqpaPtjLlwBqvp6
 jRWEqH4ulDRSyOXpPT3zPl5/31qARctyA3cNxNn3oDfCJqNyjy9B5Dt9F1GPC2yPIZ/a
 GiFd/INTy4RAwthCnvZKQ0osxCJQ4+0lqUKvtpdMPD0BOCVZ2+iNeuCD6XKOqRhkZRKt
 2dmg==
X-Gm-Message-State: APjAAAWOtOek1nLEi4N6MNE6ujkgyB5akCATRcGJhNWwBj38sw1qrDSQ
 snppxMcLSL2DEQt5xrDJYVSHjFlpfG8CRMFg54k=
X-Google-Smtp-Source: APXvYqwmCRvE84KFxCeMh/0IWweVxJ39fvDwNnbs2brPjIzOv2tB+1J13V3lQAmGQ+5mfIDXLyHm5vV4h7MTg1C1rUA=
X-Received: by 2002:a05:6808:658:: with SMTP id
 z24mr296168oih.91.1579103192495; 
 Wed, 15 Jan 2020 07:46:32 -0800 (PST)
MIME-Version: 1.0
References: <20200115124129.5684-1-madhuparnabhowmik04@gmail.com>
 <20200115135631.edr2nrfkycppxcku@debian>
 <CAF65HP0q_KcrUP_50JxZL1xNc47=detHvdOzjBmuiqUtB3AwfA@mail.gmail.com>
 <20200115150426.svapzpux2tbbgvmn@debian>
In-Reply-To: <20200115150426.svapzpux2tbbgvmn@debian>
From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
Date: Wed, 15 Jan 2020 21:16:21 +0530
Message-ID: <CAF65HP2gnDYud99DY51JMXGKaNUC5JNZgPWB8bgno+gjoVffvA@mail.gmail.com>
To: Wei Liu <wei.liu@kernel.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, paul@xen.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Joel Fernandes <joel@joelfernandes.org>, xen-devel@lists.xenproject.org,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net
Subject: Re: [Linux-kernel-mentees] [PATCH] net: xen-netbank: hash.c: Use
	built-in RCU list checking
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
Content-Type: multipart/mixed; boundary="===============8347422007043499957=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============8347422007043499957==
Content-Type: multipart/alternative; boundary="000000000000da3b89059c2f9cc3"

--000000000000da3b89059c2f9cc3
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 15, 2020 at 8:34 PM Wei Liu <wei.liu@kernel.org> wrote:

> On Wed, Jan 15, 2020 at 07:36:38PM +0530, Madhuparna Bhowmik wrote:
> [...]
> >
> > > The surrounding code makes it pretty clear that the lock is already
> held
> > > by the time list_for_each_entry_rcu is called, yet the checking
> involved
> > > in lockdep_is_held is not trivial, so I'm afraid I don't consider this
> a
> > > strict improvement over the existing code.
> > >
> > > Actually,  we want to make CONFIG_PROVE_LIST_RCU enabled by default.
>
> I think you meant CONFIG_PROVE_RCU_LIST.
>
> I am sorry about this. Yes, I meant  CONFIG_PROVE_RCU_LIST.

> And if the cond argument is not passed when the usage of
> > list_for_each_entry_rcu()
> > is outside of rcu_read_lock(), it will lead to a false positive.
> > Therefore, I think this patch is required.
>
> Fair enough.
>
> Thank you,
Madhuparna


> Wei.
>

--000000000000da3b89059c2f9cc3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 15, 2020 at 8:34 PM Wei L=
iu &lt;<a href=3D"mailto:wei.liu@kernel.org">wei.liu@kernel.org</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Jan =
15, 2020 at 07:36:38PM +0530, Madhuparna Bhowmik wrote:<br>
[...]<br>
&gt; <br>
&gt; &gt; The surrounding code makes it pretty clear that the lock is alrea=
dy held<br>
&gt; &gt; by the time list_for_each_entry_rcu is called, yet the checking i=
nvolved<br>
&gt; &gt; in lockdep_is_held is not trivial, so I&#39;m afraid I don&#39;t =
consider this a<br>
&gt; &gt; strict improvement over the existing code.<br>
&gt; &gt;<br>
&gt; &gt; Actually,=C2=A0 we want to make CONFIG_PROVE_LIST_RCU enabled by =
default.<br>
<br>
I think you meant CONFIG_PROVE_RCU_LIST.<br>
<br></blockquote><div>I am sorry about this. Yes, I meant=C2=A0=C2=A0CONFIG=
_PROVE_RCU_LIST.</div><div><br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
&gt; And if the cond argument is not passed when the usage of<br>
&gt; list_for_each_entry_rcu()<br>
&gt; is outside of rcu_read_lock(), it will lead to a false positive.<br>
&gt; Therefore, I think this patch is required.<br>
<br>
Fair enough.<br>
<br></blockquote><div>Thank you,</div><div>Madhuparna</div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
Wei.<br>
</blockquote></div></div>

--000000000000da3b89059c2f9cc3--

--===============8347422007043499957==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============8347422007043499957==--
