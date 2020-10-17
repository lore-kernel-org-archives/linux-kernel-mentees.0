Return-Path: <SRS0=PE7C=DY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D756FC433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 17 Oct 2020 05:24:49 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 591EB2076A
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 17 Oct 2020 05:24:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AEWEM5K2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 591EB2076A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E231B88945;
	Sat, 17 Oct 2020 05:24:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8FCd_GzdLAPi; Sat, 17 Oct 2020 05:24:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D06F78891B;
	Sat, 17 Oct 2020 05:24:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B8BF9C07FF;
	Sat, 17 Oct 2020 05:24:45 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BDC8FC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Oct 2020 05:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B1CDA20515
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Oct 2020 05:24:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O3X-PC1b+dbI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Oct 2020 05:24:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 981AF204EF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Oct 2020 05:24:43 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id t12so5069656ilh.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Oct 2020 22:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+vLZli80ypiept5lKeBv3/H+9Rocsc8GYOgG1Cthrvw=;
 b=AEWEM5K22eTmAZ9WBT+oqlpQODcMSES5+d5HYDRJMVun7INLBN79lIc7LA+Hqf1t2t
 lwFH4D/rfK/haSINQbAv2WPpkB1C7lxoa2IjER26umngB2ZBmj+dALqDC/VyDPfxZSrc
 6PMor9mVLdo/VJ46XLB38zyzchlH/FWZ0XLjMvKYgXqFpidMm6ZEkyBucrOnR1Y3PyM1
 I+R99QU2Sr8C+xU6szuhfOWTbV1aqVnWRY57wA3KCii9s+RKeopmqwzIrzkER7yaTHoy
 a4V0IfJmC/Jq7uuTAzM/gKn8HRTVv+birZ1JELD8fS+Laoe6rrb0KRnZ25mLAKwturpJ
 7UkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+vLZli80ypiept5lKeBv3/H+9Rocsc8GYOgG1Cthrvw=;
 b=OMHjLPHvo5KZ6vyTh/fKPo7GDAeXftLunQ5pgmneU7C7HMDgj3x0fl2SNUTJfH7jDp
 A9blzWwium8OnWaTwJBqsQ2/WJ9vVOXBapA+YmcNflXIu2hLj7PAdaX29Nx5DSQ+jP2v
 +1+Yoxrl5l5Tr1YgK7aD7aD34+vP3SKOz2a8sW18gqcI8uKZR8aWfahrbanhwZxome/A
 ZY2+D/mF4Fz6VTHfIQDrtyfUdJ1s1Nc5ULhzbxt7+O7WJHx+QYTNDhqpg4lQpext7e5D
 4TeTP/I2hYmkk6tLpr0ElKIkaypKBjDP+6YvM/92VXdkKKIiG2RQPB26EPQSvmwWtTML
 UKfQ==
X-Gm-Message-State: AOAM530ARlFw47t98Jq+H9LnpygVBMHqvY9RQAxRCz5af4ZvUi2+kfLp
 05tXalIWKO8BXTsyoxEtzQ2LfZkZe92oCz/53Nw=
X-Google-Smtp-Source: ABdhPJxYave2S1V0ZGcACabCKOD4miw/4W6mvsxz9gXS1nC5auD/bOHkpdI/kuZD9eqVhQI4iTsynTUKHU1X//DFkEE=
X-Received: by 2002:a92:de43:: with SMTP id e3mr4622168ilr.62.1602912282762;
 Fri, 16 Oct 2020 22:24:42 -0700 (PDT)
MIME-Version: 1.0
References: <20201016181613.129843-1-dwaipayanray1@gmail.com>
 <CABJPP5AwiEQNypApE_5svF6Rqb3YU=cZ_=V+KW494uC_LHDMXg@mail.gmail.com>
In-Reply-To: <CABJPP5AwiEQNypApE_5svF6Rqb3YU=cZ_=V+KW494uC_LHDMXg@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sat, 17 Oct 2020 07:24:31 +0200
Message-ID: <CAKXUXMxy9LcZw9TwOEs3b7L7VOesYS-BuHe3Nu1Vvirhmf=MFg@mail.gmail.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add new exceptions
	to repeated word check
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
Content-Type: multipart/mixed; boundary="===============6245684578579133075=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============6245684578579133075==
Content-Type: multipart/alternative; boundary="0000000000003862fa05b1d719ea"

--0000000000003862fa05b1d719ea
Content-Type: text/plain; charset="UTF-8"

I think for this feature you do not to need to send it first to me and then
to lkml.

Just continue the discussion directlyon lkml.

Lukas

