Return-Path: <SRS0=UGpm=CX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D506DC43461
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 14 Sep 2020 12:31:58 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F76220709
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 14 Sep 2020 12:31:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E23WLdZl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F76220709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1ABBD8706D;
	Mon, 14 Sep 2020 12:31:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8tzMdtdSnQny; Mon, 14 Sep 2020 12:31:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2CEEF87044;
	Mon, 14 Sep 2020 12:31:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 15892C0859;
	Mon, 14 Sep 2020 12:31:57 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 851FCC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 12:31:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7997D85FA3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 12:31:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hUoA6QTomJAp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 12:31:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8BF5885F95
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 12:31:54 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id t76so17646776oif.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 05:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M8q0gPqVC4EFxPMTPdnlD0uYN4pEPXykZI0OdOJRRk4=;
 b=E23WLdZlCG4h1PuT9AOedlWPKnRkhk1ea7ZNRb7VOJ52+syWCJ6Lwa4lzh1AYSHIzT
 94ZsdclVVbl8vCE4qPLTYA0QElCsMsv75MlY5AI/5z1PKRM8vkNjhfNKJjSoRHvvy/lx
 6F8PEddWSmgC70qt9euSyDpytK9L7qqZFWDgh0vQOhp1ZtXva3r9fEddcfFTzbiSp4Lb
 YrDa8+IuUF9pLXcv+0cC2s3o8lY4I6MLk76EGreKGy8/Tzd2ZpTQ6rK/I7lZmCTsPKF2
 kmtPkMoC3R/687rKl/ud7Uv6SfKP1wAYXtCPDpIrnjWnY6uhEPpkuZzjAZVRsoSO3FQA
 CXtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M8q0gPqVC4EFxPMTPdnlD0uYN4pEPXykZI0OdOJRRk4=;
 b=GBrb8VheZyGJTYBd9aGSHVlWk6+MPmwpClqmyE9xNEdppXY7lJyWtE/zeAylduhwaJ
 KuB861wpYrUoB9vvhYy1glMAT0uR1SHMFt8aJLe2l6olvO6Xz+2DVnSZjeq/PTgDfmKG
 zpZ9aYqMLv9YfpQ90qGm0cuNk/ml/D0N7pSOe87dd2fw5esLiJJFvIiXZ9pEd0iyfWyv
 WzcX9Sf/UUJkOOx+tVLK4eeVwfpIjW7i4cvdRgZDpC0NPXlIPk6qH+CHd0VkcGe1XYRk
 oGE6dwPJMZIm2MCUxhRldlqpZySb2hXSEt7YS6uANJWTsPbctWGqebzrFfkdIBZcTiEN
 24dw==
X-Gm-Message-State: AOAM532kENrr9lYSxIs7xrSXC2vDMwsbvNm5y7F4+1PLGhuxHcVXG2gf
 CeGlM/vg8N3BcWxRuXA/AYLZYMEvX/QNQNTX4sI=
X-Google-Smtp-Source: ABdhPJxfwH1xhqFTJ9sKhzGh7BIie+Gx4a/JT1emzvzwhy3JkInAZx65EGsi/S1PYRzi1iFlCiXecZmybE9t7Ge9eN4=
X-Received: by 2002:aca:4d58:: with SMTP id a85mr8913868oib.110.1600086713497; 
 Mon, 14 Sep 2020 05:31:53 -0700 (PDT)
