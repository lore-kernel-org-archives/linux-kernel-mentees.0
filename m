Return-Path: <SRS0=fOLH=Y5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_FONT_LOW_CONTRAST,HTML_MESSAGE,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D759EC5DF60
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Nov 2019 21:37:40 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9441C21882
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Nov 2019 21:37:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Al34BAK6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9441C21882
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 82BCBDC8;
	Tue,  5 Nov 2019 21:37:40 +0000 (UTC)
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9DCD6DAF
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue,  5 Nov 2019 21:37:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
	[209.85.167.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E2DC5844
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue,  5 Nov 2019 21:37:38 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id v138so18989701oif.6
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 05 Nov 2019 13:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=RSU22adR+rJgZ1GRaOYEtUx47QpmdXWHM2ZBKtQvXrs=;
	b=Al34BAK67MP6JqWAEjesjlo/80EUCqqUSO60GGLYaVjPDQoRfXZVplSo8u2Oqw3paC
	LIFNDCuzFkHpC6LOogXQ0bPg2ajSrrB+p+0gb5VySdTtqYH4C1ehaubvEVUWL1/u8TiH
	au3y4An/q79Mia7gBaHKQl/Z3RyeKXghqWtwmk2Av9p2I3OHTd3oSJNR8GVKXvlSaGGa
	0PKFS7ypEO+OcNiQQK3AW37lzMbSX63X3jaU3TTD+KdBkBfoby7Yp4tqzSuh0X9cjxSe
	HF1luYZ6ntKR10HgqXrheN81Qb5LMx/20bD87C9icRmWKH0v3a35LmjaYe9Pidi/wN94
	9KnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RSU22adR+rJgZ1GRaOYEtUx47QpmdXWHM2ZBKtQvXrs=;
	b=VcBsTWsKYvrzdfcjPHCBT5k3lJ+ZARMc65mVCqxp87a7EyQvZhg3rG5R+8PnAnti5x
	6zblPikR5s2a3UElBylVoFF03HgxPuHlwnnOx3/4VfQ/HUpRLGk8f+ZnV30ceM/bh9Yq
	RuDfHxHCBQlTHXATrIYbHxrZKl2VRwsR3W5/llMdymYlsp6b/QWIkG+cNFG2XJVYNeXz
	4N6nyYHGamjEqzu32895Ku++XdGTFB2KTcJ0L9/mGmxnH1bF4omPtWjkrvc83BNfWpyu
	Ko98sbZylc+OAbmE61s3Io2FW8+rWP8hforLF1Y6xDWAmkPLopHdk8M4Ttgqrm2lXBN4
	fGYg==
X-Gm-Message-State: APjAAAVOihaDVScxd4Mif5PLrkFC74+2Gh+gKndJILwpI/zAzGfm76LP
	1HI8SH8Y7D/L8rFX2tNszEcimSV066WsG/suDiPWVDQO
X-Google-Smtp-Source: APXvYqzdMyeT19asYqqXW9EYWUXAsZefDQWUTtcW1lcTvq2AltWGRyXZWz/p4N6Z5zkEN8CCNcLVGXUUnrRSD4zQoyI=
X-Received: by 2002:aca:c4c3:: with SMTP id u186mr924583oif.173.1572989857873; 
	Tue, 05 Nov 2019 13:37:37 -0800 (PST)
MIME-Version: 1.0
References: <20191028214252.17580-1-madhuparnabhowmik04@gmail.com>
	<5bab8828-76e4-c67f-5855-ea4e4f43eaa5@gmail.com>
	<20191105135524.GN20975@paulmck-ThinkPad-P72>
In-Reply-To: <20191105135524.GN20975@paulmck-ThinkPad-P72>
From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
Date: Wed, 6 Nov 2019 03:07:26 +0530
Message-ID: <CAF65HP1zFpW+82-8YbFrBNDY25cmS2HQrB3L_bFu5FQ6MFCR8A@mail.gmail.com>
To: paulmck@kernel.org
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	rcu@vger.kernel.org, Joel Fernandes <joel@joelfernandes.org>,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] Documentation: RCU: NMI-RCU:
 Converted NMI-RCU.txt to NMI-RCU.rst.
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>,
	<mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>,
	<mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============7601184938474761108=="
