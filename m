Return-Path: <SRS0=P4BV=CS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C437C43461
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  9 Sep 2020 14:07:12 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6994321D7D
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  9 Sep 2020 14:07:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pZFHak5w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6994321D7D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id DD4AF872D3;
	Wed,  9 Sep 2020 14:07:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0Rx3M8Z53aHw; Wed,  9 Sep 2020 14:07:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id CE129872D0;
	Wed,  9 Sep 2020 14:07:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B5203C0859;
	Wed,  9 Sep 2020 14:07:09 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6B7EDC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 14:07:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 525768751B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 14:07:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s-dqLwAJEd9m
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 14:07:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0606D873F5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 14:07:07 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id z22so3745406ejl.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 09 Sep 2020 07:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vCHR4HbcQlf/RmAU6BqGIAvbrGnHPtLTQv27sQ+4LsE=;
 b=pZFHak5wWMY0iqMXtzNhzDczb5Im61h1kU/+1314O/nWPH7b6Y/newTpLmEW00ynx5
 CJFOikzSG+qnwiA2yPaJ1cYbR2S25lhagFUDUFS98iRHiI/Ccmd900Hb66IHjC41OHba
 y2QZeXC7EMvVlXF4kudpTL5glec9qj1btokd1CjPZeIzgXejSLmoKaQIXSm5r4cYhaJP
 iMQV/ZKlErA/cYwwqY8/bT7By/Ou4qIfSUXJRQ3ZQkBvUp3fsIuYnMqhQD6M42XcFp7U
 ynBryEgAjfxaH2Yap8uvKtiicu2G9PizgaJlZ+OE8tO7AhjCkIY432w9dt1xK3rjlFBq
 vXTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vCHR4HbcQlf/RmAU6BqGIAvbrGnHPtLTQv27sQ+4LsE=;
 b=hSQ14xPTytJRyhni+dxxbtqslobzQh+DTcL+G6O7rZIcsm7DKMdAFEgI/XpVSvEtyw
 Ry5nPzqBE6hcf/4TjpFxRPo2347rj04ffSp9ljXl4W1H9bcC5ekQxZRtWtX0KpSG4R26
 I+ATFziOw4rTL4UiqYZvs0QI4SK6wKwcIyTO7ZfHimMqG3lzH1YurT6ggCT9c5fBRiwn
 PUq7liym3o18+c/A18/xxeIA0z7/1GC2bgpilR6Ax5aJRuixI31MN3QZ9j0yxkjXibyV
 oXw/Wt6jMP4NTGE8Mjkn7wPvxP4hdV1w4s4YoHtrOONDeh9coKOsIZovg8mVK3RiA9ry
 agwQ==
X-Gm-Message-State: AOAM530II+aC6IMs9LizGIquO+7sW6zR569dqV4YMW4K1xklCkKd9kXR
 xWVssaTGrdwKc0R9J4RpEvApRajwU0w18lnjPek=
X-Google-Smtp-Source: ABdhPJwIRos66DdsCV+6szqyVHjAAAhLCYVhNOF8enmdSKlvFcLKKggOWJsaPohP+u4Nv6/eHO/d9U6JsIxri1FoLBI=
X-Received: by 2002:a17:906:9443:: with SMTP id
 z3mr4083009ejx.156.1599660425310; 
 Wed, 09 Sep 2020 07:07:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAM1DhOivT_U=N6K-J0A7aDpG9QwEng4n9nZyS5knDKofqeunuA@mail.gmail.com>
 <alpine.DEB.2.21.2009091511200.23843@felia>
In-Reply-To: <alpine.DEB.2.21.2009091511200.23843@felia>
From: Alaa Emad <alaaemadhossney.ae@gmail.com>
Date: Wed, 9 Sep 2020 16:06:52 +0200
Message-ID: <CAM1DhOjACW=BGQvOvfbQZGexYdwa0wf-CCNHQ=XvXdWkUC3XpA@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============4698571537367554178=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============4698571537367554178==
Content-Type: multipart/alternative; boundary="00000000000069766605aee1f79e"

