Return-Path: <SRS0=FEGG=EN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5991C388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  7 Nov 2020 18:38:46 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25C8020888
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  7 Nov 2020 18:38:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WBlq0DO0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25C8020888
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9C3DF20482;
	Sat,  7 Nov 2020 18:38:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id veBozG1dF2l6; Sat,  7 Nov 2020 18:38:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id DFAB92043F;
	Sat,  7 Nov 2020 18:38:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AC7FFC088B;
	Sat,  7 Nov 2020 18:38:43 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1490BC0889
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Nov 2020 18:38:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id EEB7C87112
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Nov 2020 18:38:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D04ubZhInppC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Nov 2020 18:38:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E1A9E8710C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Nov 2020 18:38:40 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id q1so4580357ilt.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 07 Nov 2020 10:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JoEnEx9GVQeQzhBh1k3xc7yAF+2y8GR4uxCXOYb7Hh4=;
 b=WBlq0DO0+iEZ0KawPJ31q9dxyD8eydXsb9fo6f6XuzVPonZOfNJLqO5YnCwMoRzL45
 /eXFPKJm/3Dxg5xY9Sd3IUakt3HU/szHHdWeBckrzfrhRNfDTNlrtoa2w0IgIbZqmCe/
 qeBdIqbON0f32KJZ+lbGb8MwXAWl2cA1+FlGxr7/XWU9czUXehAvZBL6Nb+EylUZaWXh
 PGRtyuXcc1wwPE+60x8mP7kR6O/RCMQxM1oe5wZuQeVpixuQRzQMBQWtHlMNokCY5YOI
 cxzyWI5FC542xhZVqwBEDOSU31lRIU9GMIBS8bbqtokOfgDfDN07kqe8+92yKHNsyoSi
 /wBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JoEnEx9GVQeQzhBh1k3xc7yAF+2y8GR4uxCXOYb7Hh4=;
 b=IigyRX4HccrkvPr0ChGD2ph4U1XiS+RtysT4fqtJ8OOw6RC4QUw4FVqxSL90t+Z7Am
 B0t5vRYjpNeshJ9oqdKJbLdERT7YUKUBeQbhe4S2MJjLQ8cQf0IYOpBOjaS7tvw08IYf
 EFD7pR/n38CbzoCAq55GUYPFFhTWs9AMO3TfEHvg5nZWUeg4UvtcXMFnhYqq26eJFROd
 W5WDpFgVftUoZFJf0E125XFCUP1r+IjuNKU67+vXk8I/vddijRPxzEU0DqOwrA0wkJ/Y
 MZGnhNR8IzLumSm3JBz2OU2vrFiLUDgJJRPLLhSHOiCOp6IGBSlj7XpUG2CgTizzhssy
 AINA==
X-Gm-Message-State: AOAM5306G7A5lC9F2plLJLfw+8/aS1Q1HSQc19sX0zAKu8nVKEVeL3J3
 ho4ETK1hsrznb9yVdFpnrSbEyBYCaXSkIEELboE=
X-Google-Smtp-Source: ABdhPJyueTdKzNm6QXMDQXugKvbe5kvSJ+p0H3dcTlojMrJ5+pW7EY/Q1qvcdnVdINm7Nco6PwsXIlhToXmta2WlPvo=
X-Received: by 2002:a92:512:: with SMTP id q18mr5015823ile.147.1604774320179; 
 Sat, 07 Nov 2020 10:38:40 -0800 (PST)
MIME-Version: 1.0
References: <20201103151858.25375-1-yashsri421@gmail.com>
 <CAKXUXMzx=UacWsoPyiD5AVtfBpVDCcJpAFMo8OpXrf+KNpBFww@mail.gmail.com>
 <6fca02c0-4c4d-c6bd-67b2-35304cf25499@gmail.com>
In-Reply-To: <6fca02c0-4c4d-c6bd-67b2-35304cf25499@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sat, 7 Nov 2020 19:38:28 +0100
Message-ID: <CAKXUXMygzqgiCm+1SCaA5daO5HkoUXyhXS=QEE2d8GKUO4nypg@mail.gmail.com>
To: Aditya <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add fix for
	BAD_SIGN_OFF
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
Content-Type: multipart/mixed; boundary="===============8207192976147349239=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============8207192976147349239==
Content-Type: multipart/alternative; boundary="0000000000004c8f4005b388a335"

--0000000000004c8f4005b388a335
Content-Type: text/plain; charset="UTF-8"

On Sa., 7. Nov. 2020 at 10:27, Aditya <yashsri421@gmail.com> wrote:

> On 4/11/20 4:44 pm, Lukas Bulwahn wrote:
> > On Tue, Nov 3, 2020 at 4:19 PM Aditya Srivastava <yashsri421@gmail.com>
> wrote:
> >>
> >> Currently, checkpatch warns us if the author of the commit signs-off
> >> as co-developed-by.
> >> E.g. for commit 6e88559470f5 ("Documentation: Add section about
> >> CPU vulnerabilities for Spectre") we get:
> >>
> >> WARNING: Co-developed-by: should not be used to attribute nominal
> >> patch author 'Tim Chen <tim.c.chen@linux.intel.com>'
> >> Co-developed-by: Tim Chen <tim.c.chen@linux.intel.com>
> >>
> >> Provide a simple fix by removing the co-developed-by line from the
> >> commit message
> >>
> >
> > Patch looks good. Maybe you can add a statistics on how many cases of
> > the last 200,000 commits this rule would actually trigger?
> >
> > E.g., you can probably quickly filter all commits that have at least
> > one Co-developed-by tag among those last 200,000 commits (that is
> > already only a few thousands), then take that list and just check with
> > checkpatch.pl for this one rule quickly to see how often the rule
> > would even trigger at all.
> >
> > Once you have that and explain that in the commit message, I think the
> > patch is ready for lkml and Joe Perches.
> >
> > Lukas
> >
>
> Hi Sir
> I generated a report for around 200,000 commits (v4.13..v5.8), and
> found that this rule was being triggered only 6 times. Statistically
> this doesn't seem much. Is it still advisable to mention it in the
> commit message?
> Although, there's a possibility that user fixed this issue after
> receiving the warning manually before committing.
>

Can you share the six commits?

Then we check if the fix is really the right fix of if something different
is wrong with these commits.

This certainly needs to be mentioned in the commit message.


Lukas


> Thanks
> Aditya
>
>

--0000000000004c8f4005b388a335
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"auto">On Sa.=
, 7. Nov. 2020 at 10:27, Aditya &lt;<a href=3D"mailto:yashsri421@gmail.com"=
>yashsri421@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">On 4/11/20 4:44 pm, Lukas Bulwahn wrote:<br>
&gt; On Tue, Nov 3, 2020 at 4:19 PM Aditya Srivastava &lt;<a href=3D"mailto=
:yashsri421@gmail.com" target=3D"_blank">yashsri421@gmail.com</a>&gt; wrote=
:<br>
&gt;&gt;<br>
&gt;&gt; Currently, checkpatch warns us if the author of the commit signs-o=
ff<br>
&gt;&gt; as co-developed-by.<br>
&gt;&gt; E.g. for commit 6e88559470f5 (&quot;Documentation: Add section abo=
ut<br>
&gt;&gt; CPU vulnerabilities for Spectre&quot;) we get:<br>
&gt;&gt;<br>
&gt;&gt; WARNING: Co-developed-by: should not be used to attribute nominal<=
br>
&gt;&gt; patch author &#39;Tim Chen &lt;<a href=3D"mailto:tim.c.chen@linux.=
intel.com" target=3D"_blank">tim.c.chen@linux.intel.com</a>&gt;&#39;<br>
&gt;&gt; Co-developed-by: Tim Chen &lt;<a href=3D"mailto:tim.c.chen@linux.i=
ntel.com" target=3D"_blank">tim.c.chen@linux.intel.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Provide a simple fix by removing the co-developed-by line from the=
<br>
&gt;&gt; commit message<br>
&gt;&gt;<br>
&gt; <br>
&gt; Patch looks good. Maybe you can add a statistics on how many cases of<=
br>
&gt; the last 200,000 commits this rule would actually trigger?<br>
&gt; <br>
&gt; E.g., you can probably quickly filter all commits that have at least<b=
r>
&gt; one Co-developed-by tag among those last 200,000 commits (that is<br>
&gt; already only a few thousands), then take that list and just check with=
<br>
&gt; <a href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D"_blank">=
checkpatch.pl</a> for this one rule quickly to see how often the rule<br>
&gt; would even trigger at all.<br>
&gt; <br>
&gt; Once you have that and explain that in the commit message, I think the=
<br>
&gt; patch is ready for lkml and Joe Perches.<br>
&gt; <br>
&gt; Lukas<br>
&gt; <br>
<br>
Hi Sir<br>
I generated a report for around 200,000 commits (v4.13..v5.8), and<br>
found that this rule was being triggered only 6 times. Statistically<br>
this doesn&#39;t seem much. Is it still advisable to mention it in the<br>
commit message?<br>
Although, there&#39;s a possibility that user fixed this issue after<br>
receiving the warning manually before committing.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Can you share th=
e six commits?</div><div dir=3D"auto"><br></div><div dir=3D"auto">Then we c=
heck if the fix is really the right fix of if something different is wrong =
with these commits.</div><div dir=3D"auto"><br></div><div dir=3D"auto">This=
 certainly needs to be mentioned in the commit message.</div><div dir=3D"au=
to"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto">Lukas</div><div=
 dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Thanks<br>
Aditya<br>
<br>
</blockquote></div></div>

--0000000000004c8f4005b388a335--

--===============8207192976147349239==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============8207192976147349239==--
