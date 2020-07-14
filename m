Return-Path: <SRS0=uvNB=AZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4088FC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jul 2020 05:35:38 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08A212193E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jul 2020 05:35:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tfgCEzom"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08A212193E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C19EA8AD94;
	Tue, 14 Jul 2020 05:35:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gg6nw9ij9sQW; Tue, 14 Jul 2020 05:35:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9B77B8A45B;
	Tue, 14 Jul 2020 05:35:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7721AC0888;
	Tue, 14 Jul 2020 05:35:36 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8A2EBC0733
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 05:35:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6B71823504
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 05:35:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BeNx6OcCcDJQ
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 05:35:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by silver.osuosl.org (Postfix) with ESMTPS id 0F62B2275A
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 05:35:34 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id gc15so670656pjb.0
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 22:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6y+oIjonZWB9LyBSP3WdJwhNP4EqOKpkvjyO5B4q8XU=;
 b=tfgCEzom2xQA/4D8B70SOs4OwkCxXZLAlxZr6cmVtz7Na+OCnvb7MbLBI0y0SD7/YC
 2jnA80gqE1V2LybQNa3VX+sNPVFd2sREZp6YhgNQ22uU39ISrXbB/KaHuCSjrTRg0CA7
 5QZ4q/fNn/RedI0rFoihfcg+cGZblCJeN41igZIZCW0m+sEP2swO7QbMjJykZg9NC/m7
 iXhYC7oXKw1ZRsZ+6oISzKLXRpSMCr9jAWXjnF7QoO4xh6CNuTpnhQbKv7sXDeve7fcf
 ToHjTBa5WHiQFqGdHd5/4IhUqFBTlOXWYzMWark6NG9eDpJDKDfqTcoiyF+vnSAymWZ9
 PAFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6y+oIjonZWB9LyBSP3WdJwhNP4EqOKpkvjyO5B4q8XU=;
 b=J33HEXBsTq8KDOxcHHp9OSLuEkNMWtEBDoIVHmjiCwov8M1QHb1DdcWFflHMCMzeYo
 +HghRH9cg6Xh+pU7kpbL4KXLIRTSbQ6EXXL6fQgAcLOSND/wzGghIJfk2/e8MfsaodV7
 I0INQMgYX0iv9eym2fx+Bn9CVnfXNpZX1vy1T7oOrOia1tMuMlpv5BOfJ6ZzDEcjjga0
 WL96/qisQr2xN0J4T6Ff6eWMbAE1dA/24Rht1SQUbj0oC9vxRFjachDPN7mLaT3JGVRH
 z/v49wTGMMO/1BoUBQezC2Y25qvk1qvfQDoACQ3x/HATvWIzvqcmSZHh0lj4XKxTyvxa
 /+hw==
X-Gm-Message-State: AOAM533x2iy0jkywQrm2acCIRdR6AtKRHw2LKqhJQsvX8iOiHIAc6IbI
 4HliV/K2/vEO17z5gwMUT0lmpQ17gZmBpA2bnSs=
X-Google-Smtp-Source: ABdhPJwMz2OGQN+/ldC4DDNnSV4uJOfO/lDsG7l63jmOtbUikhSJ+MdGB6d0sj1v+FB71VGfS2HM2ZuWxHlp4BPig38=
X-Received: by 2002:a17:902:8c91:: with SMTP id
 t17mr63647plo.235.1594704933388; 
 Mon, 13 Jul 2020 22:35:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200713095740.mi3cnx7tccoetxgc@mrinalpandey>
 <alpine.DEB.2.21.2007132140160.11844@felia>
In-Reply-To: <alpine.DEB.2.21.2007132140160.11844@felia>
From: Mrinal Pandey <mrinalmni@gmail.com>
Date: Tue, 14 Jul 2020 11:05:21 +0530
Message-ID: <CAD1=X6ktktiJ10f3sefs72_WfWLFEVUg85mvp9391=tsn7gULw@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: Fix SPDX license
	check for scripts
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
Content-Type: multipart/mixed; boundary="===============3824290668493410115=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============3824290668493410115==
Content-Type: multipart/alternative; boundary="0000000000001386b205aa602db3"

--0000000000001386b205aa602db3
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 14, 2020 at 1:16 AM Lukas Bulwahn <lukas.bulwahn@gmail.com>
wrote:

