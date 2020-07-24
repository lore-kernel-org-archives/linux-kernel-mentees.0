Return-Path: <SRS0=SEG9=BD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBD81C433E5
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Jul 2020 04:59:41 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9021D206D8
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Jul 2020 04:59:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AesYLUlK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9021D206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7D64087D1A;
	Fri, 24 Jul 2020 04:59:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qPLy-UNvxWq7; Fri, 24 Jul 2020 04:59:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D029687CB1;
	Fri, 24 Jul 2020 04:59:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B539AC004D;
	Fri, 24 Jul 2020 04:59:40 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E1992C004C
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jul 2020 04:59:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id CAAF088783
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jul 2020 04:59:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HThFwWJgd0L8
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jul 2020 04:59:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1742D88373
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jul 2020 04:59:39 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id t11so4421862pfq.11
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jul 2020 21:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=U+jTWklW/P3WAi7wBS/ZmMUDXEj/IaW0ijxFYGPJv0c=;
 b=AesYLUlKYDhvnCwhSgFCdW/smUTbRCP383WfWY+k49j0DVNSGUijVyE9XmSELbomFY
 IEtQNlCCD36Hjwrb/hBU7kuyQ1p7A3Jf8kB1alyHKEG3O2Kr2rskzhl92qgjP9+wSrzo
 HvZ3q1RmyYldAMr2CWV4T4cRY/BFAqISNqKRV8O3MZF27s5eI+Tp+Hzz2KzQk4b/yWtT
 fqHHL9JyX9t6u82NSG/lL6UBMp0cfXm3AFmHLLLWIJPV5uh+oFa+i9ULP46+fvnAjgAu
 409qd9fjn93bh8/br5DNJHgczttcYDA8xSmoovnQuXv990F6h6sqtxbbmfqA08r/8NeJ
 kLow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=U+jTWklW/P3WAi7wBS/ZmMUDXEj/IaW0ijxFYGPJv0c=;
 b=ZZaYPBipjEP+8bD3FYq+0Oglf/GAPttu7rjr2NbiqHfIvLapciQtYWs4YC+1TvLq5B
 BPy8MVpD6PWdfkpf+h4ZezfnxUi86MvhJNq4I71cQzfPxMN4MNiMDMLrocz5+DIW7+Ul
 ruU9uhJZ/ID0sFk40HHkzcrec4h9yhXE5wGOgyo0JUTFuOifmibNwFNkZp6r5mWNH0gC
 bX7iB4AlbDY8h00AzpK1MpJAXrWOop1g3KI8mw+mU5GExoLM2iMclfZEg5ORY0DiszQg
 FJDs++EOdBbq1hgjDji+7TJJcfxlho4VAw1O8ttPmvfJ4S96dzNEG1xqRzXVt/NfSKmj
 /X0w==
X-Gm-Message-State: AOAM5308u0v+YbTqrABr6kX2YTThH79Z8v/XA0CzeKrYq+d1e7VPWmB2
 b/NWduenkRnSoFP/nL3lLUQm4RxRGLDEzhB1geI=
X-Google-Smtp-Source: ABdhPJwJSV6m/QXmUhL5gfQRpeZxSpXi+lul90D+8Ej8EAmYOVWBgsnBHd6TvrNiXkbNd2f4aO9dNGEkHphIkk7jOaA=
X-Received: by 2002:a63:7d08:: with SMTP id y8mr7015194pgc.224.1595566778446; 
 Thu, 23 Jul 2020 21:59:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200721054438.z7nhvykoqztofoui@mrinalpandey>
 <alpine.DEB.2.21.2007221221180.10005@felia>
In-Reply-To: <alpine.DEB.2.21.2007221221180.10005@felia>
From: Mrinal Pandey <mrinalmni@gmail.com>
Date: Fri, 24 Jul 2020 10:29:27 +0530
Message-ID: <CAD1=X6mA4pE01hMmnMNvfsypn8A6dswdCwnjOzGPvthxXA8iCw@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Shuah Khan <skhan@linuxfoundation.org>, 
 Linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: Warn about missing
	shebang in scripts
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
Content-Type: multipart/mixed; boundary="===============5513411782680657405=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============5513411782680657405==
Content-Type: multipart/alternative; boundary="0000000000000b78d905ab28d784"

--0000000000000b78d905ab28d784
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 22, 2020 at 3:53 PM Lukas Bulwahn <lukas.bulwahn@gmail.com>
wrote:

