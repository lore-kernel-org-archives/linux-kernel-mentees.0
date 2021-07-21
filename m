Return-Path: <SRS0=/QuR=MN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1608C6377B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Jul 2021 21:18:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44BA661009
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Jul 2021 21:18:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44BA661009
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 105CF402BA;
	Wed, 21 Jul 2021 21:18:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UIXgcXMRBbkr; Wed, 21 Jul 2021 21:18:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id A2263402B5;
	Wed, 21 Jul 2021 21:18:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7FD22C001A;
	Wed, 21 Jul 2021 21:18:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E60B6C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jul 2021 21:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D303A400F0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jul 2021 21:18:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9lzPsAedyqFD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jul 2021 21:18:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A9579400E1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jul 2021 21:18:26 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id w188so4335891oif.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jul 2021 14:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KTcF2ukGdv4Ld9+9x7AwMwAg6CGgC1ECwKjQusdxI+4=;
 b=Dw5zdMrv96o/DQTyJUkmLLgdUjWH93DTAewZfzYwwIUvZMioV1Cak/IinyX98AzMxo
 j7l5hfM/XYYFTIEdaQpoqeN4fQ+PUNihl+SCpGwxKsLKeZO3IFEXVEeU7he5Vgw8cB86
 NQ/DGOgIeg74aluTsJX52DqSYrGMkT6dsUcDlsrGR/vuicebg7tQ0yK+b2BhFRLcaV1o
 mXkqnYyz9A9vS2mhNx9Mg4LwoscjPJyKf0xWzuDd2qZat/d9O86VU5O0hcTg6B0WiVna
 GkBFE7bX0Gc1vzPMTLcybCt95PtUH43IszQZ0GP8GiE/GwPDAMFcifxWJ1ByGM9h/Ae3
 kKQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KTcF2ukGdv4Ld9+9x7AwMwAg6CGgC1ECwKjQusdxI+4=;
 b=AEMQCIfL/Ufuwcg+r4xPEj7gxedIF58jFCSsJ9yk173S+YBWR406Sx6Yo8HdwYzvF6
 M7QdxLjAnIuYIJ5LoamH1GXOfxk5Zm34BDhaJp1q1VqsEVJ5ndw6uFcuI+ysGEige39d
 VFLvpfZRNNvkPUGQtz2V/aaSLCsaXIMnoVrplFyRskccRjlrV/emgTZqX9fLUjqgKTpn
 oZIqQGiAxkYYEW0I9zXSI0vviKgf9ztZxRC3TfQV5MxePJZrDhmM9w2ogQ2IsgSCXacR
 0r/B/AFBQ8tOYa9qr9qJE9ly0QhRaMzpb2NMmCAqKRRt87at9SMiJHFjpUO5WSIVycOr
 X4dg==
X-Gm-Message-State: AOAM530bF4mtdNf6ZyFP43PdrP+60R7Q0QV2fRToFtIb/ttDvVvUU24v
 MJW1CMGYwxcbIliwQibU8jmCpacXGwhFv0yAFD0=
X-Google-Smtp-Source: ABdhPJxaBNIp2AQXoyUyPLjPi/TNpCuqf69R2xGBZCnYoePo+YK9Dk7pw6gxxbLzYsb3IUo1ans9gZagwzV9+uKtHyQ=
X-Received: by 2002:a05:6808:2d2:: with SMTP id
 a18mr3971049oid.106.1626902305637; 
 Wed, 21 Jul 2021 14:18:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAHTkpbUFQ0jH7wowLzAzTjRuXBKpMB0qonj4RQV9i6VWnb2hZA@mail.gmail.com>
 <CABJPP5D4MazftKO78Hrm+phKP=HqpLeNxpe234cNZOSJF=iRhw@mail.gmail.com>
In-Reply-To: <CABJPP5D4MazftKO78Hrm+phKP=HqpLeNxpe234cNZOSJF=iRhw@mail.gmail.com>
From: Chaytanya Sinha <chaytanyas4@gmail.com>
Date: Thu, 22 Jul 2021 02:48:14 +0530
Message-ID: <CAHTkpbUARsfwAe=w6C6XrbjVMV-94vS-0gy6g1Eo40_skS71Rw@mail.gmail.com>
Subject: Re: Application for Linux Mentorship under Linux Kernel
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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
Content-Type: multipart/mixed; boundary="===============3525061254410151790=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============3525061254410151790==
Content-Type: multipart/alternative; boundary="00000000000003074705c7a8b60e"

