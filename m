Return-Path: <SRS0=/i4J=Z2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_FONT_LOW_CONTRAST,HTML_MESSAGE,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BAA1C43603
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Dec 2019 20:31:26 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1696D2073C
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Dec 2019 20:31:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lF7+exc8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1696D2073C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id DC2AE234BD;
	Wed,  4 Dec 2019 20:31:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DqP3PesNC02P; Wed,  4 Dec 2019 20:31:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4433123280;
	Wed,  4 Dec 2019 20:31:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2A391C1DD6;
	Wed,  4 Dec 2019 20:31:25 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4EFF4C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Dec 2019 20:31:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 32A6287E80
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Dec 2019 20:31:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MCZpXM52q5Df
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Dec 2019 20:31:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5D40D87E15
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Dec 2019 20:31:23 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id o9so511419ote.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 04 Dec 2019 12:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1kTGWTrE9ClTUY2A0Db/GmLX/PM7k4E3fz3QKUGSbv4=;
 b=lF7+exc8GwIqceqX0S29Pth8pXqLdFr28KwN/hewpiwQyHvA9oRp/4cf1uMfam1I3l
 IMdF0ssBpVhXWXSMuPb1OtswK/afzZ6e9JQag1TFz51QX3oN2Zb7jdq2Ja62bDFQ/QpY
 FUZWbPRFyaDMQS5tdfNeZY302+/Phe7i7gZsgRhgbbWWzSvsqwbPAlo+QAoRJbqs7EBs
 jNrh9wlns2spxokQRWzvSJRvoMCCDh2f/QbRdGao/SBL5ajXXZh9yr/M8Mmu0H8tGR3k
 HFxqGmHybwQTXFD2DDljLTTZ0lB7C3HIVlUsjPmQHxX4v5lg6lXlTgTRPMWtndToaDvB
 UKVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1kTGWTrE9ClTUY2A0Db/GmLX/PM7k4E3fz3QKUGSbv4=;
 b=Gdq6D5V1eCmVyLt/2qgyjBzTeHk1/ZrnoS+1P0jqtRuu1n9RNrUkESrJeIS2TpZSYw
 EpeZG6dyX9ws6K5hBEj9vKCm9zfpxZ67e0kZJEEcUkxpBdJZByZ1D4CWkBAWMu1uaRH0
 AJLjpjAGejmt/17PzU+BK4g+O97tygayM58fGvo4ecwDMvHm5r1wRWkAH8bc161rV6CL
 HqRX9U9FM/yQT7YayQObDT1DMFf+WVkXi2jr+P6ud/g89Ep3K3kt6Kd2TvfDXung9dex
 xfHm1q/jyuZhchs2sanaxMzyDJ5u61p3yaY8S9vnF3uGleVpJVFOyjtZ0UR4RsmZmZue
 s1cw==
X-Gm-Message-State: APjAAAXiPLS9SrgHv2Vx6+nwLXw9keDxrYpbW7Cbk9B9QNYucvTy8AdQ
 rmTWEw0CT+4qMqIdBLlzMx9OmJ0COVvXpIC6/Pk=
X-Google-Smtp-Source: APXvYqwc7iEl6z2WW9Zou8fL5YH8xqlzyX0vTG7RLP9ObuLcjwM84tzftAzmgQRBGxq+fXyeLc1ZfPdvo9Ay0YBVlGk=
X-Received: by 2002:a9d:549:: with SMTP id 67mr3686884otw.175.1575491482309;
 Wed, 04 Dec 2019 12:31:22 -0800 (PST)
MIME-Version: 1.0
References: <20191204104554.9100-1-madhuparnabhowmik04@gmail.com>
 <4850753.A3onD7O4GF@harkonnen>
