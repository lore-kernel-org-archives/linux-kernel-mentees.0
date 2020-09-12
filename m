Return-Path: <SRS0=2/a+=CV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8B93C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 12 Sep 2020 09:09:28 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF792214F1
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 12 Sep 2020 09:09:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K7ej8+Xq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF792214F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 3716820446;
	Sat, 12 Sep 2020 09:09:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rU8QCG-8JWnD; Sat, 12 Sep 2020 09:09:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B697F20426;
	Sat, 12 Sep 2020 09:09:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 98D82C0859;
	Sat, 12 Sep 2020 09:09:24 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 064DEC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 09:09:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E091220446
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 09:09:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qGDW21dPEcRo
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 09:09:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 by silver.osuosl.org (Postfix) with ESMTPS id 6E9D220426
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 09:09:21 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id i17so12014334oig.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 02:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9Swm5Zk/WZSQzoLHaATv4LKOYjOxEcygwL7WsIF+WNs=;
 b=K7ej8+Xqws4FeacGyM0+kl73zaPjL/bEiHRCOtgc85XQrk06E9AOAVOBVRhK7Vj6Lg
 bTStW8VY5ArT5k9sLbALtX0T3D+J/K843z2rvwfRTJJYqf2/0D3lAk8EFOPw5c0Bz1lV
 RK7DvC4TximsU2sR9hNd6NaRZs6AJ4EYRBoEyGZE0fhNjYaJx1GdKQYU1wFfGRoFSISI
 2Nb4D+E9qF3lpkemBz5b9GoqUAq7EK/ZcxDqne/k/0uZew9aXADhIW7NIauLVB8dPjEm
 UCwkxx47Sxeff6TWWy1JIAMxJPJCzv+gB+zq1RYG0+TeSccu/LMAbN10ziSE5+tmLl6w
 9vTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9Swm5Zk/WZSQzoLHaATv4LKOYjOxEcygwL7WsIF+WNs=;
 b=SJQBCTWG2NjYTX6wilDfEUocxU02dH17Nn080Fz6chQk0m5VxY9DC2uK5b63H9fd9u
 m6BlQ2o36rjQCAAeK3yCXZJmO/4kWvzBcTXFOdKbs9bb712wrq5Xy81XF5FvMNtg8SYv
 QXWjuYxtjst61A0YObN763mTVFUMV5td9bnR6rBsvCiLiU2wJtquhwMXM0JYHzoL/NM2
 N7PZXvOjzCNfBkLvc8675HNzEjFqTpuNPo9PtOe3akziFGRVfNJY++yv9gpgYl397M0J
 X9+mZprnYDG+iuyyNuAufoSrnuvy84QU1T3q70Mq4nJfu4e0TxCBK1Cio84vsSKJDzTQ
 GMmQ==
X-Gm-Message-State: AOAM530y6ctyEzAhQzPSsGfYHyFlTliY58xBD3VckEIX4CLnfx/EaCnW
 7eg9HAOyhK3NqxkiW7tq9F8b2VbUaY3wHoeC8Ls=
X-Google-Smtp-Source: ABdhPJyFYWupR169QCTKG6E+2/+4DHvyo1xH+MJxQ+bpn3RhCOs3+u/5tl22lDpHYim2ufcj07tldhj+HVqshQS+poU=
X-Received: by 2002:aca:5050:: with SMTP id e77mr3463444oib.74.1599901760226; 
 Sat, 12 Sep 2020 02:09:20 -0700 (PDT)
MIME-Version: 1.0
References: <CABJPP5CSa_QowD-O3_E5ndoQJvuBv=n2x5WG-acwQKE=rt5+Rw@mail.gmail.com>
 <alpine.DEB.2.21.2009110925160.9220@felia>
In-Reply-To: <alpine.DEB.2.21.2009110925160.9220@felia>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sat, 12 Sep 2020 14:39:06 +0530
Message-ID: <CABJPP5AWNpYyx5asMNZccqbq07ZW+pH+EwJ+KTZ+SSOAnWZwVQ@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Linux kernel checkpatch.pl mentorship
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
Content-Type: multipart/mixed; boundary="===============0844476283909318116=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============0844476283909318116==
Content-Type: multipart/alternative; boundary="000000000000180b4205af1a28ed"

--000000000000180b4205af1a28ed
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 11, 2020 at 12:59 PM Lukas Bulwahn <lukas.bulwahn@gmail.com>
wrote:

> Dear Dwaipayan,
>
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
> Second, please always CC: linux-kernel-mentees@lists.linuxfoundation.org.
>
> Third, set up your email client according to the kernel community rules.
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
> I also suggest to have a look at the options ./scripts/checkpatch.pl
> --list-types and ./scripts/checkpatch.pl --show-types. The option
> --show-types changes the output of checkpatch.pl to list type
> identifiers,
> so it is easier to parse and aggregate the output.
>
> Please also share the script you create for that purpose on your
> github repository.
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
>
> Lukas
>


Hello Sir,
I have gone through the zeroth task and I am aware of the mailing rules
now.
Also I have implemented the first task and I would like you to review it.

The task was to run checkpatch.pl on some commits and aggregate the
reports.

