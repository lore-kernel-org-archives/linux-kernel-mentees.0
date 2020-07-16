Return-Path: <SRS0=x3JG=A3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D360DC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 16 Jul 2020 05:15:30 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 958DA204EC
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 16 Jul 2020 05:15:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e96Uf3xd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 958DA204EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4CE528A143;
	Thu, 16 Jul 2020 05:15:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KPlz8eswKZd6; Thu, 16 Jul 2020 05:15:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 07BE28A141;
	Thu, 16 Jul 2020 05:15:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E5451C07FF;
	Thu, 16 Jul 2020 05:15:28 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CC428C0733
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jul 2020 05:15:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9AB4920363
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jul 2020 05:15:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vn-+P6YaJPHA
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jul 2020 05:15:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by silver.osuosl.org (Postfix) with ESMTPS id 0CAE620357
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jul 2020 05:15:26 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id gc9so4216599pjb.2
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jul 2020 22:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=37KAcF3KeDzqQqoIf2QvnIrRStRtcLcWdC8VMTy9JAw=;
 b=e96Uf3xd3HU45bZ3fg7UiPNSy6r8xhGAoqNCW8Iu2mNKIgJ6mxB77e+4XOvXe8pFU+
 xR7j/uXLlnhMDbwoMcSJTb9aPjxhJ8d2xFWpoxbpvmC4lSutZSAdOBnD2Kt2ZoaD0jky
 2Ua0EciG5QeoshU3iQPpYviC+iH3bf+se+Qodd02oaQxTBAJw8nbBWqU7oxd3aa0jbXZ
 LfVxN1+cXPkrgUopfZWGgiSOEnL6et+PYy/anId3zI1rf/jUsyx3wXOTQom9y1DsNZoo
 QwYY8rr1tPCmj+EU6Bir8OtF4qslvLWuULZNMqjmTNBcV52SBRRiqgQY3EGGj7o7BoJ8
 FOnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=37KAcF3KeDzqQqoIf2QvnIrRStRtcLcWdC8VMTy9JAw=;
 b=AxKrpklE1vjS6vTZM3+dVVRDHNG7R5qhl62k8LQikw/YIyyl78le2S/+hP6RN+5L4o
 EGYvkz/vncfpZO/jbKMOseQLjhEG3m4+xKpz2Bdze2PRzX6PjOJ7L0/BQXFS9DSnsj2V
 /ma6dxSSbP2hKrbrh86+aMRZ3CRbXq4uBaomNzq6I4sIheyPfMCkGg7BPJwzx8OB4HXi
 e3myb4HTI2kOQZ0wsRnxtusGBOGGQBLsRHgoeAqUXnIqrj/JY5HNVtxWsoLspn0KumK+
 +TCLtwxj6yNCe8czjwxDexXRX5el1V0qDzgNNgEIRmYT+DOsHMQcTvkfNVXIm1H/baOW
 M5hg==
X-Gm-Message-State: AOAM531SP5oN+B0siEUQi/aYIC5a2T8ERrTM3grvwdWgt7FyK380Lodz
 faPNsG1D9MF6RdrYFqayT9Z5RfNXCAq15VoGQDM=
X-Google-Smtp-Source: ABdhPJxSf1Ue6Ks6trprPB49/o+KPGh67WYju8DPKTVHZDSMqaMAweSbpWx6FLIx+Bzdaa4QocK3DWlXhJYaL93RVls=
X-Received: by 2002:a17:902:7441:: with SMTP id
 e1mr2156611plt.71.1594876525377; 
 Wed, 15 Jul 2020 22:15:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200713095740.mi3cnx7tccoetxgc@mrinalpandey>
 <alpine.DEB.2.21.2007132140160.11844@felia>
 <CAD1=X6ktktiJ10f3sefs72_WfWLFEVUg85mvp9391=tsn7gULw@mail.gmail.com>
 <alpine.DEB.2.21.2007140748230.6558@felia>
In-Reply-To: <alpine.DEB.2.21.2007140748230.6558@felia>
From: Mrinal Pandey <mrinalmni@gmail.com>
Date: Thu, 16 Jul 2020 10:45:13 +0530
Message-ID: <CAD1=X6=7hdMviayOxwa9runHuKCU5ShmFnM+pzLzEsM_-D0dzA@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Shuah Khan <skhan@linuxfoundation.org>, 
 Linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: multipart/mixed; boundary="000000000000c1d7ff05aa882040"
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
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--000000000000c1d7ff05aa882040
Content-Type: multipart/alternative; boundary="000000000000c1d7fd05aa88203e"

--000000000000c1d7fd05aa88203e
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 14, 2020 at 11:33 AM Lukas Bulwahn <lukas.bulwahn@gmail.com>
wrote:

