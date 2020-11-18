Return-Path: <SRS0=ImFK=EY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5829BC5519F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Nov 2020 19:01:15 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E14020639
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Nov 2020 19:01:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jNRuEK2G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E14020639
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 086B78726A;
	Wed, 18 Nov 2020 19:01:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cU9BXBvvaNVZ; Wed, 18 Nov 2020 19:01:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 58F0086135;
	Wed, 18 Nov 2020 19:01:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4363CC0891;
	Wed, 18 Nov 2020 19:01:10 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 12F1BC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 19:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id EC4E085876
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 19:01:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H_6lC28EWBxC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 19:01:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 371DA855B1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 19:01:08 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id n129so3188853iod.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 11:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+AN+K1Fh7cJDrtjaWkJZlxAOBDfdGFybaUcAorKcdgY=;
 b=jNRuEK2GiaruoqkC3G0pZ9Z/hmv1ynEjycxZ6X6BDJlwTbVVra32gpBzNggoHlI2Z1
 lfaU43WBTm9t2kTrGDO1bLpyn9jkGyI9K/eLBNCp7q5Wq2Sh49aA57s61+IHj+bOD843
 qDI78ZFMCZX+SMaIwqSrCsPGG8I/q+ba2uFRd64um2aLEPe52c/2kfdeap0EFLRCu5e3
 jVrvmNeCdNi6xfRyaCSKaos4Y8mRA21Zdm8S9Rw3xx6qAlBSHsQQXhT+DVndcITcC4Jz
 ki3mc0ZpY6mScXv43ewS4v3T/ARDo735iI9k3mK6Nwd6OlIjvBaWHAD949RqORwcL9ne
 Ty3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+AN+K1Fh7cJDrtjaWkJZlxAOBDfdGFybaUcAorKcdgY=;
 b=M0BUNud1HptFvo5xRzHoC6qkqAc2fbzbDdHiB7ExDbEuCQhVR7kDJ2XXegmsHYMrii
 XDb4E82FpA2TDsY+SEfzV7z/6xOyLdGCdsTWMh/f/6PGYyGPZtz03dy081K8gzD5A/J+
 t0i0uZpUP0I1MFbVHpCIusG9o3hjFBjBeywYe4KrWLMO3rioo1PpHpWSTwAvYEZVN2Qw
 5CG2HHsaKwVpBjnpL6Q285c5iIL8hSag5JLH87KZWATNCLDI8X5OVPQY/Fu/g9lGMbzE
 qB6EM1otFBjm7xJkyW45Vv3n6MLxnaaCKgQ3HdYxqiIuwNJAil9kdeXRGyDjYCnkAeTu
 wrMw==
X-Gm-Message-State: AOAM530YgdIST/2xBHRYbWkjWUgarGjeoOI6UQRNYtxhzEnItyyNy58U
 XbYTuGuziByQLmDaxHlfw8hzXH8hLYLGwKsuLYdtYrpF5Bw=
X-Google-Smtp-Source: ABdhPJyQ1DJ3WckJQbwy36Y81ML8SZl2jeEKaxUSCVj3CdOhEvQmX2RhfddOstBJ6a2p5XX1N81IOdl6VS6RwKg53j0=
X-Received: by 2002:a6b:c047:: with SMTP id q68mr16590022iof.189.1605726067002; 
 Wed, 18 Nov 2020 11:01:07 -0800 (PST)
MIME-Version: 1.0
References: <357371d0-a445-181a-3565-a3ec0debc622@gmail.com>
 <20201118173950.32660-1-yashsri421@gmail.com>
In-Reply-To: <20201118173950.32660-1-yashsri421@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Wed, 18 Nov 2020 20:00:54 +0100
Message-ID: <CAKXUXMw=NnO4pU01bmTH+pkLckcJzByPktGJPuLf9st+x4VbXQ@mail.gmail.com>
To: Aditya Srivastava <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: add fix option
	for NETWORKING_BLOCK_COMMENT_STYLE
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
Content-Type: multipart/mixed; boundary="===============4394336374282286829=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============4394336374282286829==
Content-Type: multipart/alternative; boundary="000000000000d4924105b4663b51"

--000000000000d4924105b4663b51
Content-Type: text/plain; charset="UTF-8"

On Mi., 18. Nov. 2020 at 18:40, Aditya Srivastava <yashsri421@gmail.com>
wrote:

