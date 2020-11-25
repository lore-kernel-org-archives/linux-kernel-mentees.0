Return-Path: <SRS0=yuUc=E7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF600C56202
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 25 Nov 2020 19:34:52 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F38E207BB
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 25 Nov 2020 19:34:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VrLFVV4X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F38E207BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A7AB38701D;
	Wed, 25 Nov 2020 19:34:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g206y_BYF4-d; Wed, 25 Nov 2020 19:34:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1FB37854CC;
	Wed, 25 Nov 2020 19:34:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 046B2C163C;
	Wed, 25 Nov 2020 19:34:51 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AC1D5C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Nov 2020 19:34:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 92F7686E64
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Nov 2020 19:34:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mVEjB8rThCRB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Nov 2020 19:34:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id DD0D9854CC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Nov 2020 19:34:45 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id x15so3209638ilq.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Nov 2020 11:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fujsiEOGleqf2+bcSHZOCi/JVCaFLJ8JCULqGyIuBUg=;
 b=VrLFVV4Xj5wR/Zgk5IQMpD/XlhLjPA4yGV9xyxcfsqmpqT6eR4nvzPNP6hZMhm7CD0
 dz2gwHwY0FcO0tZnN04bqk14zGhh5NFStFFkth1YpwYgyT+No0tEpCwlEzEH50rWEVi2
 mvgOwRCICtrk/CmagtNzkYqJYCqMfB9VG0ijzyc5MorpD5QBt1YaC+XY2GYwJPpaltY2
 rvDhFcmNW1/IlEdvmfb5hTxiThXhqb9zC6XpavvYRzoF9jBiXUydM3vxltlnm4XEmsXv
 CjJON+FvdIN4A1qc8JGpliR/YDIZ/b1gO9xC4w9mi2+yywNpXHP+6XPErPLdtq1aJWBD
 +Zsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fujsiEOGleqf2+bcSHZOCi/JVCaFLJ8JCULqGyIuBUg=;
 b=dxVfHYnkk1zYDVeOzKMyo/mzvK1cMcgJoZMsX5U9NHwG+uvsQWMuo/VZnshxg2+blM
 IxbvkOgB8UqeGEA18QDbxmYCOsROTqDQdPLBGAJGZ0Cn8/UxmEc6RnXwbYfAlDYGvo/8
 q0LCN3yJ6MrdxdzvlTVtBPLxNzWUZ8ffAD1lmh3mSznr2eiPDxcq0hw0Uo7Aehd6borg
 2NOv71RcfSffzg8MWMFY+8DkFKi3SgCT+aTqcZa8lcaGD/hvRQSwXYDCb+kL4olX1eK+
 JkaBD8neJYtIGhGcIBIvuwQTcGMJkcPm7O0zPkfsu+IiRe3iedpJxvN6Ofo58UT9HQhr
 +w/A==
X-Gm-Message-State: AOAM533lJ4JAgLTOSDU178XR0Lm+WSf9kUHr9zJ+iNPxRBLyAKa6MkGT
 ARqmdrEWqtH7qVCkutzamakErsdX5wM6HUg1p9E=
X-Google-Smtp-Source: ABdhPJyPRHbt1b+Kfhi0uEeOHOh5S1PhRzoJU4AOoPC4fVSujA6rRIML3GzEOSqnwOOMl3oDdWU6OFz+R8aeE1lQlKI=
X-Received: by 2002:a92:aacc:: with SMTP id p73mr4366709ill.64.1606332885134; 
 Wed, 25 Nov 2020 11:34:45 -0800 (PST)
MIME-Version: 1.0
References: <20201125190444.167045-1-dwaipayanray1@gmail.com>
In-Reply-To: <20201125190444.167045-1-dwaipayanray1@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Wed, 25 Nov 2020 20:34:33 +0100
Message-ID: <CAKXUXMzehKhxZwgUSUUuG8Ve-3FApGEnt9HUaqiZSHxN76rgFQ@mail.gmail.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH RFC] checkpatch: add warning for
 unnecessary use of %h[xudi] and %hh[xudi]
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
Content-Type: multipart/mixed; boundary="===============6326631094005749367=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============6326631094005749367==
Content-Type: multipart/alternative; boundary="00000000000002750c05b4f38581"

--00000000000002750c05b4f38581
Content-Type: text/plain; charset="UTF-8"

On Mi., 25. Nov. 2020 at 20:05, Dwaipayan Ray <dwaipayanray1@gmail.com>
wrote:

> Modifiers %h and %hh should never be used.
>
> Commit cbacb5ab0aa0 ("docs: printk-formats: Stop encouraging use
> of unnecessary %h[xudi] and %hh[xudi]") specifies that:
>
> "Standard integer promotion is already done and %hx and %hhx is useless
> so do not encourage the use of %hh[xudi] or %h[xudi]."
>
> "The "h" and "hh" things should never be used. The only reason for them
> being used if you have an "int", but you want to print it out as a
> "char" (and honestly, that is a really bad reason, you'd be better off
> just using a proper cast to make the code more obvious)."
>
> Add a new check to emit a warning on finding an unneeded use of %h or
> %hh modifier.
>

Looks good. You might want to add the link to the original email discussion
on lore.kernel.org in the commit message with Link:

Lukas


> Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> ---
>  scripts/checkpatch.pl | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 7dc094445d83..47c1017a9973 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -6570,6 +6570,19 @@ sub process {
>                         }
>                 }
>
> +# check for unnecessary use of %h[xudi] and %hh[xudi]
> +               if ($perl_version_ok &&
> +                   defined $stat &&
> +                   $line =~
> /(?:[sd]?print[kfd]|(?:pr_|drm_)(?:info|debug|warn|error))/i) {
> +                       my $lc = $stat =~ tr@\n@@;
> +                       $lc = $lc + $linenr;
> +                       my $stat_real = get_stat_real($linenr, $lc);
> +                       if ($stat_real =~
> /\"[^\"]*%[\d\.\*\-]*h+[idux].*\"/i) {
> +                               WARN("UNNECESSARY_MODIFIER",
> +                                    "Unnecessary use of length modifiers
> %h[xudi] or %hh[xudi]\n" . "$here\n$stat_real\n");
> +                       }
> +               }
> +
>  # check for naked sscanf
>                 if ($perl_version_ok &&
>                     defined $stat &&
> --
> 2.27.0
>
>

--00000000000002750c05b4f38581
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"auto">On Mi.=
, 25. Nov. 2020 at 20:05, Dwaipayan Ray &lt;<a href=3D"mailto:dwaipayanray1=
@gmail.com">dwaipayanray1@gmail.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">Modifiers %h and %hh should never be used.<br>
<br>
Commit cbacb5ab0aa0 (&quot;docs: printk-formats: Stop encouraging use<br>
of unnecessary %h[xudi] and %hh[xudi]&quot;) specifies that:<br>
<br>
&quot;Standard integer promotion is already done and %hx and %hhx is useles=
s<br>
so do not encourage the use of %hh[xudi] or %h[xudi].&quot;<br>
<br>
&quot;The &quot;h&quot; and &quot;hh&quot; things should never be used. The=
 only reason for them<br>
being used if you have an &quot;int&quot;, but you want to print it out as =
a<br>
&quot;char&quot; (and honestly, that is a really bad reason, you&#39;d be b=
etter off<br>
just using a proper cast to make the code more obvious).&quot;<br>
<br>
Add a new check to emit a warning on finding an unneeded use of %h or<br>
%hh modifier.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Looks good. You =
might want to add the link to the original email discussion on <a href=3D"h=
ttp://lore.kernel.org">lore.kernel.org</a> in the commit message with Link:=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">Lukas</div><div dir=3D"=
auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><br>
Suggested-by: Lukas Bulwahn &lt;<a href=3D"mailto:lukas.bulwahn@gmail.com" =
target=3D"_blank">lukas.bulwahn@gmail.com</a>&gt;<br>
Signed-off-by: Dwaipayan Ray &lt;<a href=3D"mailto:dwaipayanray1@gmail.com"=
 target=3D"_blank">dwaipayanray1@gmail.com</a>&gt;<br>
---<br>
=C2=A0scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D=
"_blank">checkpatch.pl</a> | 13 +++++++++++++<br>
=C2=A01 file changed, 13 insertions(+)<br>
<br>
diff --git a/scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" ta=
rget=3D"_blank">checkpatch.pl</a> b/scripts/<a href=3D"http://checkpatch.pl=
" rel=3D"noreferrer" target=3D"_blank">checkpatch.pl</a><br>
index 7dc094445d83..47c1017a9973 100755<br>
--- a/scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D=
"_blank">checkpatch.pl</a><br>
+++ b/scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D=
"_blank">checkpatch.pl</a><br>
@@ -6570,6 +6570,19 @@ sub process {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
+# check for unnecessary use of %h[xudi] and %hh[xudi]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ($perl_version_o=
k &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0defin=
ed $stat &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$line=
 =3D~ /(?:[sd]?print[kfd]|(?:pr_|drm_)(?:info|debug|warn|error))/i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0my $lc =3D $stat =3D~ tr@\n@@;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0$lc =3D $lc + $linenr;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0my $stat_real =3D get_stat_real($linenr, $lc);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if ($stat_real =3D~ /\&quot;[^\&quot;]*%[\d\.\*\-]*h+[idux].*\&qu=
ot;/i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WARN(&quot;UNNECESSARY_MODIFIER&quot;=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Unnecessary use =
of length modifiers %h[xudi] or %hh[xudi]\n&quot; . &quot;$here\n$stat_real=
\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
=C2=A0# check for naked sscanf<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ($perl_version_o=
k &amp;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 defin=
ed $stat &amp;&amp;<br>
-- <br>
2.27.0<br>
<br>
</blockquote></div></div>

--00000000000002750c05b4f38581--

--===============6326631094005749367==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============6326631094005749367==--