MIME-Version: 1.0
References: <CABJPP5CSa_QowD-O3_E5ndoQJvuBv=n2x5WG-acwQKE=rt5+Rw@mail.gmail.com>
 <alpine.DEB.2.21.2009110925160.9220@felia>
 <CABJPP5AWNpYyx5asMNZccqbq07ZW+pH+EwJ+KTZ+SSOAnWZwVQ@mail.gmail.com>
 <alpine.DEB.2.21.2009121252280.13082@felia>
 <CABJPP5DMF9OpZR0agobunb3i3hLGkqedbeL-YohNn0X6Juk64w@mail.gmail.com>
 <alpine.DEB.2.21.2009121419430.3770@felia>
 <CABJPP5BFNjBhdcvBWqDYnR-o2sZ0oY77bYr9PxducXW4Y=482Q@mail.gmail.com>
 <alpine.DEB.2.21.2009131301570.22585@felia>
 <CABJPP5BmRcC+OTSjuX_QrYononVq__DkhjGOgiKrP147MAXK+g@mail.gmail.com>
 <alpine.DEB.2.21.2009132010300.6806@felia>
 <CABJPP5BaUss9pWq=e+UDmVvr-puJsBtSVppST+CTcB8JkEdLmQ@mail.gmail.com>
 <alpine.DEB.2.21.2009140716420.7737@felia>
In-Reply-To: <alpine.DEB.2.21.2009140716420.7737@felia>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Mon, 14 Sep 2020 18:01:37 +0530
Message-ID: <CABJPP5D87ZVTfZ4QHxp5vweTN16LQCy+rniq-uDVCvKkbYRDNg@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Linux kernel checkpatch.pl mentorship
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
Content-Type: multipart/mixed; boundary="===============1490591641971228485=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============1490591641971228485==
Content-Type: multipart/alternative; boundary="0000000000002afc9405af45389f"

--0000000000002afc9405af45389f
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 14, 2020 at 10:47 AM Lukas Bulwahn <lukas.bulwahn@gmail.com>
wrote:
>
>
>
> On Mon, 14 Sep 2020, Dwaipayan Ray wrote:
>
> >
> >
> > > You should also try to find a case where checkpatch.pl can be
improved:
> > >
> > > - It is best if you look at the checkpatch.pl error/warning reports
and
> > > check if you can find a class of typical false positives in the
reported
> > > data. Then, think about how to make the pattern in checkpatch and
propose
> > > a patch to checkpatch.pl on this mailing list; with the evaluation
data
> > > backing that your patch really improves the situation. We will then
test
> > > and check your patch as well.
> > >
> > > - If you really cannot find a typical false positive, maybe you can
take
> > > the task from Ayush to fix checkpatch with git ranges?
> > >
> > Hi,I will try to find and evaluate the possibiltiy of such a case, and
report my finding
> > as soon as I find something substantial.
> >
> > I may also require some advice from you on the patch submission process.
> >
>
> That is what a mentor is there for, but try hard to understand the
> warnings yourself first. This is a mentorship, not a tutorial.
>
> Lukas

Hi,
I looked into the checkpatch.pl 's output I collected. And I have found
some possible candidates
but I would like your opinion on them.

The first one is double warnings for the same kind of coding style error.
If an SPDX tag is in the following format: "// SPDX-License-Identifier:
GPL-2.0",
then checkpatch.pl generates two warnings:

1) Improper SPDX comment style for ... , please use '/*' instead.
2) Missing or malformed SPDX-License-Identifier tag in line 1.

Example: commit 726721a51838
Warnings generated:

WARNING:SPDX_LICENSE_TAG: Improper SPDX comment style for
'kernel/trace/trace_synth.h', please use '/*' instead
#4041: FILE: kernel/trace/trace_synth.h:1:
+// SPDX-License-Identifier: GPL-2.0

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag
in line 1
#4041: FILE: kernel/trace/trace_synth.h:1:
+// SPDX-License-Identifier: GPL-2.0

In my opinion, only one warning should suffice if a '//' comment style is
used in spdx tag.
But I would like to know your view on it.

----------------------------------------------------------------------------------------------
The second candidate is related to the following warning:

WARNING:SPDX_LICENSE_TAG: DT binding documents should be licensed
(GPL-2.0-only OR BSD-2-Clause)
#110: FILE:
Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml:1:
+# SPDX-License-Identifier: GPL-2.0-only

In checkpath.pl line 3209:
 $fixed[$fixlinenr] =~ s/SPDX-License-Identifier:
.*/SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)/;

