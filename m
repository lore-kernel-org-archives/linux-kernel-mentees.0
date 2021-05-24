Return-Path: <SRS0=DeHd=KT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61167C04FF3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 24 May 2021 13:27:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 054E961248
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 24 May 2021 13:27:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 054E961248
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC0034018D;
	Mon, 24 May 2021 13:27:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T1Y4bWSRzDgV; Mon, 24 May 2021 13:27:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id B439040114;
	Mon, 24 May 2021 13:27:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 92462C000E;
	Mon, 24 May 2021 13:27:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 61305C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 May 2021 13:27:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4777F60712
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 May 2021 13:27:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linaro.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kaqyYkiInnNJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 May 2021 13:27:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 634C2606E7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 May 2021 13:27:06 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id e17so10237093pfl.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 May 2021 06:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sSL5I8sqS11uXwQyCOAK5YsvKUgnE/vG/JIKkLi7U6Y=;
 b=kqFK5gsf4BjA4z2B0iMFCM2WWVh0B85gCobNly7BU9M0JBTr+ColT5PX8Nl/biHnBk
 3BFWsY2zNnfnxlOuTXoNEfksUWZznn/RbNoAbYftcrPHkO1xQORUBFIDXTenrOOkEovS
 l8br8HzoikZvXgc9O18SMrWu6Ic7V2SObzzJKYCPMbxG+LK/vUkheTgcbpLU44aysF2a
 BeHSRevUSRD2HmY4LdAmnRdDw5hRaHvhxnBjsNSDOqaTqPfyzztlCWE3+jIZ6Z+RE2YO
 /zfFYb6JuDbtxTXzzfMsQDyPyID/vKa0Ga0YZumgwzulOayv8b5BdHN7rjj8tysu06fA
 FHLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sSL5I8sqS11uXwQyCOAK5YsvKUgnE/vG/JIKkLi7U6Y=;
 b=ubj9gqjyLk/1QE8jia61blKvMfUa78UKk9pUs9UKi+i1fUqxkKoVEJrY/ARc3b+751
 ICgKRHB3R7BgM5CYiDsCq3J7yD1kZWLPSa6X0ouKozrek+G+JzPehgGBJgKODF9fkt2K
 aj0mLt+W0cDt3ir3B39sNhEtRxTB7QxlQCzcj7SnF1+BzB2atbICXqbmaQ2i5mrltMfP
 yf6zbGOxoAKAvggoftOW5mVpu4r5XJzRYLHOicPvc/v1oIHleR9DTEwgAqNDfzpN9YX5
 50NVKFEnLkF7eOjyJWRGTuokep3Qjf1afSJkuOAdESCoe6YXFSZ41Hd5lCIxI+xCE7yo
 h4dA==
X-Gm-Message-State: AOAM533id5IGZNI/hAM90HYMzwrHS+wn7Ro28/0FcDnH87E889Vzy4zW
 K+h6sWQWgB7eqVfYrYF1j/sIOHZh9LifaP7NfE4qWQ==
X-Google-Smtp-Source: ABdhPJwf2LfotxHOx92V13B4rJEUXFstP6wNixZHPyWhe7PavezF+r73Yuc8dyPyVhYm0LI+MooviHg241X7/xdAbLI=
X-Received: by 2002:a63:4e12:: with SMTP id c18mr13497070pgb.451.1621862825839; 
 Mon, 24 May 2021 06:27:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210329092945.13152-1-yashsri421@gmail.com>
In-Reply-To: <20210329092945.13152-1-yashsri421@gmail.com>
From: Lee Jones <lee.jones@linaro.org>
Date: Mon, 24 May 2021 14:26:54 +0100
Message-ID: <CAF2Aj3gZJnCGYiKNsy7QzxLtVTjZrp9Up8ZDfAxp4fb2tjVXjg@mail.gmail.com>
Subject: Re: [PATCH] scripts: kernel-doc: add warning for comment not
 following kernel-doc syntax
