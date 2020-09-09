Return-Path: <SRS0=P4BV=CS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 092ABC433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  9 Sep 2020 15:04:13 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8713D22269
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  9 Sep 2020 15:04:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZizDnXjH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8713D22269
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2ABAD874D2;
	Wed,  9 Sep 2020 15:04:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Herfi1sMOSLB; Wed,  9 Sep 2020 15:04:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9C80E8748A;
	Wed,  9 Sep 2020 15:04:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 82273C0052;
	Wed,  9 Sep 2020 15:04:11 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AAC69C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 15:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A624C8748C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 15:04:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GnxtIoxFem-S
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 15:04:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 221678748A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 15:04:09 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id z22so4030824ejl.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 09 Sep 2020 08:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uRYSYGVNTbUhIJxX7nCBQWsCOLokTTerCXyXIr7bZas=;
 b=ZizDnXjHi2KASweGw/0A+HI/WhpD+7Fp25mEMuH2OqRb8/18jJaMRWUItKdKo6V0uo
 uA63fVvLXCiNN5vEp894sjoiRg6C7+KH4TEZbJRO9JyK6CHEWOFXayvnQsCnfuA7poMC
 xiJKpGurynNbg4uS4nabQsHzEzpzY7IwKimDpwKjYB+OIFTJnW95PwcLTHS0pSPbw3YO
 IZsggDR6wacyuOFeClth43+D9JeyxryMJUaSRfCw61uPiFZN+yyvrOK9DYioIHK4Rh/L
 uL+iMlccST8glLqGE3xq5+8Ub4D0oR+QVAhRAj9+z5TyfdFml7Jzc+JpzOEC8/UUT1Ul
 zwAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uRYSYGVNTbUhIJxX7nCBQWsCOLokTTerCXyXIr7bZas=;
 b=CPHkO9I/kFbOlNPEG9vkpehy/8bL96kaxzUtpStAkxHRFra1+tRVVkXdX4l4ALjL+9
 /DnYxHbrLWH0lD3gh3+lFU6ZmVrcNWah8DrLPsO0Xf0p3qCOeIsACbb6retvuivUBvZh
 /LeyMvv0r2MCZCgiQqex7FWO5OpJzCengrEjz8ZgPH6Gzt4hvY78MfN1Oz3V6a1jEb24
 o7VPCcOaFA5tfvp7up4xnIqE3SnHY+Fu630fuTcMf3R8m4A1Ap8l3tYYIRS/4dNCI/FW
 xLBbMoZHneU3gyfnmj9nIE7nhHx/eEy9mz3f1bkVlFEoII1knvuN6efY103D839n+Wq3
 FA3g==
X-Gm-Message-State: AOAM532hj2Vl9GG22kIoqhmDoHZNWp9/M7KrXgK8OsamJc+3FDUQSP4j
 xzUdSiAdORhGrtpSF86vl1H1VQsQjUm2PMlZP4s=
X-Google-Smtp-Source: ABdhPJy961SlT//IcO0B0u6z6hr+lF+AMqggH4kkKbu5b/pgs/9Axfs1FvjRB8x1Aj/v7z656pbk9s63+aAZfZigUK8=
X-Received: by 2002:a17:906:ae50:: with SMTP id
 lf16mr3221364ejb.343.1599663847547; 
 Wed, 09 Sep 2020 08:04:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAM1DhOivT_U=N6K-J0A7aDpG9QwEng4n9nZyS5knDKofqeunuA@mail.gmail.com>
 <alpine.DEB.2.21.2009091511200.23843@felia>
 <CAM1DhOjACW=BGQvOvfbQZGexYdwa0wf-CCNHQ=XvXdWkUC3XpA@mail.gmail.com>
 <alpine.DEB.2.21.2009091611130.23843@felia>
In-Reply-To: <alpine.DEB.2.21.2009091611130.23843@felia>
From: Alaa Emad <alaaemadhossney.ae@gmail.com>
Date: Wed, 9 Sep 2020 17:03:51 +0200
Message-ID: <CAM1DhOitTkiKXdFwFZoZzSbN70LgbXVQ2CnDbS9vwfuX1H41Kg@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Linux Kernel: Evaluate and Improve
	checkpatch.pl
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
Content-Type: multipart/mixed; boundary="===============4287123487148340343=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============4287123487148340343==
Content-Type: multipart/alternative; boundary="00000000000064a68005aee2c3e5"

--00000000000064a68005aee2c3e5
Content-Type: text/plain; charset="UTF-8"

Ok, I will check,Thank you

On Wed, Sep 9, 2020, 4:13 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:

>
>
> On Wed, 9 Sep 2020, Alaa Emad wrote:
>
> >
> >
> > On Wed, Sep 9, 2020, 3:19 PM Lukas Bulwahn <lukas.bulwahn@gmail.com>
> wrote:
> >
> >
> >       On Wed, 9 Sep 2020, Alaa Emad wrote:
> >
> >       > Hello Lukas Bulwahn,
> >       > i hope this email finds you well , i applied for  Linux Kernel:
> Evaluate and Improve checkpatch.pl
> >       >
> >       > according to the first two tasks, i am unemployed how should i
> respond to these?
> >       >
> >
> >       I do not know which list of tasks you are referring to. So, I
> cannot
> >       comment on the first two tasks.
> >
> >
> >    1.Participation permission from school or employer.
> >     2.School Enrollment Verification.
> >
>
> Please check the CommunityBridge organisation if mentorships on the Linux
> kernel are also open to mentees that are not enrolled in the university?
>
> I do not know the exact expectations for the mentorship selection.
>
> Lukas

--00000000000064a68005aee2c3e5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Ok, I will check,Thank you=C2=A0</div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 9, 2020, 4:13=
 PM Lukas Bulwahn &lt;<a href=3D"mailto:lukas.bulwahn@gmail.com">lukas.bulw=
ahn@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
On Wed, 9 Sep 2020, Alaa Emad wrote:<br>
<br>
&gt; <br>
&gt; <br>
&gt; On Wed, Sep 9, 2020, 3:19 PM Lukas Bulwahn &lt;<a href=3D"mailto:lukas=
.bulwahn@gmail.com" target=3D"_blank" rel=3D"noreferrer">lukas.bulwahn@gmai=
l.com</a>&gt; wrote:<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0On Wed, 9 Sep 2020, Alaa Emad wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Hello=C2=A0Lukas Bulwahn,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; i hope this email finds you well , i ap=
plied for=C2=A0 Linux Kernel: Evaluate and Improve <a href=3D"http://checkp=
atch.pl" rel=3D"noreferrer noreferrer" target=3D"_blank">checkpatch.pl</a><=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; according to the first two tasks, i am =
unemployed how should i respond to these?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0I do not know which list of tasks you are re=
ferring to. So, I cannot<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0comment on the first two tasks.<br>
&gt; <br>
&gt; =C2=A0 =C2=A0<br>
&gt; =C2=A0 =C2=A01.Participation permission from school or employer.<br>
&gt; =C2=A0 =C2=A0 2.School Enrollment Verification.<br>
&gt;<br>
<br>
Please check the CommunityBridge organisation if mentorships on the Linux <=
br>
kernel are also open to mentees that are not enrolled in the university?<br=
>
<br>
I do not know the exact expectations for the mentorship selection.<br>
<br>
Lukas</blockquote></div>

--00000000000064a68005aee2c3e5--

--===============4287123487148340343==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============4287123487148340343==--