The first subtask was to collect the non merge commits between versions 5.7
and 5.8.
I aggregated the commit hashes and author names into a single file using
git's log
and pretty format directives.

The next subtask was to run checkpatch.pl on all the given commits.
I wrote a perl script to this effect which reads the commits stored in the
file and runs the checkpatch.pl script with the commit hash. Also I used
the
--show-types directives in this stage which allowed me easier collection of
warning and error identifiers.

The final subtask was to aggregate and parse the data. Looking at the
checkpatch's output
format, I determined it was enough to parse only the first two tokens from
each line.
I calculated three possibilities:  "WARNING:{warning_identifier}",
"ERROR:{error_identifier}",
"Commit {commit_abbrev_hash}", and aggregated these values.

Finally I used them to find total commits read, total errors, total
warnings,
and the most frequent warnings and errors from checkpatch's output.

I have uploaded the scripts and output files to
https://github.com/raydwaipayan/lkm-task-1

Hoping to get your review soon.

Thanking you,
Dwaipayan.

--000000000000180b4205af1a28ed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 11, 2020 at 12:59 PM Luka=
s Bulwahn &lt;<a href=3D"mailto:lukas.bulwahn@gmail.com">lukas.bulwahn@gmai=
l.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Dear Dwaipayan,<br>
<br>
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
replying?<br>
<br>
Second, please always CC: <a href=3D"mailto:linux-kernel-mentees@lists.linu=
xfoundation.org" target=3D"_blank">linux-kernel-mentees@lists.linuxfoundati=
on.org</a>.<br>
<br>
Third, set up your email client according to the kernel community rules.<br=
>
<br>
<br>
Then, the first task is to run <a href=3D"http://checkpatch.pl" rel=3D"nore=
ferrer" target=3D"_blank">checkpatch.pl</a> on a few kernel patches and<br>
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
all <a href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D"_blank">c=
heckpatch.pl</a> reports, and store them in your github repository?<br>
<br>
Can you suggest ideas how to aggregate the findings and create a<br>
statistics? For example: Which type of error is reported most?<br>
Can you implement that idea?<br>
<br>
<br>
I also suggest to have a look at the options ./scripts/<a href=3D"http://ch=
eckpatch.pl" rel=3D"noreferrer" target=3D"_blank">checkpatch.pl</a> <br>
--list-types and ./scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferr=
er" target=3D"_blank">checkpatch.pl</a> --show-types. The option <br>
--show-types changes the output of <a href=3D"http://checkpatch.pl" rel=3D"=
noreferrer" target=3D"_blank">checkpatch.pl</a> to list type identifiers, <=
br>
so it is easier to parse and aggregate the output.<br>
<br>
Please also share the script you create for that purpose on your<br>
github repository.<br>
<br>
<br>
The second task is to pick one warning that appears often and improve<br>
<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D"_blank">check=
patch.pl</a> to handle that better and get it accepted by the kernel<br>
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
<br>
Lukas<br></blockquote><div><br></div><div><br></div><div>Hello Sir,</div><d=
iv>I have gone through the zeroth task and I am aware of the mailing rules =
now.=C2=A0</div><div>Also I have implemented the first task and I would lik=
e you to review it.</div><div><br></div><div>The task was to run <a href=3D=
"http://checkpatch.pl">checkpatch.pl</a> on some commits and aggregate the =
reports.=C2=A0</div><div><br></div><div>The first subtask was to collect th=
e non merge commits between versions 5.7 and 5.8.=C2=A0</div><div>I aggrega=
ted the commit hashes and author names into a single file using git&#39;s l=
og</div><div>and pretty format directives.</div><div><br></div><div>The nex=
t subtask was to run <a href=3D"http://checkpatch.pl">checkpatch.pl</a> on =
all the given commits.</div><div>I wrote a perl script to this effect which=
 reads the commits stored in the=C2=A0</div><div>file and runs the <a href=
=3D"http://checkpatch.pl">checkpatch.pl</a> script with the commit hash. Al=
so I used the=C2=A0</div><div>--show-types directives in this stage which a=
llowed me easier collection of</div><div>warning and error identifiers.</di=
v><div><br></div><div>The final subtask was to aggregate and parse the data=
. Looking at the checkpatch&#39;s output=C2=A0</div><div>format, I determin=
ed it was enough to parse only the first two tokens from each line.</div><d=
iv>I calculated three possibilities:=C2=A0 &quot;WARNING:{warning_identifie=
r}&quot;, &quot;ERROR:{error_identifier}&quot;,</div><div>&quot;Commit {com=
mit_abbrev_hash}&quot;, and aggregated these values.</div><div><br></div><d=
iv>Finally I used them to find total commits read, total errors, total warn=
ings,</div><div>and the most frequent warnings and errors from checkpatch&#=
39;s output.=C2=A0</div><div><br></div><div>I have uploaded the scripts and=
 output files to=C2=A0<a href=3D"https://github.com/raydwaipayan/lkm-task-1=
">https://github.com/raydwaipayan/lkm-task-1</a></div><div><br></div><div>H=
oping to get your review soon.</div><div><br></div><div>Thanking you,</div>=
<div>Dwaipayan.</div></div></div>

--000000000000180b4205af1a28ed--

--===============0844476283909318116==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============0844476283909318116==--
