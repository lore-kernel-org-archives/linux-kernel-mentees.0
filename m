Return-Path: <SRS0=XjTA=CY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 836D0C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 15 Sep 2020 13:04:41 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E69CD20684
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 15 Sep 2020 13:04:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vWVglMk3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E69CD20684
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 842A320466;
	Tue, 15 Sep 2020 13:04:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 94MjYdeARQSL; Tue, 15 Sep 2020 13:04:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id CBD54204C3;
	Tue, 15 Sep 2020 13:04:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9BD83C0864;
	Tue, 15 Sep 2020 13:04:36 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 197F3C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 13:04:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0607D86FB3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 13:04:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0wURAFLFto62
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 13:04:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DC57B86F6A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 13:04:34 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id h17so3167378otr.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 06:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e9CWfMqkbQGmtQ5CX/G8EZ8ftdWge4mDGN31rWWysQg=;
 b=vWVglMk3PYdlwFnA9K0kBF++VlE8ggf8V4ZAtGOwyNpFk23uiA/AcXd3KvpBicaDbH
 SVi5DmY3UjNnTpveLS2iB6+7l/n/qqQoQpRDTSKtJ9nnz4Zu+H5DBkwTeNdmTS7hFLMi
 x9JT0ibGQZ75WgpAc8gPg5g40FN++4ey93K2Llr/3kIWbS7L1hr2tuXgFsoaA67vB3gI
 S5OvObaMAuGb6zHbq3UB7NC5rlbWJnqATTgD7h6AOrnN9fXIsJ9xaLdynKU22KBKSyVz
 iEGqu/VAoQV/4/FyA+bZ7PRWtREKPOYEpAfzlBBulycR5d15pQv+0ai5EZ9I4ha0wG72
 +55w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e9CWfMqkbQGmtQ5CX/G8EZ8ftdWge4mDGN31rWWysQg=;
 b=KcMjNSwa7bed3R7MkdOEsO1uaWI3sko33EnwcmpCx3K2uaUVIzm8YwAIOkubkRGvws
 LMC0vZVixXthly0MmmqpkPk76uTPPCg6bGFNEaMrwzsco4nJfhMEu9s7dn9+gASHIz5O
 KtrZLYnR0oLLHjqrNkS9VF6YK7vPPmHS2WASEyfS2w4TFIsK0X+tCGuh3pg3gUhPFHd9
 YLsGgrcUoZtIVTBVT1uIPMRR93t6ceblwLGBw9GGaSQbZxBC/v53AbWoqAUhAQIkyN4L
 O7RO3BVL6LZyXolaeN3HM5jkz+btFwT2KE75Y/Dcn6ZG5SFlpo+MRA9j1LW/412+PWWj
 QUFA==
X-Gm-Message-State: AOAM530teTTp3ygdkGwszwMN0WFZRUc7ckNbzvsLXioPzJoWjcfSejCp
 UZnYBLuZukgnfb/Q4+5eaRFKYQMru26s6/gjL5U=
X-Google-Smtp-Source: ABdhPJwr5Eqfci8rxRAT/TjPUtMmJs2MPOp22myrE6Q3Gtc/T3P9vw41d+M4cV07/L6OJmi8sjHWVqIBpWHAEnlgWWI=
X-Received: by 2002:a9d:4b18:: with SMTP id q24mr12349268otf.265.1600175073849; 
 Tue, 15 Sep 2020 06:04:33 -0700 (PDT)
MIME-Version: 1.0
References: <CABJPP5CSa_QowD-O3_E5ndoQJvuBv=n2x5WG-acwQKE=rt5+Rw@mail.gmail.com>
 <alpine.DEB.2.21.2009110925160.9220@felia>
 <CABJPP5AWNpYyx5asMNZccqbq07ZW+pH+EwJ+KTZ+SSOAnWZwVQ@mail.gmail.com>
 <alpine.DEB.2.21.2009121252280.13082@felia>
 <CABJPP5DMF9OpZR0agobunb3i3hLGkqedbeL-YohNn0X6Juk64w@mail.gmail.com>
 <alpine.DEB.2.21.2009121419430.3770@felia>
 <CABJPP5BFNjBhdcvBWqDYnR-o2sZ0oY77bYr9PxducXW4Y=482Q@mail.gmail.com>
 <alpine.DEB.2.21.2009131301570.22585@felia>
 <CABJPP5BmRcC+OTSjuX_QrYononVq__DkhjGOgiKrP147MAXK+g@mail.gmail.com>
 <alpine.DEB.2.21.2009132010300.6806@felia>
 <CABJPP5BaUss9pWq=e+UDmVvr-puJsBtSVppST+CTcB8JkEdLmQ@mail.gmail.com>
 <alpine.DEB.2.21.2009140716420.7737@felia>
 <CABJPP5D87ZVTfZ4QHxp5vweTN16LQCy+rniq-uDVCvKkbYRDNg@mail.gmail.com>
 <alpine.DEB.2.21.2009141535010.17999@felia>
 <CABJPP5Aniv2kQ4wfAD9JuR_7Q5pjChasHZTAvBWOOaza4H3VSg@mail.gmail.com>
 <alpine.DEB.2.21.2009142016150.6496@felia>
