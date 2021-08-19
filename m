Return-Path: <SRS0=yLM5=NK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC4EDC4320A
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 19 Aug 2021 13:25:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 369BE6103A
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 19 Aug 2021 13:25:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 369BE6103A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=students.iitmandi.ac.in
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E094240397;
	Thu, 19 Aug 2021 13:25:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M9AYUXJmrFrC; Thu, 19 Aug 2021 13:25:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E0812407CB;
	Thu, 19 Aug 2021 13:25:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B9400C0010;
	Thu, 19 Aug 2021 13:25:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 609A6C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Aug 2021 13:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A96480CED
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Aug 2021 13:25:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key)
 header.d=students-iitmandi-ac-in.20150623.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eYI28QEsdS1N
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Aug 2021 13:25:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DB65280CD1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Aug 2021 13:25:16 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id x5so4493503qtq.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Aug 2021 06:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=students-iitmandi-ac-in.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=2gkFxeJJvNDUkW/XD/V3YbM9HzQ88Y2RGNaBiBFlO0k=;
 b=Ivt72GFgDrGw/7HSHJZlaZ8uZ1Y8ORoPuS2fJG9DLMr/hUcSZmiRiTQxqdeq64Sr88
 e05hXqGVGT82rrr0wWmQYED/PbvTgNFGmEuaeEomo+omnGKbNU5gRx77Y1xh+BlmC4YF
 dhmU32rdKa675HlTB00xTJLtzhsTUu865oYI0KmBvPE81lNuuxLMT4rNeIoM2nnwl8yv
 HqnJMvIYGWDthhN2jFzuIruiSk5t26Qp1HDt6rMJRO3/+A9LCh/UVnd2o86gyT1iS1aK
 V0PxuMfAoiCttnjpyJEJ4Q3Ce+wU6cW8tgytDdkKw7OtZISoYhH+wAWM92Ce21/Jp+t8
 opGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=2gkFxeJJvNDUkW/XD/V3YbM9HzQ88Y2RGNaBiBFlO0k=;
 b=KKeqkCFuE2com6pfZLfbNrWQ+SVsSqGw5c7q70LFOguEibl2K8YK5cXZgS3AuvKf0y
 RACVA6mVFdBognIApfv1YaCXRYSfR0o22xkxNpsRDGv6Xs3xmYi+j57pb3rvkq3kcICF
 zvfkmJa2INCwc0q6/uMh8YAqyyfaWZZPvnycfgzV1prN4JegfJXVzD1X109LmnERBiCI
 Zauv9unjKE6/b5HLBS8PGNRv9KS2GL7YZJkxu1ptmiedqjpPB2LSpHulpBR3s/beh8X3
 lgirpBkyXCdLSX175i1rUvg72vBa9Pf9aU2NmQcGK3R3nELcXA+kQcKZWnIdXUcMITdg
 jA5w==
X-Gm-Message-State: AOAM5303V1FVe9nrQbCgV/L6mUVVZ56A+4BQC9UbGaBA/l5d6l2g97Iu
 vlUgMJzH9cURqLCYQErvHpwX6z5hSBLlLS7iH5AZUg==
X-Google-Smtp-Source: ABdhPJxQFcpSMUoY0AcLTQWFxcqn2cUwNkNYB5XdOGbn7w5HyShaIjlvwF2SWGfhNjsmmOTi1IevkW3LsEqwCcaeCE4=
X-Received: by 2002:a05:622a:14d:: with SMTP id
 v13mr12829812qtw.241.1629379515609; 
 Thu, 19 Aug 2021 06:25:15 -0700 (PDT)
MIME-Version: 1.0
From: Prakhar Uniyal <b18128@students.iitmandi.ac.in>
Date: Thu, 19 Aug 2021 18:55:04 +0530
Message-ID: <CANoAS7vdtB4NdHHzC_oRHr0tJgvd2gMAkv=hk=tUoN7cnA=jgA@mail.gmail.com>
Subject: Application for 'Linux Kernel: Mining Maintainers' mentorship program
To: lukas.bulwahn@gmail.com
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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
Content-Type: multipart/mixed; boundary="===============9089531955746426810=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============9089531955746426810==
Content-Type: multipart/alternative; boundary="0000000000003bc41905c9e97b22"

--0000000000003bc41905c9e97b22
Content-Type: text/plain; charset="UTF-8"

I am interested in the Mining Maintainers mentorship program and I would
like to work on the tasks for the mentee selection.

Regards,
Prakhar Uniyal

--0000000000003bc41905c9e97b22
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"color:rgb(33,37,41);font-family:Poppins,Rob=
oto,&quot;Helvetica Neue&quot;,Arial,sans-serif;font-size:12.8px;white-spac=
e:pre-line">I am interested in the Mining Maintainers mentorship program an=
d I would like to work on the tasks for the mentee selection.</span><br><di=
v><span style=3D"color:rgb(33,37,41);font-family:Poppins,Roboto,&quot;Helve=
tica Neue&quot;,Arial,sans-serif;font-size:12.8px;white-space:pre-line"><br=
></span></div><div><span style=3D"color:rgb(33,37,41);font-family:Poppins,R=
oboto,&quot;Helvetica Neue&quot;,Arial,sans-serif;font-size:12.8px;white-sp=
ace:pre-line">Regards,</span></div><div><span style=3D"color:rgb(33,37,41);=
font-family:Poppins,Roboto,&quot;Helvetica Neue&quot;,Arial,sans-serif;font=
-size:12.8px;white-space:pre-line">Prakhar Uniyal</span></div></div>

--0000000000003bc41905c9e97b22--

--===============9089531955746426810==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============9089531955746426810==--
