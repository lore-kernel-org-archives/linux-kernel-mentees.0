Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83854C83F2D
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  3 Sep 2023 14:42:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9078414C5;
	Sun,  3 Sep 2023 14:42:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9078414C5
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=AWlws/Yq
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6DnuRMKiX41a; Sun,  3 Sep 2023 14:42:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 3BE64410E0;
	Sun,  3 Sep 2023 14:42:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BE64410E0
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1501AC0039;
	Sun,  3 Sep 2023 14:42:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E82FDC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  3 Sep 2023 14:42:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BBFE581E3B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  3 Sep 2023 14:42:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBFE581E3B
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=AWlws/Yq
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HTIQPGSzcWKn
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  3 Sep 2023 14:42:41 +0000 (UTC)
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C359A81E2A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  3 Sep 2023 14:42:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C359A81E2A
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-9a5e37a39ecso88765666b.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 03 Sep 2023 07:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693752158; x=1694356958;
 darn=lists.linuxfoundation.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rsIrRki6UzbUUUMwAGo8jKAquOGc1XyWpUeP/iN3rCc=;
 b=AWlws/YqT5QN61IrsXQGqJCx/paV+DSZq4hgMx5Y8pFKKY8ezNqpHGxIjP/owPNlth
 iXPEoIlPFQ5DnBOEd9UR0R2M26WEwcita/PlSt7Prqjicm0bdvrQWc/nhZGVnPgpWvUe
 RCbCdmhhmZJSCgBHOI223ERSxmucOjRlELWvVfaSEvmw/JjbGNqfg3JOwoorHyR0NG8I
 S/ec6hQ+FHEeVd+xKptzc/NzO088gK6j+NGAcGV401+Fq9jjR405OuT1SpMlNc0hv6p1
 zp/6oAg5UCGcSneomoDvC39q6WLqaZiRuMO0g/iFIkcwb/a2QKnxqcDPFi3u7YfpVp3w
 24KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693752158; x=1694356958;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rsIrRki6UzbUUUMwAGo8jKAquOGc1XyWpUeP/iN3rCc=;
 b=U9fC18ujJikEAKrmHK40txSLNvsUFHqol1fTWsPQ/V/vOTDdDOQbuaJNdhI3dvuFQU
 yg7o5NCjyHgeUr4wmuyLysLfjnJrOYOFHKoRGXpcLuMzo1cBR3h92CDRcArcSt9ZQb6/
 tJ915rMcvGUgIwUkNcZuoyfh1IgD7lCAuZA3TsBSvRzuKp+cEYXQmzxtNoNlCPaX2MZG
 vfGugTO7qHjR/j7b4p4gi2q1n+5if6H70RfzOg+Mw4jdSpPdcnbgY+kik/5j5jMcHxfu
 jzi28Tl2TYP0+t4idM5bvuhpZ2xjW0EKh8QaIFE31MpzEcYvBhVhhkXWT2xAhqgVw1rF
 b4Ug==
X-Gm-Message-State: AOJu0Yxw2Si3lTPTmDhFv6sndG7LpnMMPZCBxd5SzHRUoa+eq6BF0ygV
 LFCm81ZhztQdJyidrYExf/HNOT3ibo0Lt3w5grg=
X-Google-Smtp-Source: AGHT+IEXhCbeShBlrGmRrNPOW/nJtcbzDK1NsFcP0i5jz+QEbNYhyIhFRrWKmGQVh87sFQknokwe0YWEdP8aTZ/Xqv8=
X-Received: by 2002:a17:906:113:b0:9a1:c225:1cea with SMTP id
 19-20020a170906011300b009a1c2251ceamr6234746eje.65.1693752158188; Sun, 03 Sep
 2023 07:42:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230813141207.150336-1-coolrrsh@gmail.com>
 <CA+VNjV1=xVyRkvB6RAnLySAOzS=X1XiJihrtiMx3Jmifpdq9ng@mail.gmail.com>
 <df10d700-3f3f-4665-9197-534abc24523a@sirena.org.uk>
In-Reply-To: <df10d700-3f3f-4665-9197-534abc24523a@sirena.org.uk>
From: Rajeshwar Shinde <coolrrsh@gmail.com>
Date: Sun, 3 Sep 2023 20:12:25 +0530
Message-ID: <CA+VNjV1K6WoKPqP4zrax5SOF3UFCiJ5oYA=YamjZwfZ5fkEHWg@mail.gmail.com>
Subject: Re: [PATCH v2] spi: spi-mpc512x-psc: Fix an unsigned comparison that
 can never be negative
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
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
Content-Type: multipart/mixed; boundary="===============8835191267807115121=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============8835191267807115121==
Content-Type: multipart/alternative; boundary="000000000000b9fa41060475675a"

--000000000000b9fa41060475675a
Content-Type: text/plain; charset="UTF-8"

Remainder

On Wed, 16 Aug, 2023, 5:02 pm Mark Brown, <broonie@kernel.org> wrote:

> On Wed, Aug 16, 2023 at 11:38:48AM +0530, Rajeshwar Shinde wrote:
> > Please verify this patch.
> > Thanks & Regards
>
> Please don't send content free pings and please allow a reasonable time
> for review.  People get busy, go on holiday, attend conferences and so
> on so unless there is some reason for urgency (like critical bug fixes)
> please allow at least a couple of weeks for review.  If there have been
> review comments then people may be waiting for those to be addressed.
>
> Sending content free pings adds to the mail volume (if they are seen at
> all) which is often the problem and since they can't be reviewed
> directly if something has gone wrong you'll have to resend the patches
> anyway, so sending again is generally a better approach though there are
> some other maintainers who like them - if in doubt look at how patches
> for the subsystem are normally handled.
>
> Please don't top post, reply in line with needed context.  This allows
> readers to readily follow the flow of conversation and understand what
> you are talking about and also helps ensure that everything in the
> discussion is being addressed.
>

--000000000000b9fa41060475675a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Remainder=C2=A0</div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Wed, 16 Aug, 2023, 5:02 pm Mark Brown, =
&lt;<a href=3D"mailto:broonie@kernel.org">broonie@kernel.org</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">On Wed, Aug 16, 2023 at 11:38:48AM=
 +0530, Rajeshwar Shinde wrote:<br>
&gt; Please verify this patch.<br>
&gt; Thanks &amp; Regards<br>
<br>
Please don&#39;t send content free pings and please allow a reasonable time=
<br>
for review.=C2=A0 People get busy, go on holiday, attend conferences and so=
 <br>
on so unless there is some reason for urgency (like critical bug fixes)<br>
please allow at least a couple of weeks for review.=C2=A0 If there have bee=
n<br>
review comments then people may be waiting for those to be addressed.<br>
<br>
Sending content free pings adds to the mail volume (if they are seen at<br>
all) which is often the problem and since they can&#39;t be reviewed<br>
directly if something has gone wrong you&#39;ll have to resend the patches<=
br>
anyway, so sending again is generally a better approach though there are<br=
>
some other maintainers who like them - if in doubt look at how patches<br>
for the subsystem are normally handled.<br>
<br>
Please don&#39;t top post, reply in line with needed context.=C2=A0 This al=
lows<br>
readers to readily follow the flow of conversation and understand what<br>
you are talking about and also helps ensure that everything in the<br>
discussion is being addressed.<br>
</blockquote></div>

--000000000000b9fa41060475675a--

--===============8835191267807115121==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============8835191267807115121==--
