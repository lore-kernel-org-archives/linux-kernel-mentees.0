Return-Path: <SRS0=eJeJ=A6=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_20,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77DBCC433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 19 Jul 2020 17:37:08 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 412C720B1F
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 19 Jul 2020 17:37:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MvaTfUkM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 412C720B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0C5B487A11;
	Sun, 19 Jul 2020 17:37:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0IT3pvwX-O0f; Sun, 19 Jul 2020 17:37:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7D0CF879CD;
	Sun, 19 Jul 2020 17:37:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 64D58C0890;
	Sun, 19 Jul 2020 17:37:07 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 85A32C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 19 Jul 2020 17:37:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 677242040F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 19 Jul 2020 17:37:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gOceHyPa-XWa
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 19 Jul 2020 17:37:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by silver.osuosl.org (Postfix) with ESMTPS id 4F71420000
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 19 Jul 2020 17:37:04 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id q74so15329187iod.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 19 Jul 2020 10:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UYMA7Acd8+10nfDGduatyKhWgbM4v/GbjepHYHmu2SM=;
 b=MvaTfUkMx63+luVbAohdQ20NuUmTPcVBD5crHHz2JRdvx4PsHQaoVzqB8wDb8tS9Qj
 F2V9RlVik0Y7gdLLcuzoO+lvtF74xhubNO9via2IuAtyWOnKPrc5Z9JhIRn2aJKXt9z7
 E6GOjOGc0ULTaWWW2tB3pdS6SxxbLdzH3C/+GQf1hGFpYtMkWiHT6Egneg4+izhwdEXq
 CAhu2/vrrlpTmjOWIttvsM5u97I3S0SVq7N4wEzuioIMN4b/vkhAZ83srFML+eDvthxR
 6aNxDZy0oMej/MjF+muk6CnZ4FyZtEOX6yMOMN0WEbthZJEwb69YNrr5VrYj9wwT3i2n
 1VZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UYMA7Acd8+10nfDGduatyKhWgbM4v/GbjepHYHmu2SM=;
 b=i4N5GFm/eAcreORp6FDuUvm2qu0yBcsXxAJiurI8xgVEw6dJIgM1N6gKrD7cxDwAEA
 MeJ3Me/opVwFkIFTT2iG2bX+NvytmD3/VL5bqlEtPZkE9EoJx/7/T/WA205UHTH280w4
 6QQcea1wLq+iBlBmqtyoasA5TGNXui8FqIwUujFc0BmQx/6ed2ZBQOR+Mo3cnPHH0gvE
 ur2UdUp5jItA9ng59bTw+m/rTb4Mtu4vHW65UtqhYYGOAOyTd5hb8fBR873zmJvu7ib8
 shyZVYXtZDMggO9Ste77Bg8uXDIiCigRFyr8XpkLzlMYgKBjgtFqXWxxzM+oL8cbBBKo
 SZ9w==
X-Gm-Message-State: AOAM531U8jBRxb65H/raypIxpy+jz2ThSEwXwarzbrK1e+fX9v+4jRw+
 oASA0/GgWh/xOaDT2btidWTH85bQCdPkuClyolA=
X-Google-Smtp-Source: ABdhPJy9XEPE1jdWkRcXzAri72eoW8/35bG+hFGWa6avoTyJvzTNB34tZkiFD8aJq+goaxcjb5J6ErJKsvnnoWdRPTQ=
X-Received: by 2002:a05:6638:1187:: with SMTP id
 f7mr22575631jas.21.1595180223454; 
 Sun, 19 Jul 2020 10:37:03 -0700 (PDT)
MIME-Version: 1.0
References: <nachiketun8@gmail.com>
 <20200719171554.264462-1-nachiketun8@gmail.com>