>
>
> On Mon, 13 Jul 2020, Mrinal Pandey wrote:
>
> > In all the scripts, the SPDX license should be on the second line,
> > the first line being the "sh-bang", but checkpatch issues a warning
> > "Misplaced SPDX-License-Identifier tag - use line 1 instead" for the
> > scripts that have SPDX license in the second line.
> >
> > However, this warning is not issued when checkpatch is run on a file
> using
> > `-f` option. The case for files has been handled gracefully by changing
> > `$checklicenseline` to `2` but a corresponding check when running
> checkpatch
> > on a commit hash is missing.
> >
> > I noticed this false positive while running checkpatch on the set of
> > commits from v5.7 to v5.8-rc1 of the kernel on the commits which modified
> > a script file.
> >
> > This check is missing in checkpatch since commit a8da38a9cf0e
> > ("checkpatch: add test for SPDX-License-Identifier on wrong line #")
> > when the corresponding rule was first commited.
> >
> > Fix this by setting `$checklicenseline` to `2` when the diff content that
> > is being checked originates from a script, thus, informing checkpatch
> that
> > the SPDX license should be on the second line.
> >
> > Signed-off-by: Mrinal Pandey <mrinalmni@gmail.com>
> > ---
> >  scripts/checkpatch.pl | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > index 4c820607540b..bbffd0c4449d 100755
> > --- a/scripts/checkpatch.pl
> > +++ b/scripts/checkpatch.pl
> > @@ -3218,6 +3218,9 @@ sub process {
> >               next if ($realfile !~ /\.(h|c|s|S|sh|dtsi|dts)$/);
> >
> >  # check for using SPDX-License-Identifier on the wrong line number
> > +             if ($realfile =~ /^scripts/) {
> > +                    $checklicenseline = 2;
> > +             }
>
> I think this is somehow wrong here. The check for checklicenseline = 2
> looks very different above.
>
> Why does -f work and using a patch file not work?
>

Sir,

I am going to explain my observation based on file
`scripts/atomic/gen-atomic-fallback.sh` and
commit hash `37f8173dd849`.

If we are checking against the file, `checklicenseline` is set to 1 and
when `realline` is 1 the above
`if` block is triggered, then we check if this line is of the form `#!/`
using the regular expression
`^[ \+]\s*\#\!\s*\/`. If this is the case we set `checklicenseline` to `2`
informing checkpatch that it should
expect license on the second line and this works all fine for a file.
The `if` block below my proposed changes evaluates to false in this case
and thus it emits no false warning.

However, If we are checking a diff content, the above `if` block is not
triggered at all. This is
because `realline` stores the actual line number of the line we are
checking currently out of diff content.
This value is 2 because SPDX identifier is indeed at the second line in the
file but `checklicenseline` is still `1`.
`realline` will never become equal to 1 again and thus the above `if`
condition will never be true in this case.
Even if the above `if` block is triggered it would not update
`checklicenseline` to 2 as the regular expression
is not satisfied since we don't have sh-bang in diff content and just the
SPDX tag.
If we don't do this, the `if` block below evaluates to true when `realline`
is 2 and `checklicensline` is `1` leading
to the emission of a false warning.

So, what I did was to check if the diff content we are checking actually
comes from a script, if yes, we can set
`checklicenseline` to `2` to avoid this confusion.

Please let me know if this is reasonable.

Thank you.


>
> Lukas
>
>
> >               if ($realline != $checklicenseline &&
> >                   $rawline =~ /\bSPDX-License-Identifier:/ &&
> >                   substr($line, @-, @+ - @-) eq "$;" x (@+ - @-)) {
> > --
> > 2.25.1
> >
> >
>

--0000000000001386b205aa602db3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 14, 2020 at 1:16 AM Lukas=
 Bulwahn &lt;<a href=3D"mailto:lukas.bulwahn@gmail.com">lukas.bulwahn@gmail=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><br>
<br>
On Mon, 13 Jul 2020, Mrinal Pandey wrote:<br>
<br>
&gt; In all the scripts, the SPDX license should be on the second line,<br>
&gt; the first line being the &quot;sh-bang&quot;, but checkpatch issues a =
warning<br>
&gt; &quot;Misplaced SPDX-License-Identifier tag - use line 1 instead&quot;=
 for the<br>
&gt; scripts that have SPDX license in the second line.<br>
&gt; <br>
&gt; However, this warning is not issued when checkpatch is run on a file u=
sing<br>
&gt; `-f` option. The case for files has been handled gracefully by changin=
g<br>
&gt; `$checklicenseline` to `2` but a corresponding check when running chec=
kpatch<br>
&gt; on a commit hash is missing.<br>
&gt; <br>
&gt; I noticed this false positive while running checkpatch on the set of<b=
r>
&gt; commits from v5.7 to v5.8-rc1 of the kernel on the commits which modif=
ied<br>
&gt; a script file.<br>
&gt; <br>
&gt; This check is missing in checkpatch since commit a8da38a9cf0e<br>
&gt; (&quot;checkpatch: add test for SPDX-License-Identifier on wrong line =
#&quot;)<br>
&gt; when the corresponding rule was first commited.<br>
&gt; <br>
&gt; Fix this by setting `$checklicenseline` to `2` when the diff content t=
hat<br>
&gt; is being checked originates from a script, thus, informing checkpatch =
that<br>
&gt; the SPDX license should be on the second line.<br>
&gt; <br>
&gt; Signed-off-by: Mrinal Pandey &lt;<a href=3D"mailto:mrinalmni@gmail.com=
" target=3D"_blank">mrinalmni@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" targ=
et=3D"_blank">checkpatch.pl</a> | 3 +++<br>
&gt;=C2=A0 1 file changed, 3 insertions(+)<br>
&gt; <br>
&gt; diff --git a/scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferre=
r" target=3D"_blank">checkpatch.pl</a> b/scripts/<a href=3D"http://checkpat=
ch.pl" rel=3D"noreferrer" target=3D"_blank">checkpatch.pl</a><br>
&gt; index 4c820607540b..bbffd0c4449d 100755<br>
&gt; --- a/scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" targ=
et=3D"_blank">checkpatch.pl</a><br>
&gt; +++ b/scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" targ=
et=3D"_blank">checkpatch.pl</a><br>
&gt; @@ -3218,6 +3218,9 @@ sub process {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0next if ($realfi=
le !~ /\.(h|c|s|S|sh|dtsi|dts)$/);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # check for using SPDX-License-Identifier on the wrong line numb=
er<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ($realfile =3D~ /^=
scripts/) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 $checklicenseline =3D 2;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
I think this is somehow wrong here. The check for checklicenseline =3D 2 <b=
r>
looks very different above.<br>
<br>
Why does -f work and using a patch file not work?<br></blockquote><div><br>=
</div><div><div>Sir,</div><div><br></div><div>I am going to explain my obse=
rvation based on file `scripts/atomic/gen-atomic-fallback.sh` and</div><div=
>commit hash `37f8173dd849`.</div><div><br></div><div>If we are checking ag=
ainst the file, `checklicenseline` is set to 1 and when `realline` is 1 the=
 above</div><div>`if` block is triggered, then we check if this line is of =
the form `#!/` using the regular expression</div><div>`^[ \+]\s*\#\!\s*\/`.=
 If this is the case we set `checklicenseline` to `2` informing checkpatch =
that it should</div><div>expect license on the second line and this works a=
ll fine for a file.</div><div>The `if` block below my proposed changes eval=
uates to false in this case and thus it emits no false warning.<br></div><d=
iv><br></div><div>However, If we are checking a diff content, the above `if=
` block is not triggered at all. This is</div><div>because `realline` store=
s the actual line number of the line we are checking currently out of diff =
content.</div><div>This value is 2 because SPDX identifier is indeed at the=
 second line in the file but `checklicenseline` is still `1`.</div><div>`re=
alline` will never become equal to 1 again and thus the above `if` conditio=
n will never be true in this case.<br></div><div>Even if the above `if` blo=
ck is triggered it would not update `checklicenseline` to 2 as the regular =
expression</div><div>is not satisfied since we don&#39;t have sh-bang in di=
ff content and just the SPDX tag.</div><div>If we don&#39;t do this, the `i=
f` block below evaluates to true when `realline` is 2 and `checklicensline`=
 is `1` leading</div><div>to the emission of a false warning.<br></div><div=
><br></div><div>So, what I did was to check if the diff content we are chec=
king actually comes from a script, if yes, we can set</div><div>`checklicen=
seline` to `2` to avoid this confusion.</div><div><br></div><div>Please let=
 me know if this is reasonable.<br></div><div><br></div><div>Thank you.<br>=
</div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Lukas<br>
<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ($realline !=
=3D $checklicenseline &amp;&amp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$r=
awline =3D~ /\bSPDX-License-Identifier:/ &amp;&amp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0su=
bstr($line, @-, @+ - @-) eq &quot;$;&quot; x (@+ - @-)) {<br>
&gt; -- <br>
&gt; 2.25.1<br>
&gt; <br>
&gt; <br>
</blockquote></div></div>

--0000000000001386b205aa602db3--

--===============3824290668493410115==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============3824290668493410115==--