--00000000000069766605aee1f79e
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 9, 2020, 3:19 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:

>
>
> On Wed, 9 Sep 2020, Alaa Emad wrote:
>
> > Hello Lukas Bulwahn,
> > i hope this email finds you well , i applied for  Linux Kernel: Evaluate
> and Improve checkpatch.pl
> >
> > according to the first two tasks, i am unemployed how should i respond
> to these?
> >
>
> I do not know which list of tasks you are referring to. So, I cannot
> comment on the first two tasks.
>

   1.Participation permission from school or employer.
    2.School Enrollment Verification.

>
> > also are there any resources to run and patch the checkpatch.pl ,
> Please?
> >
>
> Here is some starting information:
>
> The zeroth task is to learn suitable netiquette for the communication with
> the kernel community.
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
> I understood.
>

Second, please always CC: linux-kernel-mentees@lists.linuxfoundation.org.
>

    done

>
> Third, set up your email client according to the kernel community rules.
>
>
>
> Then, the first task is to run checkpatch.pl on a few kernel patches and
> collect the results. When you have that, please share your script with
> me, e.g., in a github repository.
>
>
> Hints to the first task:
>
> Can you create a list of all non-merge commits that were added in the
> version v5.8 of the kernel, i.e., all non-merge commits that are in v5.8
> and not already in v5.7?
>
> Can you share the script/command you executed and the resulting list on
> github?
>
> Can you run your script on all commits of this list above and record
> all checkpatch.pl reports, and store them in your github repository?
>
> Can you suggest ideas how to aggregate the findings and create a
> statistics? For example: Which type of error is reported most?
> Can you implement that idea?
>
>
> I also suggest to have a look at
> the options ./scripts/checkpatch.pl --list-types and
> ./scripts/checkpatch.pl --show-types. The option --show-types changes
> the output of checkpatch.pl to list type identifiers, so it is easier
> to parse and aggregate the output.
>
> Please also share the script you create for that purpose on your
> github repository.
>
>
>
> The second task is to pick one warning that appears often and improve
> checkpatch.pl to handle that better and get it accepted by the kernel
> community.
>
> Hints to the second task follow when the first task is solved.
>
> If you fail on any of those tasks, you are out of the selection process.
>
> I could implement that with just a few lines of code changes, but please
> do not underestimate the learning curve here. I hope you are very fit in
> Perl, that is required for this project.
>
> The selection of the mentee will happen at the end of this month.
>
> So, the first task should be done within this first week, so that you
> have time for changing checkpatch.pl, testing and discussing the
> change
>
>
> Thank you for your hints,  i will do check these points and return back to
> you


    Alaa

Lukas
>
> > Thanks in advance ,
> > Alaa Emad
> >
> >

--00000000000069766605aee1f79e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Sep 9, 2020, 3:19 PM Lukas Bulwahn &lt;<a href=
=3D"mailto:lukas.bulwahn@gmail.com">lukas.bulwahn@gmail.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><br>
<br>
On Wed, 9 Sep 2020, Alaa Emad wrote:<br>
<br>
&gt; Hello=C2=A0Lukas Bulwahn,<br>
&gt; i hope this email finds you well , i applied for=C2=A0 Linux Kernel: E=
valuate and Improve <a href=3D"http://checkpatch.pl" rel=3D"noreferrer nore=
ferrer" target=3D"_blank">checkpatch.pl</a><br>
&gt; <br>
&gt; according to the first two tasks, i am unemployed how should i respond=
 to these?<br>
&gt;<br>
<br>
I do not know which list of tasks you are referring to. So, I cannot <br>
comment on the first two tasks.<br></blockquote></div></div><div dir=3D"aut=
o">=C2=A0 =C2=A0</div><div dir=3D"auto">=C2=A0 =C2=A01.Participation permis=
sion from school or employer.</div><div dir=3D"auto">=C2=A0 =C2=A0 2.School=
 Enrollment Verification.</div><div dir=3D"auto"><div class=3D"gmail_quote"=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">