>
>
> On Tue, 21 Jul 2020, Mrinal Pandey wrote:
>
> > checkpatch should warn if a script doesn't seem to have a shebang in the
> > first line. There is no such check present currently.
> >
> > Issue this warning by checking if the file is a script and checking
> > `$realline` to be `1`, i.e. the first line. If these conditions are
> > satisfied and the first line is not a shebang, issue a missing or
> > mispaced shebang warning.
> >
> > Signed-off-by: Mrinal Pandey <mrinalmni@gmail.com>
> > ---
> >  scripts/checkpatch.pl | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > index 4c820607540b..c79233c64cee 100755
> > --- a/scripts/checkpatch.pl
> > +++ b/scripts/checkpatch.pl
> > @@ -3165,6 +3165,13 @@ sub process {
> >                       }
> >               }
> >
> > +# check for missing shebang in scripts
> > +                if ($realline == 1 && $realfile =~
> /.*\.\(py\|sh\|pl\|awk\|tc\|yaml\)/) {
>
> yaml files do not have a shebang...
>

Sir,

Yes, I will remove that from the list.

>
> This whole check can probably placed elsewhere better.
>

Should I place it on line 2657 as the check just above it also deals with
scripts?

>
> > +                        if ($rawline !~ /^[ \+]\s*\#\!\s*\//) {
> > +                                WARN("MISSING_SHEBANG", "Missing or
> misplaced shebang for '$realfile'");
> > +                        }
> > +                }
> > +
> >  # check for using SPDX license tag at beginning of files
> >               if ($realline == $checklicenseline) {
> >                       if ($rawline =~ /^[ \+]\s*\#\!\s*\//) {
> > --
> > 2.25.1
> >
> >
>

--0000000000000b78d905ab28d784
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 22, 2020 at 3:53 PM Lukas=
 Bulwahn &lt;<a href=3D"mailto:lukas.bulwahn@gmail.com">lukas.bulwahn@gmail=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><br>
<br>
On Tue, 21 Jul 2020, Mrinal Pandey wrote:<br>
<br>
&gt; checkpatch should warn if a script doesn&#39;t seem to have a shebang =
in the<br>
&gt; first line. There is no such check present currently.<br>
&gt; <br>
&gt; Issue this warning by checking if the file is a script and checking<br=
>
&gt; `$realline` to be `1`, i.e. the first line. If these conditions are<br=
>
&gt; satisfied and the first line is not a shebang, issue a missing or<br>
&gt; mispaced shebang warning.<br>
&gt; <br>
&gt; Signed-off-by: Mrinal Pandey &lt;<a href=3D"mailto:mrinalmni@gmail.com=
" target=3D"_blank">mrinalmni@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" targ=
et=3D"_blank">checkpatch.pl</a> | 7 +++++++<br>
&gt;=C2=A0 1 file changed, 7 insertions(+)<br>
&gt; <br>
&gt; diff --git a/scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferre=
r" target=3D"_blank">checkpatch.pl</a> b/scripts/<a href=3D"http://checkpat=
ch.pl" rel=3D"noreferrer" target=3D"_blank">checkpatch.pl</a><br>
&gt; index 4c820607540b..c79233c64cee 100755<br>
&gt; --- a/scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" targ=
et=3D"_blank">checkpatch.pl</a><br>
&gt; +++ b/scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" targ=
et=3D"_blank">checkpatch.pl</a><br>
&gt; @@ -3165,6 +3165,13 @@ sub process {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 <br>
&gt; +# check for missing shebang in scripts<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ($realline=
 =3D=3D 1 &amp;&amp; $realfile =3D~ /.*\.\(py\|sh\|pl\|awk\|tc\|yaml\)/) {<=
br>
<br>
yaml files do not have a shebang...<br></blockquote><div><br></div><div>Sir=
,</div><div><br></div><div>Yes, I will remove that from the list.<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
This whole check can probably placed elsewhere better.<br></blockquote><div=
>=C2=A0</div><div>Should I place it on line 2657 as the check just above it=
 also deals with scripts? <br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 if ($rawline !~ /^[ \+]\s*\#\!\s*\//) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 WARN(&quot;MISSING_SHEBANG&quot;=
, &quot;Missing or misplaced shebang for &#39;$realfile&#39;&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt;=C2=A0 # check for using SPDX license tag at beginning of files<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ($realline =
=3D=3D $checklicenseline) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0if ($rawline =3D~ /^[ \+]\s*\#\!\s*\//) {<br>
&gt; -- <br>
&gt; 2.25.1<br>
&gt; <br>
&gt; <br>
</blockquote></div></div>

--0000000000000b78d905ab28d784--

--===============5513411782680657405==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============5513411782680657405==--