> Currently, checkpatch warns us for files in 'net/' and 'drivers/net',
> if we use an empty '/*' line for comment and contents of comments are
> in next line
>
> E.g., running checkpatch on commit 0d52497ac8ee ("iwlwifi: pcie: remove
> the refs / unrefs from the transport") reports this warning:
>
> WARNING: networking block comments don't use an empty /* line, use /*
> Comment...
> +               /*
> +                * If the TXQ is active, then set the timer, if not,
>
> Provide a fix by appending the current line contents to previous line
> and removing the current line
>

Patch generally looks good.

Can you check how many comments in net actually follow that style and how
many follow another style?


Lukas


> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
> Changes in v2: modify commit message: add information about networking
> files in commit message
>
>  scripts/checkpatch.pl | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index f61ac7456151..90e863d63097 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3629,8 +3629,14 @@ sub process {
>                     $prevrawline =~ /^\+[ \t]*\/\*[ \t]*$/ &&
>                     $rawline =~ /^\+[ \t]*\*/ &&
>                     $realline > 3) { # Do not warn about the initial
> copyright comment block after SPDX-License-Identifier
> -                       WARN("NETWORKING_BLOCK_COMMENT_STYLE",
> -                            "networking block comments don't use an empty
> /* line, use /* Comment...\n" . $hereprev);
> +                       if (WARN("NETWORKING_BLOCK_COMMENT_STYLE",
> +                                "networking block comments don't use an
> empty /* line, use /* Comment...\n" . $hereprev) &&\
> +                           $fix) {
> +                               if ($rawline =~ /^\+[ \t]*\*\s*(.*)/) {
> +                                       fix_delete_line($fixlinenr,
> $rawline);
> +                                       $fixed[$fixlinenr - 1] .= " $1";
> +                               }
> +                       }
>                 }
>
>  # Block comments use * on subsequent lines
> --
> 2.17.1
>
>

--000000000000d4924105b4663b51
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"auto">On Mi.=
, 18. Nov. 2020 at 18:40, Aditya Srivastava &lt;<a href=3D"mailto:yashsri42=
1@gmail.com">yashsri421@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">Currently, checkpatch warns us for files in &#39;net/&#39; an=
d &#39;drivers/net&#39;,<br>
if we use an empty &#39;/*&#39; line for comment and contents of comments a=
re<br>
in next line<br>
<br>
E.g., running checkpatch on commit 0d52497ac8ee (&quot;iwlwifi: pcie: remov=
e<br>
the refs / unrefs from the transport&quot;) reports this warning:<br>
<br>
WARNING: networking block comments don&#39;t use an empty /* line, use /* C=
omment...<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * If the TXQ is ac=
tive, then set the timer, if not,<br>
<br>
Provide a fix by appending the current line contents to previous line<br>
and removing the current line<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Patch generally =
looks good.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Can you chec=
k how many comments in net actually follow that style and how many follow a=
nother style?</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">Lukas</div><div dir=3D"auto"><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><br>
Signed-off-by: Aditya Srivastava &lt;<a href=3D"mailto:yashsri421@gmail.com=
" target=3D"_blank">yashsri421@gmail.com</a>&gt;<br>
---<br>
Changes in v2: modify commit message: add information about networking file=
s in commit message<br>
<br>
=C2=A0scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D=
"_blank">checkpatch.pl</a> | 10 ++++++++--<br>
=C2=A01 file changed, 8 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" ta=
rget=3D"_blank">checkpatch.pl</a> b/scripts/<a href=3D"http://checkpatch.pl=
" rel=3D"noreferrer" target=3D"_blank">checkpatch.pl</a><br>
index f61ac7456151..90e863d63097 100755<br>
--- a/scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D=
"_blank">checkpatch.pl</a><br>
+++ b/scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D=
"_blank">checkpatch.pl</a><br>
@@ -3629,8 +3629,14 @@ sub process {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $prev=
rawline =3D~ /^\+[ \t]*\/\*[ \t]*$/ &amp;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $rawl=
ine =3D~ /^\+[ \t]*\*/ &amp;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $real=
line &gt; 3) { # Do not warn about the initial copyright comment block afte=
r SPDX-License-Identifier<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0WARN(&quot;NETWORKING_BLOCK_COMMENT_STYLE&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;networking block comments don&#39;t use an e=
mpty /* line, use /* Comment...\n&quot; . $hereprev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (WARN(&quot;NETWORKING_BLOCK_COMMENT_STYLE&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;networking block comments don&=
#39;t use an empty /* line, use /* Comment...\n&quot; . $hereprev) &amp;&am=
p;\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0$fix) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ($rawline =3D~ /^\+[ \t]*\*\s*(.*)=
/) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fix_delet=
e_line($fixlinenr, $rawline);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$fixed[$f=
ixlinenr - 1] .=3D &quot; $1&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0# Block comments use * on subsequent lines<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div></div>

--000000000000d4924105b4663b51--

--===============4394336374282286829==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============4394336374282286829==--