>
>
> On Tue, 14 Jul 2020, Mrinal Pandey wrote:
>
> >
> >
> > On Tue, Jul 14, 2020 at 1:16 AM Lukas Bulwahn <lukas.bulwahn@gmail.com>
> wrote:
> >
> >
> >       On Mon, 13 Jul 2020, Mrinal Pandey wrote:
> >
> >       > In all the scripts, the SPDX license should be on the second
> line,
> >       > the first line being the "sh-bang", but checkpatch issues a
> warning
> >       > "Misplaced SPDX-License-Identifier tag - use line 1 instead" for
> the
> >       > scripts that have SPDX license in the second line.
> >       >
> >       > However, this warning is not issued when checkpatch is run on a
> file using
> >       > `-f` option. The case for files has been handled gracefully by
> changing
> >       > `$checklicenseline` to `2` but a corresponding check when
> running checkpatch
> >       > on a commit hash is missing.
> >       >
> >       > I noticed this false positive while running checkpatch on the
> set of
> >       > commits from v5.7 to v5.8-rc1 of the kernel on the commits which
> modified
> >       > a script file.
> >       >
> >       > This check is missing in checkpatch since commit a8da38a9cf0e
> >       > ("checkpatch: add test for SPDX-License-Identifier on wrong line
> #")
> >       > when the corresponding rule was first commited.
> >       >
> >       > Fix this by setting `$checklicenseline` to `2` when the diff
> content that
> >       > is being checked originates from a script, thus, informing
> checkpatch that
> >       > the SPDX license should be on the second line.
> >       >
> >       > Signed-off-by: Mrinal Pandey <mrinalmni@gmail.com>
> >       > ---
> >       >  scripts/checkpatch.pl | 3 +++
> >       >  1 file changed, 3 insertions(+)
> >       >
> >       > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> >       > index 4c820607540b..bbffd0c4449d 100755
> >       > --- a/scripts/checkpatch.pl
> >       > +++ b/scripts/checkpatch.pl
> >       > @@ -3218,6 +3218,9 @@ sub process {
> >       >               next if ($realfile !~ /\.(h|c|s|S|sh|dtsi|dts)$/);
> >       >
> >       >  # check for using SPDX-License-Identifier on the wrong line
> number
> >       > +             if ($realfile =~ /^scripts/) {
> >       > +                    $checklicenseline = 2;
> >       > +             }
> >
> >       I think this is somehow wrong here. The check for checklicenseline
> = 2
> >       looks very different above.
> >
> >       Why does -f work and using a patch file not work?
> >
> >
> > Sir,
> >
> > I am going to explain my observation based on file
> `scripts/atomic/gen-atomic-fallback.sh` and
> > commit hash `37f8173dd849`.
> >
> > If we are checking against the file, `checklicenseline` is set to 1 and
> when `realline` is 1 the above
> > `if` block is triggered, then we check if this line is of the form `#!/`
> using the regular expression
> > `^[ \+]\s*\#\!\s*\/`. If this is the case we set `checklicenseline` to
> `2` informing checkpatch that it should
> > expect license on the second line and this works all fine for a file.
> > The `if` block below my proposed changes evaluates to false in this case
> and thus it emits no false warning.
> >
> > However, If we are checking a diff content, the above `if` block is not
> triggered at all. This is
> > because `realline` stores the actual line number of the line we are
> checking currently out of diff content.
> > This value is 2 because SPDX identifier is indeed at the second line in
> the file but `checklicenseline` is still
> > `1`.
> > `realline` will never become equal to 1 again and thus the above `if`
> condition will never be true in this case.
> > Even if the above `if` block is triggered it would not update
> `checklicenseline` to 2 as the regular expression
> > is not satisfied since we don't have sh-bang in diff content and just
> the SPDX tag.
> > If we don't do this, the `if` block below evaluates to true when
> `realline` is 2 and `checklicensline` is `1`
> > leading
> > to the emission of a false warning.
> >
>
> So, maybe this whole logic needs to be reworked. If you do not know the
> first line, you need to have a different criteria in the first place
> to determine if you expect the license tag in the first or the second,
> e.g., the file extension, and then checking line 1 for a shebang is just
> sanity checking. If it is of a specific file extension, you know line 1
> and it is not a shebang, that is probably worth noting as a different
> recommendation in checkpatch.pl anyway.
>

Sir,

When we know the first line, i.e. we are running checkpatch against a file,
the existing logic
works fine. We probably don't want to induce any changes there.

But when we don't know the first line, if am not wrong, it would go
somewhat like:
if (the file is a script) {
    if (the first line is shebang) {
        if (the second line is SPDX) {
            All good
        } else {
            Issue a misplaced or missing SPDX tag warning
        }
    } else {
            Issue a missing shebang warning
    }
} else {
    if (the first line is SPDX) {
        All good
    } else {
        Issue a misplaced or missing SPDX tag warning
    }
}

Lukas
>
>
> > So, what I did was to check if the diff content we are checking actually
> comes from a script, if yes, we can set
> > `checklicenseline` to `2` to avoid this confusion.
> >
>
> Why would you think that scripts are only in scripts?
>
> How about first listing all files where the SPDX tag is in line 2 in the
> current repository, e.g., v5.8-rc5?
>
> Then, we look at that list and determine a suitable criteria for looking
> in line 2 for the SPDX tag.
>

Yes, the scripts are not only in scripts. I have listed all the files where
the SPDX tag should be
on the second line. I've attached the list for reference. We should
probably be checking the file
extension to determine if the tag needs to be on the second line or not.
The documentation says the SPDX tag should be present in all source files.
Do these source files include
Documentation files too?

Thank you.

>
> Lukas
>
> > Please let me know if this is reasonable.
> >
> > Thank you.
> >
> >
> >       Lukas
> >
> >
> >       >               if ($realline != $checklicenseline &&
> >       >                   $rawline =~ /\bSPDX-License-Identifier:/ &&
> >       >                   substr($line, @-, @+ - @-) eq "$;" x (@+ -
> @-)) {
> >       > --
> >       > 2.25.1
> >       >
> >       >
> >
> >
> >

--000000000000c1d7fd05aa88203e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 14, 2020 at 11:33 AM Luka=
s Bulwahn &lt;<a href=3D"mailto:lukas.bulwahn@gmail.com">lukas.bulwahn@gmai=
l.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><br>
<br>
On Tue, 14 Jul 2020, Mrinal Pandey wrote:<br>
<br>
&gt; <br>
&gt; <br>
&gt; On Tue, Jul 14, 2020 at 1:16 AM Lukas Bulwahn &lt;<a href=3D"mailto:lu=
kas.bulwahn@gmail.com" target=3D"_blank">lukas.bulwahn@gmail.com</a>&gt; wr=
ote:<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0On Mon, 13 Jul 2020, Mrinal Pandey wrote:<br=
>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; In all the scripts, the SPDX license sh=
ould be on the second line,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; the first line being the &quot;sh-bang&=
quot;, but checkpatch issues a warning<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &quot;Misplaced SPDX-License-Identifier=
 tag - use line 1 instead&quot; for the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; scripts that have SPDX license in the s=
econd line.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; However, this warning is not issued whe=
n checkpatch is run on a file using<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; `-f` option. The case for files has bee=
n handled gracefully by changing<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; `$checklicenseline` to `2` but a corres=
ponding check when running checkpatch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; on a commit hash is missing.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I noticed this false positive while run=
ning checkpatch on the set of<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; commits from v5.7 to v5.8-rc1 of the ke=
rnel on the commits which modified<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; a script file.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; This check is missing in checkpatch sin=
ce commit a8da38a9cf0e<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (&quot;checkpatch: add test for SPDX-Li=
cense-Identifier on wrong line #&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; when the corresponding rule was first c=
ommited.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Fix this by setting `$checklicenseline`=
 to `2` when the diff content that<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; is being checked originates from a scri=
pt, thus, informing checkpatch that<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; the SPDX license should be on the secon=
d line.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Signed-off-by: Mrinal Pandey &lt;<a hre=
f=3D"mailto:mrinalmni@gmail.com" target=3D"_blank">mrinalmni@gmail.com</a>&=
gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 scripts/<a href=3D"http://checkpa=
tch.pl" rel=3D"noreferrer" target=3D"_blank">checkpatch.pl</a> | 3 +++<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 1 file changed, 3 insertions(+)<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; diff --git a/scripts/<a href=3D"http://=
checkpatch.pl" rel=3D"noreferrer" target=3D"_blank">checkpatch.pl</a> b/scr=
ipts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D"_blank">=
checkpatch.pl</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; index 4c820607540b..bbffd0c4449d 100755=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; --- a/scripts/<a href=3D"http://checkpa=
tch.pl" rel=3D"noreferrer" target=3D"_blank">checkpatch.pl</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; +++ b/scripts/<a href=3D"http://checkpa=
tch.pl" rel=3D"noreferrer" target=3D"_blank">checkpatch.pl</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; @@ -3218,6 +3218,9 @@ sub process {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0next if ($realfile !~ /\.(h|c|s|S|sh|dtsi|dts)$/);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 # check for using SPDX-License-Id=
entifier on the wrong line number<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if ($realfile =3D~ /^scripts/) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $checklicenseline =3D 2;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0I think this is somehow wrong here. The chec=
k for checklicenseline =3D 2<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0looks very different above.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Why does -f work and using a patch file not =
work?<br>
&gt; <br>
&gt; <br>
&gt; Sir,<br>
&gt; <br>
&gt; I am going to explain my observation based on file `scripts/atomic/gen=
-atomic-fallback.sh` and<br>
&gt; commit hash `37f8173dd849`.<br>
&gt; <br>
&gt; If we are checking against the file, `checklicenseline` is set to 1 an=
d when `realline` is 1 the above<br>
&gt; `if` block is triggered, then we check if this line is of the form `#!=
/` using the regular expression<br>
&gt; `^[ \+]\s*\#\!\s*\/`. If this is the case we set `checklicenseline` to=
 `2` informing checkpatch that it should<br>
&gt; expect license on the second line and this works all fine for a file.<=
br>
&gt; The `if` block below my proposed changes evaluates to false in this ca=
se and thus it emits no false warning.<br>
&gt; <br>
&gt; However, If we are checking a diff content, the above `if` block is no=
t triggered at all. This is<br>
&gt; because `realline` stores the actual line number of the line we are ch=
ecking currently out of diff content.<br>
&gt; This value is 2 because SPDX identifier is indeed at the second line i=
n the file but `checklicenseline` is still<br>
&gt; `1`.<br>
&gt; `realline` will never become equal to 1 again and thus the above `if` =
condition will never be true in this case.<br>
&gt; Even if the above `if` block is triggered it would not update `checkli=
censeline` to 2 as the regular expression<br>
&gt; is not satisfied since we don&#39;t have sh-bang in diff content and j=
ust the SPDX tag.<br>
&gt; If we don&#39;t do this, the `if` block below evaluates to true when `=
realline` is 2 and `checklicensline` is `1`<br>
&gt; leading<br>
&gt; to the emission of a false warning.<br>
&gt; <br>
<br>
So, maybe this whole logic needs to be reworked. If you do not know the <br=
>
first line, you need to have a different criteria in the first place<br>
to determine if you expect the license tag in the first or the second, <br>
e.g., the file extension, and then checking line 1 for a shebang is just<br=
>
sanity checking. If it is of a specific file extension, you know line 1<br>
and it is not a shebang, that is probably worth noting as a different <br>
recommendation in <a href=3D"http://checkpatch.pl" rel=3D"noreferrer" targe=
t=3D"_blank">checkpatch.pl</a> anyway.<br></blockquote><div><br></div><div>=
Sir,</div><div><br></div><div><div>When we know the first line, i.e. we are=
 running checkpatch against a file, the existing logic</div><div>works fine=
. We probably don&#39;t want to induce any changes there.<br></div><div><br=
></div></div><div>But when we don&#39;t know the first line, if am not wron=
g, it would go somewhat like:<br></div><div>if (the file is a script) {</di=
v><div>=C2=A0=C2=A0=C2=A0 if (the first line is shebang) {</div><div>=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (the second line is SPDX) {</div><d=
iv>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 All g=
ood<br></div><div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {</div>=
<div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Iss=
ue a misplaced or missing SPDX tag warning<br></div><div>=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 }<br></div><div>=C2=A0=C2=A0=C2=A0 } else {</div><=
div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Issu=
e a missing shebang warning<br></div><div>=C2=A0=C2=A0=C2=A0 }<br></div><di=
v>} else {</div><div>=C2=A0=C2=A0=C2=A0 if (the first line is SPDX) {</div>=
<div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 All good<br></div><div>=C2=
=A0=C2=A0=C2=A0 } else {</div><div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 Issue a misplaced or missing SPDX tag warning</div><div>=C2=A0=C2=A0=C2=
=A0 }<br></div><div>}</div><div> <br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
Lukas<br>
<br>
<br>
&gt; So, what I did was to check if the diff content we are checking actual=
ly comes from a script, if yes, we can set<br>
&gt; `checklicenseline` to `2` to avoid this confusion.<br>
&gt;<br>
<br>
Why would you think that scripts are only in scripts?<br>
<br>
How about first listing all files where the SPDX tag is in line 2 in the <b=
r>
current repository, e.g., v5.8-rc5?<br>
<br>
Then, we look at that list and determine a suitable criteria for looking <b=
r>
in line 2 for the SPDX tag.<br></blockquote><div><br></div><div>Yes, the sc=
ripts are not only in scripts. I have listed all the files where the SPDX t=
ag should be</div><div>on the second line. I&#39;ve attached the list for r=
eference. We should probably be checking the file</div><div>extension to de=
termine if the tag needs to be on the second line or not.</div><div>The doc=
umentation says the SPDX tag should be present in all source files. Do thes=
e source files include</div><div>Documentation files too?</div><div><br></d=
iv><div>Thank you.<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
<br>
Lukas<br>
<br>
&gt; Please let me know if this is reasonable.<br>
&gt; <br>
&gt; Thank you.<br>
&gt; =C2=A0<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Lukas<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0if ($realline !=3D $checklicenseline &amp;&amp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$rawline =3D~ /\bSPDX-License-Identifier:/ &=
amp;&amp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0substr($line, @-, @+ - @-) eq &quot;$;&quot;=
 x (@+ - @-)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; --<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; 2.25.1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; <br>
&gt; <br>
&gt; </blockquote></div></div>

--000000000000c1d7fd05aa88203e--
--000000000000c1d7ff05aa882040
Content-Type: application/octet-stream; name=scripts
Content-Disposition: attachment; filename=scripts
Content-Transfer-Encoding: base64
Content-ID: <f_kcoc9axr0>
X-Attachment-Id: f_kcoc9axr0

Li9Eb2N1bWVudGF0aW9uL25ldHdvcmtpbmcvY3hhY3J1LWNmLnB5Ci4vRG9jdW1lbnRhdGlvbi9m
ZWF0dXJlcy9zY3JpcHRzL2ZlYXR1cmVzLXJlZnJlc2guc2gKLi9Eb2N1bWVudGF0aW9uL2ZlYXR1
cmVzL2xpc3QtYXJjaC5zaAouL0RvY3VtZW50YXRpb24vdHJhY2UvcG9zdHByb2Nlc3MvdHJhY2Ut
cGFnZWFsbG9jLXBvc3Rwcm9jZXNzLnBsCi4vRG9jdW1lbnRhdGlvbi90cmFjZS9wb3N0cHJvY2Vz
cy90cmFjZS12bXNjYW4tcG9zdHByb2Nlc3MucGwKLi9Eb2N1bWVudGF0aW9uL3RyYWNlL3Bvc3Rw
cm9jZXNzL2RlY29kZV9tc3IucHkKLi9Eb2N1bWVudGF0aW9uL2FybTY0L2thc2FuLW9mZnNldHMu
c2gKLi9Eb2N1bWVudGF0aW9uL3MzOTAvY29uZmlnMzI3MC5zaAouL0RvY3VtZW50YXRpb24vYWRt
aW4tZ3VpZGUvYW9lL3N0YXR1cy5zaAouL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvYW9lL3Vk
ZXYtaW5zdGFsbC5zaAouL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvYW9lL2F1dG9sb2FkLnNo
Ci4vRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9jaWZzL3dpbnVjYXNlX2NvbnZlcnQucGwKLi9E
b2N1bWVudGF0aW9uL3NwaGlueC9rZXJuZWxkb2MucHkKLi9Eb2N1bWVudGF0aW9uL3NwaGlueC9w
YXJzZS1oZWFkZXJzLnBsCi4vRG9jdW1lbnRhdGlvbi9zcGhpbngvcnN0RmxhdFRhYmxlLnB5Ci4v
RG9jdW1lbnRhdGlvbi9zcGhpbngva2VybmVsbG9nLnB5Ci4vRG9jdW1lbnRhdGlvbi9zcGhpbngv
bG9hZF9jb25maWcucHkKLi9Eb2N1bWVudGF0aW9uL3NwaGlueC9rZmlndXJlLnB5Ci4vRG9jdW1l
bnRhdGlvbi9zcGhpbngvY2RvbWFpbi5weQouL0RvY3VtZW50YXRpb24vc3BoaW54L21haW50YWlu
ZXJzX2luY2x1ZGUucHkKLi9Eb2N1bWVudGF0aW9uL3NwaGlueC9rZXJuZWxfaW5jbHVkZS5weQou
L0RvY3VtZW50YXRpb24vc3BoaW54L2F1dG9tYXJrdXAucHkKLi9Eb2N1bWVudGF0aW9uL3NwaGlu
eC9wYXJhbGxlbC13cmFwcGVyLnNoCi4vRG9jdW1lbnRhdGlvbi9zb3VuZC9jYXJkcy9tdWx0aXNv
dW5kLnNoCi4vRG9jdW1lbnRhdGlvbi9jb25mLnB5Ci4vRG9jdW1lbnRhdGlvbi90YXJnZXQvdGNt
X21vZF9idWlsZGVyLnB5Ci4vRG9jdW1lbnRhdGlvbi91c2Vyc3BhY2UtYXBpL21lZGlhL2NvbmZf
bml0cGljay5weQouL3ZtbGludXgtZ2RiLnB5Ci4va2VybmVsL2dlbl9raGVhZGVycy5zaAouL3Nj
cmlwdHMvY2hlY2twYXRjaC5wbAouL3NjcmlwdHMva2NvbmZpZy90ZXN0cy9lcnJfcmVjdXJzaXZl
X2RlcC9fX2luaXRfXy5weQouL3NjcmlwdHMva2NvbmZpZy90ZXN0cy9lcnJfcmVjdXJzaXZlX2lu
Yy9fX2luaXRfXy5weQouL3NjcmlwdHMva2NvbmZpZy90ZXN0cy9jaG9pY2VfdmFsdWVfd2l0aF9t
X2RlcC9fX2luaXRfXy5weQouL3NjcmlwdHMva2NvbmZpZy90ZXN0cy9jaG9pY2UvX19pbml0X18u
cHkKLi9zY3JpcHRzL2tjb25maWcvdGVzdHMvYXV0b19zdWJtZW51L19faW5pdF9fLnB5Ci4vc2Ny
aXB0cy9rY29uZmlnL3Rlc3RzL2NvbmZ0ZXN0LnB5Ci4vc2NyaXB0cy9rY29uZmlnL3Rlc3RzL25l
d19jaG9pY2Vfd2l0aF9kZXAvX19pbml0X18ucHkKLi9zY3JpcHRzL2tjb25maWcvdGVzdHMvcHJl
cHJvY2Vzcy92YXJpYWJsZS9fX2luaXRfXy5weQouL3NjcmlwdHMva2NvbmZpZy90ZXN0cy9wcmVw
cm9jZXNzL2VzY2FwZS9fX2luaXRfXy5weQouL3NjcmlwdHMva2NvbmZpZy90ZXN0cy9wcmVwcm9j
ZXNzL2J1aWx0aW5fZnVuYy9fX2luaXRfXy5weQouL3NjcmlwdHMva2NvbmZpZy90ZXN0cy9wcmVw
cm9jZXNzL2NpcmN1bGFyX2V4cGFuc2lvbi9fX2luaXRfXy5weQouL3NjcmlwdHMva2NvbmZpZy90
ZXN0cy9ub193cml0ZV9pZl9kZXBfdW5tZXQvX19pbml0X18ucHkKLi9zY3JpcHRzL2tjb25maWcv
dGVzdHMvaW50ZXJfY2hvaWNlL19faW5pdF9fLnB5Ci4vc2NyaXB0cy9rY29uZmlnL3Fjb25mLWNm
Zy5zaAouL3NjcmlwdHMva2NvbmZpZy9nY29uZi1jZmcuc2gKLi9zY3JpcHRzL2tjb25maWcvc3Ry
ZWFtbGluZV9jb25maWcucGwKLi9zY3JpcHRzL2tjb25maWcvbmNvbmYtY2ZnLnNoCi4vc2NyaXB0
cy9rY29uZmlnL21lcmdlX2NvbmZpZy5zaAouL3NjcmlwdHMva2NvbmZpZy9tY29uZi1jZmcuc2gK
Li9zY3JpcHRzL2djYy12ZXJzaW9uLnNoCi4vc2NyaXB0cy9nY2MtcGx1Z2luLnNoCi4vc2NyaXB0
cy9nY2MtZ290by5zaAouL3NjcmlwdHMvZ2NjLXg4Nl8zMi1oYXMtc3RhY2stcHJvdGVjdG9yLnNo
Ci4vc2NyaXB0cy9leHRyYWN0LW1vZHVsZS1zaWcucGwKLi9zY3JpcHRzL3Rvb2xzLXN1cHBvcnQt
cmVsci5zaAouL3NjcmlwdHMvZ2V0X2FiaS5wbAouL3NjcmlwdHMvY2xhbmctdmVyc2lvbi5zaAou
L3NjcmlwdHMvZXh0cmFjdC1zeXMtY2VydHMucGwKLi9zY3JpcHRzL2R0Yy91cGRhdGUtZHRjLXNv
dXJjZS5zaAouL3NjcmlwdHMvdHJhY2luZy9kcmF3X2Z1bmN0cmFjZS5weQouL3NjcmlwdHMvdHJh
Y2luZy9mdHJhY2UtYmlzZWN0LnNoCi4vc2NyaXB0cy9yZWNvcmRtY291bnQucGwKLi9zY3JpcHRz
L2hlYWRlcmRlcC5wbAouL3NjcmlwdHMvc3BsaXQtbWFuLnBsCi4vc2NyaXB0cy9zZWxpbnV4L2lu
c3RhbGxfcG9saWN5LnNoCi4vc2NyaXB0cy9jaGVja2luY2x1ZGVzLnBsCi4vc2NyaXB0cy9saW5r
LXZtbGludXguc2gKLi9zY3JpcHRzL2NoZWNrdmVyc2lvbi5wbAouL3NjcmlwdHMvbWt1Ym9vdC5z
aAouL3NjcmlwdHMvaGVhZGVyc19jaGVjay5wbAouL3NjcmlwdHMvZ2V0X21haW50YWluZXIucGwK
Li9zY3JpcHRzL2F0b21pYy9hdG9taWMtdGJsLnNoCi4vc2NyaXB0cy9hdG9taWMvZ2VuLWF0b21p
Yy1mYWxsYmFjay5zaAouL3NjcmlwdHMvYXRvbWljL2NoZWNrLWF0b21pY3Muc2gKLi9zY3JpcHRz
L2F0b21pYy9nZW4tYXRvbWljLWxvbmcuc2gKLi9zY3JpcHRzL2F0b21pYy9nZW4tYXRvbWljcy5z
aAouL3NjcmlwdHMvYXRvbWljL2dlbi1hdG9taWMtaW5zdHJ1bWVudGVkLnNoCi4vc2NyaXB0cy9n
Y2MtcGx1Z2lucy9nZW4tcmFuZG9tLXNlZWQuc2gKLi9zY3JpcHRzL2ZpbmQtdW51c2VkLWRvY3Mu
c2gKLi9zY3JpcHRzL2RlcG1vZC5zaAouL3NjcmlwdHMvZ2VuX2NvbXBpbGVfY29tbWFuZHMucHkK
Li9zY3JpcHRzL3RhZ3Muc2gKLi9zY3JpcHRzL2NjLWNhbi1saW5rLnNoCi4vc2NyaXB0cy9ib290
Z3JhcGgucGwKLi9zY3JpcHRzL2dkYi92bWxpbnV4LWdkYi5weQouL3NjcmlwdHMvZ2RiL2xpbnV4
L3JidHJlZS5weQouL3NjcmlwdHMvZ2RiL2xpbnV4L3RpbWVybGlzdC5weQouL3NjcmlwdHMvZ2Ri
L2xpbnV4L3V0aWxzLnB5Ci4vc2NyaXB0cy9nZGIvbGludXgvY3B1cy5weQouL3NjcmlwdHMvZ2Ri
L2xpbnV4L3Rhc2tzLnB5Ci4vc2NyaXB0cy9nZGIvbGludXgvY29uc3RhbnRzLnB5Ci4vc2NyaXB0
cy9nZGIvbGludXgvZGV2aWNlLnB5Ci4vc2NyaXB0cy9nZGIvbGludXgvX19pbml0X18ucHkKLi9z
Y3JpcHRzL2dkYi9saW51eC9wcm9jLnB5Ci4vc2NyaXB0cy9nZGIvbGludXgvbGlzdHMucHkKLi9z
Y3JpcHRzL2dkYi9saW51eC9tb2R1bGVzLnB5Ci4vc2NyaXB0cy9nZGIvbGludXgvZG1lc2cucHkK
Li9zY3JpcHRzL2dkYi9saW51eC9jbGsucHkKLi9zY3JpcHRzL2dkYi9saW51eC9zeW1ib2xzLnB5
Ci4vc2NyaXB0cy9nZGIvbGludXgvZ2VucGQucHkKLi9zY3JpcHRzL2dkYi9saW51eC9jb25maWcu
cHkKLi9zY3JpcHRzL3h6X3dyYXAuc2gKLi9zY3JpcHRzL2dlbl9hdXRva3N5bXMuc2gKLi9zY3Jp
cHRzL2NoZWNrX2V4dGFibGUuc2gKLi9zY3JpcHRzL21hcmt1cF9vb3BzLnBsCi4vc2NyaXB0cy9n
Y2MteDg2XzY0LWhhcy1zdGFjay1wcm90ZWN0b3Iuc2gKLi9zY3JpcHRzL2hlYWRlcnNfaW5zdGFs
bC5zaAouL3NjcmlwdHMvZXh0cmFjdF94YzMwMjgucGwKLi9zY3JpcHRzL2dlbl9rc3ltZGVwcy5z
aAouL3NjcmlwdHMvYWRqdXN0X2F1dG9rc3ltcy5zaAouL3NjcmlwdHMvc3BkeGNoZWNrLXRlc3Qu
c2gKLi9zY3JpcHRzL3BhcnNlLW1haW50YWluZXJzLnBsCi4vc2NyaXB0cy9sZWFraW5nX2FkZHJl
c3Nlcy5wbAouL3NjcmlwdHMvbW9kdWxlcy1jaGVjay5zaAouL3NjcmlwdHMveGVuLWh5cGVyY2Fs
bHMuc2gKLi9zY3JpcHRzL2JwZl9oZWxwZXJzX2RvYy5weQouL3NjcmlwdHMvZmlsZS1zaXplLnNo
Ci4vc2NyaXB0cy9jaGVja2tjb25maWdzeW1ib2xzLnB5Ci4vc2NyaXB0cy9zcGR4Y2hlY2sucHkK
Li9zY3JpcHRzL2xkLXZlcnNpb24uc2gKLi9zY3JpcHRzL2NoZWNrc3RhY2sucGwKLi9zY3JpcHRz
L2V4cG9ydF9yZXBvcnQucGwKLi9zY3JpcHRzL2RlY29kZV9zdGFja3RyYWNlLnNoCi4vc2NyaXB0
cy9jaGVja3N5c2NhbGxzLnNoCi4vc2NyaXB0cy9uYW1lc3BhY2UucGwKLi9zY3JpcHRzL3Byb2Zp
bGUybGlua2VybGlzdC5wbAouL2RyaXZlcnMvc2NzaS9zY3JpcHRfYXNtLnBsCi4vZHJpdmVycy91
c2Ivc2VyaWFsL2V6dXNiX2NvbnZlcnQucGwKLi9kcml2ZXJzL3N0YWdpbmcvY29tZWRpL2RyaXZl
cnMvbmlfcm91dGluZy90b29scy9jc3ZfY29sbGVjdGlvbi5weQouL2RyaXZlcnMvc3RhZ2luZy9j
b21lZGkvZHJpdmVycy9uaV9yb3V0aW5nL3Rvb2xzL25pX25hbWVzLnB5Ci4vZHJpdmVycy9zdGFn
aW5nL2NvbWVkaS9kcml2ZXJzL25pX3JvdXRpbmcvdG9vbHMvbWFrZV9ibGFua19jc3YucHkKLi9k
cml2ZXJzL3N0YWdpbmcvY29tZWRpL2RyaXZlcnMvbmlfcm91dGluZy90b29scy9jb252ZXJ0X3B5
X3RvX2Nzdi5weQouL2RyaXZlcnMvc3RhZ2luZy9jb21lZGkvZHJpdmVycy9uaV9yb3V0aW5nL3Rv
b2xzL2NvbnZlcnRfY3N2X3RvX2MucHkKLi9kcml2ZXJzL2NyeXB0by92bXgvcHBjLXhsYXRlLnBs
Ci4vZHJpdmVycy9jcnlwdG8vdm14L2doYXNocDgtcHBjLnBsCi4vZHJpdmVycy9jcnlwdG8vdm14
L2Flc3A4LXBwYy5wbAouL3Rvb2xzL2Jvb3Rjb25maWcvdGVzdC1ib290Y29uZmlnLnNoCi4vdG9v
bHMvb2JqdG9vbC9zeW5jLWNoZWNrLnNoCi4vdG9vbHMvbWVtb3J5LW1vZGVsL3NjcmlwdHMvY21w
bGl0bXVzaGlzdC5zaAouL3Rvb2xzL21lbW9yeS1tb2RlbC9zY3JpcHRzL2NoZWNrYWxsbGl0bXVz
LnNoCi4vdG9vbHMvbWVtb3J5LW1vZGVsL3NjcmlwdHMvY2hlY2tnaGxpdG11cy5zaAouL3Rvb2xz
L21lbW9yeS1tb2RlbC9zY3JpcHRzL3J1bmxpdG11c2hpc3Quc2gKLi90b29scy9tZW1vcnktbW9k
ZWwvc2NyaXB0cy9jaGVja2xpdG11cy5zaAouL3Rvb2xzL21lbW9yeS1tb2RlbC9zY3JpcHRzL3Bh
cnNlYXJncy5zaAouL3Rvb2xzL21lbW9yeS1tb2RlbC9zY3JpcHRzL2p1ZGdlbGl0bXVzLnNoCi4v
dG9vbHMvbWVtb3J5LW1vZGVsL3NjcmlwdHMvaW5pdGxpdG11c2hpc3Quc2gKLi90b29scy9tZW1v
cnktbW9kZWwvc2NyaXB0cy9jaGVja2xpdG11c2hpc3Quc2gKLi90b29scy9tZW1vcnktbW9kZWwv
c2NyaXB0cy9uZXdsaXRtdXNoaXN0LnNoCi4vdG9vbHMvcGVyZi9weXRob24vdHJhY2Vwb2ludC5w
eQouL3Rvb2xzL3BlcmYvcHl0aG9uL3R3YXRjaC5weQouL3Rvb2xzL3BlcmYvdGVzdHMvYXR0ci5w
eQouL3Rvb2xzL3BlcmYvdGVzdHMvc2hlbGwvcmVjb3JkK3Byb2JlX2xpYmNfaW5ldF9wdG9uLnNo
Ci4vdG9vbHMvcGVyZi90ZXN0cy9zaGVsbC90cmFjZStwcm9iZV92ZnNfZ2V0bmFtZS5zaAouL3Rv
b2xzL3BlcmYvdGVzdHMvc2hlbGwvcHJvYmVfdmZzX2dldG5hbWUuc2gKLi90b29scy9wZXJmL3Rl
c3RzL3NoZWxsL3JlY29yZCtzY3JpcHRfcHJvYmVfdmZzX2dldG5hbWUuc2gKLi90b29scy9wZXJm
L3Rlc3RzL3NoZWxsL3JlY29yZCt6c3RkX2NvbXBfZGVjb21wLnNoCi4vdG9vbHMvcGVyZi90ZXN0
cy9zaGVsbC9saWIvcHJvYmVfdmZzX2dldG5hbWUuc2gKLi90b29scy9wZXJmL3Rlc3RzL3NoZWxs
L2xpYi9wcm9iZS5zaAouL3Rvb2xzL3BlcmYvc2NyaXB0cy9weXRob24vY2hlY2stcGVyZi10cmFj
ZS5weQouL3Rvb2xzL3BlcmYvc2NyaXB0cy9weXRob24vbWVtLXBoeXMtYWRkci5weQouL3Rvb2xz
L3BlcmYvc2NyaXB0cy9weXRob24vc3lzY2FsbC1jb3VudHMtYnktcGlkLnB5Ci4vdG9vbHMvcGVy
Zi9zY3JpcHRzL3B5dGhvbi9zdGF0LWNwaS5weQouL3Rvb2xzL3BlcmYvc2NyaXB0cy9weXRob24v
cG93ZXJwYy1oY2FsbHMucHkKLi90b29scy9wZXJmL3NjcmlwdHMvcHl0aG9uL25ldF9kcm9wbW9u
aXRvci5weQouL3Rvb2xzL3BlcmYvc2NyaXB0cy9weXRob24vZmxhbWVncmFwaC5weQouL3Rvb2xz
L3BlcmYvc2NyaXB0cy9weXRob24vc2N0b3AucHkKLi90b29scy9wZXJmL3NjcmlwdHMvcHl0aG9u
L2V4cG9ydGVkLXNxbC12aWV3ZXIucHkKLi90b29scy9wZXJmL3NjcmlwdHMvcHl0aG9uL2V2ZW50
X2FuYWx5emluZ19zYW1wbGUucHkKLi90b29scy9wZXJmL3NjcmlwdHMvcHl0aG9uL3NjaGVkLW1p
Z3JhdGlvbi5weQouL3Rvb2xzL3BlcmYvc2NyaXB0cy9weXRob24vUGVyZi1UcmFjZS1VdGlsL2xp
Yi9QZXJmL1RyYWNlL0V2ZW50Q2xhc3MucHkKLi90b29scy9wZXJmL3NjcmlwdHMvcHl0aG9uL1Bl
cmYtVHJhY2UtVXRpbC9saWIvUGVyZi9UcmFjZS9VdGlsLnB5Ci4vdG9vbHMvcGVyZi9zY3JpcHRz
L3B5dGhvbi9QZXJmLVRyYWNlLVV0aWwvbGliL1BlcmYvVHJhY2UvU2NoZWRHdWkucHkKLi90b29s
cy9wZXJmL3NjcmlwdHMvcHl0aG9uL1BlcmYtVHJhY2UtVXRpbC9saWIvUGVyZi9UcmFjZS9Db3Jl
LnB5Ci4vdG9vbHMvcGVyZi9zY3JpcHRzL3B5dGhvbi9zeXNjYWxsLWNvdW50cy5weQouL3Rvb2xz
L3BlcmYvc2NyaXB0cy9weXRob24vZXhwb3J0LXRvLXNxbGl0ZS5weQouL3Rvb2xzL3BlcmYvc2Ny
aXB0cy9weXRob24vZmFpbGVkLXN5c2NhbGxzLWJ5LXBpZC5weQouL3Rvb2xzL3BlcmYvc2NyaXB0
cy9weXRob24vZXhwb3J0LXRvLXBvc3RncmVzcWwucHkKLi90b29scy9wZXJmL3NjcmlwdHMvcHl0
aG9uL25ldGRldi10aW1lcy5weQouL3Rvb2xzL3BlcmYvc2NyaXB0cy9weXRob24vY29tcGFjdGlv
bi10aW1lcy5weQouL3Rvb2xzL3BlcmYvc2NyaXB0cy9weXRob24vc3RhY2tjb2xsYXBzZS5weQou
L3Rvb2xzL3BlcmYvc2NyaXB0cy9weXRob24vZnV0ZXgtY29udGVudGlvbi5weQouL3Rvb2xzL3Bl
cmYvc2NyaXB0cy9weXRob24vaW50ZWwtcHQtZXZlbnRzLnB5Ci4vdG9vbHMvcGVyZi9zY3JpcHRz
L3BlcmwvY2hlY2stcGVyZi10cmFjZS5wbAouL3Rvb2xzL3BlcmYvc2NyaXB0cy9wZXJsL3dha2V1
cC1sYXRlbmN5LnBsCi4vdG9vbHMvcGVyZi9zY3JpcHRzL3BlcmwvcnctYnktcGlkLnBsCi4vdG9v
bHMvcGVyZi9zY3JpcHRzL3BlcmwvZmFpbGVkLXN5c2NhbGxzLnBsCi4vdG9vbHMvcGVyZi9zY3Jp
cHRzL3BlcmwvcnctYnktZmlsZS5wbAouL3Rvb2xzL3BlcmYvc2NyaXB0cy9wZXJsL3J3dG9wLnBs
Ci4vdG9vbHMvcGVyZi90cmFjZS9iZWF1dHkvZmFkdmlzZS5zaAouL3Rvb2xzL3BlcmYvdHJhY2Uv
YmVhdXR5L2ZzbW91bnQuc2gKLi90b29scy9wZXJmL3RyYWNlL2JlYXV0eS9tbWFwX2ZsYWdzLnNo
Ci4vdG9vbHMvcGVyZi90cmFjZS9iZWF1dHkveDg2X2FyY2hfcHJjdGwuc2gKLi90b29scy9wZXJm
L3RyYWNlL2JlYXV0eS91c2JkZXZmc19pb2N0bC5zaAouL3Rvb2xzL3BlcmYvdHJhY2UvYmVhdXR5
L3N5bmNfZmlsZV9yYW5nZS5zaAouL3Rvb2xzL3BlcmYvdHJhY2UvYmVhdXR5L3JlbmFtZV9mbGFn
cy5zaAouL3Rvb2xzL3BlcmYvdHJhY2UvYmVhdXR5L2t2bV9pb2N0bC5zaAouL3Rvb2xzL3BlcmYv
dHJhY2UvYmVhdXR5L3RyYWNlcG9pbnRzL3g4Nl9pcnFfdmVjdG9ycy5zaAouL3Rvb2xzL3BlcmYv
dHJhY2UvYmVhdXR5L3RyYWNlcG9pbnRzL3g4Nl9tc3Iuc2gKLi90b29scy9wZXJmL3RyYWNlL2Jl
YXV0eS9mc3BpY2suc2gKLi90b29scy9wZXJmL3RyYWNlL2JlYXV0eS9tYWR2aXNlX2JlaGF2aW9y
LnNoCi4vdG9vbHMvcGVyZi90cmFjZS9iZWF1dHkvZHJtX2lvY3RsLnNoCi4vdG9vbHMvcGVyZi90
cmFjZS9iZWF1dHkvcHJjdGxfb3B0aW9uLnNoCi4vdG9vbHMvcGVyZi90cmFjZS9iZWF1dHkvbW91
bnRfZmxhZ3Muc2gKLi90b29scy9wZXJmL3RyYWNlL2JlYXV0eS9zb2NrZXRfaXBwcm90by5zaAou
L3Rvb2xzL3BlcmYvdHJhY2UvYmVhdXR5L2FyY2hfZXJybm9fbmFtZXMuc2gKLi90b29scy9wZXJm
L3RyYWNlL2JlYXV0eS9wZXJmX2lvY3RsLnNoCi4vdG9vbHMvcGVyZi90cmFjZS9iZWF1dHkvZnNj
b25maWcuc2gKLi90b29scy9wZXJmL3RyYWNlL2JlYXV0eS9zbmRydl9wY21faW9jdGwuc2gKLi90
b29scy9wZXJmL3RyYWNlL2JlYXV0eS9zbmRydl9jdGxfaW9jdGwuc2gKLi90b29scy9wZXJmL3Ry
YWNlL2JlYXV0eS92aG9zdF92aXJ0aW9faW9jdGwuc2gKLi90b29scy9wZXJmL3RyYWNlL2JlYXV0
eS9wa2V5X2FsbG9jX2FjY2Vzc19yaWdodHMuc2gKLi90b29scy9wZXJmL3RyYWNlL2JlYXV0eS9r
Y21wX3R5cGUuc2gKLi90b29scy9wZXJmL3RyYWNlL2JlYXV0eS9tb3ZlX21vdW50X2ZsYWdzLnNo
Ci4vdG9vbHMvcGVyZi9wZXJmLXdpdGgta2NvcmUuc2gKLi90b29scy9wZXJmL3V0aWwvc2V0dXAu
cHkKLi90b29scy9wZXJmL3V0aWwvZ2VuZXJhdGUtY21kbGlzdC5zaAouL3Rvb2xzL3BlcmYvcGVy
Zi1jb21wbGV0aW9uLnNoCi4vdG9vbHMvcGVyZi9hcmNoL3g4Ni90ZXN0cy9nZW4taW5zbi14ODYt
ZGF0LnNoCi4vdG9vbHMvcGVyZi9hcmNoL3g4Ni9lbnRyeS9zeXNjYWxscy9zeXNjYWxsdGJsLnNo
Ci4vdG9vbHMvcGVyZi9jaGVjay1oZWFkZXJzLnNoCi4vdG9vbHMvcGVyZi9wZXJmLWFyY2hpdmUu
c2gKLi90b29scy9uZnNkL2luamVjdF9mYXVsdC5zaAouL3Rvb2xzL2J1aWxkL3Rlc3RzL3J1bi5z
aAouL3Rvb2xzL3Rlc3RpbmcvZmF1bHQtaW5qZWN0aW9uL2ZhaWxjbWQuc2gKLi90b29scy90ZXN0
aW5nL2t1bml0L2t1bml0X2NvbmZpZy5weQouL3Rvb2xzL3Rlc3Rpbmcva3VuaXQva3VuaXRfa2Vy
bmVsLnB5Ci4vdG9vbHMvdGVzdGluZy9rdW5pdC9rdW5pdF9wYXJzZXIucHkKLi90b29scy90ZXN0
aW5nL2t1bml0L2t1bml0X3Rvb2xfdGVzdC5weQouL3Rvb2xzL3Rlc3Rpbmcva3VuaXQva3VuaXQu
cHkKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9maXJtd2FyZS9md19saWIuc2gKLi90b29scy90
ZXN0aW5nL3NlbGZ0ZXN0cy9maXJtd2FyZS9md19mYWxsYmFjay5zaAouL3Rvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL2Zpcm13YXJlL2Z3X2ZpbGVzeXN0ZW0uc2gKLi90b29scy90ZXN0aW5nL3NlbGZ0
ZXN0cy9maXJtd2FyZS9md19ydW5fdGVzdHMuc2gKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9w
b3dlcnBjL2VlaC9lZWgtZnVuY3Rpb25zLnNoCi4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcG93
ZXJwYy9lZWgvZWVoLWJhc2ljLnNoCi4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcG93ZXJwYy9z
Y3JpcHRzL2htaS5zaAouL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Bvd2VycGMvbngtZ3ppcC9u
eC1nemlwLXRlc3Quc2gKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9hbmRyb2lkL3J1bi5zaAou
L3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2FuZHJvaWQvaW9uL2lvbl90ZXN0LnNoCi4vdG9vbHMv
dGVzdGluZy9zZWxmdGVzdHMvbmV0ZmlsdGVyL2lwdnMuc2gKLi90b29scy90ZXN0aW5nL3NlbGZ0
ZXN0cy9uZXRmaWx0ZXIvbmZ0X25hdC5zaAouL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25ldGZp
bHRlci9uZnRfY29ubnRyYWNrX2hlbHBlci5zaAouL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25l
dGZpbHRlci9uZnRfcXVldWUuc2gKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9uZXRmaWx0ZXIv
Y29ubnRyYWNrX2ljbXBfcmVsYXRlZC5zaAouL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25ldGZp
bHRlci9icmlkZ2VfYnJvdXRlci5zaAouL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25ldGZpbHRl
ci9uZnRfY29uY2F0X3JhbmdlLnNoCi4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbmV0ZmlsdGVy
L25mdF9mbG93dGFibGUuc2gKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9uZXRmaWx0ZXIvbmZ0
X3RyYW5zX3N0cmVzcy5zaAouL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL21lbWZkL3J1bl9mdXNl
X3Rlc3Quc2gKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9tZW1mZC9ydW5faHVnZXRsYmZzX3Rl
c3Quc2gKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9nZW5fa3NlbGZ0ZXN0X3Rhci5zaAouL3Rv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3JjdXRvcnR1cmUvYmluL2t2bS1yZWNoZWNrLnNoCi4vdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMvcmN1dG9ydHVyZS9iaW4va2NzYW4tY29sbGFwc2Uuc2gKLi90
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yY3V0b3J0dXJlL2Jpbi9jb25maWdpbml0LnNoCi4vdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMvcmN1dG9ydHVyZS9iaW4va3ZtLXRlc3QtMS1ydW4uc2gKLi90
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yY3V0b3J0dXJlL2Jpbi9wYXJzZS1jb25zb2xlLnNoCi4v
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmN1dG9ydHVyZS9iaW4vbWtpbml0cmQuc2gKLi90b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9yY3V0b3J0dXJlL2Jpbi9jcHVzMnVzZS5zaAouL3Rvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL3JjdXRvcnR1cmUvYmluL2ppdHRlci5zaAouL3Rvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL3JjdXRvcnR1cmUvYmluL2t2bS1yZWNoZWNrLXJjdXBlcmYuc2gKLi90b29scy90
ZXN0aW5nL3NlbGZ0ZXN0cy9yY3V0b3J0dXJlL2Jpbi9jb25maWdjaGVjay5zaAouL3Rvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL3JjdXRvcnR1cmUvYmluL2NvbmZpZ05SX0NQVVMuc2gKLi90b29scy90
ZXN0aW5nL3NlbGZ0ZXN0cy9yY3V0b3J0dXJlL2Jpbi9mdW5jdGlvbnMuc2gKLi90b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9yY3V0b3J0dXJlL2Jpbi9rdm0tcmVjaGVjay1sb2NrLnNoCi4vdG9vbHMv
dGVzdGluZy9zZWxmdGVzdHMvcmN1dG9ydHVyZS9iaW4va3ZtLnNoCi4vdG9vbHMvdGVzdGluZy9z
ZWxmdGVzdHMvcmN1dG9ydHVyZS9iaW4va3ZtLWZpbmQtZXJyb3JzLnNoCi4vdG9vbHMvdGVzdGlu
Zy9zZWxmdGVzdHMvcmN1dG9ydHVyZS9iaW4vcGFyc2UtYnVpbGQuc2gKLi90b29scy90ZXN0aW5n
L3NlbGZ0ZXN0cy9yY3V0b3J0dXJlL2Jpbi9rdm0tcmVjaGVjay1yY3Uuc2gKLi90b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9yY3V0b3J0dXJlL2Jpbi9rdm0tcmVjaGVjay1yY3VwZXJmLWZ0cmFjZS5z
aAouL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3JjdXRvcnR1cmUvYmluL2t2bS1idWlsZC5zaAou
L3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3JjdXRvcnR1cmUvYmluL2NvbmZpZ19vdmVycmlkZS5z
aAouL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3JjdXRvcnR1cmUvZm9ybWFsL3NyY3UtY2JtYy90
ZXN0cy90ZXN0X3NjcmlwdC5zaAouL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3JjdXRvcnR1cmUv
Y29uZmlncy9yY3UvdmVyX2Z1bmN0aW9ucy5zaAouL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jj
dXRvcnR1cmUvY29uZmlncy9yY3VwZXJmL3Zlcl9mdW5jdGlvbnMuc2gKLi90b29scy90ZXN0aW5n
L3NlbGZ0ZXN0cy9yY3V0b3J0dXJlL2NvbmZpZ3MvbG9jay92ZXJfZnVuY3Rpb25zLnNoCi4vdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMva3NlbGZ0ZXN0L3ByZWZpeC5wbAouL3Rvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL2tzZWxmdGVzdC9ydW5uZXIuc2gKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9r
c2VsZnRlc3QvbW9kdWxlLnNoCi4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL3Rlc3RfdGNw
X2NoZWNrX3N5bmNvb2tpZS5zaAouL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi90ZXN0X3Nr
Yl9jZ3JvdXBfaWQuc2gKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvYmVuY2hzL3J1bl9i
ZW5jaF9yaW5nYnVmcy5zaAouL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9iZW5jaHMvcnVu
X2JlbmNoX3JlbmFtZS5zaAouL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9iZW5jaHMvcnVu
X2JlbmNoX3RyaWdnZXIuc2gKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvd2l0aF9hZGRy
LnNoCi4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL3Rlc3RfYnBmdG9vbC5zaAouL3Rvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi90ZXN0X3hkcGluZy5zaAouL3Rvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL2JwZi90ZXN0X3R1bm5lbC5zaAouL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi90
ZXN0X3hkcF9yZWRpcmVjdC5zaAouL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi90ZXN0X3hk
cF92bGFuLnNoCi4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL3Rlc3RfeGRwX21ldGEuc2gK
Li90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvdGVzdF9icGZ0b29sX2J1aWxkLnNoCi4vdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL3Rlc3RfbGlyY19tb2RlMi5zaAouL3Rvb2xzL3Rlc3Rp
bmcvc2VsZnRlc3RzL2JwZi90ZXN0X3hkcF92bGFuX21vZGVfbmF0aXZlLnNoCi4vdG9vbHMvdGVz
dGluZy9zZWxmdGVzdHMvYnBmL3Rlc3RfZmxvd19kaXNzZWN0b3Iuc2gKLi90b29scy90ZXN0aW5n
L3NlbGZ0ZXN0cy9icGYvdGVzdF9sd3Rfc2VnNmxvY2FsLnNoCi4vdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMvYnBmL3RjcF9zZXJ2ZXIucHkKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvdGVz
dF9rbW9kLnNoCi4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL3Rlc3RfZnRyYWNlLnNoCi4v
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL3dpdGhfdHVubmVscy5zaAouL3Rvb2xzL3Rlc3Rp
bmcvc2VsZnRlc3RzL2JwZi90ZXN0X2JwZnRvb2wucHkKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0
cy9icGYvdGVzdF90Y190dW5uZWwuc2gKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvdGVz
dF9zb2NrX2FkZHIuc2gKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvdGVzdF94ZHBfdmxh
bl9tb2RlX2dlbmVyaWMuc2gKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvdGVzdF9vZmZs
b2FkLnB5Ci4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL3Rlc3RfdGNfZWR0LnNoCi4vdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL3RjcF9jbGllbnQucHkKLi90b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy9icGYvdGVzdF94ZHBfdmV0aC5zaAouL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2Jw
Zi90ZXN0X2x3dF9pcF9lbmNhcC5zaAouL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3RjLXRlc3Rp
bmcvVGRjUGx1Z2luLnB5Ci4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvdGMtdGVzdGluZy90ZGMu
cHkKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy90Yy10ZXN0aW5nL1RkY1Jlc3VsdHMucHkKLi90
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy90Yy10ZXN0aW5nL3RkY19jb25maWdfbG9jYWxfdGVtcGxh
dGUucHkKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy90Yy10ZXN0aW5nL3BsdWdpbi1saWIvc2Nh
cHlQbHVnaW4ucHkKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy90Yy10ZXN0aW5nL3BsdWdpbi1s
aWIvdmFsZ3JpbmRQbHVnaW4ucHkKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy90Yy10ZXN0aW5n
L3BsdWdpbi1saWIvcm9vdFBsdWdpbi5weQouL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3RjLXRl
c3RpbmcvcGx1Z2luLWxpYi9uc1BsdWdpbi5weQouL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Rj
LXRlc3RpbmcvcGx1Z2luLWxpYi9idWlsZGVicGZQbHVnaW4ucHkKLi90b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy90Yy10ZXN0aW5nL3RkY19oZWxwZXIucHkKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0
cy90Yy10ZXN0aW5nL3RkY19tdWx0aWJhdGNoLnB5Ci4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMv
dGMtdGVzdGluZy9wbHVnaW5zL19faW5pdF9fLnB5Ci4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMv
dGMtdGVzdGluZy90ZGNfY29uZmlnLnB5Ci4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvdGMtdGVz
dGluZy90ZGNfYmF0Y2gucHkKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9udGIvbnRiX3Rlc3Qu
c2gKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9zdGF0aWNfa2V5cy90ZXN0X3N0YXRpY19rZXlz
LnNoCi4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcHRwL3BoYy5zaAouL3Rvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL2RyaXZlcnMvZ3B1L2RybV9tbS5zaAouL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L2RyaXZlcnMvZ3B1L2k5MTUuc2gKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9kcml2ZXJzL3Vz
Yi91c2JpcC91c2JpcF90ZXN0LnNoCi4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvZHJpdmVycy9u
ZXQvbmV0ZGV2c2ltL2ZpYi5zaAouL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2RyaXZlcnMvbmV0
L25ldGRldnNpbS9kZXZsaW5rLnNoCi4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvZHJpdmVycy9u
ZXQvbmV0ZGV2c2ltL2RldmxpbmtfaW5fbmV0bnMuc2gKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0
cy9kcml2ZXJzL25ldC9uZXRkZXZzaW0vZGV2bGlua190cmFwLnNoCi4vdG9vbHMvdGVzdGluZy9z
ZWxmdGVzdHMvZHJpdmVycy9uZXQvbWx4c3cvc2NoX2V0cy5zaAouL3Rvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL2RyaXZlcnMvbmV0L21seHN3L3NjaF90YmZfZXRzLnNoCi4vdG9vbHMvdGVzdGluZy9z
ZWxmdGVzdHMvZHJpdmVycy9uZXQvbWx4c3cvdGNfYWN0aW9uX2h3X3N0YXRzLnNoCi4vdG9vbHMv
dGVzdGluZy9zZWxmdGVzdHMvZHJpdmVycy9uZXQvbWx4c3cvZmliLnNoCi4vdG9vbHMvdGVzdGlu
Zy9zZWxmdGVzdHMvZHJpdmVycy9uZXQvbWx4c3cvdnhsYW4uc2gKLi90b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy9kcml2ZXJzL25ldC9tbHhzdy90Y19mbG93ZXJfc2NhbGUuc2gKLi90b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9kcml2ZXJzL25ldC9tbHhzdy9zaGFyZWRidWZmZXIuc2gKLi90b29scy90
ZXN0aW5nL3NlbGZ0ZXN0cy9kcml2ZXJzL25ldC9tbHhzdy9kZXZsaW5rX3RyYXBfbDNfZXhjZXB0
aW9ucy5zaAouL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2RyaXZlcnMvbmV0L21seHN3L3Z4bGFu
X2ZkYl92ZXRvLnNoCi4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvZHJpdmVycy9uZXQvbWx4c3cv
cW9zX21jX2F3YXJlLnNoCi4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvZHJpdmVycy9uZXQvbWx4
c3cvc3BlY3RydW0tMi90Y19mbG93ZXJfc2NhbGUuc2gKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0
cy9kcml2ZXJzL25ldC9tbHhzdy9zcGVjdHJ1bS0yL21pcnJvcl9ncmVfc2NhbGUuc2gKLi90b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9kcml2ZXJzL25ldC9tbHhzdy9zcGVjdHJ1bS0yL3RjX2Zsb3dl
ci5zaAouL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2RyaXZlcnMvbmV0L21seHN3L3NwZWN0cnVt
LTIvcmVzb3VyY2Vfc2NhbGUuc2gKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9kcml2ZXJzL25l
dC9tbHhzdy9zcGVjdHJ1bS0yL3JvdXRlcl9zY2FsZS5zaAouL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL2RyaXZlcnMvbmV0L21seHN3L2ZpYl9vZmZsb2FkLnNoCi4vdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMvZHJpdmVycy9uZXQvbWx4c3cvZGV2bGlua190cmFwX2NvbnRyb2wuc2gKLi90b29scy90
ZXN0aW5nL3NlbGZ0ZXN0cy9kcml2ZXJzL25ldC9tbHhzdy9vbmVfYXJtZWRfcm91dGVyLnNoCi4v
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvZHJpdmVycy9uZXQvbWx4c3cvc2hhcmVkYnVmZmVyX2Nv
bmZpZ3VyYXRpb24ucHkKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9kcml2ZXJzL25ldC9tbHhz
dy9xb3NfZXRzX3N0cmljdC5zaAouL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2RyaXZlcnMvbmV0
L21seHN3L21seHN3X2xpYi5zaAouL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2RyaXZlcnMvbmV0
L21seHN3L3NjaF9yZWRfcHJpby5zaAouL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2RyaXZlcnMv
bmV0L21seHN3L2RldmxpbmtfdHJhcF9hY2xfZHJvcHMuc2gKLi90b29scy90ZXN0aW5nL3NlbGZ0
ZXN0cy9kcml2ZXJzL25ldC9tbHhzdy9xb3NfZGVmcHJpby5zaAouL3Rvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL2RyaXZlcnMvbmV0L21seHN3L21pcnJvcl9ncmUuc2gKLi90b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy9kcml2ZXJzL25ldC9tbHhzdy9zY2hfcmVkX3Jvb3Quc2gKLi90b29scy90ZXN0aW5n
L3NlbGZ0ZXN0cy9kcml2ZXJzL25ldC9tbHhzdy90Y19yZXN0cmljdGlvbnMuc2gKLi90b29scy90
ZXN0aW5nL3NlbGZ0ZXN0cy9kcml2ZXJzL25ldC9tbHhzdy9xb3NfZHNjcF9icmlkZ2Uuc2gKLi90
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9kcml2ZXJzL25ldC9tbHhzdy9kZXZsaW5rX3RyYXBfcG9s
aWNlci5zaAouL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2RyaXZlcnMvbmV0L21seHN3L2Rldmxp
bmtfdHJhcC5zaAouL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2RyaXZlcnMvbmV0L21seHN3L2Rl
dmxpbmtfdHJhcF9sMl9kcm9wcy5zaAouL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2RyaXZlcnMv
bmV0L21seHN3L21pcnJvcl9ncmVfc2NhbGUuc2gKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9k
cml2ZXJzL25ldC9tbHhzdy9kZXZsaW5rX3RyYXBfdHVubmVsX2lwaXAuc2gKLi90b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9kcml2ZXJzL25ldC9tbHhzdy9kZXZsaW5rX3RyYXBfdHVubmVsX3Z4bGFu
LnNoCi4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvZHJpdmVycy9uZXQvbWx4c3cvcW9zX2RzY3Bf
cm91dGVyLnNoCi4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvZHJpdmVycy9uZXQvbWx4c3cvcnRu
ZXRsaW5rLnNoCi4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvZHJpdmVycy9uZXQvbWx4c3cvZGV2
bGlua190cmFwX2wzX2Ryb3BzLnNoCi4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvZHJpdmVycy9u
ZXQvbWx4c3cvcm91dGVyX3NjYWxlLnNoCi4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvZHJpdmVy
cy9uZXQvbWx4c3cvc2NoX3JlZF9jb3JlLnNoCi4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvZHJp
dmVycy9uZXQvbWx4c3cvc2NoX3JlZF9ldHMuc2gKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9k
cml2ZXJzL25ldC9tbHhzdy9ibGFja2hvbGVfcm91dGVzLnNoCi4vdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMvZHJpdmVycy9uZXQvbWx4c3cvc2NoX3RiZl9yb290LnNoCi4vdG9vbHMvdGVzdGluZy9z
ZWxmdGVzdHMvZHJpdmVycy9uZXQvbWx4c3cvdnhsYW5fZmxvb2Rpbmcuc2gKLi90b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9kcml2ZXJzL25ldC9tbHhzdy9zY2hfdGJmX3ByaW8uc2gKLi90b29scy90
ZXN0aW5nL3NlbGZ0ZXN0cy9kcml2ZXJzL25ldC9tbHhzdy9zcGVjdHJ1bS90Y19mbG93ZXJfc2Nh
bGUuc2gKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9kcml2ZXJzL25ldC9tbHhzdy9zcGVjdHJ1
bS9taXJyb3JfZ3JlX3NjYWxlLnNoCi4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvZHJpdmVycy9u
ZXQvbWx4c3cvc3BlY3RydW0vcmVzb3VyY2Vfc2NhbGUuc2gKLi90b29scy90ZXN0aW5nL3NlbGZ0
ZXN0cy9kcml2ZXJzL25ldC9tbHhzdy9zcGVjdHJ1bS9yb3V0ZXJfc2NhbGUuc2gKLi90b29scy90
ZXN0aW5nL3NlbGZ0ZXN0cy9kcml2ZXJzL25ldC9tbHhzdy9zcGVjdHJ1bS9kZXZsaW5rX2xpYl9z
cGVjdHJ1bS5zaAouL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2RyaXZlcnMvbmV0L21seHN3L3Nw
ZWN0cnVtL2RldmxpbmtfcmVzb3VyY2VzLnNoCi4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvZHJp
dmVycy9uZXQvbWx4c3cvcW9zX2xpYi5zaAouL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2RyaXZl
cnMvbmV0L21seHN3L2V4dGFjay5zaAouL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2tleGVjL3Rl
c3Rfa2V4ZWNfZmlsZV9sb2FkLnNoCi4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva2V4ZWMvdGVz
dF9rZXhlY19sb2FkLnNoCi4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva2V4ZWMva2V4ZWNfY29t
bW9uX2xpYi5zaAouL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2tzZWxmdGVzdF9kZXBzLnNoCi4v
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYXJtNjQvdGFncy9ydW5fdGFnc190ZXN0LnNoCi4vdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMvdHBtMi90cG0yX3Rlc3RzLnB5Ci4vdG9vbHMvdGVzdGluZy9z
ZWxmdGVzdHMvdHBtMi90ZXN0X3Ntb2tlLnNoCi4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvdHBt
Mi90ZXN0X3NwYWNlLnNoCi4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvdHBtMi90cG0yLnB5Ci4v
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva21vZC9rbW9kLnNoCi4vdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMvenJhbS96cmFtMDIuc2gKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy96cmFtL3pyYW0u
c2gKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy96cmFtL3pyYW0wMS5zaAouL3Rvb2xzL3Rlc3Rp
bmcvc2VsZnRlc3RzL3pyYW0venJhbV9saWIuc2gKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9p
ci9pcl9sb29wYmFjay5zaAouL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3g4Ni9jaGVja19jYy5z
aAouL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2Nncm91cC93aXRoX3N0cmVzcy5zaAouL3Rvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL2Nncm91cC90ZXN0X3N0cmVzcy5zaAouL3Rvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL3JzZXEvcnVuX3BhcmFtX3Rlc3Quc2gKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0
cy9mdXRleC9ydW4uc2gKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9mdXRleC9mdW5jdGlvbmFs
L3J1bi5zaAouL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2ludGVsX3BzdGF0ZS9ydW4uc2gKLi90
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9ncGlvL2dwaW8tbW9ja3VwLnNoCi4vdG9vbHMvdGVzdGlu
Zy9zZWxmdGVzdHMvZ3Bpby9ncGlvLW1vY2t1cC1zeXNmcy5zaAouL3Rvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL3N5c2N0bC9zeXNjdGwuc2gKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9saXZlcGF0
Y2gvdGVzdC1zdGF0ZS5zaAouL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2xpdmVwYXRjaC90ZXN0
LXNoYWRvdy12YXJzLnNoCi4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbGl2ZXBhdGNoL3Rlc3Qt
bGl2ZXBhdGNoLnNoCi4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbGl2ZXBhdGNoL3Rlc3QtZnRy
YWNlLnNoCi4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbGl2ZXBhdGNoL2Z1bmN0aW9ucy5zaAou
L3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2xpdmVwYXRjaC90ZXN0LWNhbGxiYWNrcy5zaAouL3Rv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL21vdW50L3J1bl90ZXN0cy5zaAouL3Rvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL2xvY2tpbmcvd3dfbXV0ZXguc2gKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9z
cGFyYzY0L2RyaXZlcnMvZHJpdmVyc190ZXN0LnNoCi4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMv
c3BhcmM2NC9ydW4uc2gKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9zcGxpY2UvZGVmYXVsdF9m
aWxlX3NwbGljZV9yZWFkLnNoCi4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3NlbGZ0ZXN0X2lu
c3RhbGwuc2gKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9jcHVmcmVxL2NwdWZyZXEuc2gKLi90
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9jcHVmcmVxL2dvdmVybm9yLnNoCi4vdG9vbHMvdGVzdGlu
Zy9zZWxmdGVzdHMvY3B1ZnJlcS9tYWluLnNoCi4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvY3B1
ZnJlcS9jcHUuc2gKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9jcHVmcmVxL21vZHVsZS5zaAou
L3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2NwdWZyZXEvc3BlY2lhbC10ZXN0cy5zaAouL3Rvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL25ldC9mb3J3YXJkaW5nL21pcnJvcl9saWIuc2gKLi90b29scy90
ZXN0aW5nL3NlbGZ0ZXN0cy9uZXQvZm9yd2FyZGluZy9taXJyb3JfZ3JlX2xhZ19sYWNwLnNoCi4v
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbmV0L2ZvcndhcmRpbmcvc2NoX2V0cy5zaAouL3Rvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL25ldC9mb3J3YXJkaW5nL21pcnJvcl9ncmVfbmguc2gKLi90b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9uZXQvZm9yd2FyZGluZy9taXJyb3JfZ3JlX2xpYi5zaAouL3Rv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25ldC9mb3J3YXJkaW5nL2xpYi5zaAouL3Rvb2xzL3Rlc3Rp
bmcvc2VsZnRlc3RzL25ldC9mb3J3YXJkaW5nL3NjaF90YmZfZXRzLnNoCi4vdG9vbHMvdGVzdGlu
Zy9zZWxmdGVzdHMvbmV0L2ZvcndhcmRpbmcvZGV2bGlua19saWIuc2gKLi90b29scy90ZXN0aW5n
L3NlbGZ0ZXN0cy9uZXQvZm9yd2FyZGluZy9taXJyb3Jfdmxhbi5zaAouL3Rvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL25ldC9mb3J3YXJkaW5nL2ZpYl9vZmZsb2FkX2xpYi5zaAouL3Rvb2xzL3Rlc3Rp
bmcvc2VsZnRlc3RzL25ldC9mb3J3YXJkaW5nL3JvdXRlci5zaAouL3Rvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL25ldC9mb3J3YXJkaW5nL3RjX2Zsb3dlcl9yb3V0ZXIuc2gKLi90b29scy90ZXN0aW5n
L3NlbGZ0ZXN0cy9uZXQvZm9yd2FyZGluZy9zY2hfZXRzX2NvcmUuc2gKLi90b29scy90ZXN0aW5n
L3NlbGZ0ZXN0cy9uZXQvZm9yd2FyZGluZy9icmlkZ2VfaWdtcC5zaAouL3Rvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL25ldC9mb3J3YXJkaW5nL21pcnJvcl9ncmVfdmxhbi5zaAouL3Rvb2xzL3Rlc3Rp
bmcvc2VsZnRlc3RzL25ldC9mb3J3YXJkaW5nL2lwaXBfaGllcl9ncmVfa2V5cy5zaAouL3Rvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL25ldC9mb3J3YXJkaW5nL2lwNmdyZV9pbm5lcl92Nl9tdWx0aXBh
dGguc2gKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9uZXQvZm9yd2FyZGluZy90Y192bGFuX21v
ZGlmeS5zaAouL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25ldC9mb3J3YXJkaW5nL21pcnJvcl9n
cmVfdG9wb19saWIuc2gKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9uZXQvZm9yd2FyZGluZy9t
aXJyb3JfZ3JlX2Zsb3dlci5zaAouL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25ldC9mb3J3YXJk
aW5nL3Z4bGFuX2FzeW1tZXRyaWMuc2gKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9uZXQvZm9y
d2FyZGluZy90Y19jb21tb24uc2gKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9uZXQvZm9yd2Fy
ZGluZy9yb3V0ZXJfYnJvYWRjYXN0LnNoCi4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbmV0L2Zv
cndhcmRpbmcvcm91dGVyX2JyaWRnZS5zaAouL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25ldC9m
b3J3YXJkaW5nL21pcnJvcl9ncmVfdmxhbl9icmlkZ2VfMXEuc2gKLi90b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy9uZXQvZm9yd2FyZGluZy90Y19zaGJsb2Nrcy5zaAouL3Rvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL25ldC9mb3J3YXJkaW5nL3JvdXRlcl92aWRfMS5zaAouL3Rvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL25ldC9mb3J3YXJkaW5nL2JyaWRnZV9wb3J0X2lzb2xhdGlvbi5zaAouL3Rvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL25ldC9mb3J3YXJkaW5nL2lwaXBfZmxhdF9ncmUuc2gKLi90b29scy90
ZXN0aW5nL3NlbGZ0ZXN0cy9uZXQvZm9yd2FyZGluZy9ldGh0b29sX2xpYi5zaAouL3Rvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL25ldC9mb3J3YXJkaW5nL3Z4bGFuX2JyaWRnZV8xcV9wb3J0Xzg0NzIu
c2gKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9uZXQvZm9yd2FyZGluZy92eGxhbl9icmlkZ2Vf
MXEuc2gKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9uZXQvZm9yd2FyZGluZy92eGxhbl9icmlk
Z2VfMWQuc2gKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9uZXQvZm9yd2FyZGluZy9taXJyb3Jf
Z3JlX25laWdoLnNoCi4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbmV0L2ZvcndhcmRpbmcvbWly
cm9yX2dyZS5zaAouL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25ldC9mb3J3YXJkaW5nL3RjX2Fj
dGlvbnMuc2gKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9uZXQvZm9yd2FyZGluZy9ncmVfaW5u
ZXJfdjZfbXVsdGlwYXRoLnNoCi4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbmV0L2ZvcndhcmRp
bmcvbWlycm9yX2dyZV9icmlkZ2VfMWRfdmxhbi5zaAouL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L25ldC9mb3J3YXJkaW5nL3NjaF90YmZfZXRzcHJpby5zaAouL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL25ldC9mb3J3YXJkaW5nL21pcnJvcl9ncmVfYnJpZGdlXzFxX2xhZy5zaAouL3Rvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL25ldC9mb3J3YXJkaW5nL2lwaXBfbGliLnNoCi4vdG9vbHMvdGVzdGlu
Zy9zZWxmdGVzdHMvbmV0L2ZvcndhcmRpbmcvcm91dGVyX211bHRpcGF0aC5zaAouL3Rvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL25ldC9mb3J3YXJkaW5nL3JvdXRlcl9icmlkZ2Vfdmxhbi5zaAouL3Rv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25ldC9mb3J3YXJkaW5nL2JyaWRnZV9zdGlja3lfZmRiLnNo
Ci4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbmV0L2ZvcndhcmRpbmcvaXBpcF9mbGF0X2dyZV9r
ZXkuc2gKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9uZXQvZm9yd2FyZGluZy90Y19mbG93ZXIu
c2gKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9uZXQvZm9yd2FyZGluZy9taXJyb3JfZ3JlX2Jv
dW5kLnNoCi4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbmV0L2ZvcndhcmRpbmcvdGNfY2hhaW5z
LnNoCi4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbmV0L2ZvcndhcmRpbmcvbWlycm9yX2dyZV9i
cmlkZ2VfMXEuc2gKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9uZXQvZm9yd2FyZGluZy9pcGlw
X2hpZXJfZ3JlLnNoCi4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbmV0L2ZvcndhcmRpbmcvZ3Jl
X211bHRpcGF0aC5zaAouL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25ldC9mb3J3YXJkaW5nL2Jy
aWRnZV92bGFuX2F3YXJlLnNoCi4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbmV0L2ZvcndhcmRp
bmcvbWlycm9yX2dyZV9icmlkZ2VfMWQuc2gKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9uZXQv
Zm9yd2FyZGluZy9taXJyb3JfdG9wb19saWIuc2gKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9u
ZXQvZm9yd2FyZGluZy9yb3V0ZXJfbXVsdGljYXN0LnNoCi4vdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMvbmV0L2ZvcndhcmRpbmcvZ3JlX2lubmVyX3Y0X211bHRpcGF0aC5zaAouL3Rvb2xzL3Rlc3Rp
bmcvc2VsZnRlc3RzL25ldC9mb3J3YXJkaW5nL3NjaF90YmZfcm9vdC5zaAouL3Rvb2xzL3Rlc3Rp
bmcvc2VsZnRlc3RzL25ldC9mb3J3YXJkaW5nL2JyaWRnZV92bGFuX3VuYXdhcmUuc2gKLi90b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9uZXQvZm9yd2FyZGluZy9taXJyb3JfZ3JlX2NoYW5nZXMuc2gK
Li90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9uZXQvZm9yd2FyZGluZy9pcGlwX2ZsYXRfZ3JlX2tl
eXMuc2gKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9uZXQvZm9yd2FyZGluZy9ldGh0b29sLnNo
Ci4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbmV0L2ZvcndhcmRpbmcvc2NoX3RiZl9wcmlvLnNo
Ci4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbmV0L2ZvcndhcmRpbmcvc2NoX3RiZl9jb3JlLnNo
Ci4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbmV0L2ZvcndhcmRpbmcvaXBpcF9oaWVyX2dyZV9r
ZXkuc2gKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9uZXQvZm9yd2FyZGluZy9wZWRpdF9kc2Zp
ZWxkLnNoCi4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbmV0L2ZvcndhcmRpbmcvcm91dGVyX21w
YXRoX25oLnNoCi4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbmV0L2ZvcndhcmRpbmcvc2NoX2V0
c190ZXN0cy5zaAouL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25ldC9mb3J3YXJkaW5nL3Z4bGFu
X2JyaWRnZV8xZF9wb3J0Xzg0NzIuc2gKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9uZXQvZm9y
d2FyZGluZy9pcDZncmVfaW5uZXJfdjRfbXVsdGlwYXRoLnNoCi4vdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMvbmV0L2ZvcndhcmRpbmcvbG9vcGJhY2suc2gKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0
cy9uZXQvZm9yd2FyZGluZy9za2JlZGl0X3ByaW9yaXR5LnNoCi4vdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMvbmV0L2ZvcndhcmRpbmcvdnhsYW5fc3ltbWV0cmljLnNoCi4vdG9vbHMvdGVzdGluZy9z
ZWxmdGVzdHMvbmV0L2ZjbmFsLXRlc3Quc2gKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9uZXQv
cmV1c2Vwb3J0X2FkZHJfYW55LnNoCi4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbmV0L3VkcGdy
by5zaAouL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25ldC9pcDZfZ3JlX2hlYWRyb29tLnNoCi4v
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbmV0L3Rlc3RfdnhsYW5fZmRiX2NoYW5nZWxpbmsuc2gK
Li90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9uZXQvZmliX25leHRob3BfbXVsdGlwcmVmaXguc2gK
Li90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9uZXQvdGVzdF9icGYuc2gKLi90b29scy90ZXN0aW5n
L3NlbGZ0ZXN0cy9uZXQvdnJmLXhmcm0tdGVzdHMuc2gKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0
cy9uZXQvdWRwZ3JvX2JlbmNoLnNoCi4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbmV0L2lwX2Rl
ZnJhZy5zaAouL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25ldC9pbl9uZXRucy5zaAouL3Rvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL25ldC90ZXN0X3Z4bGFuX3VuZGVyX3ZyZi5zaAouL3Rvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL25ldC9uZXRkZXZpY2Uuc2gKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0
cy9uZXQvbDJ0cC5zaAouL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25ldC9hbHRuYW1lcy5zaAou
L3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25ldC9maWJfbmV4dGhvcHMuc2gKLi90b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9uZXQvdWRwZ3NvLnNoCi4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbmV0
L2Zpbl9hY2tfbGF0LnNoCi4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbmV0L3hmcm1fcG9saWN5
LnNoCi4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbmV0L21wdGNwL3BtX25ldGxpbmsuc2gKLi90
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9uZXQvbXB0Y3AvbXB0Y3BfY29ubmVjdC5zaAouL3Rvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL25ldC9tcHRjcC9tcHRjcF9qb2luLnNoCi4vdG9vbHMvdGVzdGlu
Zy9zZWxmdGVzdHMvbmV0L3J0bmV0bGluay5zaAouL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25l
dC9maWJfcnVsZV90ZXN0cy5zaAouL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25ldC9zb190eHRp
bWUuc2gKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9uZXQvdHh0aW1lc3RhbXAuc2gKLi90b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9uZXQvdWRwZ3NvX2JlbmNoLnNoCi4vdG9vbHMvdGVzdGluZy9z
ZWxmdGVzdHMvbmV0L3JvdXRlX2xvY2FsbmV0LnNoCi4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMv
bmV0L3BtdHUuc2gKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9uZXQvdHJhY2Vyb3V0ZS5zaAou
L3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25ldC9wc29ja19zbmQuc2gKLi90b29scy90ZXN0aW5n
L3NlbGZ0ZXN0cy9uZXQvbXNnX3plcm9jb3B5LnNoCi4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMv
bmV0L3RjcF9mYXN0b3Blbl9iYWNrdXBfa2V5LnNoCi4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMv
bmV0L2ZpYi1vbmxpbmstdGVzdHMuc2gKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9uZXQvaWNt
cF9yZWRpcmVjdC5zaAouL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25ldC9maWJfdGVzdHMuc2gK
Li90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9uZXQvdGVzdF9ibGFja2hvbGVfZGV2LnNoCi4vdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMvbmV0L3JldXNlYWRkcl9wb3J0c19leGhhdXN0ZWQuc2gKLi90
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9uZXQvaXB2Nl9mbG93bGFiZWwuc2gKLi90b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9sa2R0bS9ydW4uc2gKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9saWIv
c3Ryc2NweS5zaAouL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2xpYi9wcmltZV9udW1iZXJzLnNo
Ci4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbGliL3ByaW50Zi5zaAouL3Rvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL2xpYi9iaXRtYXAuc2gKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy91c2VyL3Rl
c3RfdXNlcl9jb3B5LnNoCi4vdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvdm0vY2hhcmdlX3Jlc2Vy
dmVkX2h1Z2V0bGIuc2gKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy92bS90ZXN0X3ZtYWxsb2Mu
c2gKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy92bS9odWdldGxiX3JlcGFyZW50aW5nX3Rlc3Qu
c2gKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy92bS93cml0ZV9odWdldGxiX21lbW9yeS5zaAou
L3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3ZtL3Rlc3RfaG1tLnNoCi4vdG9vbHMvdGVzdGluZy9z
ZWxmdGVzdHMvbWVtb3J5LWhvdHBsdWcvbWVtLW9uLW9mZi10ZXN0LnNoCi4vdG9vbHMvdGVzdGlu
Zy9zZWxmdGVzdHMvZWZpdmFyZnMvZWZpdmFyZnMuc2gKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0
cy9zYWZlc2V0aWQvc2FmZXNldGlkLXRlc3Quc2gKLi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9t
ZWRpYV90ZXN0cy9vcGVuX2xvb3BfdGVzdC5zaAouL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL21l
ZGlhX3Rlc3RzL2JpbmRfdW5iaW5kX3NhbXBsZS5zaAouL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L21lZGlhX3Rlc3RzL21lZGlhX2Rldl9hbGxvY2F0b3Iuc2gKLi90b29scy90ZXN0aW5nL3NlbGZ0
ZXN0cy9jcHUtaG90cGx1Zy9jcHUtb24tb2ZmLXRlc3Quc2gKLi90b29scy90ZXN0aW5nL3NlbGZ0
ZXN0cy93aXJlZ3VhcmQvbmV0bnMuc2gKLi90b29scy90ZXN0aW5nL2t0ZXN0L2NvbXBhcmUta3Rl
c3Qtc2FtcGxlLnBsCi4vdG9vbHMvdGVzdGluZy9rdGVzdC9rdGVzdC5wbAouL3Rvb2xzL3Rlc3Rp
bmcva3Rlc3QvY29uZmlnLWJpc2VjdC5wbAouL3Rvb2xzL2Nncm91cC9pb2Nvc3RfbW9uaXRvci5w
eQouL3Rvb2xzL2Nncm91cC9pb2Nvc3RfY29lZl9nZW4ucHkKLi90b29scy91c2IvaGNkLXRlc3Rz
LnNoCi4vdG9vbHMvdXNiL3VzYmlwL3Z1ZGMvdnVkY19zZXJ2ZXJfZXhhbXBsZS5zaAouL3Rvb2xz
L3VzYi91c2JpcC9hdXRvZ2VuLnNoCi4vdG9vbHMvdXNiL3VzYmlwL2NsZWFudXAuc2gKLi90b29s
cy9sZWRzL2dldF9sZWRfZGV2aWNlX2luZm8uc2gKLi90b29scy9odi9odl9nZXRfZGhjcF9pbmZv
LnNoCi4vdG9vbHMvaHYvaHZfZ2V0X2Ruc19pbmZvLnNoCi4vdG9vbHMvaHYvaHZfc2V0X2lmY29u
ZmlnLnNoCi4vdG9vbHMvcG93ZXIveDg2L2ludGVsX3BzdGF0ZV90cmFjZXIvaW50ZWxfcHN0YXRl
X3RyYWNlci5weQouL3Rvb2xzL3Bvd2VyL3BtLWdyYXBoL3NsZWVwZ3JhcGgucHkKLi90b29scy9w
b3dlci9wbS1ncmFwaC9ib290Z3JhcGgucHkKLi90b29scy9wb3dlci9jcHVwb3dlci9iZW5jaC9j
cHVmcmVxLWJlbmNoX3Bsb3Quc2gKLi90b29scy9wb3dlci9jcHVwb3dlci9iZW5jaC9jcHVmcmVx
LWJlbmNoX3NjcmlwdC5zaAouL3Rvb2xzL3Bvd2VyL2NwdXBvd2VyL3V0aWxzL3ZlcnNpb24tZ2Vu
LnNoCi4vdG9vbHMvcG93ZXIvY3B1cG93ZXIvY3B1cG93ZXItY29tcGxldGlvbi5zaAouL3Rvb2xz
L2xpYi9sb2NrZGVwL3Rlc3RzL0FCQ0RCRERBLnNoCi4vdG9vbHMvbGliL2xvY2tkZXAvdGVzdHMv
QUEuc2gKLi90b29scy9saWIvbG9ja2RlcC90ZXN0cy9BQkJDQ0Euc2gKLi90b29scy9saWIvbG9j
a2RlcC90ZXN0cy9BQkEuc2gKLi90b29scy9saWIvbG9ja2RlcC90ZXN0cy9BQkJBLnNoCi4vdG9v
bHMvbGliL2xvY2tkZXAvdGVzdHMvQUJDQUJDLnNoCi4vdG9vbHMvbGliL2xvY2tkZXAvdGVzdHMv
QUJDREJDREEuc2gKLi90b29scy9saWIvbG9ja2RlcC90ZXN0cy9XVy5zaAouL3Rvb2xzL2xpYi9s
b2NrZGVwL3Rlc3RzL0FCQkNDRERBLnNoCi4vdG9vbHMvbGliL2xvY2tkZXAvdGVzdHMvdW5sb2Nr
X2JhbGFuY2Uuc2gKLi90b29scy9saWIvbG9ja2RlcC90ZXN0cy9BQkJBXzJ0aHJlYWRzLnNoCi4v
dG9vbHMvbGliL2xvY2tkZXAvcnVuX3Rlc3RzLnNoCi4vdG9vbHMvdm0vc2xhYmluZm8tZ251cGxv
dC5zaAouL3Rvb2xzL3BjaS9wY2l0ZXN0LnNoCi4vdG9vbHMvdmlydGlvL3Jpbmd0ZXN0L3J1bi1v
bi1hbGwuc2gKLi90b29scy90aW1lL3VkZWxheV90ZXN0LnNoCi4vc2FtcGxlcy9icGYvcnVuX2Nv
b2tpZV91aWRfaGVscGVyX2V4YW1wbGUuc2gKLi9zYW1wbGVzL2JwZi90ZXN0X2Nsc19icGYuc2gK
Li9zYW1wbGVzL2JwZi90ZXN0X2NncnAyX3RjLnNoCi4vc2FtcGxlcy9icGYvdGVzdF9vdmVycmlk
ZV9yZXR1cm4uc2gKLi9zYW1wbGVzL2JwZi90ZXN0X2NncnAyX3NvY2syLnNoCi4vc2FtcGxlcy9i
cGYvdGVzdF9sd3RfYnBmLnNoCi4vc2FtcGxlcy9icGYvZG9faGJtX3Rlc3Quc2gKLi9zYW1wbGVz
L2JwZi90ZXN0X2lwaXAuc2gKLi9zYW1wbGVzL2JwZi94ZHAyc2tiX21ldGEuc2gKLi9zYW1wbGVz
L2JwZi9sd3RfbGVuX2hpc3Quc2gKLi9zYW1wbGVzL2JwZi90Y19sMl9yZWRpcmVjdC5zaAouL3Nh
bXBsZXMvYnBmL3Rlc3RfY2dycDJfc29jay5zaAouL3NhbXBsZXMvcGt0Z2VuL3BrdGdlbl9zYW1w
bGUwM19idXJzdF9zaW5nbGVfZmxvdy5zaAouL3NhbXBsZXMvcGt0Z2VuL3BrdGdlbl9zYW1wbGUw
Ml9tdWx0aXF1ZXVlLnNoCi4vc2FtcGxlcy9wa3RnZW4vcGt0Z2VuX3NhbXBsZTA2X251bWFfYXdh
cmVkX3F1ZXVlX2lycV9hZmZpbml0eS5zaAouL3NhbXBsZXMvcGt0Z2VuL2Z1bmN0aW9ucy5zaAou
L3NhbXBsZXMvcGt0Z2VuL3BrdGdlbl9iZW5jaF94bWl0X21vZGVfbmV0aWZfcmVjZWl2ZS5zaAou
L3NhbXBsZXMvcGt0Z2VuL3BrdGdlbl9zYW1wbGUwMV9zaW1wbGUuc2gKLi9zYW1wbGVzL3BrdGdl
bi9wa3RnZW5fc2FtcGxlMDVfZmxvd19wZXJfdGhyZWFkLnNoCi4vc2FtcGxlcy9wa3RnZW4vcGt0
Z2VuX3NhbXBsZTA0X21hbnlfZmxvd3Muc2gKLi9zYW1wbGVzL3BrdGdlbi9wYXJhbWV0ZXJzLnNo
Ci4vc2FtcGxlcy9wa3RnZW4vcGt0Z2VuX2JlbmNoX3htaXRfbW9kZV9xdWV1ZV94bWl0LnNoCi4v
dXNyL2dlbl9pbml0cmFtZnMuc2gKLi9hcmNoL3h0ZW5zYS9rZXJuZWwvc3lzY2FsbHMvc3lzY2Fs
bHRibC5zaAouL2FyY2gveHRlbnNhL2tlcm5lbC9zeXNjYWxscy9zeXNjYWxsaGRyLnNoCi4vYXJj
aC9wYXJpc2Mva2VybmVsL3N5c2NhbGxzL3N5c2NhbGx0Ymwuc2gKLi9hcmNoL3BhcmlzYy9rZXJu
ZWwvc3lzY2FsbHMvc3lzY2FsbGhkci5zaAouL2FyY2gvcGFyaXNjL2Jvb3QvaW5zdGFsbC5zaAou
L2FyY2gvcGFyaXNjL2luc3RhbGwuc2gKLi9hcmNoL3Bvd2VycGMva2VybmVsL3N5c2NhbGxzL3N5
c2NhbGx0Ymwuc2gKLi9hcmNoL3Bvd2VycGMva2VybmVsL3N5c2NhbGxzL3N5c2NhbGxoZHIuc2gK
Li9hcmNoL3Bvd2VycGMva2VybmVsL3Byb21faW5pdF9jaGVjay5zaAouL2FyY2gvcG93ZXJwYy9r
ZXJuZWwvc3lzdGJsX2Noay5zaAouL2FyY2gvcG93ZXJwYy90b29scy9nY2MtY2hlY2stbXByb2Zp
bGUta2VybmVsLnNoCi4vYXJjaC9wb3dlcnBjL3Rvb2xzL3VucmVsX2JyYW5jaF9jaGVjay5zaAou
L2FyY2gvcG93ZXJwYy90b29scy9oZWFkX2NoZWNrLnNoCi4vYXJjaC9wb3dlcnBjL3Rvb2xzL3Jl
bG9jc19jaGVjay5zaAouL2FyY2gvcG93ZXJwYy90b29scy9jaGVja3BhdGNoLnNoCi4vYXJjaC9w
b3dlcnBjL2Jvb3QvaW5zdGFsbC5zaAouL2FyY2gvc3BhcmMva2VybmVsL3N5c2NhbGxzL3N5c2Nh
bGx0Ymwuc2gKLi9hcmNoL3NwYXJjL2tlcm5lbC9zeXNjYWxscy9zeXNjYWxsaGRyLnNoCi4vYXJj
aC9zcGFyYy92ZHNvL2NoZWNrdW5kZWYuc2gKLi9hcmNoL3NwYXJjL2Jvb3QvaW5zdGFsbC5zaAou
L2FyY2gvYXJtL3Rvb2xzL3N5c2NhbGxuci5zaAouL2FyY2gvYXJtL3Rvb2xzL3N5c2NhbGx0Ymwu
c2gKLi9hcmNoL2FybS90b29scy9zeXNjYWxsaGRyLnNoCi4vYXJjaC9hcm0vYm9vdC9kZWZsYXRl
X3hpcF9kYXRhLnNoCi4vYXJjaC9hcm0vYm9vdC9pbnN0YWxsLnNoCi4vYXJjaC9hcm0vY3J5cHRv
L3NoYTI1Ni1hcm12NC5wbAouL2FyY2gvYXJtL2NyeXB0by9zaGE1MTItYXJtdjQucGwKLi9hcmNo
L2FybS9jcnlwdG8vcG9seTEzMDUtYXJtdjQucGwKLi9hcmNoL21pcHMva2VybmVsL3N5c2NhbGxz
L3N5c2NhbGxuci5zaAouL2FyY2gvbWlwcy9rZXJuZWwvc3lzY2FsbHMvc3lzY2FsbHRibC5zaAou
L2FyY2gvbWlwcy9rZXJuZWwvc3lzY2FsbHMvc3lzY2FsbGhkci5zaAouL2FyY2gvbWlwcy90b29s
cy9nZW5lcmljLWJvYXJkLWNvbmZpZy5zaAouL2FyY2gvbWlwcy9jcnlwdG8vcG9seTEzMDUtbWlw
cy5wbAouL2FyY2gvbTY4ay9rZXJuZWwvc3lzY2FsbHMvc3lzY2FsbHRibC5zaAouL2FyY2gvbTY4
ay9rZXJuZWwvc3lzY2FsbHMvc3lzY2FsbGhkci5zaAouL2FyY2gvbTY4ay9pbnN0YWxsLnNoCi4v
YXJjaC9hcm02NC9rZXJuZWwvdmRzby9nZW5fdmRzb19vZmZzZXRzLnNoCi4vYXJjaC9hcm02NC9i
b290L2luc3RhbGwuc2gKLi9hcmNoL2FybTY0L2NyeXB0by9wb2x5MTMwNS1hcm12OC5wbAouL2Fy
Y2gvYXJtNjQvY3J5cHRvL3NoYTUxMi1hcm12OC5wbAouL2FyY2gvczM5MC9ib290L2luc3RhbGwu
c2gKLi9hcmNoL3g4Ni9rZXJuZWwvY3B1L21rY2FwZmxhZ3Muc2gKLi9hcmNoL3g4Ni91bS92ZHNv
L2NoZWNrdW5kZWYuc2gKLi9hcmNoL3g4Ni9ib290L2dlbmltYWdlLnNoCi4vYXJjaC94ODYvYm9v
dC9pbnN0YWxsLnNoCi4vYXJjaC94ODYvY3J5cHRvL3BvbHkxMzA1LXg4Nl82NC1jcnlwdG9nYW1z
LnBsCi4vYXJjaC94ODYvZW50cnkvc3lzY2FsbHMvc3lzY2FsbHRibC5zaAouL2FyY2gveDg2L2Vu
dHJ5L3N5c2NhbGxzL3N5c2NhbGxoZHIuc2gKLi9hcmNoL3g4Ni9lbnRyeS92ZHNvL2NoZWNrdW5k
ZWYuc2gKLi9hcmNoL25kczMyL2tlcm5lbC92ZHNvL2dlbl92ZHNvX29mZnNldHMuc2gKLi9hcmNo
L2lhNjQva2VybmVsL3N5c2NhbGxzL3N5c2NhbGx0Ymwuc2gKLi9hcmNoL2lhNjQva2VybmVsL3N5
c2NhbGxzL3N5c2NhbGxoZHIuc2gKLi9hcmNoL2lhNjQvc2NyaXB0cy91bndjaGVjay5weQouL2Fy
Y2gvaWE2NC9pbnN0YWxsLnNoCi4vYXJjaC9taWNyb2JsYXplL2tlcm5lbC9zeXNjYWxscy9zeXNj
YWxsdGJsLnNoCi4vYXJjaC9taWNyb2JsYXplL2tlcm5lbC9zeXNjYWxscy9zeXNjYWxsaGRyLnNo
Ci4vYXJjaC9hbHBoYS9rZXJuZWwvc3lzY2FsbHMvc3lzY2FsbHRibC5zaAouL2FyY2gvYWxwaGEv
a2VybmVsL3N5c2NhbGxzL3N5c2NhbGxoZHIuc2gKLi9hcmNoL25pb3MyL2Jvb3QvaW5zdGFsbC5z
aAouL2FyY2gvcmlzY3YvYm9vdC9pbnN0YWxsLnNoCi4vYXJjaC9zaC9rZXJuZWwvc3lzY2FsbHMv
c3lzY2FsbHRibC5zaAouL2FyY2gvc2gva2VybmVsL3N5c2NhbGxzL3N5c2NhbGxoZHIuc2gKLi9h
cmNoL3NoL2Jvb3QvY29tcHJlc3NlZC9pbnN0YWxsLnNoCg==
--000000000000c1d7ff05aa882040
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--000000000000c1d7ff05aa882040--