--00000000000003074705c7a8b60e
Content-Type: text/plain; charset="UTF-8"

Respected mentor,

Thanks for sharing the important information and task with me.
I'll get back with the solution as soon as possible.

Regards

On Thu, 22 Jul 2021, 02:38 Dwaipayan Ray, <dwaipayanray1@gmail.com> wrote:

> On Thu, Jul 22, 2021 at 2:24 AM Chaytanya Sinha <chaytanyas4@gmail.com>
> wrote:
> >
> > Respected Mentor,
> >
> > I am interested in the Checkpatch Documentation mentorship program and I
> would like to work on the tasks for the mentee selection.
> >
> > I will try my best to complete the tasks as soon as possible.
> >
> > Regards
>
> Thanks for your interest in working with the checkpatch documentation.
>
> The zeroth task is to learn suitable netiquette for the communication with
> the kernel community. Below are some basic rules and pointers for this
> mentorship. More information on kernel netiquette is also at
> https://people.kernel.org/tglx/notes-about-netiquette.
>
> First, please do not top-post.
>
>     A: Because we read from top to bottom, left to right.
>     Q: Why should I start my reply below the quoted text?
>
>     A: Because it messes up the order in which people normally read text.
>     Q: Why is top-posting such a bad thing?
>
>     A: The lost context.
>     Q: What makes top-posted replies harder to read than bottom-posted?
>
>     A: Yes.
>     Q: Should I trim down the quoted part of an email to which I'm
> replying?
>
> Second, please always CC: linux-kernel-mentees@lists.linuxfoundation.org.
>
> Third, set up your email client according to the kernel community
> rules. Here is some information to that:
>
>
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html#no-mime-no-links-no-compression-no-attachments-just-plain-text
> https://www.kernel.org/doc/html/latest/process/email-clients.html
>
> Generally more information on submitting patches and responding on
> replies is at
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html
>
> Once the zeroth task is understood, you can now move on to the first
> task: Running checkpatch on a specific file.
>
> Get a clone of the Linux kernel repository.
> The script checkpatch.pl is under the scripts directory.
>
> Then, the first task is to run checkpatch.pl on a few files below
> and share the results:
>
> drivers/crypto/ux500/hash/hash_core.c
> drivers/crypto/ux500/cryp/cryp_core.c
>
> Which information on these rules that checkpatch warns about
> is available in the Checkpatch Documentation?
>
> If documentation of these rules is available, explain your
> understanding of the rules in your own words.
> If no information is available in the documentation,
> explain your understanding of the rule.
>
> In any case, explain the violation that is checked and raised in the
> checkpatch script, i.e., what is implemented in checkpatch to check
> the rule and possible violations. Which code in the checkpatch script
> is raising the warning? What does it check and how is that
> implemented?
>
> Explain how to possibly fix this code with regards to that violation.
>
> Once you succeed on this first task, we inform you about the further
> second and third task. If you fail on any of those tasks, you are out
> of the selection process.
>
> The selection of the mentee will happen according to schedule,
> at earliest on August 12th and at latest at the end of August.
> More information is available at
>
> https://docs.linuxfoundation.org/lfx/mentorship/mentorship-program-timelines
> .
>
> Dwaipayan.
>

--00000000000003074705c7a8b60e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"auto"><div dir=3D"auto">Respected mentor,</div=
><div dir=3D"auto"><br></div>Thanks for sharing the important information a=
nd task with me.<br>I&#39;ll get back with the solution as soon as possible=
.</div><div dir=3D"auto"><br></div><div>Regards</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 22 Jul 2021,=
 02:38 Dwaipayan Ray, &lt;<a href=3D"mailto:dwaipayanray1@gmail.com" target=
=3D"_blank">dwaipayanray1@gmail.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">On Thu, Jul 22, 2021 at 2:24 AM Chaytany=
a Sinha &lt;<a href=3D"mailto:chaytanyas4@gmail.com" rel=3D"noreferrer" tar=
get=3D"_blank">chaytanyas4@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Respected Mentor,<br>
&gt;<br>
&gt; I am interested in the Checkpatch Documentation mentorship program and=
 I would like to work on the tasks for the mentee selection.<br>