In-Reply-To: <20200719171554.264462-1-nachiketun8@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sun, 19 Jul 2020 19:36:50 +0200
Message-ID: <CAKXUXMx3pkpY9Ud=VRf5EVVpr2ThvBTyF9Lr6Hw+CCRFvO7AbQ@mail.gmail.com>
To: Nachiket Naganure <nachiketun8@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] Checkpatch: Disables commit
 length check/warning in commit log in case of valid signature tags
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
Content-Type: multipart/mixed; boundary="===============4733722096458018914=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============4733722096458018914==
Content-Type: multipart/alternative; boundary="0000000000009269ec05aaced63f"

--0000000000009269ec05aaced63f
Content-Type: text/plain; charset="UTF-8"

Did you checkpatch this patch?

You need to provide a rationale. Use a full checkpatch.pl evaluation data
for showing the difference before and after applying the patch.

Lukas

On So., 19. Juli 2020 at 19:16, Nachiket Naganure <nachiketun8@gmail.com>
wrote:

> From: NachiketUN <nachiketun8@gmail.com>
>
> Signed-off-by: NachiketUN <nachiketun8@gmail.com>
> ---
>  scripts/checkpatch.pl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 197436b20288..8db0f26601c5 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2799,7 +2799,7 @@ sub process {
>
>  # Check for line lengths > 75 in commit log, warn once
>                 if ($in_commit_log && !$commit_log_long_line &&
> -                   length($line) > 75 &&
> +                   length($line) > 75 && $line !~ /$signature_tags/ &&
>                     !($line =~ /^\s*[a-zA-Z0-9_\/\.]+\s+\|\s+\d+/ ||
>                                         # file delta changes
>                       $line =~ /^\s*(?:[\w\.\-]+\/)++[\w\.\-]+:/ ||
> --
> 2.25.1
>
>

--0000000000009269ec05aaced63f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Did you checkpatch this patch?</div></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">You need to provide a rationale. Use =
a full <a href=3D"http://checkpatch.pl">checkpatch.pl</a> evaluation data f=
or showing the difference before and after applying the patch.</div><div di=
r=3D"auto"><br></div><div dir=3D"auto">Lukas</div><div><br><div class=3D"gm=
ail_quote"><div>On So., 19. Juli 2020 at 19:16, Nachiket Naganure &lt;<a hr=
ef=3D"mailto:nachiketun8@gmail.com">nachiketun8@gmail.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">From: NachiketUN &lt;<a href=3D"mailt=
o:nachiketun8@gmail.com" target=3D"_blank">nachiketun8@gmail.com</a>&gt;<br=
>
<br>
Signed-off-by: NachiketUN &lt;<a href=3D"mailto:nachiketun8@gmail.com" targ=
et=3D"_blank">nachiketun8@gmail.com</a>&gt;<br>
---<br>
=C2=A0scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D=
"_blank">checkpatch.pl</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" ta=
rget=3D"_blank">checkpatch.pl</a> b/scripts/<a href=3D"http://checkpatch.pl=
" rel=3D"noreferrer" target=3D"_blank">checkpatch.pl</a><br>
index 197436b20288..8db0f26601c5 100755<br>
--- a/scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D=
"_blank">checkpatch.pl</a><br>
+++ b/scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D=
"_blank">checkpatch.pl</a><br>
@@ -2799,7 +2799,7 @@ sub process {<br>
<br>
=C2=A0# Check for line lengths &gt; 75 in commit log, warn once<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ($in_commit_log =
&amp;&amp; !$commit_log_long_line &amp;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lengt=
h($line) &gt; 75 &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lengt=
h($line) &gt; 75 &amp;&amp; $line !~ /$signature_tags/ &amp;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !($li=
ne =3D~ /^\s*[a-zA-Z0-9_\/\.]+\s+\|\s+\d+/ ||<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # file d=
elta changes<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 $line =3D~ /^\s*(?:[\w\.\-]+\/)++[\w\.\-]+:/ ||<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--0000000000009269ec05aaced63f--

--===============4733722096458018914==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============4733722096458018914==--