<br>
&gt; also are there any resources to run and patch the=C2=A0<a href=3D"http=
://checkpatch.pl" rel=3D"noreferrer noreferrer" target=3D"_blank">checkpatc=
h.pl</a> , Please?=C2=A0<br>
&gt;<br>
<br>
Here is some starting information:<br>
<br>
The zeroth task is to learn suitable netiquette for the communication with =
<br>
the kernel community.<br>
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
#39;m <br>
replying?<br><br>I understood.=C2=A0<br></blockquote></div></div><div dir=
=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">
Second, please always CC: <a href=3D"mailto:linux-kernel-mentees@lists.linu=
xfoundation.org" target=3D"_blank" rel=3D"noreferrer">linux-kernel-mentees@=
lists.linuxfoundation.org</a>.<br></blockquote></div></div><div dir=3D"auto=
"><br></div><div dir=3D"auto">=C2=A0 =C2=A0 done</div><div dir=3D"auto"><di=
v class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Third, set up your email client according to the kernel community rules.<br=
>
<br>
<br>
<br>
Then, the first task is to run <a href=3D"http://checkpatch.pl" rel=3D"nore=
ferrer noreferrer" target=3D"_blank">checkpatch.pl</a> on a few kernel patc=
hes and<br>
collect the results. When you have that, please share your script with<br>
me, e.g., in a github repository.<br>
<br>
<br>
Hints to the first task:<br>
<br>
Can you create a list of all non-merge commits that were added in the<br>
version v5.8 of the kernel, i.e., all non-merge commits that are in v5.8<br=
>
and not already in v5.7?<br>
<br>
Can you share the script/command you executed and the resulting list on <br=
>
github?<br>
<br>
Can you run your script on all commits of this list above and record<br>
all <a href=3D"http://checkpatch.pl" rel=3D"noreferrer noreferrer" target=
=3D"_blank">checkpatch.pl</a> reports, and store them in your github reposi=
tory?<br>
<br>
Can you suggest ideas how to aggregate the findings and create a<br>
statistics? For example: Which type of error is reported most?<br>
Can you implement that idea?<br>
<br>
<br>
I also suggest to have a look at<br>
the options ./scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer no=
referrer" target=3D"_blank">checkpatch.pl</a> --list-types and<br>
./scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">checkpatch.pl</a> --show-types. The option --show-types cha=
nges<br>
the output of <a href=3D"http://checkpatch.pl" rel=3D"noreferrer noreferrer=
" target=3D"_blank">checkpatch.pl</a> to list type identifiers, so it is ea=
sier<br>
to parse and aggregate the output.<br>
<br>
Please also share the script you create for that purpose on your<br>
github repository.<br>
<br>
<br>
<br>
The second task is to pick one warning that appears often and improve<br>
<a href=3D"http://checkpatch.pl" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">checkpatch.pl</a> to handle that better and get it accepted by the ke=
rnel<br>
community.<br>
<br>
Hints to the second task follow when the first task is solved.<br>
<br>
If you fail on any of those tasks, you are out of the selection process.<br=
>
<br>
I could implement that with just a few lines of code changes, but please <b=
r>
do not underestimate the learning curve here. I hope you are very fit in <b=
r>
Perl, that is required for this project.<br>
<br>
The selection of the mentee will happen at the end of this month.<br>
<br>
So, the first task should be done within this first week, so that you<br>
have time for changing <a href=3D"http://checkpatch.pl" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">checkpatch.pl</a>, testing and discussing the<=
br>
change<br><br><br>Thank you for your hints,=C2=A0 i will do check these poi=
nts and return back to you=C2=A0</blockquote></div></div><div dir=3D"auto">=
=C2=A0 =C2=A0=C2=A0</div><div dir=3D"auto">=C2=A0 =C2=A0 Alaa</div><div dir=
=3D"auto"><br></div><div dir=3D"auto"></div><div dir=3D"auto"><div class=3D=
"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">
Lukas<br>
<br>
&gt; Thanks in advance ,<br>
&gt; Alaa Emad<br>
&gt; <br>
&gt; </blockquote></div></div></div>

--00000000000069766605aee1f79e--

--===============4698571537367554178==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============4698571537367554178==--
