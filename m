Return-Path: <SRS0=TljZ=NE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7946C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Aug 2021 19:10:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9050861042
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Aug 2021 19:10:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9050861042
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5775B80E8B;
	Fri, 13 Aug 2021 19:10:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TzmhS0_uEZIZ; Fri, 13 Aug 2021 19:10:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 603EF80E88;
	Fri, 13 Aug 2021 19:10:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 30508C0010;
	Fri, 13 Aug 2021 19:10:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B67BAC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 19:10:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 987BD401FE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 19:10:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mD6eiK0SQ_dy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 19:10:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DF89740191
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 19:10:40 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id e19so13255167pla.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 12:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=/kK5UOfGn8puf27GrAvcycJn9YXEvDhUTd7aVGlYDXA=;
 b=Ql/qjYgrH42UMviBspyioLC3EyzLIpkATv7XGNotdO3xBx653iPwvK4a97Wts+Hqr+
 BqvqHDzLm8dV7tqxqk7aBF7mKRw1CGr4r302ntOOUWR/W4uvCH9XEbtl8yJQ3jvyj48t
 4Sy37JvVikLvC/dcEAEEUmi0vFcEprPFBdhJdKg6MpRuhK+1SE3vmVJWEUrU+G1ck0WR
 SBhi2aGcBW0fi+n5YYRE0nq5rx7RAt97OlvVH6YWZaLr9Bmx22K+9VPJUgGmCzGrCqJ7
 K7Y+bm+IjjcXLkRZ+AMg8GPk2W89X+ZvjQNA7UPuoj/4O31N07BzseDvfiYFU7ZmFEYK
 Og6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=/kK5UOfGn8puf27GrAvcycJn9YXEvDhUTd7aVGlYDXA=;
 b=sosJs9ciLun/KmtEqbdytBKPOOd+RJc1zBEhfVa919sz1A40xESB71quuajX4rlQOo
 NTuLwYOZiZOJtjfj66gCwdLuMPl+Ha+sU8/PFRi1OpHGGZRx+bPPkpJTaspa4Jh1S2UH
 W0Ozt724vBwLlzLy+e0A0rlXn/bVPvIIe4rR1tGD21abIbjsN8XjYee0N7aOrLfjDZ+H
 usT+V52tOFp2XCnCuIOA8Vih459u+V3R9j1SM/ZQx5y771YsQvCiydBQpsog5JwDb3gl
 twr/G9yvAOGRi9GW56DQ6+R1LxGHD/EbIn2yYhY18USTtfILl+bdbrtKDG43/SSNhEbO
 vmMQ==
X-Gm-Message-State: AOAM531PU6isD0lInPP57/15EAUmt5hhsb3P6XcwLLM90ollnAhFLJ3h
 Klqb3pFw+X2W3o6JBsIXHrRAaLPf6+U7oDVFIS8=
X-Google-Smtp-Source: ABdhPJzn/n6j+KIEJU6pHbU3bi/L6s7C9PpVB/NsPr3Mdaudbdr1mZJkgJF7iRpiiMjwqUBOwNuVb74L6J6smSXQbkY=
X-Received: by 2002:a17:902:bd05:b029:12d:5ce2:1e77 with SMTP id
 p5-20020a170902bd05b029012d5ce21e77mr3206290pls.10.1628881840337; Fri, 13 Aug
 2021 12:10:40 -0700 (PDT)
MIME-Version: 1.0
From: Sahethi DG <dgsahethi@gmail.com>
Date: Sat, 14 Aug 2021 00:40:29 +0530
Message-ID: <CAKvDqm_ytP1BJ1Onw0n2f1F1bUXAuzETAiGZQDQmvdZifEhNrg@mail.gmail.com>
Subject: Mining Maintainers mentorship program
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
Content-Type: multipart/mixed; boundary="===============8988602100650121212=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============8988602100650121212==
Content-Type: multipart/alternative; boundary="00000000000079771d05c9759b43"

--00000000000079771d05c9759b43
Content-Type: text/plain; charset="UTF-8"

Hello,
I am Sahethi Depuru Guru a Third Year Student pursuing B-Tech in Computer
Engineering. I am interested in the Mining Maintainers mentorship program
and I would like to work on the tasks for the mentee selection.

Best Regards,
Sahethi

--00000000000079771d05c9759b43
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"color:rgb(33,37,41);font-family:Poppins,Rob=
oto,&quot;Helvetica Neue&quot;,Arial,sans-serif;font-size:12.8px;white-spac=
e:pre-line">Hello,=C2=A0</span><div style=3D"user-select: auto;"><span styl=
e=3D"color:rgb(33,37,41);font-family:Poppins,Roboto,&quot;Helvetica Neue&qu=
ot;,Arial,sans-serif;font-size:12.8px;white-space:pre-line">I am Sahethi De=
puru Guru a Third Year Student pursuing B-Tech in Computer Engineering. I a=
m interested in the Mining Maintainers mentorship program and I would like =
to work on the tasks for the mentee selection.</span></div><div style=3D"us=
er-select: auto;"><span style=3D"color:rgb(33,37,41);font-family:Poppins,Ro=
boto,&quot;Helvetica Neue&quot;,Arial,sans-serif;font-size:12.8px;white-spa=
ce:pre-line"><br style=3D"user-select: auto;"></span></div><div style=3D"us=
er-select: auto;"><font color=3D"#212529" face=3D"Poppins, Roboto, Helvetic=
a Neue, Arial, sans-serif" style=3D"user-select: auto;"><span style=3D"font=
-size:12.8px;white-space:pre-line">Best Regards,=C2=A0</span></font></div><=
div style=3D"user-select: auto;"><font color=3D"#212529" face=3D"Poppins, R=
oboto, Helvetica Neue, Arial, sans-serif" style=3D"user-select: auto;"><spa=
n style=3D"font-size:12.8px;white-space:pre-line">Sahethi</span></font></di=
v></div>

--00000000000079771d05c9759b43--

--===============8988602100650121212==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============8988602100650121212==--