In-Reply-To: <alpine.DEB.2.21.2009142016150.6496@felia>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Tue, 15 Sep 2020 18:34:15 +0530
Message-ID: <CABJPP5DhzCHz6PM7bLzW9s1=VckN_+qnaUuYO148xSL59Q-pkA@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============2213192583946626836=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============2213192583946626836==
Content-Type: multipart/alternative; boundary="000000000000daf9c505af59ca80"

--000000000000daf9c505af59ca80
Content-Type: text/plain; charset="UTF-8"

Hi,
Sorry for the late reply.

> First explain:
>
> - which situations does checkpatch.pl currently complain about?
>
Currently, checkpatch complains whenever the author mail is not
found in any signed-off-by block in the patch.


> - for which situation do you want to have more refined checks?
>
The situations where author might have signed off using a different
email. I believe multiple mail addresses isn't uncommon.


> - why does that actually improve checkpatch.pl?

It shall significantly reduce the number of author_sign_off warnings. I have
not yet created a statistical count, but looking at the data I found several
such instances. This is certainly a false positive due to a condition which
checkpatch was not programmed to handle.
The avoidance of warnings on such known cases might also save the
committer and the maintainers some time.


> Checkpatch.pl should complain when developers do something wrong.
>
> To really understand what is wrong behavior and what is not, you probably
> need to create some statistics on who authors and signs off with which
> names and email addresses.
>
> Maybe we can collect all the previous instances where we know that
> frequent developers, e.g., with more >100 commits, use multiple email
> addresses interchangeably. If we add that list to the repository and
> let others know how to maintain it, checkpatch.pl can make use of that.
>
> With that extended check, we can warn newbies that just have a broken git
> and sign-off setup and still reduce the false positives for the
> experienced developers that might just have good reasons to have the
> setup they have, i.e., they have this setup for many years and want to
> keep it that way.

This seems like a great idea. I can load the mailmap data into checkpatch
and form some kind of map between names and mail addresses.
If two mail addresses belong to same user then the warning can be ignored
totally.

I know that the kernel community is strict about such changes. So will this
be
acceptible? I can generate a proof of concept patch with the data at hand
if it seems like a good thing to work on.


> You can try to work that through or look for another case of potential
> checkpatch.pl improvement in your evaluation data.

I haven't found anything substantial yet. I will continue looking.
Earlier, you had told if I would like to take the task from Ayush to
fix checkpatch with git ranges. I would like to know about the task
and take it up if possible.

Thanks,
Dwaipayan.

--000000000000daf9c505af59ca80
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div>Sorry for the late reply.</div><div><br=
></div><font color=3D"#4c1130">&gt; First explain:<br>&gt;</font><div><font=
 color=3D"#4c1130">&gt; - which situations does <a href=3D"http://checkpatc=
h.pl">checkpatch.pl</a> currently complain about?<br>&gt;</font></div><div>=
Currently, checkpatch complains whenever=C2=A0the author mail is not</div><=
div>found in any signed-off-by block in the patch.</div><div><br></div><div=
><br></div><div><font color=3D"#4c1130">&gt; - for which situation do you w=
ant to have more refined checks?<br>&gt;</font></div><div>The situations=C2=
=A0where author might have signed off using a different</div><div>email. I =
believe multiple mail addresses isn&#39;t uncommon.</div><div><br></div><di=
v><br></div><div><font color=3D"#4c1130">&gt; - why does that actually impr=
ove <a href=3D"http://checkpatch.pl">checkpatch.pl</a>?</font></div><div><f=
ont color=3D"#4c1130"><br></font></div><div><font color=3D"#000000">It shal=
l significantly reduce the number of author_sign_off warnings. I have</font=
></div><div><font color=3D"#000000">not yet created a statistical count, bu=
t looking at the data I found several</font></div><div><font color=3D"#0000=
00">such instances. This is certainly a false positive due to a condition w=
hich</font></div><div><font color=3D"#000000">checkpatch was not programmed=
 to handle.</font></div><div><font color=3D"#000000">The avoidance of warni=
