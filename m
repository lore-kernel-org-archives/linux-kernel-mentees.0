Return-Path: <SRS0=4CcE=NI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C42BAC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Aug 2021 23:14:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C7B360F11
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Aug 2021 23:14:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6C7B360F11
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A0B180C6D;
	Tue, 17 Aug 2021 23:14:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m9XpMF6corMQ; Tue, 17 Aug 2021 23:14:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2B48B80DB4;
	Tue, 17 Aug 2021 23:14:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EDF94C0010;
	Tue, 17 Aug 2021 23:14:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 39D21C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Aug 2021 23:14:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 16D8460699
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Aug 2021 23:14:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YaQqAp5C_AuV
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Aug 2021 23:14:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6E8BE60683
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Aug 2021 23:14:02 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id by4so196703edb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Aug 2021 16:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=iRF9dju6J059xyTR8VyRl88W/5pnwqVbmMlYW4x9NaE=;
 b=br0boaMXC9phpx4Y9I+D2EmzXej7qbV5tRCbUePOxziX/sbjAbmFlC3vt9Hs4xc+Vs
 pb4V4DDQiTG8inih6YyZtRRsHvs761TJhJyHLS2etHDZuBQfdc7G8H5h0KumKdI5ULd0
 p7/OHABT2ulZXt58HZAMd5SAwwwNskR7P2A9RT3kua9rrsHugwsORsEFfX6I/N48qts6
 fgUowZ54Zi3LF1JMOCHtZuUotHO7psWFZDWmG5suwXJdsSsBzaLyL0S3e5HBrXoPHGF7
 mFTle6yCwyTxWySPcZYC4s+WCHlpNU67632K5DjgPC9EhjpnvSRziHkxE7DHNi3GkKYW
 UC/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=iRF9dju6J059xyTR8VyRl88W/5pnwqVbmMlYW4x9NaE=;
 b=Psa/WNRBC4PZLaGs7k8AfyI7THW8ai65JlSt7rIWyxwdr25aA8LToXVrgGpo6CTtDi
 7M1HoAhSiQvBNNb/rThz3dM0XnGa6OsCyZklGfKIs/x+gbZCetpTJ0ITX8NaM1YVJafX
 DfDPPgqqnLzV/WdYP0+Iyu8VF+0hMJCGryYwVQJTV0CsilnxwQZL25c5eqIJR0JBiyBX
 BHZdp8uZOG5xI/+AGXptIYy31tyXXSWcKageV99y2J2yS1k5ZsL2aco4MbcuBLm2jg9+
 d+qX74c/p1JWGFre86336MYL64IDVu/M0Axl7Kw3KpJlPsZIzmtyC7tPQ8uVduuTaYVJ
 hh+Q==
X-Gm-Message-State: AOAM533E2sCm0eLmCNc+OvOMgyDeE4ckUmCw7Omd5NrR0vIVJb17nSPU
 aolBE0FRIgi556IOkyfvtn3GI8wMM7AFr/xpH/PnBhVHaWAmtg==
X-Google-Smtp-Source: ABdhPJxG4fkEIvgYc6ezIYEJeQxrSFBU/e02zJV0gRCjyLqYXqMQWGv7t2k/gcMz+Xrh7e+jg27GIu6NkpE1TqYHimg=
X-Received: by 2002:a05:6402:b56:: with SMTP id
 bx22mr6676929edb.285.1629242040565; 
 Tue, 17 Aug 2021 16:14:00 -0700 (PDT)
MIME-Version: 1.0
From: faith hunja <faithhunja17@gmail.com>
Date: Wed, 18 Aug 2021 02:13:49 +0300
Message-ID: <CAPORMKYU7OEg3Poxwx8fOi5vFBeLn+xjvD_FGNUn83m6RGkTOg@mail.gmail.com>
Subject: Linux Kernel: Mining for Maintainers mentorship program
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
Content-Type: multipart/mixed; boundary="===============1342890841391590345=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============1342890841391590345==
Content-Type: multipart/alternative; boundary="00000000000014c38805c9c979af"

--00000000000014c38805c9c979af
Content-Type: text/plain; charset="UTF-8"

Hello.

I am interested in the Mining Maintainers mentorship program and I would
like to work on the tasks for the mentee selection.

Regards,
Faith Hunja.

--00000000000014c38805c9c979af
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello.<div><br></div><div><span style=3D"color:rgb(33,37,4=
1);font-family:Poppins,Roboto,&quot;Helvetica Neue&quot;,Arial,sans-serif;f=
ont-size:12.8px;white-space:pre-line">I am interested in the Mining Maintai=
ners mentorship program and I would like to work on the tasks for the mente=
e selection.</span><br></div><div><span style=3D"color:rgb(33,37,41);font-f=
amily:Poppins,Roboto,&quot;Helvetica Neue&quot;,Arial,sans-serif;font-size:=
12.8px;white-space:pre-line"><br></span></div><div><span style=3D"color:rgb=
(33,37,41);font-family:Poppins,Roboto,&quot;Helvetica Neue&quot;,Arial,sans=
-serif;font-size:12.8px;white-space:pre-line">Regards,</span></div><div><sp=
an style=3D"color:rgb(33,37,41);font-family:Poppins,Roboto,&quot;Helvetica =
Neue&quot;,Arial,sans-serif;font-size:12.8px;white-space:pre-line">Faith Hu=
nja.</span></div></div>

--00000000000014c38805c9c979af--

--===============1342890841391590345==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============1342890841391590345==--