In-Reply-To: <4850753.A3onD7O4GF@harkonnen>
From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
Date: Thu, 5 Dec 2019 02:01:11 +0530
Message-ID: <CAF65HP1x1oG6Z+NFKDJrkk77jqYo5mtYhTaR_PcCMGSv7SJ9pA@mail.gmail.com>
To: Federico Vaga <federico.vaga@vaga.pv.it>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [Linux-kernel-mentees] [PATCH 2/2] Documentation:
 kernel-hacking: hacking.rst: Change reference to document namespaces.rst to
 symbol-namespaces.rst
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
Content-Type: multipart/mixed; boundary="===============8278141965849020585=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============8278141965849020585==
Content-Type: multipart/alternative; boundary="0000000000002657280598e6b27b"

--0000000000002657280598e6b27b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 5, 2019 at 1:19 AM Federico Vaga <federico.vaga@vaga.pv.it>
wrote:

> If you are interested there is a little discussion here about it
>
> https://www.lkml.org/lkml/2019/11/22/1580
>
> Thank you for informing me about the discussion.
Regards,
Madhuparna


> On Wednesday, December 4, 2019 11:45:54 AM CET
> madhuparnabhowmik04@gmail.com
> wrote:
> > From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> >
> > This patch fixes the following documentation build warning:
> > Warning: Documentation/kernel-hacking/hacking.rst references
> > a file that doesn't exist: Documentation/kbuild/namespaces.rst
> >
> > According to the following patch:
> > https://patchwork.kernel.org/patch/11178727/
> > (doc: move namespaces.rst from kbuild/ to core-api/)
> >
> > The file namespaces.rst was moved from kbuild to core-api
> > and renamed to symbol-namespaces.rst.
> > Therefore, this patch changes the reference to the document
> > kbuild/namespaces.rst in hacking.rst to
> > core-api/symbol-namespaces.rst
> >
> > Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> > ---
> >  Documentation/kernel-hacking/hacking.rst | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/kernel-hacking/hacking.rst
> > b/Documentation/kernel-hacking/hacking.rst index
> a3ddb213a5e1..d62aacb2822a
> > 100644
> > --- a/Documentation/kernel-hacking/hacking.rst
> > +++ b/Documentation/kernel-hacking/hacking.rst
> > @@ -601,7 +601,7 @@ Defined in ``include/linux/export.h``
> >
> >  This is the variant of `EXPORT_SYMBOL()` that allows specifying a symb=
ol
> >  namespace. Symbol Namespaces are documented in
> > -``Documentation/kbuild/namespaces.rst``.
> > +``Documentation/core-api/symbol-namespaces.rst``.
> >
> >  :c:func:`EXPORT_SYMBOL_NS_GPL()`
> >
> >  --------------------------------
> > @@ -610,7 +610,7 @@ Defined in ``include/linux/export.h``
> >
> >  This is the variant of `EXPORT_SYMBOL_GPL()` that allows specifying a
> > symbol namespace. Symbol Namespaces are documented in
> > -``Documentation/kbuild/namespaces.rst``.
> > +``Documentation/core-api/symbol-namespaces.rst``.
> >
> >  Routines and Conventions
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>
>
>
>
> =E1=90=A7

