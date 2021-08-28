Return-Path: <SRS0=ANfH=NT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D1DDC432BE
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 28 Aug 2021 18:24:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D05F86023E
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 28 Aug 2021 18:24:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D05F86023E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 936E76073B;
	Sat, 28 Aug 2021 18:24:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oTcMUIR-srr8; Sat, 28 Aug 2021 18:24:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 96905605CE;
	Sat, 28 Aug 2021 18:24:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 69E17C001A;
	Sat, 28 Aug 2021 18:24:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EBD74C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Aug 2021 18:24:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E75804017B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Aug 2021 18:24:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vHZZVzzM_mfU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Aug 2021 18:24:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2BF9A400EB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Aug 2021 18:24:02 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id g14so8737285pfm.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Aug 2021 11:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=hDf9NBbjbGaYgmQDlZeaP3saynHi1Mxv1iAhxveJxAo=;
 b=JKInRT467mwhxAyE9ijUxVCOlO70Wckztt0AsT9Ii5s534MqsTjYf9nX8qAYzIjiij
 y4X0sF1QJeK/qH/RtF2mUOe8zAhs3SFx7IcbzjvsWv/hJCCxH1PIKGEevXWjE4XMTVOW
 RAnSRWNa9t2fA63BmAyC56jJNgEniJEyQM38d0DIC8r7wn3rNpzOPPuMB2VpPVh+pOp2
 SQOGPdDg9c+emNn595M050fAt0hPgIMRx5DVtKzsUHRjDuW2v9ZG5uk60JBpj5ZhBHbm
 An1VnLHBwyu9jwZV3AIXMzUM4sWPVHvPTxa1UStsGb2AC5KyvYdgu0h2UC4xS0Bvq8AR
 uI0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=hDf9NBbjbGaYgmQDlZeaP3saynHi1Mxv1iAhxveJxAo=;
 b=FuK7+UxlNjUzPVFYARgvyrOmMavLEVDgTGOwk3OzWzbPVwgn4U0UGpErwEYlMNMicY
 lLIGSPol8oHqT/HzhUT0Zc8d4zVgpyU0jMWtxKQISKPowVRVqEc/NnfkJig4RriiawPZ
 Y1n0Xu+CaDNw1V1XXrdh2ZBsin8L5GYDpSTX2NsQwAaWLUaj5codipJpZ2exi0kRe/lB
 Ic+Q+2eF5p+aNDxLk+k71hxgOaFMKQ3dRYbZr/Bl82pCkaW5M468avyhiPyPIE0NOMAt
 3npl+m1jAMWumlmTbrExecHN1i5pDurcwBbE+w7wyMIrHdpoWhLOq9+9Qx+Ydb0eJpwv
 +UHw==
X-Gm-Message-State: AOAM5319B5n1gW24BRXjc6GVbZ1N8uE6+fEsOu21DMovX80pyhZ9tfFb
 BuVf3Sl9hKfDtbOD092B0/P0Dt5i3SxV7Ed81dE=
X-Google-Smtp-Source: ABdhPJzfW6/k5U3DRKQMwcpQYR/jP3gEVEx/uX00HSHYMO0X5FY/UsXkBYUma2K8Cm6fktcwcww5SZhQY/I3F3KUZ6c=
X-Received: by 2002:a05:6a00:150d:b0:3e2:13fc:dd2b with SMTP id
 q13-20020a056a00150d00b003e213fcdd2bmr15046357pfu.71.1630175041562; Sat, 28
 Aug 2021 11:24:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAKvDqm_ytP1BJ1Onw0n2f1F1bUXAuzETAiGZQDQmvdZifEhNrg@mail.gmail.com>
In-Reply-To: <CAKvDqm_ytP1BJ1Onw0n2f1F1bUXAuzETAiGZQDQmvdZifEhNrg@mail.gmail.com>
From: Sahethi DG <dgsahethi@gmail.com>
Date: Sat, 28 Aug 2021 23:53:50 +0530
Message-ID: <CAKvDqm8ZLUJrtBnQeFXCX+jeprond0=YybETVQ7ES3Q3-gsHWg@mail.gmail.com>
Subject: Re: Mining Maintainers mentorship program
To: lukas.bulwahn@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org
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
Content-Type: multipart/mixed; boundary="===============4791210835059548065=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============4791210835059548065==
Content-Type: multipart/alternative; boundary="000000000000462f5b05caa2b41c"