ngs on such known cases might also save the=C2=A0</font></div><div><font co=
lor=3D"#000000">committer and the maintainers some time.</font></div><div><=
font color=3D"#4c1130"><br></font></div><div><br><font color=3D"#4c1130">&g=
t; Checkpatch.pl should complain when developers do something wrong.</font>=
<br><font color=3D"#4c1130">&gt;</font><br><font color=3D"#4c1130">&gt; To =
really understand what is wrong behavior and what is not, you probably</fon=
t><br><font color=3D"#4c1130">&gt; need to create some statistics on who au=
thors and signs off with which</font><br><font color=3D"#4c1130">&gt; names=
 and email addresses.</font><br><font color=3D"#4c1130">&gt;</font><br><fon=
t color=3D"#4c1130">&gt; Maybe we can collect all the previous instances wh=
ere we know that</font><br><font color=3D"#4c1130">&gt; frequent developers=
, e.g., with more &gt;100 commits, use multiple email</font><br><font color=
=3D"#4c1130">&gt; addresses interchangeably. If we add that list to the rep=
ository and</font><br><font color=3D"#4c1130">&gt; let others know how to m=
aintain it, <a href=3D"http://checkpatch.pl">checkpatch.pl</a> can make use=
 of that.</font><br><font color=3D"#4c1130">&gt;</font><br><font color=3D"#=
4c1130">&gt; With that extended check, we can warn newbies that just have a=
 broken git</font><br><font color=3D"#4c1130">&gt; and sign-off setup and s=
till reduce the false positives for the</font><br><font color=3D"#4c1130">&=
gt; experienced developers that might just have good reasons to have the</f=
ont><br><font color=3D"#4c1130">&gt; setup they have, i.e., they have this =
setup for many years and want to</font><br><font color=3D"#4c1130">&gt; kee=
p it that way.</font><br><br><font color=3D"#000000">This seems like a grea=
t idea. I can load the mailmap data into checkpatch</font></div><div><span =
style=3D"color:rgb(0,0,0)">and form some kind of map between names</span><s=
pan style=3D"color:rgb(0,0,0)">=C2=A0and mail addresses.=C2=A0</span></div>=
<div><span style=3D"color:rgb(0,0,0)">If two mail addresses belong to same =
user=C2=A0</span><span style=3D"color:rgb(0,0,0)">then the warning can be i=
gnored</span></div><div><span style=3D"color:rgb(0,0,0)">totally.</span></d=
iv><div><span style=3D"color:rgb(0,0,0)"><br></span></div><div><span style=
=3D"color:rgb(0,0,0)">I know that the kernel community is strict about such=
 changes. So will this be</span></div><div><span style=3D"color:rgb(0,0,0)"=
>acceptible? I can generate a proof of concept patch with the data at hand<=
/span></div><div><span style=3D"color:rgb(0,0,0)">if it seems like a good t=
hing to work on.</span></div><div><span style=3D"color:rgb(0,0,0)"><br></sp=
an></div><div><span style=3D"color:rgb(0,0,0)"><br></span></div><div><font =
color=3D"#4c1130">&gt; You can try to work that through or look for another=
 case of potential</font><br><font color=3D"#4c1130">&gt; <a href=3D"http:/=
/checkpatch.pl">checkpatch.pl</a> improvement in your evaluation data.</fon=
t></div><div><font color=3D"#4c1130"><br></font></div><div><font color=3D"#=
000000">I haven&#39;t found anything substantial yet. I will continue looki=
ng.=C2=A0</font></div><div><font color=3D"#000000">Earlier, you had told if=
 I would like to take the task from Ayush to</font></div><div><font color=
=3D"#000000">fix checkpatch with git ranges. I would like to know about the=
 task</font></div><div><font color=3D"#000000">and take it up if possible.<=
/font></div><div><font color=3D"#000000"><br></font></div><div><font color=
=3D"#000000">Thanks,</font></div><div><font color=3D"#000000">Dwaipayan.</f=
ont></div><div><br></div></div>

--000000000000daf9c505af59ca80--

--===============2213192583946626836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============2213192583946626836==--
