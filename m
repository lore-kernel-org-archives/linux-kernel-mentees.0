Return-Path: <SRS0=pZ6u=MP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52624C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 23 Jul 2021 14:50:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01D6960EBD
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 23 Jul 2021 14:50:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 01D6960EBD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C019E60A5C;
	Fri, 23 Jul 2021 14:50:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uXOoEXge1yJv; Fri, 23 Jul 2021 14:50:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id EBBEE60730;
	Fri, 23 Jul 2021 14:50:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CA6F1C001A;
	Fri, 23 Jul 2021 14:50:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E9BBEC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Jul 2021 14:50:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CBE64401FC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Jul 2021 14:50:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EOWPxSb4lNUX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Jul 2021 14:50:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0AC0A4015C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Jul 2021 14:50:45 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id f12so2048953ljn.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Jul 2021 07:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=aL9YMamiROiwjcN3w9iAY8jEL83T0E/bH/RZolYwT1Y=;
 b=b7CNZLvrkxvfy/s08F4Jm/vtjyuN2w92UJ3JCfZ9AhYcqGaW/r3ZcwyHUSyHQR+8Vc
 5g5a2PnymkxeDezT5bOWzbbIKqhZJUw2lnOmW+n1HuS7VcjvzSO1OAaInVEvIGay1LZ3
 waeBi/bjhrUpexU/wpjoRdh9wfvpZX6J6j0dALsduVFkjo+odzhQ1PoYxeBoI2tEKTZl
 jttQC1SKjydNGa4jmggbduep5u4erhZx/oRyCurYIGg15akJ0c37Z2OvFSvymoghC0DB
 dzy41FsLtJoGJEDlr1Nrfs+OrnN9NLW+BJ2mtjAIXpkljg97Do/ZQ9M6wR9yg2ly7zS6
 76Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=aL9YMamiROiwjcN3w9iAY8jEL83T0E/bH/RZolYwT1Y=;
 b=DFoO8cX722zR5ShjdNLItJrQ83GeDCc/E2y/PIS1yo8zYi3K8IgQMXINO8pcNBFkhi
 ZmYfFa60hzo/yjFWAllOcPmoy91MfwqtDhgsNNeI4iOLfnFQWcYqChbALJBc9H0gkymO
 FKiDHB3tskQOmVHirFOHDDp7es342/z8mzQmqEUflvODeaVSROY9pSoYFKq4idNL/eEb
 LdB5BEXkEy/Y8q/xhvs29SH5VnMe0WT93NHeK5oei6MWa9T6ewZDgvM6BfZvfEUIRB/X
 XbRwdWUbr4BDhQ2bzLY0ijmE/SzcnoLYK5CvaJZqDQv+qD3jA2lmd/Bz4tkDnA0fvjAs
 XBFA==
X-Gm-Message-State: AOAM532KkF5Nf7k9foZvv1S6iu1i/5uD498EQh0BAXNN3fcfZwnGq1ib
 yHWidWHMB7FmzdVXgWWTcnL8FmduQGM7aRoXW0AnNr6UFBwBYK7c
X-Google-Smtp-Source: ABdhPJxr9/+wawu++wLlSTvaIskVXJj85Auao6NBotDXd/vZ58smJGucEz6/6rg7sTSacFiZyFzbtPVN9OWAk8+rqvg=
X-Received: by 2002:a2e:155c:: with SMTP id 28mr3534972ljv.337.1627051843833; 
 Fri, 23 Jul 2021 07:50:43 -0700 (PDT)
MIME-Version: 1.0
From: SHIVAM VAISHAMPAYAN <shivamvviiita@gmail.com>
Date: Fri, 23 Jul 2021 20:20:30 +0530
Message-ID: <CAN5=y1+NS4SNq5HmWPNm2bWznV3e--oQz53zXbkD5ZJd1=4p1Q@mail.gmail.com>
Subject: Checkpatch Documentation Mentorship Programme
To: linux-kernel-mentees@lists.linuxfoundation.org
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
Content-Type: multipart/mixed; boundary="===============7162349729587158956=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============7162349729587158956==
Content-Type: multipart/alternative; boundary="0000000000002ed28f05c7cb8749"

--0000000000002ed28f05c7cb8749
Content-Type: text/plain; charset="UTF-8"

Hello guys,

I am interested in the Checkpatch Documentation mentorship program and I
would like to work on the tasks for the mentee selection.

I have already mailed the mentors about the same.

Looking forward to hearing from you :)

Thank you
Shivam Vaishampayan

--0000000000002ed28f05c7cb8749
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><span style=3D"color:rgb(33,37,41);font-family:Poppin=
s,Roboto,&quot;Helvetica Neue&quot;,Arial,sans-serif;font-size:12.8px;white=
-space:pre-line">Hello guys,</span></div><span style=3D"color:rgb(33,37,41)=
;font-family:Poppins,Roboto,&quot;Helvetica Neue&quot;,Arial,sans-serif;fon=
t-size:12.8px;white-space:pre-line"><div><br></div>I am interested in the C=
heckpatch Documentation mentorship program and I would like to work on the =
tasks for the mentee selection.</span><div><font color=3D"#212529" face=3D"=
Poppins, Roboto, Helvetica Neue, Arial, sans-serif"><span style=3D"font-siz=
e:12.8px;white-space:pre-line"><br></span></font></div><div><font color=3D"=
#212529" face=3D"Poppins, Roboto, Helvetica Neue, Arial, sans-serif"><span =
style=3D"font-size:12.8px;white-space:pre-line">I have already mailed the m=
entors about the same.<br></span></font><div><span style=3D"color:rgb(33,37=
,41);font-family:Poppins,Roboto,&quot;Helvetica Neue&quot;,Arial,sans-serif=
;font-size:12.8px;white-space:pre-line"><br></span></div><div><span style=
=3D"color:rgb(33,37,41);font-family:Poppins,Roboto,&quot;Helvetica Neue&quo=
t;,Arial,sans-serif;font-size:12.8px;white-space:pre-line">Looking=C2=A0for=
ward to hearing from you :)</span></div><div><span style=3D"color:rgb(33,37=
,41);font-family:Poppins,Roboto,&quot;Helvetica Neue&quot;,Arial,sans-serif=
;font-size:12.8px;white-space:pre-line"><br></span></div><div><span style=
=3D"color:rgb(33,37,41);font-family:Poppins,Roboto,&quot;Helvetica Neue&quo=
t;,Arial,sans-serif;font-size:12.8px;white-space:pre-line">Thank you</span>=
</div><font color=3D"#888888"><div><span style=3D"color:rgb(33,37,41);font-=
family:Poppins,Roboto,&quot;Helvetica Neue&quot;,Arial,sans-serif;font-size=
:12.8px;white-space:pre-line">Shivam Vaishampayan</span></div></font></div>=
</div>

--0000000000002ed28f05c7cb8749--

--===============7162349729587158956==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============7162349729587158956==--