--000000000000462f5b05caa2b41c
Content-Type: text/plain; charset="UTF-8"

Hello,
I would just like to reiterate this mail and let you know the following: -
I am interested in the Mining Maintainers mentorship program and I would
like to work on the tasks for the mentee selection.

Best Regards,
Sahethi

On Sat, Aug 14, 2021 at 12:40 AM Sahethi DG <dgsahethi@gmail.com> wrote:

> Hello,
> I am Sahethi Depuru Guru a Third Year Student pursuing B-Tech in Computer
> Engineering. I am interested in the Mining Maintainers mentorship program
> and I would like to work on the tasks for the mentee selection.
>
> Best Regards,
> Sahethi
>

--000000000000462f5b05caa2b41c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,=C2=A0<div style=3D"user-select: auto;">I would just=
 like to reiterate this mail and let you know the following: -=C2=A0</div><=
div style=3D"user-select: auto;"><span style=3D"color:rgb(33,37,41);font-fa=
mily:Poppins,Roboto,&quot;Helvetica Neue&quot;,Arial,sans-serif;font-size:1=
2.8px;white-space:pre-line">I am interested in the Mining Maintainers mento=
rship program and I would like to work on the tasks for the mentee selectio=
n.</span><br style=3D"user-select: auto;"></div><div style=3D"user-select: =
auto;"><span style=3D"color:rgb(33,37,41);font-family:Poppins,Roboto,&quot;=
Helvetica Neue&quot;,Arial,sans-serif;font-size:12.8px;white-space:pre-line=
"><br style=3D"user-select: auto;"></span></div><div style=3D"user-select: =
auto;"><span style=3D"color:rgb(33,37,41);font-family:Poppins,Roboto,&quot;=
Helvetica Neue&quot;,Arial,sans-serif;font-size:12.8px;white-space:pre-line=
">Best Regards,</span></div><div style=3D"user-select: auto;"><span style=
=3D"color:rgb(33,37,41);font-family:Poppins,Roboto,&quot;Helvetica Neue&quo=
t;,Arial,sans-serif;font-size:12.8px;white-space:pre-line">Sahethi</span></=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Sat, Aug 14, 2021 at 12:40 AM Sahethi DG &lt;<a href=3D"mailto:dgsah=
ethi@gmail.com">dgsahethi@gmail.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><span style=3D"color:rg=
b(33,37,41);font-family:Poppins,Roboto,&quot;Helvetica Neue&quot;,Arial,san=
s-serif;font-size:12.8px;white-space:pre-line">Hello,=C2=A0</span><div><spa=
n style=3D"color:rgb(33,37,41);font-family:Poppins,Roboto,&quot;Helvetica N=
eue&quot;,Arial,sans-serif;font-size:12.8px;white-space:pre-line">I am Sahe=
thi Depuru Guru a Third Year Student pursuing B-Tech in Computer Engineerin=
g. I am interested in the Mining Maintainers mentorship program and I would=
 like to work on the tasks for the mentee selection.</span></div><div><span=
 style=3D"color:rgb(33,37,41);font-family:Poppins,Roboto,&quot;Helvetica Ne=
ue&quot;,Arial,sans-serif;font-size:12.8px;white-space:pre-line"><br></span=
></div><div><font color=3D"#212529" face=3D"Poppins, Roboto, Helvetica Neue=
, Arial, sans-serif"><span style=3D"font-size:12.8px;white-space:pre-line">=
Best Regards,=C2=A0</span></font></div><div><font color=3D"#212529" face=3D=
"Poppins, Roboto, Helvetica Neue, Arial, sans-serif"><span style=3D"font-si=
ze:12.8px;white-space:pre-line">Sahethi</span></font></div></div>
</blockquote></div>

--000000000000462f5b05caa2b41c--

--===============4791210835059548065==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============4791210835059548065==--
