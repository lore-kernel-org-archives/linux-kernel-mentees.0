Return-Path: <SRS0=TljZ=NE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07B1BC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Aug 2021 03:25:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 988C2610A7
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Aug 2021 03:25:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 988C2610A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B22540379;
	Fri, 13 Aug 2021 03:25:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nKmpIDXoCpsE; Fri, 13 Aug 2021 03:25:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 46A774035C;
	Fri, 13 Aug 2021 03:25:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 20160C001A;
	Fri, 13 Aug 2021 03:25:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5CB34C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 03:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 47E8D40763
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 03:25:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id btDr8lkDNZwX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 03:25:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8E9524048E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 03:25:08 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id d6so13237658edt.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Aug 2021 20:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=xakWRMNjSfkdX/JE/wAJM2AMcD9yMJasJ2Q3okJVugk=;
 b=aVGyy10lGy6a8ZiXpF1iKDDJHd0e0n23CLB8NYp+cfuZO7CUXJpt95lOJ+Y1tZljSb
 w6VFzJJZf7sNs8qWSBtGLNo08KuvwcP7XkwjF2kycz3LIRAj14DuF+d8jS1e3hEHN2Sw
 eyDeVO4O6yJusNZc0PapqnM5vt14NgZzAiOnxJUyY0rSntqU/P/bsyV2al4ESN06kY0F
 dBjQ7CZKtU3u/EJfkAXSY0aTDNU5qjCHAmffNJog9fdbt6GFRbzpc0GGFuWTA8HlzF3M
 w/CWzZI/kxogo6mxQYkAfl6m+4Y28HRVAJGcZvGP8tdRfnDZm/LKet1tshCL2k+BkRVF
 pcAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=xakWRMNjSfkdX/JE/wAJM2AMcD9yMJasJ2Q3okJVugk=;
 b=moyBifowHCmm0GcEGHyO94otUUQVs/3GfSl0mjpORXn2zcQaPDcxfke5+VYB5aZ9os
 ku4xcZBknUKk6sbO5WXbEwtMHlsdNQP+UjrUkFPVfWJzGMFWRK2+l7h5+x6rN/2A9ZVA
 DmPAa1JDmfRSn4d5AI9YrLZNdvaYQb/UVh0tJ1hTBY2FsCnNiqajbnJrVmqkyD1ALVhV
 /2Cckfi+/AIFvB/9U6beBzrdLEw9DvZDYqLILCyz35120CjtTVQaZNPK7FF8hVgTTWj/
 3Gjmc/MclfNhXYsFQg/lZjPmCuLpZyUnOWAYSAz1g6UubN/ZziZGmDeNJpJDP+vDF3TI
 UChQ==
X-Gm-Message-State: AOAM531plx8+x3S67lGKoVrs0u7kzMjpzW4DHLZO4Iin8Z8tc+etABpc
 TCMum+LRTBk/aJoft2p5AP9Jl77+6J27Q6N/2Ig=
X-Google-Smtp-Source: ABdhPJwWk8gSJh2qseEAH2A9JoNlKelyzpBS8go40hWNzlzFnjQGfD8sZNbKJhp3CwgLYpn3N3FE3crpeZQPHNTiVyg=
X-Received: by 2002:a05:6402:5251:: with SMTP id
 t17mr275464edd.157.1628825106616; 
 Thu, 12 Aug 2021 20:25:06 -0700 (PDT)
MIME-Version: 1.0
From: Yanbo Liang <liangyanbo00@gmail.com>
Date: Fri, 13 Aug 2021 11:25:01 +0800
Message-ID: <CAM5BWn_BXtuW6GjC=EL-CRnjQ8MA+=NSYDRsgnZMJ29+kfiVkQ@mail.gmail.com>
Subject: Mining Maintainers mentorship program Inquiry
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
Content-Type: multipart/mixed; boundary="===============6140336381640921099=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============6140336381640921099==
Content-Type: multipart/alternative; boundary="000000000000e194f305c9686516"

--000000000000e194f305c9686516
Content-Type: text/plain; charset="UTF-8"

I am interested in the Mining Maintainers mentorship program and I would
like to work on the tasks for the mentee selection.

Best,
Yanbo Liang

--000000000000e194f305c9686516
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><span style=3D"color:rgb(33,37,41);font-family:Poppin=
s,Roboto,&quot;Helvetica Neue&quot;,Arial,sans-serif;font-size:16px;white-s=
pace:pre-line">I am interested in the Mining Maintainers mentorship program=
 and I would like to work on the tasks for the mentee selection.</span><br>=
</div><div><span style=3D"color:rgb(33,37,41);font-family:Poppins,Roboto,&q=
uot;Helvetica Neue&quot;,Arial,sans-serif;font-size:16px;white-space:pre-li=
ne"><br></span></div><div><span style=3D"color:rgb(33,37,41);font-family:Po=
ppins,Roboto,&quot;Helvetica Neue&quot;,Arial,sans-serif;font-size:16px;whi=
te-space:pre-line">Best,</span></div><div><span style=3D"color:rgb(33,37,41=
);font-family:Poppins,Roboto,&quot;Helvetica Neue&quot;,Arial,sans-serif;fo=
nt-size:16px;white-space:pre-line">Yanbo Liang</span></div></div>

--000000000000e194f305c9686516--

--===============6140336381640921099==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============6140336381640921099==--