Sender: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org

--===============7601184938474761108==
Content-Type: multipart/alternative; boundary="000000000000b6c3200596a03d9f"

--000000000000b6c3200596a03d9f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 5, 2019 at 7:25 PM Paul E. McKenney <paulmck@kernel.org> wrote:

> On Tue, Nov 05, 2019 at 08:40:05PM +0700, Phong Tran wrote:
> > On 10/29/19 4:42 AM, madhuparnabhowmik04@gmail.com wrote:
> > > From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> > >
> > > This patch converts NMI-RCU from txt to rst format.
> > > Also adds NMI-RCU in the index.rst file.
> > >
> > > Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> > > -- >   .../RCU/{NMI-RCU.txt =3D> NMI-RCU.rst}          | 53
> ++++++++++---------
> > >   Documentation/RCU/index.rst                   |  1 +
> > >   2 files changed, 29 insertions(+), 25 deletions(-)
> > >   rename Documentation/RCU/{NMI-RCU.txt =3D> NMI-RCU.rst} (73%)
> > >
> > > diff --git a/Documentation/RCU/NMI-RCU.txt
> b/Documentation/RCU/NMI-RCU.rst
> > > similarity index 73%
> > > rename from Documentation/RCU/NMI-RCU.txt
> > > rename to Documentation/RCU/NMI-RCU.rst
> > > index 881353fd5bff..da5861f6a433 100644
> > > --- a/Documentation/RCU/NMI-RCU.txt
> > > +++ b/Documentation/RCU/NMI-RCU.rst
> > > @@ -1,4 +1,7 @@
> > > +.. _NMI_rcu_doc:
> > > +
> > >   Using RCU to Protect Dynamic NMI Handlers
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >   Although RCU is usually used to protect read-mostly data structures=
,
> > > @@ -9,7 +12,7 @@ work in "arch/x86/oprofile/nmi_timer_int.c" and in
> > >   "arch/x86/kernel/traps.c".
> > >   The relevant pieces of code are listed below, each followed by a
> > > -brief explanation.
> > > +brief explanation.::
> > there is just a minor ":" redundant in html page.There are some same in
> this
> > patch.
> > eg:
> >  brief explanation.:
> >
> > Other things look good to me.
> >
> > Tested-by: Phong Tran <tranmanphong@gmail.com>
>
> Thank you, Phong!
>
> I queued a commit to be squashed into Madhuparna's original as shown belo=
w
> which adds your Tested-by and attempts a fix.  Does this work for you?
>
> Thank you, Paul, for improving my patch. I will do keep these things in
mind from next time and let me know if any other changes are required.

Regards
Madhuparna

