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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98AB6C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 26 Jul 2020 15:09:46 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4800A2065F
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 26 Jul 2020 15:09:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QUMEU432"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4800A2065F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0997385F83;
	Sun, 26 Jul 2020 15:09:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m2wMvAQe-MiX; Sun, 26 Jul 2020 15:09:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 55786855C6;
	Sun, 26 Jul 2020 15:09:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3FEBEC004F;
	Sun, 26 Jul 2020 15:09:45 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E6B89C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 15:09:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D26798773F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 15:09:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VG9hzceblVri
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 15:09:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com
 [209.85.222.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D9FE58773E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 15:09:42 +0000 (UTC)
Received: by mail-ua1-f65.google.com with SMTP id u6so4645068uau.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 08:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VXbfvWtH8zz4brHS0etFZy1veFYKUOp5XNk3vMDpdxc=;
 b=QUMEU432eZfZ8b7faqZ0IX8kQNQrBrb3dhyF/bG3V7jlw+SVZRcBI6vDuAx/+eR4CU
 k/a1qjV/jSFVv9HtcPZIlwflg65HxCr/PFIZCWpTVcgYkyUV/CoApJxlQlbqr+UAvegZ
 Q+nnlI9dJsHopF7WhND1p8IPypldAowPHjj88AhFEMNKLGLpX+eghDHjqwiOPOgXVel1
 z46lETYXuRojvwSOy+cZec+Zo94tlr3qw59mv9dimc++zxEXOH1XmLAD1+Z7K24KFfXX
 jrtG0gTFm/S0zOT61ADwryS8ToQPv++h+3NExIAWqS9Jfne0mmxgQ9tx5iqzEkHzmY9R
 5Dgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VXbfvWtH8zz4brHS0etFZy1veFYKUOp5XNk3vMDpdxc=;
 b=PJqo7PUR+6drmZ9fSUOtjuoPLrlrXxFInNS3PYTBZ3zcFOhKenZqFFDY52Upx1XAnq
 7QQC8Tgb29D0vgUlBv+KB8Fn5XCjXnip3vnNF8vnGJn1ACUPr6/4sA3n3HJCxYj7wcYK
 dBKKcqdZuRjuWpK6Rpf4louVQLlai5DavYuBS9pBDpfNYldJWQG1/U/WCS9HRE6v/ZVp
 mlDGDwP6PIk5qRVmckCs8ScljxHAE3md4fRuo7Jy5rsddCW+J19oooQffmao4qaNJONO
 aEfhLnRr9VBhpUmCcJ1rexKFgJ60kH9MrM4sWtbcxKhfX5M9gPOxtwbjkzEPxy5pUwX8
 Bzcg==
X-Gm-Message-State: AOAM530MYOUbvzhale2KfIzLqfD6VPpN7RENIv0tWxPlafp+klDQCIvn
 CuF45hhwzgBiQPofAZ6wXoEzB0SqTn8OFoBR6mU=
X-Google-Smtp-Source: ABdhPJwIAV2p3zZ0YgYRBT+93B7aqYJUKVewEGXGdhFza1EGvZZYZPlWc59kpi/GbcT2zOMsxkKuYf7vx5DVdZFbEXY=
X-Received: by 2002:ab0:44e5:: with SMTP id n92mr14122568uan.9.1595776181797; 
 Sun, 26 Jul 2020 08:09:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200726075802.396907-1-nachiketun8@gmail.com>
 <alpine.DEB.2.21.2007261310140.6195@felia>
In-Reply-To: <alpine.DEB.2.21.2007261310140.6195@felia>
From: Nachiket N <nachiketun8@gmail.com>
Date: Sun, 26 Jul 2020 20:39:30 +0530
Message-ID: <CA+Dc07ijF4HT2zJBbVGRkzTk3wvN596baXies-6SmgWfoMgphQ@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] Script: Checkpatch: Disables
 commit log length check in case of valid signature tags
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
Content-Type: multipart/mixed; boundary="===============2377408583216903654=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============2377408583216903654==
Content-Type: multipart/alternative; boundary="0000000000007507b805ab5998e4"

--0000000000007507b805ab5998e4
Content-Type: text/plain; charset="UTF-8"

On Sun, Jul 26, 2020 at 4:43 PM Lukas Bulwahn <lukas.bulwahn@gmail.com>
wrote:

>
> Commit message is wrong.
>
> On Sun, 26 Jul 2020, Nachiket Naganure wrote:
>
> > Checkpatch.pl outputs warnings for commit description lines that exceed
> > beyond 75 characters. Sometimes these lines might contain signature tags
> > that cannot be shortened. The patch checks if the line has any valid
> > signature tags and disables the warning in such a case.
> >
> > For instance in commit ID ac854131d984, the patch
> > contains a Reported by tag line which exceeds 75 chars. And there is no
> > valid way to shorten the length.
> >
> > To fix this, we need to check if the $line variable has any valid
> > signature tags which are already stored in $signature_tags variable.
> >
>
> Read the documentation on commit messages. Think about the things you are
> doing wrong in your commit message.
>
> > Signed-off-by: Nachiket Naganure <nachiketun8@gmail.com>
> > ---
> >  scripts/checkpatch.pl | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > index 197436b20288..b6d5e2a8fce8 100755
> > --- a/scripts/checkpatch.pl
> > +++ b/scripts/checkpatch.pl
> > @@ -2806,6 +2806,8 @@ sub process {
> >                                       # filename then :
> >                     $line =~ /^\s*(?:Fixes:|Link:)/i ||
> >                                       # A Fixes: or Link: line
> > +          $line =~ /$signature_tags/ ||
> > +          # Checks for signature_tags
>
> Change looks more reasonable now.
> Indentation is broken.
>
>
> Maybe two or three iterations on this patch and it is getting ready for
> submission.
>
> Lukas
>
> >                     $commit_log_possible_stack_dump)) {
> >                       WARN("COMMIT_LOG_LONG_LINE",
> >                            "Possible unwrapped commit description
> (prefer a maximum 75 chars per line)\n" . $herecurr);
> > --
> > 2.25.1
> >
> >
>
Checkpatch: Disable length check warning for signature tag

Disable commit log length check in case of the signature tag. If the commit
log line has valid signature tags such as "Reported-and-tested-by" with
more than 75 characters, it suppresses the long line length warning.

For instance in Commit ac854131d984 (USB: core: Fix misleading driver
bug report), the corresponding contains a "Reported by" tag line which
exceeds 75 chars. And there is no valid way to shorten the length.


The modified commit message is written above. Changed the language to
imperative and shortened the subject line. Fixed the commit ID reference.
Are there any other changes required?

--0000000000007507b805ab5998e4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Sun, Jul 26, 2020 at 4:43 PM Lukas Bulwahn &lt;<a href=
=3D"mailto:lukas.bulwahn@gmail.com">lukas.bulwahn@gmail.com</a>&gt; wrote:<=
br><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><br>
Commit message is wrong.<br>
<br>
On Sun, 26 Jul 2020, Nachiket Naganure wrote:<br>
<br>
&gt; Checkpatch.pl outputs warnings for commit description lines that excee=
d<br>
&gt; beyond 75 characters. Sometimes these lines might contain signature ta=
gs<br>
&gt; that cannot be shortened. The patch checks if the line has any valid<b=
r>
&gt; signature tags and disables the warning in such a case.<br>
&gt; <br>
&gt; For instance in commit ID ac854131d984, the patch<br>
&gt; contains a Reported by tag line which exceeds 75 chars. And there is n=
o<br>
&gt; valid way to shorten the length.<br>
&gt; <br>
&gt; To fix this, we need to check if the $line variable has any valid<br>
&gt; signature tags which are already stored in $signature_tags variable.<b=
r>
&gt; <br>
<br>
Read the documentation on commit messages. Think about the things you are <=
br>
doing wrong in your commit message.<br>
<br>
&gt; Signed-off-by: Nachiket Naganure &lt;<a href=3D"mailto:nachiketun8@gma=
il.com" target=3D"_blank">nachiketun8@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" targ=
et=3D"_blank">checkpatch.pl</a> | 2 ++<br>
&gt;=C2=A0 1 file changed, 2 insertions(+)<br>
&gt; <br>
&gt; diff --git a/scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferre=
r" target=3D"_blank">checkpatch.pl</a> b/scripts/<a href=3D"http://checkpat=
ch.pl" rel=3D"noreferrer" target=3D"_blank">checkpatch.pl</a><br>
&gt; index 197436b20288..b6d5e2a8fce8 100755<br>
&gt; --- a/scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" targ=
et=3D"_blank">checkpatch.pl</a><br>
&gt; +++ b/scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" targ=
et=3D"_blank">checkpatch.pl</a><br>
&gt; @@ -2806,6 +2806,8 @@ sub process {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# file=
name then :<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0$line =3D~ /^\s*(?:Fixes:|Link:)/i ||<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# A Fi=
xes: or Link: line<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $line =3D~ /$signature_tags/ ||<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Checks for signature_tags<br>
<br>
Change looks more reasonable now.<br>
Indentation is broken.<br>
<br>
<br>
Maybe two or three iterations on this patch and it is getting ready for <br=
>
submission.<br>
<br>
Lukas<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0$commit_log_possible_stack_dump)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0WARN(&quot;COMMIT_LOG_LONG_LINE&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Possible unwrapped commit description (pr=
efer a maximum 75 chars per line)\n&quot; . $herecurr);<br>
&gt; -- <br>
&gt; 2.25.1<br>
&gt; <br>
&gt;<br></blockquote><div>Checkpatch: Disable length check warning for sign=
ature tag<br><br>Disable commit log length check in case of the signature t=
ag. If the commit<br>log line has valid signature tags such as &quot;Report=
ed-and-tested-by&quot; with<br>more than 75 characters, it suppresses the l=
ong line length warning.<br><br>For instance in Commit ac854131d984 (USB: c=
ore: Fix misleading driver<br></div><div>bug report), the corresponding con=
tains a &quot;Reported by&quot; tag line which<br>exceeds 75 chars. And the=
re is no valid way to shorten the length.</div><div><br></div><div><br></di=
v><div>The modified commit message is written above. Changed the language t=
o<br></div><div>imperative and shortened the subject line. Fixed the commit=
 ID reference.</div><div>Are there any other changes required?<br></div></d=
iv></div>

--0000000000007507b805ab5998e4--

--===============2377408583216903654==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============2377408583216903654==--