To: Aditya Srivastava <yashsri421@gmail.com>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 open list <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>
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
Content-Type: multipart/mixed; boundary="===============7035482889876811453=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============7035482889876811453==
Content-Type: multipart/alternative; boundary="0000000000009be5b905c3135de4"

--0000000000009be5b905c3135de4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 29 Mar 2021 at 10:30, Aditya Srivastava <yashsri421@gmail.com>
wrote:

> Currently, kernel-doc start parsing the comment as a kernel-doc comment i=
f
> it starts with '/**', but does not take into account if the content insid=
e
> the comment too, adheres with the expected format.
> This results in unexpected and unclear warnings for the user.
>
> E.g., running scripts/kernel-doc -none mm/memcontrol.c emits:
> "mm/memcontrol.c:961: warning: expecting prototype for do not fallback to
> current(). Prototype was for get_mem_cgroup_from_current() instead"
>
> Here kernel-doc parses the corresponding comment as a kernel-doc comment
> and expects prototype for it in the next lines, and as a result causing
> this warning.
>

Actually this patch makes things worse by obfuscating the issue.  It was
way better before.

In the example you give, it's obvious to me that there is descriptive text
where the prototype should be.

Now I just get a warning that this "isn't a kernel-doc comment", which a)
is not correct and b) could mean anything.

Please consider reverting this patch, as it does the opposite of its intent=
.

