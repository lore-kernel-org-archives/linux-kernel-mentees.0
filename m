Return-Path: <SRS0=DUpp=CW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C563C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 13 Sep 2020 08:17:12 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E91FB2076C
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 13 Sep 2020 08:17:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E9fgeqL+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E91FB2076C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A22F8871FE;
	Sun, 13 Sep 2020 08:17:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gu6sYPOPpBtk; Sun, 13 Sep 2020 08:17:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id ECF78871F3;
	Sun, 13 Sep 2020 08:17:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CD83AC0859;
	Sun, 13 Sep 2020 08:17:10 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 53458C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 08:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3F0E986BEA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 08:17:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zmG4KXWckc7F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 08:17:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2D4DA86B7D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 08:17:08 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id o8so4426554otl.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 01:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/bmyJR6vbXaIwnEDtzHPY/zHTnycHNoz5sRhjI1x/iA=;
 b=E9fgeqL+MHhu0e+wwfKL9PWGgXc7vUl4ozk2CBZeVWWCaA8XfZQMQe4Z5jTUnxOnrx
 1UZFz3kQFRZgpB50IFZJAezi/Wp1nzair/lk8O3Y0rnyj3U5MxfeYwHEAxMXxfAXm4Q1
 3gZbNoX9PzhBD1H5w8wSRuXLrDi3uK24nRQrF913NswuJHDNU6all2DK4hGG8oY1Z9M8
 wj+Fj8eMeQIkicdDXIVgpOkO1zWytn2HPNcPFw1HBP5wNlpM+6YxdJeqJBQ19vzzMiMG
 iKY6XoXCTNYiH1+XZW6SBFfuE7mDBU/0F48GzI48mp/3hIh5WxWhJk1AzNirI8QHSdKO
 8dbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/bmyJR6vbXaIwnEDtzHPY/zHTnycHNoz5sRhjI1x/iA=;
 b=rwY46PfnixRjyMIDnlfJqbLq7hCDtV3qjMDZSqM4nY3N1H3D5YZaeeSfwF5R16RNbz
 vUzUi8UelEqUh82nKK+bGjDB0pKvpsaF2XZWRXiLZYbkZenwj3IlkECeShPk+jSvC1yW
 5FQB/lgYyznRNNzdjs+CaspklzrBZzZ97PTCNGJUxMmiBasbg2o/8wUPiFJSIcLp/4KG
 RwKVp7HInA0cYi3G3SQdVIvMesUJrNeydliHfeC1wb9hmcg92s2k1TAoWYavVVfBAGA6
 DABVyevuYM33W+KKng91vfwIbDwnROsejAxFXpV/MibEUOtWqaPI9X7qSVm8cHXlPX4c
 q4Xw==
X-Gm-Message-State: AOAM531bONvijn3SS54jp//iT4LC9MJJz5bFnpCXDUoyNfILpziGO+Td
 b+E6zXSin3PmjU75H32gg2l+1xuwBIZb8HThpjg=
X-Google-Smtp-Source: ABdhPJyDEMAni6BHytTBuggqnW/KXOiQ1+csJUSEeA0c4YSKtjAaWf5xOlE/0nc1/VhpfbJGVM7+kwEBoL4CAemBsBY=
X-Received: by 2002:a9d:4b18:: with SMTP id q24mr5766631otf.265.1599985027181; 
 Sun, 13 Sep 2020 01:17:07 -0700 (PDT)
MIME-Version: 1.0
References: <CABJPP5CSa_QowD-O3_E5ndoQJvuBv=n2x5WG-acwQKE=rt5+Rw@mail.gmail.com>
 <alpine.DEB.2.21.2009110925160.9220@felia>
 <CABJPP5AWNpYyx5asMNZccqbq07ZW+pH+EwJ+KTZ+SSOAnWZwVQ@mail.gmail.com>
 <alpine.DEB.2.21.2009121252280.13082@felia>
 <CABJPP5DMF9OpZR0agobunb3i3hLGkqedbeL-YohNn0X6Juk64w@mail.gmail.com>
 <alpine.DEB.2.21.2009121419430.3770@felia>
In-Reply-To: <alpine.DEB.2.21.2009121419430.3770@felia>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sun, 13 Sep 2020 13:46:51 +0530
Message-ID: <CABJPP5BFNjBhdcvBWqDYnR-o2sZ0oY77bYr9PxducXW4Y=482Q@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============3644277956846063797=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============3644277956846063797==
Content-Type: multipart/alternative; boundary="00000000000030f08e05af2d8b73"

