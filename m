Return-Path: <SRS0=5Mz1=BF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50461C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 26 Jul 2020 10:23:32 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 073D3206D8
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 26 Jul 2020 10:23:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L2Q9HFk6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 073D3206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A98738791F;
	Sun, 26 Jul 2020 10:23:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JLY0QeSUDXpm; Sun, 26 Jul 2020 10:23:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 377A68785D;
	Sun, 26 Jul 2020 10:23:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1E515C0050;
	Sun, 26 Jul 2020 10:23:30 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 18FF2C004D
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 10:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0863F85816
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 10:23:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fYKtwLXjXGfm
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 10:23:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1433B8575B
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 10:23:28 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id w2so7802735pgg.10
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 03:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=uvS5mJbInVZxkVO8CL1tvVS8Yw+bjbyJCvwODvTJRlU=;
 b=L2Q9HFk6ShDDe/35LRJ/xhWF1Il4/0d+zm17LUYU7nEIuscAM23wMpmKha+p7TFB22
 gYdzpJlyIJUgpuVqRHkQz/vL/VQwZbQXFV5quWosos5bsZWJvnMWrawM5SveTc/7ZxUy
 v7CogX/d/VjuhiiRtNrOBlA8KLGcdhtm2iPRbPFjbiqjp9jtig6ubL7BTI1YGfvtQp3x
 IEIW7iSj/tJQM0SzxXaMdw4Lt/k+zARsWUpc6CM3vqV863Yf5SO1MG+D2Vmf6izT/7Xt
 D+1vzVuMqo+79RU7J22mpq7Lrmk8JCLnwoxtfXWZtt8szlf9UmhCE5wezA9Uu5re86cb
 o6LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=uvS5mJbInVZxkVO8CL1tvVS8Yw+bjbyJCvwODvTJRlU=;
 b=V/p8WCzxahCPdb4YH3vhUz4R3KR6HY0e5ccYHmSLDp8ywLxT5gAzqhficvcGRZZvcJ
 9otNpfHkJjHnClRgMoEzbfSILyeKjgYWG7qy9zqBOmOO0h7P+U7ViXBOfVQx+D0yCnlE
 +S9OvsYxWT3LLBmNomfZJAB9bd0+XUjaIKYE0CDQVgZs2Tw/PujHqWcaGG6LWIgScuLq
 4Lspwp0s8v8M7CBOIN43bmtt7L+7CBRlls5BpesvgAjdITrAReLm68FZ+dyLNlWLzqoM
 wBssJsnx8QCHuGSMTY07GHbwvKB8vPOiIO9IXCWE8/HMOyZtzlAGcXqv1BPNYy3gm3U4
 +HXw==
X-Gm-Message-State: AOAM532O1s6nY9MreKCLnPP8bcOEyrbNS60mHAWNQ5L9DExzBtA4KKkW
 0UOtM0Hknh0z+ALeBJw/WEzwuzjtKHF82MrV/RM=
X-Google-Smtp-Source: ABdhPJx2B++xwpmLvehhW+T+dqExNjROEsAZSVYGX5oXUgfS7DUXP11QgCKhIWvkAiPeEZOYwYmZcy0p+2Q4XHlEtnE=
X-Received: by 2002:a63:1a16:: with SMTP id a22mr15501813pga.142.1595759007524; 
 Sun, 26 Jul 2020 03:23:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200725111847.pnt2a36ndd5lbqre@mrinalpandey>
 <alpine.DEB.2.21.2007260759440.7525@felia>
In-Reply-To: <alpine.DEB.2.21.2007260759440.7525@felia>
From: Mrinal Pandey <mrinalmni@gmail.com>
Date: Sun, 26 Jul 2020 15:53:16 +0530
Message-ID: <CAD1=X6kUzJNwdkRoZi01yYVAw7SskgALpTkRGmNLLxWxxjMzFQ@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Shuah Khan <skhan@linuxfoundation.org>, 
 Linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: Fix SPDX license
	check for script files
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
Content-Type: multipart/mixed; boundary="===============1879128535317311579=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============1879128535317311579==
Content-Type: multipart/alternative; boundary="000000000000ca6c5a05ab55988b"

--000000000000ca6c5a05ab55988b
Content-Type: text/plain; charset="UTF-8"

On Sun, Jul 26, 2020 at 11:43 AM Lukas Bulwahn <lukas.bulwahn@gmail.com>
wrote:

>
>
> On Sat, 25 Jul 2020, Mrinal Pandey wrote:
>
> > In all the script files(except yaml), SPDX license identifier is expected
>
> Why do believe a yaml file is a script file? Where did you read that?
>
> To me, this reads like:
>
> All fish(except zebras) live in water...
>
> I think you can just drop that note on yaml.
>
> > on the second line, the first line being the shebang. Sometimes, the
> > diff content includes the SPDX licensing information but excludes the
> > shebang when a commit is made to a script file.
> >
>
> You can be more explicit here. Sometimes? You can exactly say when and how
> that happens.
>
> > This can be seen in the commits like commit 37f8173dd849
> ("locking/atomics:
> > Flip fallbacks and instrumentation") and commit 075c8aa79d54 ("selftests:
> > forwarding: tc_actions.sh: add matchall mirror test"). In these cases
> > checkpatch issues a false positive warning:
> > "Misplaced SPDX-License-Identifier tag - use line 1 instead".
> >
> > I noticed this false positive, while running checkpatch on the set of
> > commits from v5.7 to v5.8-rc1 of the kernel, on the said commits.
> > This false positive exists in checkpatch since commit a8da38a9cf0e
> > ("checkpatch: add test for SPDX-License-Identifier on wrong line #")
> > when the corresponding rule was first added.
> >
> > The existing logic looks for a shebang in the patch/file being checked
> > and if a shebang is encountered it directs checkpatch to expect
> > license on the second line by setting `$checklicenseline` to `2`.
> >
>
> You can drop those `quotes` around variable names and numbers.
>
> This can be written shorter:
> Currently, if checkpatch find a shebang in line 1, it expects the
> license identifier in line 2 instead of line 1.
>
> > However, this approach doesn't work when we don't have a shebang in the
> > patch and `$checklicensline` continues to be `1` in this case leading to
> > the unnecessary warning.
> >
>
> However, this only works when both line 1 and 2 are part of the patch.
>
> > Fix this by setting `$checklicenseline` to `2` by checking if the patch
> > comes from a script for the cases when the shebang doesn't appear in the
> > patch.
> >
>
> You are not really fixing it. You are improving the heuristics.
>
> So:
>
> Reduce the false warnings for such patches on scripts, by checking file
> extension.
>
> Alternatively, you could actually also check the file permissions of the
> file.
>
> Sir,

There are 577 executable files in the kernel, out of which 53 don't have a
shebang in the first line.

Moreover, in these 53 files, 8 should have definitely had it as they are
.py or .sh files.
The other files are .dts, .dtsi, .S, .h, .c files,
scripts/atomic/atomics.tbl file, Documentation/Changes file and all the
files
inside scripts/atomic/fallbacks that are without extension.
If I am correct none of these should have a shebang but I am not very sure
about files inside scripts/atomic/fallbacks.

If we check for file extension we warn wrongly for 120 files iff shebang
doesn't appear in the patch but if we check for
permissions we would warn wrongly for 53 files. I think this is better than
checking for extension.
Should we use this heuristic in the new patch I send?

Thank you.

>
>
> Improve the patch; if it looks good then, it could be suitable for the
> larger discussion on lkml.
>

> Lukas
>
> > Signed-off-by: Mrinal Pandey <mrinalmni@gmail.com>
> > ---
> >  scripts/checkpatch.pl | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > index 4c820607540b..80dfa83ed0fb 100755
> > --- a/scripts/checkpatch.pl
> > +++ b/scripts/checkpatch.pl
> > @@ -3167,7 +3167,7 @@ sub process {
> >
> >  # check for using SPDX license tag at beginning of files
> >               if ($realline == $checklicenseline) {
> > -                     if ($rawline =~ /^[ \+]\s*\#\!\s*\//) {
> > +                     if ($rawline =~ /^[ \+]\s*\#\!\s*\// || $realfile
> =~ /.*\.\(py\|sh\|pl\|awk\|tc\)/) {
> >                               $checklicenseline = 2;
> >                       } elsif ($rawline =~ /^\+/) {
> >                               my $comment = "";
> > --
> > 2.25.1
> >
> >
>

--000000000000ca6c5a05ab55988b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jul 26, 2020 at 11:43 AM Luka=
s Bulwahn &lt;<a href=3D"mailto:lukas.bulwahn@gmail.com">lukas.bulwahn@gmai=
l.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><br>
<br>
On Sat, 25 Jul 2020, Mrinal Pandey wrote:<br>
<br>
&gt; In all the script files(except yaml), SPDX license identifier is expec=
ted<br>
<br>
Why do believe a yaml file is a script file? Where did you read that?<br>
<br>
To me, this reads like:<br>
<br>
All fish(except zebras) live in water...<br>
<br>
I think you can just drop that note on yaml.<br>
<br>
&gt; on the second line, the first line being the shebang. Sometimes, the<b=
r>
&gt; diff content includes the SPDX licensing information but excludes the<=
br>
&gt; shebang when a commit is made to a script file.<br>
&gt; <br>
<br>
You can be more explicit here. Sometimes? You can exactly say when and how =
<br>
that happens.<br>
<br>
&gt; This can be seen in the commits like commit 37f8173dd849 (&quot;lockin=
g/atomics:<br>
&gt; Flip fallbacks and instrumentation&quot;) and commit 075c8aa79d54 (&qu=
ot;selftests:<br>
&gt; forwarding: tc_actions.sh: add matchall mirror test&quot;). In these c=
ases<br>
&gt; checkpatch issues a false positive warning:<br>
&gt; &quot;Misplaced SPDX-License-Identifier tag - use line 1 instead&quot;=
.<br>
&gt; <br>
&gt; I noticed this false positive, while running checkpatch on the set of<=
br>
&gt; commits from v5.7 to v5.8-rc1 of the kernel, on the said commits.<br>
&gt; This false positive exists in checkpatch since commit a8da38a9cf0e<br>
&gt; (&quot;checkpatch: add test for SPDX-License-Identifier on wrong line =
#&quot;)<br>
&gt; when the corresponding rule was first added.<br>
&gt; <br>
&gt; The existing logic looks for a shebang in the patch/file being checked=
<br>
&gt; and if a shebang is encountered it directs checkpatch to expect<br>
&gt; license on the second line by setting `$checklicenseline` to `2`.<br>
&gt;<br>
<br>
You can drop those `quotes` around variable names and numbers.<br>
<br>
This can be written shorter:<br>
Currently, if checkpatch find a shebang in line 1, it expects the <br>
license identifier in line 2 instead of line 1.<br>
<br>
&gt; However, this approach doesn&#39;t work when we don&#39;t have a sheba=
ng in the<br>
&gt; patch and `$checklicensline` continues to be `1` in this case leading =
to<br>
&gt; the unnecessary warning.<br>
&gt; <br>
<br>
However, this only works when both line 1 and 2 are part of the patch.<br>
<br>
&gt; Fix this by setting `$checklicenseline` to `2` by checking if the patc=
h<br>
&gt; comes from a script for the cases when the shebang doesn&#39;t appear =
in the<br>
&gt; patch.<br>
&gt;<br>
<br>
You are not really fixing it. You are improving the heuristics.<br>
<br>
So:<br>
<br>
Reduce the false warnings for such patches on scripts, by checking file <br=
>
extension.<br>
<br>
Alternatively, you could actually also check the file permissions of the <b=
r>
file.<br>
<br></blockquote><div>Sir,</div><div><br></div><div>There are 577 executabl=
e files in the kernel, out of which 53 don&#39;t have a shebang in the firs=
t line.</div><div><br></div><div>Moreover, in these 53 files, 8 should have=
 definitely had it as they are .py or .sh files.</div><div>The other files =
are .dts, .dtsi, .S, .h, .c files, scripts/atomic/atomics.tbl file, Documen=
tation/Changes file and all the files <br></div><div>inside scripts/atomic/=
fallbacks that are without extension.</div><div>If I am correct none of the=
se should have a shebang but I am not very sure about files inside scripts/=
atomic/fallbacks.</div><div><br></div><div>If we check for file extension w=
e warn wrongly for 120 files iff shebang doesn&#39;t appear in the patch bu=
t if we check for</div><div>permissions we would warn wrongly for 53 files.=
 I think this is better than checking for extension.<br></div><div>Should w=
e use this heuristic in the new patch I send?</div><div><br></div><div>Than=
k you.<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
Improve the patch; if it looks good then, it could be suitable for the <br>
larger discussion on lkml.<br></blockquote><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
<br>
Lukas<br>
<br>
&gt; Signed-off-by: Mrinal Pandey &lt;<a href=3D"mailto:mrinalmni@gmail.com=
" target=3D"_blank">mrinalmni@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" targ=
et=3D"_blank">checkpatch.pl</a> | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferre=
r" target=3D"_blank">checkpatch.pl</a> b/scripts/<a href=3D"http://checkpat=
ch.pl" rel=3D"noreferrer" target=3D"_blank">checkpatch.pl</a><br>
&gt; index 4c820607540b..80dfa83ed0fb 100755<br>
&gt; --- a/scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" targ=
et=3D"_blank">checkpatch.pl</a><br>
&gt; +++ b/scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" targ=
et=3D"_blank">checkpatch.pl</a><br>
&gt; @@ -3167,7 +3167,7 @@ sub process {<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # check for using SPDX license tag at beginning of files<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ($realline =
=3D=3D $checklicenseline) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if ($rawline =3D~ /^[ \+]\s*\#\!\s*\//) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if ($rawline =3D~ /^[ \+]\s*\#\!\s*\// || $realfile =3D~ /.*\.\(py\|=
sh\|pl\|awk\|tc\)/) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$checklicenseline =3D 2;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0} elsif ($rawline =3D~ /^\+/) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0my $comment =3D &quot;&quot;;<br>
&gt; -- <br>
&gt; 2.25.1<br>
&gt; <br>
&gt; <br>
</blockquote></div></div>

--000000000000ca6c5a05ab55988b--

--===============1879128535317311579==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============1879128535317311579==--
