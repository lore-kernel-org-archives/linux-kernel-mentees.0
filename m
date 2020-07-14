Return-Path: <SRS0=uvNB=AZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E201C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jul 2020 07:37:48 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C4AD2084C
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jul 2020 07:37:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o1cvy/36"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C4AD2084C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 3E24020470;
	Tue, 14 Jul 2020 07:37:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lRXWvZrIPr4S; Tue, 14 Jul 2020 07:37:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1F80020422;
	Tue, 14 Jul 2020 07:37:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 085C5C0888;
	Tue, 14 Jul 2020 07:37:47 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 31BEDC08A0
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 07:37:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 41615204E6
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 07:37:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XMa5BCYgBo0U
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 07:37:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by silver.osuosl.org (Postfix) with ESMTPS id 77FB420439
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 07:37:15 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id 207so7229747pfu.3
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 00:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=xQJqBp5VqJDtuIjHQMEsnkjY1Xwr0NOvhXQmyg2tp2E=;
 b=o1cvy/36kHEP+tieeqEW2nV41r1nYG6345bz6OvTE6/2MMjdGoErtAo2sYpzjhDlx1
 /dO64A00t13S9B38RojclrtWuN3twdtvFfF/UwqDma42LLYpIf/6KWLLOKtWKwt41k53
 Aec33YiQEwPJhElHgHy1M41O92gwJ86WZ8Vb7xGUhsDlc667vGp8Irgbl5lJxz6yrqM6
 tWC9vBvRcxbFZY8JhEl9RnQGrxq15FN3LieW1AOSrWKaOnhk0cZLkgGYzWUFnnDMMgqh
 95WC/mVLt1Bd27pa38K38LwgHtRTkFnbNxy9EsxLJAAcOzLBloIUu4tj8Xv6ut6c1O59
 1w2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=xQJqBp5VqJDtuIjHQMEsnkjY1Xwr0NOvhXQmyg2tp2E=;
 b=Wf8nGn04ypoNOo2p/yNNQ33MDW5zPMeA5CedLZ7a+/GLokabQOQs0m3mQy9Kc6yJ1G
 lT/8yFlWaQnajKMr+MZVOSMSn/WMKySiA5LWkHA9sbohDRgT1YzkWizpxGDjeHmhfCZn
 uuuK1z0c2Pzs5ib9BiaKdocI5573Ma/uHep2fZpFXsqSw9FQrtPjwsHAj3OSScYv4fpW
 DclEJqcBOB06Vf08Yu4KkXMQkV8XR2T40sr3icZq6LSEXtk7ehSlCPtdOMBgRuzP1UAO
 uI4XunwKHetM7iVfAgp88AkpwBWLQJI5blMkrXHQn6Aelp9vNP9JQwxZ9InRgCVl97nb
 BPQQ==
X-Gm-Message-State: AOAM531vJxHoiP8rczs2mrZ+OgmeRJ/C3/U99JSm2eS0bgKDiKwkqlGf
 WTUOIkYEcfxZVpqsZdVq+IdtDTlb7n9yBTf4yII=
X-Google-Smtp-Source: ABdhPJy2ZlHuKPTDmOdSx+b+L74lbz1XCTEQggj6tYHchXAUD7u6cXOvb/4WLhOsiSw0GzJfdBIjkxyZh/WI4bt1v08=
X-Received: by 2002:a62:2b0c:: with SMTP id r12mr3298191pfr.122.1594712234930; 
 Tue, 14 Jul 2020 00:37:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200714032352.f476hanaj2dlmiot@mrinalpandey>
 <alpine.DEB.2.21.2007140742570.6558@felia>
In-Reply-To: <alpine.DEB.2.21.2007140742570.6558@felia>
From: Mrinal Pandey <mrinalmni@gmail.com>
Date: Tue, 14 Jul 2020 13:07:03 +0530
Message-ID: <CAD1=X6kVo26OT2jaPu-D_MremS75=+6U7nrXw89xFbo255pbhg@mail.gmail.com>
To: apw@canonical.com, joe@perches.com, linux-kernel@vger.kernel.org, 
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>,
 Linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: Fix the usage of
	capture group ( ... )
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
Content-Type: multipart/mixed; boundary="===============0709879033148980372=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============0709879033148980372==
Content-Type: multipart/alternative; boundary="00000000000048388d05aa61e046"

--00000000000048388d05aa61e046
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 14, 2020 at 11:18 AM Lukas Bulwahn <lukas.bulwahn@gmail.com>
wrote:

>
>
> On Tue, 14 Jul 2020, Mrinal Pandey wrote:
>
> > The usage of "capture group (...)" in the immediate condition after `&&`
> > results in `$1` being uninitialized. This issues a warning "Use of
> > uninitialized value $1 in regexp compilation at ./scripts/checkpatch.pl
> > line 2638".
> >
> > I noticed this bug while running checkpatch on the set of commits from
> > v5.7 to v5.8-rc1 of the kernel on the commits with a diff content in
> > their commit message.
> >
> > This bug was introduced in the script by commit e518e9a59ec3
> > ("checkpatch: emit an error when there's a diff in a changelog"). It has
> > been in the script since then.
> >
> > The author intended to store the match made by capture group in variable
> > `$1`. This should have contained the name of the file as `[\w/]+`
> matched.
> > However, this couldn't be accomplished due to usage of capture group and
> > `$1` in the same regular expression.
> >
> > Fix this by placing the capture group in the condition before `&&`.
> > Thus, `$1` can be initialized to the text that capture group matches
> > thereby setting it to the desired and required value.
> >
> > Reviewed-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > Tested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > Signed-off-by: Mrinal Pandey <mrinalmni@gmail.com>
> > ---
> > Changes since v1:
> > Add Reviewed-by and Tested-by tag
> >
>
>
> Usually, the maintainers pick up those tags when they apply a patch to
> their tree, and the patch authors do not need to add those tags and resend
> the patch as a new version on the mailing list.
>