&gt;<br>
&gt; I will try my best to complete the tasks as soon as possible.<br>
&gt;<br>
&gt; Regards<br>
<br>
Thanks for your interest in working with the checkpatch documentation.<br>
<br>
The zeroth task is to learn suitable netiquette for the communication with<=
br>
the kernel community. Below are some basic rules and pointers for this<br>
mentorship. More information on kernel netiquette is also at<br>
<a href=3D"https://people.kernel.org/tglx/notes-about-netiquette" rel=3D"no=
referrer noreferrer" target=3D"_blank">https://people.kernel.org/tglx/notes=
-about-netiquette</a>.<br>
<br>
First, please do not top-post.<br>
<br>
=C2=A0 =C2=A0 A: Because we read from top to bottom, left to right.<br>
=C2=A0 =C2=A0 Q: Why should I start my reply below the quoted text?<br>
<br>
=C2=A0 =C2=A0 A: Because it messes up the order in which people normally re=
ad text.<br>
=C2=A0 =C2=A0 Q: Why is top-posting such a bad thing?<br>
<br>
=C2=A0 =C2=A0 A: The lost context.<br>
=C2=A0 =C2=A0 Q: What makes top-posted replies harder to read than bottom-p=
osted?<br>
<br>
=C2=A0 =C2=A0 A: Yes.<br>
=C2=A0 =C2=A0 Q: Should I trim down the quoted part of an email to which I&=
#39;m replying?<br>
<br>
Second, please always CC: <a href=3D"mailto:linux-kernel-mentees@lists.linu=
xfoundation.org" rel=3D"noreferrer" target=3D"_blank">linux-kernel-mentees@=
lists.linuxfoundation.org</a>.<br>
<br>
Third, set up your email client according to the kernel community<br>
rules. Here is some information to that:<br>
<br>
<a href=3D"https://www.kernel.org/doc/html/latest/process/submitting-patche=
s.html#no-mime-no-links-no-compression-no-attachments-just-plain-text" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://www.kernel.org/doc/htm=
l/latest/process/submitting-patches.html#no-mime-no-links-no-compression-no=
-attachments-just-plain-text</a><br>
<a href=3D"https://www.kernel.org/doc/html/latest/process/email-clients.htm=
l" rel=3D"noreferrer noreferrer" target=3D"_blank">https://www.kernel.org/d=
oc/html/latest/process/email-clients.html</a><br>
<br>
Generally more information on submitting patches and responding on<br>
replies is at <a href=3D"https://www.kernel.org/doc/html/latest/process/sub=
mitting-patches.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https=
://www.kernel.org/doc/html/latest/process/submitting-patches.html</a><br>
<br>
Once the zeroth task is understood, you can now move on to the first<br>
task: Running checkpatch on a specific file.<br>
<br>
Get a clone of the Linux kernel repository.<br>
The script <a href=3D"http://checkpatch.pl" rel=3D"noreferrer noreferrer" t=
arget=3D"_blank">checkpatch.pl</a> is under the scripts directory.<br>
<br>
Then, the first task is to run <a href=3D"http://checkpatch.pl" rel=3D"nore=
ferrer noreferrer" target=3D"_blank">checkpatch.pl</a> on a few files below=
<br>
and share the results:<br>
<br>
drivers/crypto/ux500/hash/hash_core.c<br>
drivers/crypto/ux500/cryp/cryp_core.c<br>
<br>
Which information on these rules that checkpatch warns about<br>
is available in the Checkpatch Documentation?<br>
<br>
If documentation of these rules is available, explain your<br>
understanding of the rules in your own words.<br>
If no information is available in the documentation,<br>
explain your understanding of the rule.<br>
<br>
In any case, explain the violation that is checked and raised in the<br>
checkpatch script, i.e., what is implemented in checkpatch to check<br>
the rule and possible violations. Which code in the checkpatch script<br>
is raising the warning? What does it check and how is that<br>
implemented?<br>
<br>
Explain how to possibly fix this code with regards to that violation.<br>
<br>
Once you succeed on this first task, we inform you about the further<br>
second and third task. If you fail on any of those tasks, you are out<br>
of the selection process.<br>
<br>
The selection of the mentee will happen according to schedule,<br>
at earliest on August 12th and at latest at the end of August.<br>
More information is available at<br>
<a href=3D"https://docs.linuxfoundation.org/lfx/mentorship/mentorship-progr=
am-timelines" rel=3D"noreferrer noreferrer" target=3D"_blank">https://docs.=
linuxfoundation.org/lfx/mentorship/mentorship-program-timelines</a>.<br>
<br>
Dwaipayan.<br>
</blockquote></div>

--00000000000003074705c7a8b60e--

--===============3525061254410151790==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============3525061254410151790==--