--0000000000002657280598e6b27b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 5, 2019 at 1:19 AM Federi=
co Vaga &lt;<a href=3D"mailto:federico.vaga@vaga.pv.it">federico.vaga@vaga.=
pv.it</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">If you are interested there is a little discussion here about it<br>
<br>
<a href=3D"https://www.lkml.org/lkml/2019/11/22/1580" rel=3D"noreferrer" ta=
rget=3D"_blank">https://www.lkml.org/lkml/2019/11/22/1580</a><br>
<br></blockquote><div>Thank you for informing me about the discussion.</div=
><div>Regards,</div><div>Madhuparna</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
On Wednesday, December 4, 2019 11:45:54 AM CET <a href=3D"mailto:madhuparna=
bhowmik04@gmail.com" target=3D"_blank">madhuparnabhowmik04@gmail.com</a> <b=
r>
wrote:<br>
&gt; From: Madhuparna Bhowmik &lt;<a href=3D"mailto:madhuparnabhowmik04@gma=
il.com" target=3D"_blank">madhuparnabhowmik04@gmail.com</a>&gt;<br>
&gt; <br>
&gt; This patch fixes the following documentation build warning:<br>
&gt; Warning: Documentation/kernel-hacking/hacking.rst references<br>
&gt; a file that doesn&#39;t exist: Documentation/kbuild/namespaces.rst<br>
&gt; <br>
&gt; According to the following patch:<br>
&gt; <a href=3D"https://patchwork.kernel.org/patch/11178727/" rel=3D"norefe=
rrer" target=3D"_blank">https://patchwork.kernel.org/patch/11178727/</a><br=
>
&gt; (doc: move namespaces.rst from kbuild/ to core-api/)<br>
&gt; <br>
&gt; The file namespaces.rst was moved from kbuild to core-api<br>
&gt; and renamed to symbol-namespaces.rst.<br>
&gt; Therefore, this patch changes the reference to the document<br>
&gt; kbuild/namespaces.rst in hacking.rst to<br>
&gt; core-api/symbol-namespaces.rst<br>
&gt; <br>
&gt; Signed-off-by: Madhuparna Bhowmik &lt;<a href=3D"mailto:madhuparnabhow=
mik04@gmail.com" target=3D"_blank">madhuparnabhowmik04@gmail.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 Documentation/kernel-hacking/hacking.rst | 4 ++--<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/Documentation/kernel-hacking/hacking.rst<br>
&gt; b/Documentation/kernel-hacking/hacking.rst index a3ddb213a5e1..d62aacb=
2822a<br>
&gt; 100644<br>
&gt; --- a/Documentation/kernel-hacking/hacking.rst<br>
&gt; +++ b/Documentation/kernel-hacking/hacking.rst<br>
&gt; @@ -601,7 +601,7 @@ Defined in ``include/linux/export.h``<br>
&gt; <br>
&gt;=C2=A0 This is the variant of `EXPORT_SYMBOL()` that allows specifying =
a symbol<br>
&gt;=C2=A0 namespace. Symbol Namespaces are documented in<br>
&gt; -``Documentation/kbuild/namespaces.rst``.<br>
&gt; +``Documentation/core-api/symbol-namespaces.rst``.<br>
&gt; <br>
&gt;=C2=A0 :c:func:`EXPORT_SYMBOL_NS_GPL()`<br>
&gt; <br>
&gt;=C2=A0 --------------------------------<br>
&gt; @@ -610,7 +610,7 @@ Defined in ``include/linux/export.h``<br>
&gt; <br>
&gt;=C2=A0 This is the variant of `EXPORT_SYMBOL_GPL()` that allows specify=
ing a<br>
&gt; symbol namespace. Symbol Namespaces are documented in<br>
&gt; -``Documentation/kbuild/namespaces.rst``.<br>
&gt; +``Documentation/core-api/symbol-namespaces.rst``.<br>
&gt; <br>
&gt;=C2=A0 Routines and Conventions<br>
&gt;=C2=A0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D<br>
<br>
<br>
<br>
<br>
</blockquote></div></div><div hspace=3D"streak-pt-mark" style=3D"max-height=
:1px"><img alt=3D"" style=3D"width:0px;max-height:0px;overflow:hidden" src=
=3D"https://mailfoogae.appspot.com/t?sender=3DabWFkaHVwYXJuYWJob3dtaWswNEBn=
bWFpbC5jb20%3D&amp;type=3Dzerocontent&amp;guid=3D1b568207-0e61-49e6-a12c-44=
da80e3be85"><font color=3D"#ffffff" size=3D"1">=E1=90=A7</font></div>

--0000000000002657280598e6b27b--

--===============8278141965849020585==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============8278141965849020585==--
