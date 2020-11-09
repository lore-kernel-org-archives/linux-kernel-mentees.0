Return-Path: <SRS0=nBzY=EP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78E3FC56201
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  9 Nov 2020 13:40:54 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEFAE20658
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  9 Nov 2020 13:40:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GIljPGrT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEFAE20658
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 69280203FC;
	Mon,  9 Nov 2020 13:40:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3rpPPW6nmQ16; Mon,  9 Nov 2020 13:40:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id BB7F52002B;
	Mon,  9 Nov 2020 13:40:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B0B29C0889;
	Mon,  9 Nov 2020 13:40:52 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 501E7C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Nov 2020 13:40:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3C0D2203FC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Nov 2020 13:40:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rEESvdl9ppcq
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Nov 2020 13:40:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by silver.osuosl.org (Postfix) with ESMTPS id 8AB3E2002B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Nov 2020 13:40:49 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id u21so9760581iol.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 09 Nov 2020 05:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=61SFV3Odi6j4JPTAQHCZwmj/N5WFHhj/ghYNoVO/CU8=;
 b=GIljPGrTx7MHDQ3sIg5Y89eWa+J9EqLbi6/2rMyiPk+zJ1aR70BWU+txqe2wNDroyw
 pvXHN1DDS7R50lXs0L4g1/wbrFN66PV5woeaES4DM6Yx0umSEiBEqlo7h/p0Snm6/sr0
 AOT+2GX3ltCqPznsTiLWXsNOIJrYvkl9iXgfTVDYvh/B0+zdym0pyC8nnFzkazZoK6Oj
 0kGTIy8ol+unVWKWxd4ZxwrWm9t58d7PL89SsidQqWWSOVuMuBshTpmDqPTSeNB0nzqi
 bu4ujONfv7cPq+UdMebn0FUsyAl68D62F8M4v2a6XKgmAdGOcUqCF9jV3bE7CRmo9mq1
 OU2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=61SFV3Odi6j4JPTAQHCZwmj/N5WFHhj/ghYNoVO/CU8=;
 b=VZqZE4W6gL1HRxJFFSmUgOdMy8ibtqfW98nPHUYC4fCGsNl+ra0QYtrlosC7h/+Fx/
 Y7/YDS1JtAY+dHCL633cl5yJMVRO6dKMPotcK5KbSXSOZzn+qJvyuW7YP9ABbCqTO3Ed
 cw11PmitYy7cxfxe4t69rN3saba2pLPewILJLyUjSWvFvlYC128e3SjSphWlNKsM1OCx
 JV1gOcBvMkNJkISkirSbhCZo7XLk5GBH9xCMJFAkrDFRH9amJNu8gbFAu7kjQVg6i6Mn
 EgBHgdOSDUJRf15SXqsMK+yRT4UKsGsMR7rm4QXF8SPM30jeSCOvQ8/iq9pLUe461i1J
 e33w==
X-Gm-Message-State: AOAM5322grppd3aKbXTQ7N5DASFVFy8DKbZhpZ564zS9wwkGBrACpQT2
 MmFJBBa0SImOuljHAfb3LFs2yeW0sltu8z6NiyY=
X-Google-Smtp-Source: ABdhPJw8G/+0Rrw9iw/nt8o2ZJ6dZJ0Y1VJPp+zR6FQGAEfXfZ84im8jtqnD8adOI6zlU3QyZilmtysfG8D+OFM2sJw=
X-Received: by 2002:a5d:990e:: with SMTP id x14mr3625952iol.158.1604929248804; 
 Mon, 09 Nov 2020 05:40:48 -0800 (PST)
MIME-Version: 1.0
References: <20201109131040.19266-1-yashsri421@gmail.com>
In-Reply-To: <20201109131040.19266-1-yashsri421@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 9 Nov 2020 14:40:37 +0100
Message-ID: <CAKXUXMyVqjG+XvZ+dnB=3NEnGcNOtcYFW2r5cJ3KCEzTE35rXQ@mail.gmail.com>
To: Aditya Srivastava <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add fix option for
	MISSING_SIGN_OFF
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
Content-Type: multipart/mixed; boundary="===============7962288307716713216=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============7962288307716713216==
Content-Type: multipart/alternative; boundary="000000000000c3c70d05b3acb50c"

--000000000000c3c70d05b3acb50c
Content-Type: text/plain; charset="UTF-8"

On Mo., 9. Nov. 2020 at 14:10, Aditya Srivastava <yashsri421@gmail.com>
wrote:

> Currently checkpatch warns us if there is no 'Signed-off-by' line
> for the patch.
>
> E.g., running checkpatch on commit f68e7927212f ("Revert
> "powerpc/book3s32: Reorder _PAGE_XXX flags to simplify TLB handling"")
> reports this error:
>
> ERROR: Missing Signed-off-by: line(s)
>
> Provide a fix by adding a Signed-off-by line corresponding to the author
> of the patch before the start of diff(s)
>

Can you please provide an evaluation first?

As far as remember, the fix is often not to add a Signed-off-by: tag but it
requires something completely different.

Lukas


> Suggested-by: Joe Perches <joe@perches.com>
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
>  scripts/checkpatch.pl | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index cb46288127ac..bc447aa4e5b0 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2404,6 +2404,7 @@ sub process {
>
>         my $last_blank_line = 0;
>         my $last_coalesced_string_linenr = -1;
> +       my $diff_linenr = 0;
>
>         our @report = ();
>         our $cnt_lines = 0;
> @@ -2602,6 +2603,10 @@ sub process {
>                         $realfile =~ s@^([^/]*)/@@ if (!$file);
>                         $in_commit_log = 0;
>                         $found_file = 1;
> +                       # to add missing sign off line before diff(s)
> +                       if($diff_linenr == 0) {
> +                               $diff_linenr = $fixlinenr;
> +                       }
>                 } elsif ($line =~ /^\+\+\+\s+(\S+)/) {
>                         $realfile = $1;
>                         $realfile =~ s@^([^/]*)/@@ if (!$file);
> @@ -7119,8 +7124,11 @@ sub process {
>         }
>         if ($is_patch && $has_commit_log && $chk_signoff) {
>                 if ($signoff == 0) {
> -                       ERROR("MISSING_SIGN_OFF",
> -                             "Missing Signed-off-by: line(s)\n");
> +                       if (ERROR("MISSING_SIGN_OFF",
> +                                 "Missing Signed-off-by: line(s)\n") &&
> +                           $fix) {
> +                               fix_insert_line($diff_linenr,
> "Signed-off-by: $author\n");
> +                       }
>                 } elsif ($authorsignoff != 1) {
>                         # authorsignoff values:
>                         # 0 -> missing sign off
> --
> 2.17.1
>
>

--000000000000c3c70d05b3acb50c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"auto">On Mo.=
, 9. Nov. 2020 at 14:10, Aditya Srivastava &lt;<a href=3D"mailto:yashsri421=
@gmail.com">yashsri421@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">Currently checkpatch warns us if there is no &#39;Signed-off-=
by&#39; line<br>
for the patch.<br>
<br>
E.g., running checkpatch on commit f68e7927212f (&quot;Revert<br>
&quot;powerpc/book3s32: Reorder _PAGE_XXX flags to simplify TLB handling&qu=
ot;&quot;)<br>
reports this error:<br>
<br>
ERROR: Missing Signed-off-by: line(s)<br>
<br>
Provide a fix by adding a Signed-off-by line corresponding to the author<br=
>
of the patch before the start of diff(s)<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Can you please p=
rovide an evaluation first?</div><div dir=3D"auto"><br></div><div dir=3D"au=
to">As far as remember, the fix is often not to add a Signed-off-by: tag bu=
t it requires something completely different.</div><div dir=3D"auto"><br></=
div><div dir=3D"auto">Lukas</div><div dir=3D"auto"><br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex"><br>
Suggested-by: Joe Perches &lt;<a href=3D"mailto:joe@perches.com" target=3D"=
_blank">joe@perches.com</a>&gt;<br>
Signed-off-by: Aditya Srivastava &lt;<a href=3D"mailto:yashsri421@gmail.com=
" target=3D"_blank">yashsri421@gmail.com</a>&gt;<br>
---<br>
=C2=A0scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D=
"_blank">checkpatch.pl</a> | 12 ++++++++++--<br>
=C2=A01 file changed, 10 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" ta=
rget=3D"_blank">checkpatch.pl</a> b/scripts/<a href=3D"http://checkpatch.pl=
" rel=3D"noreferrer" target=3D"_blank">checkpatch.pl</a><br>
index cb46288127ac..bc447aa4e5b0 100755<br>
--- a/scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D=
"_blank">checkpatch.pl</a><br>
+++ b/scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D=
"_blank">checkpatch.pl</a><br>
@@ -2404,6 +2404,7 @@ sub process {<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 my $last_blank_line =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 my $last_coalesced_string_linenr =3D -1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0my $diff_linenr =3D 0;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 our @report =3D ();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 our $cnt_lines =3D 0;<br>
@@ -2602,6 +2603,10 @@ sub process {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 $realfile =3D~ s@^([^/]*)/@@ if (!$file);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 $in_commit_log =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 $found_file =3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0# to add missing sign off line before diff(s)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if($diff_linenr =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$diff_linenr =3D $fixlinenr;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } elsif ($line =3D~=
 /^\+\+\+\s+(\S+)/) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 $realfile =3D $1;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 $realfile =3D~ s@^([^/]*)/@@ if (!$file);<br>
@@ -7119,8 +7124,11 @@ sub process {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ($is_patch &amp;&amp; $has_commit_log &amp;&=
amp; $chk_signoff) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ($signoff =3D=3D=
 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ERROR(&quot;MISSING_SIGN_OFF&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Missing Signed-off-by: line(s)\n&quot;=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (ERROR(&quot;MISSING_SIGN_OFF&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Missing Signed-off-by: l=
ine(s)\n&quot;) &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0$fix) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fix_insert_line($diff_linenr, &quot;S=
igned-off-by: $author\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } elsif ($authorsig=
noff !=3D 1) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 # authorsignoff values:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 # 0 -&gt; missing sign off<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div></div>

--000000000000c3c70d05b3acb50c--

--===============7962288307716713216==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============7962288307716713216==--