On Fr., 16. Okt. 2020 at 20:22, Dwaipayan Ray <dwaipayanray1@gmail.com>
wrote:

> On Fri, Oct 16, 2020 at 11:46 PM Dwaipayan Ray <dwaipayanray1@gmail.com>
> wrote:
> >
> > Recently, commit 4f6ad8aa1eac ("checkpatch: move repeated word test")
> > moved the repeated word test to check for more file types. But after
> > this, if checkpatch.pl is run on MAINTAINERS, it generates several
> > new warnings of the type:
> >
> > WARNING: Possible repeated word: 'git'
> >
> > For example:
> > WARNING: Possible repeated word: 'git'
> > +T:     git git://git.kernel.org/pub/scm/linux/kernel/git/rw/uml.git
> >
> > So, the pattern "git git://..." is a false positive in this case.
> >
> > There are several other combinations which may produce a wrong
> > warning message, such as "@size size", "Begin; begin", etc.
> >
> > Extend repeated word check to compare the characters before and
> > after the word matches. If the preceding or succeeding character
> > belongs to the exception list, the warning is avoided.
> >
> > Suggested-by: Joe Perches <joe@perches.com>
> > Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> > ---
> >  scripts/checkpatch.pl | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > index f1a4e61917eb..82497a71ac96 100755
> > --- a/scripts/checkpatch.pl
> > +++ b/scripts/checkpatch.pl
> > @@ -595,6 +595,7 @@ our @mode_permission_funcs = (
> >  );
> >
> >  my $word_pattern = '\b[A-Z]?[a-z]{2,}\b';
> > +my $punctuation_chars = '[,:;@\.\-]';
> >
> >  #Create a search pattern for all these functions to speed up a loop
> below
> >  our $mode_perms_search = "";
> > @@ -3065,6 +3066,21 @@ sub process {
> >                                 next if ($first ne $second);
> >                                 next if ($first eq 'long');
> >
> > +                               # check for character before and after
> the word matches
> > +                               my $ca_first = substr($rawline, $-[1]-1,
> 1);
> > +                               my $cb_first = substr($rawline, $+[1],
> 1);
> > +                               my $ca_second = substr($rawline,
> $-[2]-1, 1);
> > +                               my $cb_second = substr($rawline, $+[2],
> 1);
> > +
> > +                               if ($ca_first ne $ca_second || $cb_first
> ne $cb_second) {
> > +                                       if ($ca_first =~
> /$punctuation_chars/ ||
> > +                                           $ca_second =~
> /$punctuation_chars/ ||
> > +                                           $cb_first =~
> /$punctuation_chars/ ||
> > +                                           $cb_second =~
> /$punctuation_chars/) {
> > +                                               next;
> > +                                       }
> > +                               }
> > +
> >                                 if (WARN("REPEATED_WORD",
> >                                          "Possible repeated word:
> '$first'\n" . $herecurr) &&
> >                                     $fix) {
> > --
> > 2.27.0
> >
> Hi,
> This patch is followed from the discussion at
>
> https://lore.kernel.org/linux-kernel-mentees/7d8c7d80aa7b0524cca49a6dfe24e878bea6ab12.camel@perches.com/
> , where Joe suggested that instead of hard coding the
> particular words, we can check the surrounding
> characters instead for punctuations and ingore them.
>
> Please let me know if any changes are needed.
>
> Thanks,
> Dwaipayan.
>

--0000000000003862fa05b1d719ea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">I think for this feature you do not to need to send =
it first to me and then to lkml.</div></div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">Just continue the discussion directlyon lkml.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Lukas</div><div dir=3D"auto"><br></di=
v><div><div class=3D"gmail_quote"><div>On Fr., 16. Okt. 2020 at 20:22, Dwai=
payan Ray &lt;<a href=3D"mailto:dwaipayanray1@gmail.com">dwaipayanray1@gmai=
l.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Fri, Oct 16=
, 2020 at 11:46 PM Dwaipayan Ray &lt;<a href=3D"mailto:dwaipayanray1@gmail.=
com" target=3D"_blank">dwaipayanray1@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Recently, commit 4f6ad8aa1eac (&quot;checkpatch: move repeated word te=
st&quot;)<br>
&gt; moved the repeated word test to check for more file types. But after<b=
r>
&gt; this, if <a href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D=
"_blank">checkpatch.pl</a> is run on MAINTAINERS, it generates several<br>
&gt; new warnings of the type:<br>
&gt;<br>
&gt; WARNING: Possible repeated word: &#39;git&#39;<br>
&gt;<br>
&gt; For example:<br>
&gt; WARNING: Possible repeated word: &#39;git&#39;<br>
&gt; +T:=C2=A0 =C2=A0 =C2=A0git git://<a href=3D"http://git.kernel.org/pub/=
scm/linux/kernel/git/rw/uml.git" rel=3D"noreferrer" target=3D"_blank">git.k=
ernel.org/pub/scm/linux/kernel/git/rw/uml.git</a><br>
&gt;<br>
&gt; So, the pattern &quot;git git://...&quot; is a false positive in this =
case.<br>
&gt;<br>
&gt; There are several other combinations which may produce a wrong<br>
&gt; warning message, such as &quot;@size size&quot;, &quot;Begin; begin&qu=
ot;, etc.<br>
&gt;<br>
&gt; Extend repeated word check to compare the characters before and<br>
&gt; after the word matches. If the preceding or succeeding character<br>
&gt; belongs to the exception list, the warning is avoided.<br>
&gt;<br>
&gt; Suggested-by: Joe Perches &lt;<a href=3D"mailto:joe@perches.com" targe=
t=3D"_blank">joe@perches.com</a>&gt;<br>
&gt; Suggested-by: Lukas Bulwahn &lt;<a href=3D"mailto:lukas.bulwahn@gmail.=
com" target=3D"_blank">lukas.bulwahn@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Dwaipayan Ray &lt;<a href=3D"mailto:dwaipayanray1@gmail=
.com" target=3D"_blank">dwaipayanray1@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" targ=
et=3D"_blank">checkpatch.pl</a> | 16 ++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 16 insertions(+)<br>
&gt;<br>
&gt; diff --git a/scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferre=
r" target=3D"_blank">checkpatch.pl</a> b/scripts/<a href=3D"http://checkpat=
ch.pl" rel=3D"noreferrer" target=3D"_blank">checkpatch.pl</a><br>
&gt; index f1a4e61917eb..82497a71ac96 100755<br>
&gt; --- a/scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" targ=
et=3D"_blank">checkpatch.pl</a><br>
&gt; +++ b/scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" targ=
et=3D"_blank">checkpatch.pl</a><br>
&gt; @@ -595,6 +595,7 @@ our @mode_permission_funcs =3D (<br>
&gt;=C2=A0 );<br>
&gt;<br>
&gt;=C2=A0 my $word_pattern =3D &#39;\b[A-Z]?[a-z]{2,}\b&#39;;<br>
&gt; +my $punctuation_chars =3D &#39;[,:;@\.\-]&#39;;<br>
&gt;<br>
&gt;=C2=A0 #Create a search pattern for all these functions to speed up a l=
oop below<br>
&gt;=C2=A0 our $mode_perms_search =3D &quot;&quot;;<br>
&gt; @@ -3065,6 +3066,21 @@ sub process {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0next if ($first ne $second)=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0next if ($first eq &#39;lon=
g&#39;);<br>
&gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# check for character before and =
after the word matches<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0my $ca_first =3D substr($rawline,=
 $-[1]-1, 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0my $cb_first =3D substr($rawline,=
 $+[1], 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0my $ca_second =3D substr($rawline=
, $-[2]-1, 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0my $cb_second =3D substr($rawline=
, $+[2], 1);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ($ca_first ne $ca_second || $c=
b_first ne $cb_second) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ($=
ca_first =3D~ /$punctuation_chars/ ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0$ca_second =3D~ /$punctuation_chars/ ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0$cb_first =3D~ /$punctuation_chars/ ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0$cb_second =3D~ /$punctuation_chars/) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0next;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (WARN(&quot;REPEATED_WOR=
D&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;Possible repeated word: &#39;$first&#39;\n&quot; . $herecurr) &am=
p;&amp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$fix) {<br>
&gt; --<br>
&gt; 2.27.0<br>
&gt;<br>
Hi,<br>
This patch is followed from the discussion at<br>
<a href=3D"https://lore.kernel.org/linux-kernel-mentees/7d8c7d80aa7b0524cca=
49a6dfe24e878bea6ab12.camel@perches.com/" rel=3D"noreferrer" target=3D"_bla=
nk">https://lore.kernel.org/linux-kernel-mentees/7d8c7d80aa7b0524cca49a6dfe=
24e878bea6ab12.camel@perches.com/</a><br>
, where Joe suggested that instead of hard coding the<br>
particular words, we can check the surrounding<br>
characters instead for punctuations and ingore them.<br>
<br>
Please let me know if any changes are needed.<br>
<br>
Thanks,<br>
Dwaipayan.<br>
</blockquote></div></div>

--0000000000003862fa05b1d719ea--

--===============6245684578579133075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============6245684578579133075==--