Provide a clearer warning message to the users regarding the same, if the
> content inside the comment does not follow the kernel-doc expected format=
.
>
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
>  scripts/kernel-doc | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/kernel-doc b/scripts/kernel-doc
> index cb92d0e1e932..b1d71a7b721f 100755
> --- a/scripts/kernel-doc
> +++ b/scripts/kernel-doc
> @@ -2103,15 +2103,17 @@ sub process_name($$) {
>         }
>      } elsif (/$doc_decl/o) {
>         $identifier =3D $1;
> -       if (/\s*([\w\s]+?)(\(\))?\s*([-:].*)?$/) {
> +       my $is_kernel_comment =3D 0;
> +       if (/^\s*\*\s*([\w\s]+?)(\(\))?\s*([-:].*)?$/) {
>             $identifier =3D $1;
> +           $decl_type =3D 'function';
> +           $identifier =3D~ s/^define\s+//;
> +           $is_kernel_comment =3D 1;
>         }
>         if ($identifier =3D~ m/^(struct|union|enum|typedef)\b\s*(\S*)/) {
>             $decl_type =3D $1;
>             $identifier =3D $2;
> -       } else {
> -           $decl_type =3D 'function';
> -           $identifier =3D~ s/^define\s+//;
> +           $is_kernel_comment =3D 1;
>         }
>         $identifier =3D~ s/\s+$//;
>
> @@ -2133,6 +2135,13 @@ sub process_name($$) {
>             $declaration_purpose =3D "";
>         }
>
> +       if (!$is_kernel_comment) {
> +           print STDERR "${file}:$.: warning: This comment starts with
> '/**', but isn't a kernel-doc comment. Refer
> Documentation/doc-guide/kernel-doc.rst\n";
> +           print STDERR $_;
> +           ++$warnings;
> +           $state =3D STATE_NORMAL;
> +       }
> +
>         if (($declaration_purpose eq "") && $verbose) {
>             print STDERR "${file}:$.: warning: missing initial short
> description on line:\n";
>             print STDERR $_;
> --
> 2.17.1
>

--=20
Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
Linaro Services Senior Technical Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog

--0000000000009be5b905c3135de4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, 29 Mar 2021 at 10:30, Aditya Sriv=
astava &lt;<a href=3D"mailto:yashsri421@gmail.com">yashsri421@gmail.com</a>=
&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">Currently, kernel-doc start parsing the comment as a=
 kernel-doc comment if<br>
it starts with &#39;/**&#39;, but does not take into account if the content=
 inside<br>
the comment too, adheres with the expected format.<br>
This results in unexpected and unclear warnings for the user.<br>
<br>
E.g., running scripts/kernel-doc -none mm/memcontrol.c emits:<br>
&quot;mm/memcontrol.c:961: warning: expecting prototype for do not fallback=
 to current(). Prototype was for get_mem_cgroup_from_current() instead&quot=
;<br>
<br>
Here kernel-doc parses the corresponding comment as a kernel-doc comment<br=
>
and expects prototype for it in the next lines, and as a result causing<br>
this warning.<br></blockquote><div><br></div><div>Actually this patch makes=
 things worse by obfuscating=C2=A0the issue.=C2=A0 It was way better before=
.</div><div><br></div><div>In the example you give, it&#39;s obvious to me =
that there is descriptive text where the prototype should be.</div><div><br=
></div><div>Now I just get a warning that this &quot;isn&#39;t a kernel-doc=
 comment&quot;, which a) is not correct and b) could mean anything.</div><d=
iv><br></div><div>Please consider reverting this patch, as it does the oppo=
site of its intent.</div><div><br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
Provide a clearer warning message to the users regarding the same, if the<b=
r>
content inside the comment does not follow the kernel-doc expected format.<=
br>
<br>
Signed-off-by: Aditya Srivastava &lt;<a href=3D"mailto:yashsri421@gmail.com=
" target=3D"_blank">yashsri421@gmail.com</a>&gt;<br>
---<br>
=C2=A0scripts/kernel-doc | 17 +++++++++++++----<br>
=C2=A01 file changed, 13 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/scripts/kernel-doc b/scripts/kernel-doc<br>
index cb92d0e1e932..b1d71a7b721f 100755<br>
--- a/scripts/kernel-doc<br>
+++ b/scripts/kernel-doc<br>
@@ -2103,15 +2103,17 @@ sub process_name($$) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0} elsif (/$doc_decl/o) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $identifier =3D $1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (/\s*([\w\s]+?)(\(\))?\s*([-:].*)?$/) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0my $is_kernel_comment =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (/^\s*\*\s*([\w\s]+?)(\(\))?\s*([-:].*)?$/) =
{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $identifier =3D $1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$decl_type =3D &#39;function&#39;=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$identifier =3D~ s/^define\s+//;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$is_kernel_comment =3D 1;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ($identifier =3D~ m/^(struct|union|enum|type=
def)\b\s*(\S*)/) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $decl_type =3D $1;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $identifier =3D $2;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$decl_type =3D &#39;function&#39;=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$identifier =3D~ s/^define\s+//;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$is_kernel_comment =3D 1;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $identifier =3D~ s/\s+$//;<br>
<br>
@@ -2133,6 +2135,13 @@ sub process_name($$) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $declaration_purpose =3D &quot;&q=
uot;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!$is_kernel_comment) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print STDERR &quot;${file}:$.: wa=
rning: This comment starts with &#39;/**&#39;, but isn&#39;t a kernel-doc c=
omment. Refer Documentation/doc-guide/kernel-doc.rst\n&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print STDERR $_;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0++$warnings;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$state =3D STATE_NORMAL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (($declaration_purpose eq &quot;&quot;) &amp=
;&amp; $verbose) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print STDERR &quot;${file}:$.: wa=
rning: missing initial short description on line:\n&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print STDERR $_;<br>
-- <br>
2.17.1<br></blockquote></div><div><br></div>-- <br><div dir=3D"ltr" class=
=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div><span=
 style=3D"font-size:12.8px">Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]</span><=
/div><div><span style=3D"font-size:12.8px">Linaro Services Senior Technical=
 Lead</span></div><div><span style=3D"font-size:12.8px">Linaro.org =E2=94=
=82 Open source software for ARM SoCs</span></div><div><span style=3D"font-=
size:12.8px">Follow Linaro: Facebook | Twitter | Blog</span></div></div></d=
iv></div></div></div></div>

--0000000000009be5b905c3135de4--

--===============7035482889876811453==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============7035482889876811453==--
