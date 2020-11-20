Return-Path: <SRS0=YTQs=E2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE1B9C2D0E4
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Nov 2020 20:23:45 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FFFB206FB
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Nov 2020 20:23:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ebm12I60"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FFFB206FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id BC67886D90;
	Fri, 20 Nov 2020 20:23:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mMk76KeFlxCk; Fri, 20 Nov 2020 20:23:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id CBD5E86E08;
	Fri, 20 Nov 2020 20:23:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A461FC163C;
	Fri, 20 Nov 2020 20:23:42 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B4B5EC0891
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Nov 2020 20:23:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9A99486FE2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Nov 2020 20:23:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H_xhNykG2hbe
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Nov 2020 20:23:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
 [209.85.166.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6E0A086F60
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Nov 2020 20:23:39 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id a19so3891769ilm.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Nov 2020 12:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sfZER4e5robAXE2gIOgmf6q0oty8pze3I0iBSLjZIy4=;
 b=Ebm12I60nrcJKFEy4le+9tQkv9Xd8tidnfRS7TuWFMpj+CzmyECFo3/zdClwbhvvwE
 8PiQC7Lk7nNPWBipDdDMp9YcoY79gX57Z3nWceGQTrtQ4prNkSRVsFlaBydwKWuJMAmY
 KtK9Mn4xM/gXiNn8N2d9uNAGIkDYNjEJsur4I8SspHYVc8opXqj7jjcZmoPotBAD4mho
 9Uzk0ITTFDKxI9lombBkswrLqPxnSGPM5rn01K1D3bdG/Q6/RD+JRQzg+ahr7ja5uCmO
 nzZ5o03jW0N5m9AgizSz+ZFJWDI3SJV2HWAd1gvG5J6uvSOlSQmKl1C2vtsOPryht6Qf
 9gMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sfZER4e5robAXE2gIOgmf6q0oty8pze3I0iBSLjZIy4=;
 b=dyclNzFJrHQf2cjj4ZK+y/11IvGQz/ZKSAHqHDdN1rAmaX0kqC2UtK1SMDcgiYaDkM
 PO93zaTkgIlCYHUdUzH41l8HroQlU6v+mkZCbujwQTEYSEG90YE3BtcUMOBMqg4O9fu0
 89e7mkxMiukvRNY71KMQfExWCkqRPu7wpnpWo0Quwm+r8HPcEmrOtkqSF9xnwM07b0+b
 /yB1+PxuRrEKlVUZbk9zfMhk96e0KTiKvGmadsnKkqhuUdP+6pefChzOGeQmATR00tcd
 PObtp+YJE2iMYyezXdb7IO6y3FTMyiFvbmLqEcqiVuYCRb/2gYdOpiDDqeO531jIa4Sb
 NOZw==
X-Gm-Message-State: AOAM533j0xdPO/jFK1s9t74pjKrFnrh+2sKNWwZqEiwy4eaOq4ecgt4j
 DyqBtJJOSWWcPGD1c1RfKgmT/4UF2FGvxZst5iM=
X-Google-Smtp-Source: ABdhPJw0+jWFEnad+IltPWbPAgsc4Z1FNN8BYI2+X2DqeH8k5zHniQO0LM2atLOOs5cIXZozO+Y1Zu3TrYp3LGaVQoc=
X-Received: by 2002:a92:aacc:: with SMTP id p73mr10764494ill.64.1605903818647; 
 Fri, 20 Nov 2020 12:23:38 -0800 (PST)
MIME-Version: 1.0
References: <da375716-721c-e4d8-27a9-f8d576741d65@gmail.com>
 <20201120195851.23679-1-yashsri421@gmail.com>
 <3fbf54ea-20f4-8e80-2bfd-363e9cec6619@gmail.com>
In-Reply-To: <3fbf54ea-20f4-8e80-2bfd-363e9cec6619@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Fri, 20 Nov 2020 21:23:25 +0100
Message-ID: <CAKXUXMwC-+BrDuCELNwZV_Qz1FDPXZKT_mTePOjZcjOXAviacw@mail.gmail.com>
To: Aditya <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add fix and improve
 warning msg for Non-standard signature
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
Content-Type: multipart/mixed; boundary="===============7952846940217841658=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============7952846940217841658==
Content-Type: multipart/alternative; boundary="000000000000a76c2705b48f9ef5"

--000000000000a76c2705b48f9ef5
Content-Type: text/plain; charset="UTF-8"

On Fr., 20. Nov. 2020 at 21:03, Aditya <yashsri421@gmail.com> wrote:

> On 21/11/20 1:28 am, Aditya Srivastava wrote:
> > Checkpatch.pl warns on non-standard signature styles.
> >
> > E.g., running checkpatch on commit 513f7f747e1c ("parisc: Fix vmap
> > memory leak in ioremap()/iounmap()") reports this warning:
> >
> > WARNING: Non-standard signature: Noticed-by:
> > Noticed-by: Sven Schnelle <svens@stackframe.org>
> >


This example really does not tell anyone much.

Replace it with a summary from your evaluation.


> > Provide a fix by:
> > 1) replacing the non-standard signature with its standard equivalent
> > 2) removing the signature if it is not required
> >
> > Also, improve warning messages correspondingly, providing users
> > suggestions to either replace or remove the signature
> >