The desired fix is "(GPL-2.0-only OR BSD-2-Clause)" . Shouldn't the
identifier be "GPL-2.0-only"
or "BSD-2-Clause", that is either of them? Or was the former the decided
one?

----------------------------------------------------------------------------------------------
The third candidate is related to the warning:

WARNING:NO_AUTHOR_SIGN_OFF: Missing Signed-off-by: line by nominal patch
author ...

I found several such commits in which the author had used different mail
addresses in the
signed-off -by section, due to which this warning is generated.

An example is Commit dc5bdb68b5b3 .
Git log show:
Author: Daniel Vetter <daniel.vetter@ffwll.ch>
....,.
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

This is infact a common scenario. I easily found another commit
207324a321a8.
Git log shows:
Author: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
...
Signed-off-by: Minas Harutyunyan <hminas@synopsys.com>

This warning could be avoided or at least handled better.


I would like to know if any of them can be worked on.

Thanks,
Dwaipayan.

--0000000000002afc9405af45389f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><font color=3D"#4c1130"><br><br><br>On Mon, Sep 14, 2020 a=
t 10:47 AM Lukas Bulwahn &lt;<a href=3D"mailto:lukas.bulwahn@gmail.com">luk=
as.bulwahn@gmail.com</a>&gt; wrote:<br>&gt;<br>&gt;<br>&gt;<br>&gt; On Mon,=
 14 Sep 2020, Dwaipayan Ray wrote:<br>&gt;<br>&gt; &gt;<br>&gt; &gt;<br>&gt=
; &gt; &gt; You should also try to find a case where <a href=3D"http://chec=
kpatch.pl">checkpatch.pl</a> can be improved:<br>&gt; &gt; &gt;<br>&gt; &gt=
; &gt; - It is best if you look at the <a href=3D"http://checkpatch.pl">che=
ckpatch.pl</a> error/warning reports and<br>&gt; &gt; &gt; check if you can=
 find a class of typical false positives in the reported<br>&gt; &gt; &gt; =
data. Then, think about how to make the pattern in checkpatch and propose<b=
r>&gt; &gt; &gt; a patch to <a href=3D"http://checkpatch.pl">checkpatch.pl<=
/a> on this mailing list; with the evaluation data<br>&gt; &gt; &gt; backin=
g that your patch really improves the situation. We will then test<br>&gt; =
&gt; &gt; and check your patch as well.<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;=
 - If you really cannot find a typical false positive, maybe you can take<b=
r>&gt; &gt; &gt; the task from Ayush to fix checkpatch with git ranges?<br>=
&gt; &gt; &gt;<br>&gt; &gt; Hi,I will try to find and evaluate the possibil=
tiy of such a case, and report my finding <br>&gt; &gt; as soon as I find s=
omething substantial.<br>&gt; &gt;<br>&gt; &gt; I may also require some adv=
ice from you on the patch submission process.<br>&gt; &gt;<br>&gt;<br>&gt; =
That is what a mentor is there for, but try hard to understand the<br>&gt; =
warnings yourself first. This is a mentorship, not a tutorial.<br>&gt;<br>&=
gt; Lukas</font><div><font color=3D"#4c1130"><br></font></div><div><font co=
lor=3D"#000000">Hi,</font></div><div><font color=3D"#000000">I looked into =
the <a href=3D"http://checkpatch.pl">checkpatch.pl</a> &#39;s output I coll=
ected. And I have found some possible candidates</font></div><div><font col=
or=3D"#000000">but I would like your opinion on them.</font></div><div><fon=
t color=3D"#000000"><br></font></div><div><font color=3D"#000000">The first=
 one is double warnings for the same kind of coding style error.</font></di=
