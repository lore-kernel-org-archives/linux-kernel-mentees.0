Return-Path: <SRS0=s3T2=MJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_RED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21BA7C636CA
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 17 Jul 2021 18:01:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4FA96113D
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 17 Jul 2021 18:01:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4FA96113D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A7A083DF1;
	Sat, 17 Jul 2021 18:01:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fbpyHdKydDO3; Sat, 17 Jul 2021 18:01:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 9668B83C8F;
	Sat, 17 Jul 2021 18:01:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 75592C0010;
	Sat, 17 Jul 2021 18:01:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E86AEC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 18:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D78484016C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 18:01:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m84NeSIqpLeu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 18:01:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2105A4002B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 18:01:42 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id h9so18797444ljm.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 11:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=VFNuyUSeFT1PNDZuI8PjWZxCn7Lj1L8QFvdacQcMoUw=;
 b=GPZGXx/xl++O0M7xJKGVOmH2OHjriklNZeOompWhRcArga8rmwjQNqdCVTvxGYsmIK
 l3VIJLeeiMiDxBd/HIhdcxusf0f3r3wZYzE+9rS9GvAL5DHkJkM8c5WEUInHsYnfAAOf
 rPZGuJ3dyUHHIiMnj1HNXaDv6VnKuUGkHDKMLc0vvSaEH2nyZN/deng7emwKKsxM4Ks4
 BKnqrG0aF8ojjf8s/Q6w6/RbNjoVJrKg7dhoiI8wSEdPBB1Dyw+RknmWBhWkNYEI1xcv
 FbOPiEz9MYjAe11wjjs1qmARP+c2IxjEaIhEqz1Huz0tVQ/ZQ+A2XBkMocqFSJrUdrB9
 tgxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=VFNuyUSeFT1PNDZuI8PjWZxCn7Lj1L8QFvdacQcMoUw=;
 b=GXUT3st4DTu5yp5cjwzPi3DdviZfboSbxtajEqWkzihKSrkk6WWr9PxspHxE12KQPN
 NDLB3fKqALbAqCJxbwqnwS2xIywRNJURVlZWlgcUb5MJTkOU05ohL+UyD7IUCayRa1qR
 CEpQz1YrhXvSU08TDjN1TS/FH2FYMHX20yefKtyaxwlplWgNOkrxM7w3rWOKCEE8BP6C
 HwT7tbdG3KEuBu4vMoeTUOLdcPiWVJPs0zLoh134a2HX/K8OR0VgjAmHHleAQ46nqpDx
 hvocJaFgw95T5rheeHHIaNPXjoy7fOEeRUHw+/m0AlBcA7e8UQ2qKNYIZWrtbF+qFZk6
 8UzQ==
X-Gm-Message-State: AOAM532wJLPBbDXkXsXEHMxqc1Gf3cYsVRuV5QYcSECVhjDXjUKgw1J7
 fFlhYKbWAVwuUbP2JsG+ZDLnMKHdkqUG4i/PbfKT1jx9wpHjqg==
X-Google-Smtp-Source: ABdhPJwcsDt5PjhXqFzhoONLye16R4uKylXG4EGFjWHq/L+3HlXywqymESrV3fJTeXheWeacMs/ikw8xPWxHg9IDrho=
X-Received: by 2002:a2e:b8ce:: with SMTP id s14mr14403683ljp.177.1626544900805; 
 Sat, 17 Jul 2021 11:01:40 -0700 (PDT)
MIME-Version: 1.0
From: Aliya Rahmani <aliyarahmani786@gmail.com>
Date: Sat, 17 Jul 2021 23:31:29 +0530
Message-ID: <CAGTWmRHbO7FcrkOzFKqiRes=L+GfVdAiLgbwjBNOQETsC3yO5A@mail.gmail.com>
Subject: Regarding LFX Mentorship
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
Content-Type: multipart/mixed; boundary="===============1697972632520032342=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============1697972632520032342==
Content-Type: multipart/alternative; boundary="00000000000006184405c7557feb"

--00000000000006184405c7557feb
Content-Type: text/plain; charset="UTF-8"

Greetings,

  I'm Aliya, an aspiring mentee and a passionate developer. I am interested
in the Checkpatch Documentation mentorship program and I would like to work
on the tasks for the mentee selection.
 Kindly provide me the details of the task for the mentee selection process.

Thanks and Regards,
Aliya

--00000000000006184405c7557feb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Greetings,<div><br><div>=C2=A0 I&#39;m Aliya, an aspiring =
mentee and a passionate developer.=C2=A0I am interested in the Checkpatch D=
ocumentation mentorship program and I would like to work on the tasks for t=
he mentee selection.=C2=A0</div><div>=C2=A0Kindly provide me the details of=
 the task for the mentee selection process.<br><br></div><div>Thanks=C2=A0a=
nd Regards,</div><div>Aliya</div></div></div>

--00000000000006184405c7557feb--

--===============1697972632520032342==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============1697972632520032342==--