>                                                         Thanx, Paul
>
> ------------------------------------------------------------------------
>
> commit 2c29f1c481f74f5e5aaaab195042f4df6a0b8119
> Author: Paul E. McKenney <paulmck@kernel.org>
> Date:   Tue Nov 5 05:51:12 2019 -0800
>
>     squash! Documentation: RCU: NMI-RCU: Converted NMI-RCU.txt to
> NMI-RCU.rst.
>
>     [ paulmck: Apply feedback from Phong Tran. ]
>     Tested-by: Phong Tran <tranmanphong@gmail.com>
>     Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
>
> diff --git a/Documentation/RCU/NMI-RCU.rst b/Documentation/RCU/NMI-RCU.rs=
t
> index da5861f..1809583 100644
> --- a/Documentation/RCU/NMI-RCU.rst
> +++ b/Documentation/RCU/NMI-RCU.rst
> @@ -12,7 +12,7 @@ work in "arch/x86/oprofile/nmi_timer_int.c" and in
>  "arch/x86/kernel/traps.c".
>
>  The relevant pieces of code are listed below, each followed by a
> -brief explanation.::
> +brief explanation::
>
>         static int dummy_nmi_callback(struct pt_regs *regs, int cpu)
>         {
> @@ -21,12 +21,12 @@ brief explanation.::
>
>  The dummy_nmi_callback() function is a "dummy" NMI handler that does
>  nothing, but returns zero, thus saying that it did nothing, allowing
> -the NMI handler to take the default machine-specific action.::
> +the NMI handler to take the default machine-specific action::
>
>         static nmi_callback_t nmi_callback =3D dummy_nmi_callback;
>
>  This nmi_callback variable is a global function pointer to the current
> -NMI handler.::
> +NMI handler::
>
>         void do_nmi(struct pt_regs * regs, long error_code)
>         {
> @@ -61,7 +61,7 @@ Quick Quiz:
>
>  :ref:`Answer to Quick Quiz <answer_quick_quiz_NMI>`
>
> -Back to the discussion of NMI and RCU...::
> +Back to the discussion of NMI and RCU::
>
>         void set_nmi_callback(nmi_callback_t callback)
>         {
>
=E1=90=A7

--000000000000b6c3200596a03d9f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 5, 2019 at 7:25 PM Paul E=
. McKenney &lt;<a href=3D"mailto:paulmck@kernel.org" target=3D"_blank">paul=
mck@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">On Tue, Nov 05, 2019 at 08:40:05PM +0700, Phong Tran wrote:<b=
r>
&gt; On 10/29/19 4:42 AM, <a href=3D"mailto:madhuparnabhowmik04@gmail.com" =
target=3D"_blank">madhuparnabhowmik04@gmail.com</a> wrote:<br>
&gt; &gt; From: Madhuparna Bhowmik &lt;<a href=3D"mailto:madhuparnabhowmik0=
4@gmail.com" target=3D"_blank">madhuparnabhowmik04@gmail.com</a>&gt;<br>
&gt; &gt; <br>
&gt; &gt; This patch converts NMI-RCU from txt to rst format.<br>
&gt; &gt; Also adds NMI-RCU in the index.rst file.<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Madhuparna Bhowmik &lt;<a href=3D"mailto:madhuparn=
abhowmik04@gmail.com" target=3D"_blank">madhuparnabhowmik04@gmail.com</a>&g=
t;<br>
&gt; &gt; -- &gt;=C2=A0 =C2=A0.../RCU/{NMI-RCU.txt =3D&gt; NMI-RCU.rst}=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 53 ++++++++++---------<br>
&gt; &gt;=C2=A0 =C2=A0Documentation/RCU/index.rst=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt; &gt;=C2=A0 =C2=A02 files changed, 29 insertions(+), 25 deletions(-)<br=
>
&gt; &gt;=C2=A0 =C2=A0rename Documentation/RCU/{NMI-RCU.txt =3D&gt; NMI-RCU=
.rst} (73%)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/Documentation/RCU/NMI-RCU.txt b/Documentation/RCU/NM=
I-RCU.rst<br>
&gt; &gt; similarity index 73%<br>
&gt; &gt; rename from Documentation/RCU/NMI-RCU.txt<br>
&gt; &gt; rename to Documentation/RCU/NMI-RCU.rst<br>
&gt; &gt; index 881353fd5bff..da5861f6a433 100644<br>
&gt; &gt; --- a/Documentation/RCU/NMI-RCU.txt<br>
&gt; &gt; +++ b/Documentation/RCU/NMI-RCU.rst<br>
&gt; &gt; @@ -1,4 +1,7 @@<br>
&gt; &gt; +.. _NMI_rcu_doc:<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 =C2=A0Using RCU to Protect Dynamic NMI Handlers<br>
&gt; &gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; &gt;=C2=A0 =C2=A0Although RCU is usually used to protect read-mostly d=
ata structures,<br>
&gt; &gt; @@ -9,7 +12,7 @@ work in &quot;arch/x86/oprofile/nmi_timer_int.c&=
quot; and in<br>
&gt; &gt;=C2=A0 =C2=A0&quot;arch/x86/kernel/traps.c&quot;.<br>
&gt; &gt;=C2=A0 =C2=A0The relevant pieces of code are listed below, each fo=
llowed by a<br>
&gt; &gt; -brief explanation.<br>
&gt; &gt; +brief explanation.::<br>
&gt; there is just a minor &quot;:&quot; redundant in html page.There are s=
ome same in this<br>
&gt; patch.<br>
&gt; eg:<br>
&gt;=C2=A0 brief explanation.:<br>
&gt; <br>
&gt; Other things look good to me.<br>
&gt; <br>
&gt; Tested-by: Phong Tran &lt;<a href=3D"mailto:tranmanphong@gmail.com" ta=
rget=3D"_blank">tranmanphong@gmail.com</a>&gt;<br>
<br>
Thank you, Phong!<br>
<br>
I queued a commit to be squashed into Madhuparna&#39;s original as shown be=
low<br>
which adds your Tested-by and attempts a fix.=C2=A0 Does this work for you?=
<br>
<br></blockquote><div>Thank you, Paul, for improving my patch. I will do ke=
ep these things in mind from next time and let me know if any other changes=
 are required.</div><div><br></div><div>Regards</div><div>Madhuparna</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Thanx, Paul<br>
<br>
------------------------------------------------------------------------<br=
>
<br>
commit 2c29f1c481f74f5e5aaaab195042f4df6a0b8119<br>
Author: Paul E. McKenney &lt;<a href=3D"mailto:paulmck@kernel.org" target=
=3D"_blank">paulmck@kernel.org</a>&gt;<br>
Date:=C2=A0 =C2=A0Tue Nov 5 05:51:12 2019 -0800<br>
<br>
=C2=A0 =C2=A0 squash! Documentation: RCU: NMI-RCU: Converted NMI-RCU.txt to=
 NMI-RCU.rst.<br>
<br>
=C2=A0 =C2=A0 [ paulmck: Apply feedback from Phong Tran. ]<br>
=C2=A0 =C2=A0 Tested-by: Phong Tran &lt;<a href=3D"mailto:tranmanphong@gmai=
l.com" target=3D"_blank">tranmanphong@gmail.com</a>&gt;<br>
=C2=A0 =C2=A0 Signed-off-by: Paul E. McKenney &lt;<a href=3D"mailto:paulmck=
@kernel.org" target=3D"_blank">paulmck@kernel.org</a>&gt;<br>
<br>
diff --git a/Documentation/RCU/NMI-RCU.rst b/Documentation/RCU/NMI-RCU.rst<=
br>
index da5861f..1809583 100644<br>
--- a/Documentation/RCU/NMI-RCU.rst<br>
+++ b/Documentation/RCU/NMI-RCU.rst<br>
@@ -12,7 +12,7 @@ work in &quot;arch/x86/oprofile/nmi_timer_int.c&quot; and=
 in<br>
=C2=A0&quot;arch/x86/kernel/traps.c&quot;.<br>
<br>
=C2=A0The relevant pieces of code are listed below, each followed by a<br>
-brief explanation.::<br>
+brief explanation::<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 static int dummy_nmi_callback(struct pt_regs *r=
egs, int cpu)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
@@ -21,12 +21,12 @@ brief explanation.::<br>
<br>
=C2=A0The dummy_nmi_callback() function is a &quot;dummy&quot; NMI handler =
that does<br>
=C2=A0nothing, but returns zero, thus saying that it did nothing, allowing<=
br>
-the NMI handler to take the default machine-specific action.::<br>
+the NMI handler to take the default machine-specific action::<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 static nmi_callback_t nmi_callback =3D dummy_nm=
i_callback;<br>
<br>
=C2=A0This nmi_callback variable is a global function pointer to the curren=
t<br>
-NMI handler.::<br>
+NMI handler::<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 void do_nmi(struct pt_regs * regs, long error_c=
ode)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
@@ -61,7 +61,7 @@ Quick Quiz:<br>
<br>
=C2=A0:ref:`Answer to Quick Quiz &lt;answer_quick_quiz_NMI&gt;`<br>
<br>
-Back to the discussion of NMI and RCU...::<br>
+Back to the discussion of NMI and RCU::<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 void set_nmi_callback(nmi_callback_t callback)<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
</blockquote></div></div><div hspace=3D"streak-pt-mark" style=3D"max-height=
:1px"><img alt=3D"" style=3D"width:0px;max-height:0px;overflow:hidden" src=
=3D"https://mailfoogae.appspot.com/t?sender=3DabWFkaHVwYXJuYWJob3dtaWswNEBn=
bWFpbC5jb20%3D&amp;type=3Dzerocontent&amp;guid=3D18c086ca-0d5e-430c-b41c-3e=
1f8c519496"><font color=3D"#ffffff" size=3D"1">=E1=90=A7</font></div>

--000000000000b6c3200596a03d9f--

--===============7601184938474761108==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============7601184938474761108==--