Looks good.



> > Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> > ---
> >  scripts/checkpatch.pl | 45 +++++++++++++++++++++++++++++++++++++++++--
> >  1 file changed, 43 insertions(+), 2 deletions(-)
> >
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > index fdfd5ec09be6..23a21dc2c29a 100755
> > --- a/scripts/checkpatch.pl
> > +++ b/scripts/checkpatch.pl
> > @@ -506,6 +506,27 @@ our $signature_tags = qr{(?xi:
> >       Cc:
> >  )};
> >
> > +our %standard_signature_fix = (
> > +     "Requested-by:" => "Suggested-by:",
> > +     "Co-authored-by:" => "Co-developed-by:",
> > +     "Analyzed-by:" => "Co-developed-by:",
> > +     "Analysed-by:" => "Co-developed-by:",
> > +     "Improvements-by:" => "Co-developed-by:",
> > +     "Noticed-by:" => "Reported-by:",
> > +     "Inspired-by:" => "Suggested-by:",
> > +     "Verified-by:" => "Tested-by:",
> > +     "Okay-ished-by:" => "Acked-by:",
> > +     "Acked-for-MFD-by:" => "Acked-by:",
> > +     "Reviewed-off-by:" => "Reviewed-by:",
> > +     "Proposed-by:" => "Suggested-by:",
> > +     "Fixed-by:" => "Co-developed-by:",
> > +     "Pointed-out-by:" => "Suggested-by:",
> > +     "Pointed-at-by:" => "Suggested-by:",
> > +     "Suggestions-by:" => "Suggested-by:",
> > +     "Generated-by:" => "remove",
> > +     "Celebrated-by:" => "remove",
> > +);
> > +


How did create this list? I thought we looked at 30 cases...