--00000000000030f08e05af2d8b73
Content-Type: text/plain; charset="UTF-8"

On Sat, Sep 12, 2020 at 5:51 PM Lukas Bulwahn <lukas.bulwahn@gmail.com>
wrote:
>
>
>
> On Sat, 12 Sep 2020, Dwaipayan Ray wrote:
>
> >
> > > Hmm, your email client still seems to be broken :( If you answer to my
> > > email, it should use ">" not tabs. Maybe you can fix that.>
> > > I looked at your scripts, I did not run them. They look as if they
would
> > > do the job you claim they do. They are more complicated than needed,
but
> > > it was not the task to find a simple solution. So, let us try them.
> > >
> > > Please have a look at this patch:
> > >
> > >
https://lore.kernel.org/linux-kernel-mentees/20200912094826.150170-1-ayush@disroot.org/
> > >
> > > The author states:
> > >
> > > This issue was discovered through a thorough analysis of checkpatch.pl
> > > errors and warnings of type GIT_COMMIT_ID on commits between v5.7 and
> > > v5.8.
> > >
> > > Before applying this patch, checkpatch.pl reported 342 errors of type
> > > GIT_COMMIT_ID. After applying patch, errors reduced to 284.
> > >
> > >
> > > If your scripts work, you should be able to confirm the statement.
> > >
> > > The tasks are:
> > >
> > > 1. Run your scripts and create a full statistics of all error types
with
> > > their according count for v5.7..v5.8.
> > >
> > > 2. Apply the patch with git am.
> > >
> > > 3. Run your scripts again and create a new statistics.
> > >
> > > 4. Compare before and after
> > >
> > > 5. Make all results available on your github repository.
> > >

> > The last time checkpatch.pl took awfully long to run on so many
commits. :(
> > So, it might take a while but I will report my findings on this as soon
> > it is done processing.
> >
>
> I guess a bit computing power is required, SSDs, parallelization and
> multi-core systems help :)
>

Hi,
So i managed to add parallelization in my script and the generation was a
lot faster
( brought down from >3 hours to <40 mins ).
The script is at:
https://github.com/raydwaipayan/lkm-task-1/blob/master/run_checkpatch.pl

As you told, I applied the patch and compared the statistics. In my case
however the statistics
vary. Before patching total no. of errors of type GIT_COMMIT_ID was 270,
and after patching,
the number went down to 251. This is in constrast to the author's finding
but the number
reduces, so the patch works apparently.

I am posting the diff of statistics before and after the patch:

99c99
< COMMIT_LOG_LONG_LINE: 1059
---
> COMMIT_LOG_LONG_LINE: 1057
126c126
< GIT_COMMIT_ID: 270
---
> GIT_COMMIT_ID: 251
142,143c142,143
< Warnings generated: 25661
< Errors generated: 4768
---
> Warnings generated: 25659
> Errors generated: 4749

As you can see, the warnings of type COMMIT_LOG_LONG_LINE decreased too.

The entire output and scripts can be found at:
https://github.com/raydwaipayan/lkm-task-1


Thanks,
Dwaipayan.

--00000000000030f08e05af2d8b73
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><br><font color=3D"#741b47">On Sat, Sep 12, 2020 a=
t 5:51 PM Lukas Bulwahn &lt;<a href=3D"mailto:lukas.bulwahn@gmail.com">luka=
s.bulwahn@gmail.com</a>&gt; wrote:<br>&gt;<br>&gt;<br>&gt;<br>&gt; On Sat, =
12 Sep 2020, Dwaipayan Ray wrote:<br>&gt;<br>&gt; &gt;<br>&gt; &gt; &gt; Hm=
m, your email client still seems to be broken :( If you answer to my<br>&gt=
; &gt; &gt; email, it should use &quot;&gt;&quot; not tabs. Maybe you can f=
ix that.&gt;<br>&gt; &gt; &gt; I looked at your scripts, I did not run them=
. They look as if they would<br>&gt; &gt; &gt; do the job you claim they do=
. They are more complicated than needed, but<br>&gt; &gt; &gt; it was not t=
he task to find a simple solution. So, let us try them.<br>&gt; &gt; &gt;<b=
r>&gt; &gt; &gt; Please have a look at this patch:<br>&gt; &gt; &gt;<br>&gt=
; &gt; &gt; <a href=3D"https://lore.kernel.org/linux-kernel-mentees/2020091=
2094826.150170-1-ayush@disroot.org/">https://lore.kernel.org/linux-kernel-m=
entees/20200912094826.150170-1-ayush@disroot.org/</a><br>&gt; &gt; &gt;<br>=
&gt; &gt; &gt; The author states:<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; This =
issue was discovered through a thorough analysis of <a href=3D"http://check=
patch.pl">checkpatch.pl</a><br>&gt; &gt; &gt; errors and warnings of type G=
IT_COMMIT_ID on commits between v5.7 and<br>&gt; &gt; &gt; v5.8.<br>&gt; &g=
t; &gt;<br>&gt; &gt; &gt; Before applying this patch, <a href=3D"http://che=
ckpatch.pl">checkpatch.pl</a> reported 342 errors of type<br>&gt; &gt; &gt;=
 GIT_COMMIT_ID. After applying patch, errors reduced to 284.<br>&gt; &gt; &=
gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; If your scripts work, you should be=
 able to confirm the statement.<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; The tas=
ks are:<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; 1. Run your scripts and create =
a full statistics of all error types with<br>&gt; &gt; &gt; their according=
 count for v5.7..v5.8.<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; 2. Apply the pat=
ch with git am.<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; 3. Run your scripts aga=
in and create a new statistics.<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; 4. Comp=
are before and after<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; 5. Make all result=
s available on your github repository.<br>&gt; &gt; &gt;<br><br>&gt; &gt; T=
he last time <a href=3D"http://checkpatch.pl">checkpatch.pl</a> took awfull=
y long to run on so many commits. :( <br>&gt; &gt; So, it might take a whil=
e but I will report my findings on this as soon <br>&gt; &gt; it is done pr=
ocessing.<br>&gt; &gt;</font><div><span style=3D"color:rgb(116,27,71)">&gt;=
</span><br></div><div><font color=3D"#741b47">&gt; I guess a bit computing =
power is required, SSDs, parallelization and</font><br><font color=3D"#741b=
47">&gt; multi-core systems help :)</font><br><font color=3D"#741b47">&gt;<=
/font><br><br></div><div>Hi,</div><div>So i managed to add parallelization =
in my script and the generation was a lot faster=C2=A0</div><div>( brought =
down from &gt;3 hours to &lt;40 mins ).</div><div>The script is at:=C2=A0<a=
 href=3D"https://github.com/raydwaipayan/lkm-task-1/blob/master/run_checkpa=
tch.pl">https://github.com/raydwaipayan/lkm-task-1/blob/master/run_checkpat=
ch.pl</a></div><div><br></div><div>As you told, I applied the patch and com=
pared the statistics. In my case however the statistics=C2=A0</div><div>var=
y. Before patching total no. of errors of type GIT_COMMIT_ID was 270, and a=
fter patching,</div><div>the number went down to 251. This is in constrast =
to the author&#39;s finding but the number=C2=A0</div><div>reduces, so the =
patch works apparently.</div><div><br></div><div>I am posting the diff of s=
tatistics before and after the patch:</div><div><br></div><div><font face=
=3D"monospace">99c99<br>&lt; COMMIT_LOG_LONG_LINE: 1059<br>---<br>&gt; COMM=
IT_LOG_LONG_LINE: 1057<br>126c126<br>&lt; GIT_COMMIT_ID: 270<br>---<br>&gt;=
 GIT_COMMIT_ID: 251<br>142,143c142,143<br>&lt; Warnings generated: 25661<br=
>&lt; Errors generated: 4768<br>---<br>&gt; Warnings generated: 25659<br>&g=
t; Errors generated: 4749</font><br></div><div><font face=3D"monospace"><br=
></font></div><div><font face=3D"arial, sans-serif">As you can see, the war=
nings of type COMMIT_LOG_LONG_LINE decreased too.</font></div><div><font fa=
ce=3D"arial, sans-serif"><br></font></div><div><font face=3D"arial, sans-se=
rif">The entire output and scripts can be found at:</font></div><div><font =
face=3D"arial, sans-serif"><a href=3D"https://github.com/raydwaipayan/lkm-t=
ask-1">https://github.com/raydwaipayan/lkm-task-1</a></font><font face=3D"m=
onospace"><br></font></div><div><br></div><div><br></div><div>Thanks,</div>=
<div>Dwaipayan.</div><div><br></div><div><br></div></div>

--00000000000030f08e05af2d8b73--

--===============3644277956846063797==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============3644277956846063797==--