Sir,

Thank you for your insight. I'll keep this in mind.


>
> Mrinal, can you please go through and check the kernel documentation on
> submitting patches and find the places where it is pointed out that the
> maintainers usually apply those tags and the authors usually do not need
> to resend a new version of the patch with the tags applied?
>

I read through Submitting patches
<https://www.kernel.org/doc/html/latest/process/submitting-patches.html>
and a few related pieces of documentation but
couldn't infer this information.


> If you cannot find such a statement in the documentation, please let us
> know where it would ideally added in the documentation. We can then create
> a patch for that together.
>

The statement might be placed under Respond to review comments
<https://www.kernel.org/doc/html/latest/process/submitting-patches.html#respond-to-review-comments>
and maybe
it could further contain some information about how to send a new version
of the patch.

Thank you.

>
>
> Lukas
>

--00000000000048388d05aa61e046
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 14, 2020 at 11:18 AM Luka=
s Bulwahn &lt;<a href=3D"mailto:lukas.bulwahn@gmail.com">lukas.bulwahn@gmai=
l.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><br>
<br>
On Tue, 14 Jul 2020, Mrinal Pandey wrote:<br>
<br>
&gt; The usage of &quot;capture group (...)&quot; in the immediate conditio=
n after `&amp;&amp;`<br>
&gt; results in `$1` being uninitialized. This issues a warning &quot;Use o=
f<br>
&gt; uninitialized value $1 in regexp compilation at ./scripts/<a href=3D"h=
ttp://checkpatch.pl" rel=3D"noreferrer" target=3D"_blank">checkpatch.pl</a>=
<br>
&gt; line 2638&quot;.<br>
&gt; <br>
&gt; I noticed this bug while running checkpatch on the set of commits from=
<br>
&gt; v5.7 to v5.8-rc1 of the kernel on the commits with a diff content in<b=
r>
&gt; their commit message.<br>
&gt; <br>
&gt; This bug was introduced in the script by commit e518e9a59ec3<br>
&gt; (&quot;checkpatch: emit an error when there&#39;s a diff in a changelo=
g&quot;). It has<br>
&gt; been in the script since then.<br>
&gt; <br>
&gt; The author intended to store the match made by capture group in variab=
le<br>
&gt; `$1`. This should have contained the name of the file as `[\w/]+` matc=
hed.<br>
&gt; However, this couldn&#39;t be accomplished due to usage of capture gro=
up and<br>
&gt; `$1` in the same regular expression.<br>
&gt; <br>
&gt; Fix this by placing the capture group in the condition before `&amp;&a=
mp;`.<br>
&gt; Thus, `$1` can be initialized to the text that capture group matches<b=
r>
&gt; thereby setting it to the desired and required value.<br>
&gt; <br>
&gt; Reviewed-by: Lukas Bulwahn &lt;<a href=3D"mailto:lukas.bulwahn@gmail.c=
om" target=3D"_blank">lukas.bulwahn@gmail.com</a>&gt;<br>
&gt; Tested-by: Lukas Bulwahn &lt;<a href=3D"mailto:lukas.bulwahn@gmail.com=
" target=3D"_blank">lukas.bulwahn@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Mrinal Pandey &lt;<a href=3D"mailto:mrinalmni@gmail.com=
" target=3D"_blank">mrinalmni@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; Changes since v1:<br>
&gt; Add Reviewed-by and Tested-by tag<br>
&gt;<br>
<br>
<br>
Usually, the maintainers pick up those tags when they apply a patch to <br>
their tree, and the patch authors do not need to add those tags and resend =
<br>
the patch as a new version on the mailing list.<br></blockquote><div><br></=
div><div><div>Sir,</div><div><br></div><div>Thank you for your insight. I&#=
39;ll keep this in mind.</div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
<br>
Mrinal, can you please go through and check the kernel documentation on <br=
>
submitting patches and find the places where it is pointed out that the <br=
>
maintainers usually apply those tags and the authors usually do not need <b=
r>
to resend a new version of the patch with the tags applied?<br></blockquote=
><div><br></div><div>I read through <a href=3D"https://www.kernel.org/doc/h=
tml/latest/process/submitting-patches.html" target=3D"_blank">Submitting pa=
tches</a> and a few related pieces of documentation but<div>couldn&#39;t in=
fer this information.</div><div><br></div> </div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
<br>
If you cannot find such a statement in the documentation, please let us <br=
>
know where it would ideally added in the documentation. We can then create =
<br>
a patch for that together.<br></blockquote><div><br></div><div><div>The sta=
tement might be placed under <a href=3D"https://www.kernel.org/doc/html/lat=
est/process/submitting-patches.html#respond-to-review-comments" target=3D"_=
blank">Respond to review comments</a> and maybe</div><div>it could further =
contain some information about how to send a new version of the patch.<br><=
/div><div><br></div><div>Thank you.</div></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
<br>
<br>
Lukas<br>
</blockquote></div></div>

--00000000000048388d05aa61e046--

--===============0709879033148980372==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============0709879033148980372==--
