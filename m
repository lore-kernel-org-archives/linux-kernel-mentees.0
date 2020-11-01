Return-Path: <SRS0=yjWw=EH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84BC3C2D0A3
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Nov 2020 08:06:59 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 005F721534
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Nov 2020 08:06:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cs/nQxgX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 005F721534
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A460487447;
	Sun,  1 Nov 2020 08:06:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S9tZc9vlc9+9; Sun,  1 Nov 2020 08:06:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 25C7B87443;
	Sun,  1 Nov 2020 08:06:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 10DDEC0889;
	Sun,  1 Nov 2020 08:06:58 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 82529C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Nov 2020 08:06:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6A2CA87126
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Nov 2020 08:06:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r680eVfc1-4X
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Nov 2020 08:06:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DA03D8632E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Nov 2020 08:06:55 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id b12so5238696plr.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 01 Nov 2020 01:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wDxRBddlCbZ4M+j9+QPLRFUfiOJlCVuHI6L4d7V9jBA=;
 b=cs/nQxgXaD492agOiimfjK1uwpIIPwgwKZaymaRcCiqGHmRaDS2T3iu9WUhVIW4smu
 BrnxULaJJSe3AtDA059Cws7jVqhZOfFhvxDCU1q84X++vnGf3uHdX3t+6SejIwBKs9h0
 RqKWLTZoZwMJVbPnBwRKs9c8NG6LqwaRwaFPZkqGxAqeTqAvdTQXCCnLvKlObBBfzIfu
 08uiR/R6scfjJRKj48kN0eGt7L8VT61fp5BzxWc8Mhduu8r5Hb5gGEQQ7lf/aQpJdmow
 gIl2HJSxOwkFJ+ld1X7Q4PLLzDN+Tw+zVzRVXmoDLdvtVP3o1J46X7miZSkW1sBu4Tol
 HYWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wDxRBddlCbZ4M+j9+QPLRFUfiOJlCVuHI6L4d7V9jBA=;
 b=OR85B4aLBcofB/9rbF7jn5jz87agic1nODNmQqL3m1AVMnbGZ767Ff82Ax/DZCTIMs
 YH1bJql6DD/MOu75yXnbMSwGmnkMW1VRcectMorbIOqbqQQRxuIKq0g/TD6Z4VfX0va/
 l3ISBrE/8yUrQLbUoRVXdvhVLRaZKP+/1OuEy/781/+X15vTULVNDxcFP6ZUaZw3KWB3
 +NpdfDSl7qOfzCYAHxRa63qTQdMJO+xE18oInZSeMGLD382CCl8GCwmW0/XkXjrx9XR9
 cj1jb1vjXhtG+Wy1Jqkj0yZbUxgGJaybGu6Ivbq83O59PaT5RsFHf7fveN9SME1YQzd8
 2UUg==
X-Gm-Message-State: AOAM532e9tFDt7EtTEXRn82cO7kx8k8CsMKns2H/JOsGeJ4Cpw5woGq5
 CXGMaRqwEBGOFCYpDix1PWehsjgib3RmgA6gztXxnt0J
X-Google-Smtp-Source: ABdhPJzlK1wrV1uvibHC+9QUqoZWl+QsUcIYlO7MDqlcn+gjQ8YYbF1EhgtPKurv6xu2HMjUOsD4tH3l+lZVWNc0tNc=
X-Received: by 2002:a17:902:9042:b029:d5:eef1:c9c8 with SMTP id
 w2-20020a1709029042b02900d5eef1c9c8mr17184261plz.0.1604218015325; Sun, 01 Nov
 2020 01:06:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ3Q+7bum=ESExRa7mcjLWq9wXGfHOrVMOFqTuwVW60DUH=87A@mail.gmail.com>
 <CAJ3Q+7a_Ddw_iUcA4ijJxuD+Vt_E2M9X+pw7=nnBeZvfhh9v9g@mail.gmail.com>
 <20201101064315.GA432993@kroah.com>
In-Reply-To: <20201101064315.GA432993@kroah.com>
From: Drupad Joshi <drupadjoshi64@gmail.com>
Date: Sun, 1 Nov 2020 13:36:43 +0530
Message-ID: <CAJ3Q+7Z8Fo0k33COdiSpqyju0Xs-yG6tgXFhtpte7akLk2tQHQ@mail.gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Fwd: Linux kernel upstream patch
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
Content-Type: multipart/mixed; boundary="===============1921367425904485460=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============1921367425904485460==
Content-Type: multipart/alternative; boundary="000000000000f222eb05b3071c08"

--000000000000f222eb05b3071c08
Content-Type: text/plain; charset="UTF-8"

No means I am looking for trainer who can help me in that.

I have not tried yet. But need a direction from you.

Regards,
Drupad

On Sun, Nov 1, 2020, 12:13 PM Greg KH <gregkh@linuxfoundation.org> wrote:

> On Sun, Nov 01, 2020 at 02:23:02AM +0530, Drupad Joshi wrote:
> > ---------- Forwarded message ---------
> > From: Drupad Joshi <drupadjoshi64@gmail.com>
> > Date: Sun, 1 Nov 2020 at 02:04
> > Subject: Linux kernel upstream patch
> > To: <training@linuxfoundation.org>, <info@linuxfoundation.org>
> >
> >
> > Hi ,
> >
> > I want to upstream or contribute to open source. Any training or help
> > provided from you?
>
> What have you tried already that did not work?
>

--000000000000f222eb05b3071c08
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">No means I am looking for trainer who can help me in that=
.<div dir=3D"auto"><br></div><div dir=3D"auto">I have not tried yet. But ne=
ed a direction=C2=A0from you.</div><div dir=3D"auto"><br></div><div dir=3D"=
auto">Regards,</div><div dir=3D"auto">Drupad</div></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Nov 1, 2020, 12:1=
3 PM Greg KH &lt;<a href=3D"mailto:gregkh@linuxfoundation.org">gregkh@linux=
foundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Su=
n, Nov 01, 2020 at 02:23:02AM +0530, Drupad Joshi wrote:<br>
&gt; ---------- Forwarded message ---------<br>
&gt; From: Drupad Joshi &lt;<a href=3D"mailto:drupadjoshi64@gmail.com" targ=
et=3D"_blank" rel=3D"noreferrer">drupadjoshi64@gmail.com</a>&gt;<br>
&gt; Date: Sun, 1 Nov 2020 at 02:04<br>
&gt; Subject: Linux kernel upstream patch<br>
&gt; To: &lt;<a href=3D"mailto:training@linuxfoundation.org" target=3D"_bla=
nk" rel=3D"noreferrer">training@linuxfoundation.org</a>&gt;, &lt;<a href=3D=
"mailto:info@linuxfoundation.org" target=3D"_blank" rel=3D"noreferrer">info=
@linuxfoundation.org</a>&gt;<br>
&gt; <br>
&gt; <br>
&gt; Hi ,<br>
&gt; <br>
&gt; I want to upstream or contribute to open source. Any training or help<=
br>
&gt; provided from you?<br>
<br>
What have you tried already that did not work?<br>
</blockquote></div>

--000000000000f222eb05b3071c08--

--===============1921367425904485460==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============1921367425904485460==--