v><div><font color=3D"#000000">If an SPDX tag is in the following format: &=
quot;</font>// SPDX-License-Identifier: GPL-2.0&quot;,</div><div>then <a hr=
ef=3D"http://checkpatch.pl">checkpatch.pl</a> generates two warnings:</div>=
<div><br></div><div>1) Improper SPDX comment style for ... , please use &#3=
9;/*&#39; instead.</div><div>2)=C2=A0Missing or malformed SPDX-License-Iden=
tifier tag in line 1.</div><div><br></div><div>Example: commit=C2=A0726721a=
51838</div><div>Warnings generated:<br></div><div><br></div><div>WARNING:SP=
DX_LICENSE_TAG: Improper SPDX comment style for &#39;kernel/trace/trace_syn=
th.h&#39;, please use &#39;/*&#39; instead<br>#4041: FILE: kernel/trace/tra=
ce_synth.h:1:<br>+// SPDX-License-Identifier: GPL-2.0<br><br>WARNING:SPDX_L=
ICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1<br>#=
4041: FILE: kernel/trace/trace_synth.h:1:<br>+// SPDX-License-Identifier: G=
PL-2.0</div><div><br></div><div>In my opinion, only one warning should suff=
ice if a &#39;//&#39; comment style is used in spdx tag.=C2=A0</div><div>Bu=
t I would like to know your view on it.</div><div><br></div><div>----------=
---------------------------------------------------------------------------=
---------</div><div>The second candidate is related to the following warnin=
g:</div><div><br></div><div>WARNING:SPDX_LICENSE_TAG: DT binding documents =
should be licensed (GPL-2.0-only OR BSD-2-Clause)<br>#110: FILE: Documentat=
ion/devicetree/bindings/i2c/snps,designware-i2c.yaml:1:<br>+# SPDX-License-=
Identifier: GPL-2.0-only<br></div><div><br></div><div>In <a href=3D"http://=
checkpath.pl">checkpath.pl</a> line 3209:</div><div>=C2=A0$fixed[$fixlinenr=
] =3D~ s/SPDX-License-Identifier: .*/SPDX-License-Identifier: (GPL-2.0-only=
 OR BSD-2-Clause)/;<br></div><div><br></div><div>The desired fix is &quot;(=
GPL-2.0-only OR BSD-2-Clause)&quot; . Shouldn&#39;t the identifier be &quot=
;GPL-2.0-only&quot;=C2=A0</div><div>or &quot;BSD-2-Clause&quot;, that is ei=
ther of them? Or was the former the decided one?</div><div><br></div><div>-=
---------------------------------------------------------------------------=
------------------</div><div>The third candidate is related to the warning:=
</div><div><br></div><div>WARNING:NO_AUTHOR_SIGN_OFF: Missing Signed-off-by=
: line by nominal patch author ...<br></div><div><br></div><div>I found sev=
eral such commits in which the author had used different mail addresses in =
the=C2=A0</div><div>signed-off -by section, due to which this warning is ge=
nerated.</div><div><br></div><div>An example is Commit=C2=A0dc5bdb68b5b3 .<=
/div><div>Git log show:</div><div>Author: Daniel Vetter &lt;<a href=3D"mail=
to:daniel.vetter@ffwll.ch">daniel.vetter@ffwll.ch</a>&gt;</div><div>....,.<=
/div><div>Signed-off-by: Daniel Vetter &lt;<a href=3D"mailto:daniel.vetter@=
intel.com">daniel.vetter@intel.com</a>&gt;<br></div><div><br></div><div>Thi=
s is infact a common scenario. I easily found another commit 207324a321a8.<=
/div><div>Git log shows:</div><div>Author: Minas Harutyunyan &lt;<a href=3D=
"mailto:Minas.Harutyunyan@synopsys.com">Minas.Harutyunyan@synopsys.com</a>&=
gt;<br></div><div>...</div><div>Signed-off-by: Minas Harutyunyan &lt;<a hre=
f=3D"mailto:hminas@synopsys.com">hminas@synopsys.com</a>&gt;<br></div><div>=
<br></div><div>This warning could be avoided or at least handled better.</d=
iv><div><br></div><div><br></div><div>I would like to know if any of them c=
an be worked on.</div><div><br></div><div>Thanks,</div><div>Dwaipayan.</div=
><div><br></div><div><br></div></div>

--0000000000002afc9405af45389f--

--===============1490591641971228485==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============1490591641971228485==--