> >  our @typeListMisordered = (
> >       qr{char\s+(?:un)?signed},
> >       qr{int\s+(?:(?:un)?signed\s+)?short\s},
> > @@ -2773,8 +2794,28 @@ sub process {
> >                       my $ucfirst_sign_off = ucfirst(lc($sign_off));
> >
> >                       if ($sign_off !~ /$signature_tags/) {
> > -                             WARN("BAD_SIGN_OFF",
> > -                                  "Non-standard signature: $sign_off\n"
> . $herecurr);
> > +                             my $suggested_signature = "";
> > +                             if
> (exists($standard_signature_fix{$sign_off})) {
> > +                                     $suggested_signature =
> $standard_signature_fix{$sign_off};
> > +                             }
> > +                             if ($suggested_signature eq "") {
> > +                                     WARN("BAD_SIGN_OFF",
> > +                                          "Non-standard signature:
> $sign_off\n" . $herecurr);
> > +                             }
> > +                             elsif ($suggested_signature eq "remove") {
> > +                                     if (WARN("BAD_SIGN_OFF",
> > +                                             "Non-standard signature:
> $sign_off. Please consider removing this signature tag.\n" . $herecurr) &&
> > +                                     $fix) {
> > +
>  fix_delete_line($fixlinenr, $rawline);
> > +                                     }
> > +                             }
> > +                             else {
> > +                                     if (WARN("BAD_SIGN_OFF",
> > +                                             "Non-standard signature:
> $sign_off. Please use '$suggested_signature' instead.\n" . $herecurr) &&
> > +                                     $fix) {
> > +                                             $fixed[$fixlinenr] =~
> s/$sign_off/$suggested_signature/;
> > +                                     }
> > +                             }
> >                       }
> >                       if (defined $space_before && $space_before ne "") {
> >                               if (WARN("BAD_SIGN_OFF",
> >
>
> Initial tests performed on patches found this fix to be working as
> expected.
>
> Thanks
> Aditya
>

--000000000000a76c2705b48f9ef5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"auto">On Fr.=
, 20. Nov. 2020 at 21:03, Aditya &lt;<a href=3D"mailto:yashsri421@gmail.com=
">yashsri421@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">On 21/11/20 1:28 am, Aditya Srivastava wrote:<br>
&gt; Checkpatch.pl warns on non-standard signature styles.<br>
&gt; <br>
&gt; E.g., running checkpatch on commit 513f7f747e1c (&quot;parisc: Fix vma=
p<br>
&gt; memory leak in ioremap()/iounmap()&quot;) reports this warning:<br>
&gt; <br>
&gt; WARNING: Non-standard signature: Noticed-by:<br>
&gt; Noticed-by: Sven Schnelle &lt;<a href=3D"mailto:svens@stackframe.org" =
target=3D"_blank">svens@stackframe.org</a>&gt;<br>
&gt;</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">This example=
 really does not tell anyone much.</div><div dir=3D"auto"><br></div><div di=
r=3D"auto">Replace it with a summary from your evaluation.</div><div dir=3D=
"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"> <br>
&gt; Provide a fix by:<br>
&gt; 1) replacing the non-standard signature with its standard equivalent<b=
r>
&gt; 2) removing the signature if it is not required<br>
&gt; <br>
&gt; Also, improve warning messages correspondingly, providing users<br>
&gt; suggestions to either replace or remove the signature<br>
&gt; </blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Looks good.=
</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex"><br>
&gt; Signed-off-by: Aditya Srivastava &lt;<a href=3D"mailto:yashsri421@gmai=
l.com" target=3D"_blank">yashsri421@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" targ=
et=3D"_blank">checkpatch.pl</a> | 45 ++++++++++++++++++++++++++++++++++++++=
+++--<br>
&gt;=C2=A0 1 file changed, 43 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferre=
r" target=3D"_blank">checkpatch.pl</a> b/scripts/<a href=3D"http://checkpat=
ch.pl" rel=3D"noreferrer" target=3D"_blank">checkpatch.pl</a><br>
&gt; index fdfd5ec09be6..23a21dc2c29a 100755<br>
&gt; --- a/scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" targ=
et=3D"_blank">checkpatch.pl</a><br>
&gt; +++ b/scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" targ=
et=3D"_blank">checkpatch.pl</a><br>
&gt; @@ -506,6 +506,27 @@ our $signature_tags =3D qr{(?xi:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Cc:<br>
&gt;=C2=A0 )};<br>
&gt;=C2=A0 <br>
&gt; +our %standard_signature_fix =3D (<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;Requested-by:&quot; =3D&gt; &quot;Suggested=
-by:&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;Co-authored-by:&quot; =3D&gt; &quot;Co-deve=
loped-by:&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;Analyzed-by:&quot; =3D&gt; &quot;Co-develop=
ed-by:&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;Analysed-by:&quot; =3D&gt; &quot;Co-develop=
ed-by:&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;Improvements-by:&quot; =3D&gt; &quot;Co-dev=
eloped-by:&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;Noticed-by:&quot; =3D&gt; &quot;Reported-by=
:&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;Inspired-by:&quot; =3D&gt; &quot;Suggested-=
by:&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;Verified-by:&quot; =3D&gt; &quot;Tested-by:=
&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;Okay-ished-by:&quot; =3D&gt; &quot;Acked-by=
:&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;Acked-for-MFD-by:&quot; =3D&gt; &quot;Acked=
-by:&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;Reviewed-off-by:&quot; =3D&gt; &quot;Review=
ed-by:&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;Proposed-by:&quot; =3D&gt; &quot;Suggested-=
by:&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;Fixed-by:&quot; =3D&gt; &quot;Co-developed-=
by:&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;Pointed-out-by:&quot; =3D&gt; &quot;Suggest=
ed-by:&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;Pointed-at-by:&quot; =3D&gt; &quot;Suggeste=
d-by:&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;Suggestions-by:&quot; =3D&gt; &quot;Suggest=
ed-by:&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;Generated-by:&quot; =3D&gt; &quot;remove&qu=
ot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;Celebrated-by:&quot; =3D&gt; &quot;remove&q=
uot;,<br>
&gt; +);<br>
&gt; +</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">How did cr=
eate this list? I thought we looked at 30 cases...</div><div dir=3D"auto"><=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><br>
&gt;=C2=A0 our @typeListMisordered =3D (<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0qr{char\s+(?:un)?signed},<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0qr{int\s+(?:(?:un)?signed\s+)?short\s},<br>
&gt; @@ -2773,8 +2794,28 @@ sub process {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0my $ucfirst_sign_off =3D ucfirst(lc($sign_off));<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0if ($sign_off !~ /$signature_tags/) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WARN(&quot;BAD_SIGN_OFF&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Non-standard signat=
ure: $sign_off\n&quot; . $herecurr);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0my $suggested_signature =3D &quot;&quot;=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (exists($standard_signature_fix{$sign=
_off})) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$suggested_s=
ignature =3D $standard_signature_fix{$sign_off};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ($suggested_signature eq &quot;&quot;=
) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WARN(&quot;B=
AD_SIGN_OFF&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;Non-standard signature: $sign_off\n&quot; . $herecurr);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elsif ($suggested_signature eq &quot;rem=
ove&quot;) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (WARN(&qu=
ot;BAD_SIGN_OFF&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;Non-standard signature: $sign_off. Please consider r=
emoving this signature tag.\n&quot; . $herecurr) &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$fix) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0fix_delete_line($fixlinenr, $rawline);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (WARN(&qu=
ot;BAD_SIGN_OFF&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;Non-standard signature: $sign_off. Please use &#39;$=
suggested_signature&#39; instead.\n&quot; . $herecurr) &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$fix) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0$fixed[$fixlinenr] =3D~ s/$sign_off/$suggested_signature/;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0if (defined $space_before &amp;&amp; $space_before ne &quot;&q=
uot;) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (WARN(&quot;BAD_SIGN_OFF&quot;,=
<br>
&gt; <br>
<br>
Initial tests performed on patches found this fix to be working as<br>
expected.<br>
<br>
Thanks<br>
Aditya<br>
</blockquote></div></div>

--000000000000a76c2705b48f9ef5--

--===============7952846940217841658==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============7952846940217841658==--
