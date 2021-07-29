Return-Path: <SRS0=Pn+h=MV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A03EC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 29 Jul 2021 11:21:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F272260E9B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 29 Jul 2021 11:21:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F272260E9B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFC6440505;
	Thu, 29 Jul 2021 11:21:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z9GmahLcyPd5; Thu, 29 Jul 2021 11:21:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id D7A7540503;
	Thu, 29 Jul 2021 11:21:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9E10CC0010;
	Thu, 29 Jul 2021 11:21:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8FF23C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Jul 2021 11:21:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 792B660608
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Jul 2021 11:21:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AAot1wrAf1Pu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Jul 2021 11:21:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A1458605A2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Jul 2021 11:21:48 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id h11so7022497ljo.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Jul 2021 04:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=D3aBgOYGqgdNxMFGWe/HxusoFakhmJGqSBunWQoCwyA=;
 b=GxwybrWITDwYmBcMzCqmwTAWhyReh7rU0Pn1Tk1f9wF7W5m591N9bAqiRso178Ffbs
 pwnr2geSWLjEefBV6L1GaLinfPAq4O7uiLccn7Z9At+eRxOzqpAnGpVsFFZu7dGqpmYx
 BKbf+RefF2hQh2BxFFJ7J45QAaDUGpfFM65fxht6+ddxQLm1CnxlOW+f4nWwtqoeVbxA
 jd7D42irVQlgOgMkLtvmcR63wRRXaTrWiwWvVGddMrPjkmvxegPIAZtq4/onQwOidDqZ
 L8DiBBdUA+7YQl/3xMM7bo+Lfl9hgNJVs+0Rl1f1WfGjR2Sgo4knS1QMUcKPGjkDXqGo
 WFBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=D3aBgOYGqgdNxMFGWe/HxusoFakhmJGqSBunWQoCwyA=;
 b=FX9LjuYzduMj/1vkoQAeXzcvDefpZ2HVTTEkTzyEfNsXcpgkr4CpaJMJMgsD5deMxL
 xedIvJM3u3nY6xf5AGA7g6Lm2KYmnUBWwQcf6rQE5vXGnYR5z/udgZkHl1Wv13+YJpLy
 D+h3JbVVX8+BW65v1WfAu1/QNjmr5Gx3wAA6cC8sgWlgHbM5BN70y8IG5Hh3xVu905Se
 HdOjBOFm5V7AF6auEtV/k2RNoOLhC916v3VhnOYfPcXEF8791hnOGIxi51WGmY+Kuwld
 ddz5D6maJLqgzMffya0QZQV2j8KHCHam5jtl6JgqESn4/mZ2SIKSFd0crnRjxOoC+ebE
 7H5w==
X-Gm-Message-State: AOAM533KKmCmDcOPdFX4tr9GASk/JPnDQkjwpaDMGQyXqGFbrV9j77DK
 +/jUY8tDBdZaaHN8aF7DApIRei4VyRbfOlxY+MnGeHdVPqrkQlIa
X-Google-Smtp-Source: ABdhPJz6aXKPO1xjDGuqLy+7l1pycRx7PujLmSjFglrHsTKxSkTydYSFQM/bPJKT2d+Aa4TAELa5WG7zWEGlkTmrbtk=
X-Received: by 2002:a2e:a885:: with SMTP id m5mr2675742ljq.288.1627557706313; 
 Thu, 29 Jul 2021 04:21:46 -0700 (PDT)
MIME-Version: 1.0
From: Richard Gregory <gregory.o.richard@gmail.com>
Date: Thu, 29 Jul 2021 12:21:35 +0100
Message-ID: <CALPTtY+-FEvTJStrAKRTdWANjjzrrH5iD9V2EQn9uEcHy_rQCg@mail.gmail.com>
Subject: Mining Maintainers Mentorship Program
To: linux-kernel-mentees@lists.linuxfoundation.org, lukas.bulwahn@gmail.com
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
Content-Type: multipart/mixed; boundary="===============3154675104993892258=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============3154675104993892258==
Content-Type: multipart/alternative; boundary="000000000000efb16c05c8414ef6"

--000000000000efb16c05c8414ef6
Content-Type: text/plain; charset="UTF-8"

Hello,

My name is Richard Gregory. I am a software developer from Nigeria. I am
interested in the Mining Maintainers mentorship program and I would like to
work on the tasks for the mentee selection. Thank you for your
consideration.

Regards,
Richard Gregory

--000000000000efb16c05c8414ef6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><span style=3D"color:rgb(33,37,41);font-family:Poppin=
s,Roboto,&quot;Helvetica Neue&quot;,Arial,sans-serif;font-size:12.8px;white=
-space:pre-line">Hello,</span></div><div><span style=3D"color:rgb(33,37,41)=
;font-family:Poppins,Roboto,&quot;Helvetica Neue&quot;,Arial,sans-serif;fon=
t-size:12.8px;white-space:pre-line"><br></span></div><div><span style=3D"co=
lor:rgb(33,37,41);font-family:Poppins,Roboto,&quot;Helvetica Neue&quot;,Ari=
al,sans-serif;font-size:12.8px;white-space:pre-line">My name is Richard Gre=
gory. I am a software developer from=C2=A0Nigeria.=C2=A0</span><span style=
=3D"color:rgb(33,37,41);font-family:Poppins,Roboto,&quot;Helvetica Neue&quo=
t;,Arial,sans-serif;font-size:12.8px;white-space:pre-line">I am interested =
in the Mining Maintainers mentorship program and I would like to work on th=
e tasks for the mentee selection. Thank you for your consideration.</span><=
/div><div><span style=3D"color:rgb(33,37,41);font-family:Poppins,Roboto,&qu=
ot;Helvetica Neue&quot;,Arial,sans-serif;font-size:12.8px;white-space:pre-l=
ine"><br></span></div><div><span style=3D"color:rgb(33,37,41);font-family:P=
oppins,Roboto,&quot;Helvetica Neue&quot;,Arial,sans-serif;font-size:12.8px;=
white-space:pre-line">Regards,</span></div><div><span style=3D"color:rgb(33=
,37,41);font-family:Poppins,Roboto,&quot;Helvetica Neue&quot;,Arial,sans-se=
rif;font-size:12.8px;white-space:pre-line">Richard Gregory</span></div></di=
v>

--000000000000efb16c05c8414ef6--

--===============3154675104993892258==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============3154675104993892258==--
