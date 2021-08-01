Return-Path: <SRS0=qNgb=MY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D08CEC432BE
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Aug 2021 08:14:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F54060F59
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Aug 2021 08:14:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7F54060F59
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5148E83CBE;
	Sun,  1 Aug 2021 08:14:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id StWB4au3EjHb; Sun,  1 Aug 2021 08:14:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 83DEF83CBB;
	Sun,  1 Aug 2021 08:14:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 67714C0010;
	Sun,  1 Aug 2021 08:14:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7D63DC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Aug 2021 08:14:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 67E9F607B4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Aug 2021 08:14:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ydLyF5V0mcal
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Aug 2021 08:13:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D06AD605C9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Aug 2021 08:13:59 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id a1so2064254ioa.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 01 Aug 2021 01:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=RoxWRZi8xpgVnwHO+P7sYuz+yWhlDSTJ4ZXbTN1VfYw=;
 b=gcqopD7FQmBFNwR6FeLXuEmq+iDVB+tsazWy1yJn/ODl9BQqPIqy1JIxxZKn9f/Ap7
 bsPORE8sOjXFg+4N/jvwr1Rcm3PgPznQeUJ7Tgx5G55FsqqjGn6KtssKm6rCsXwLc9KI
 a2vPCcOxc+/NRfXT8YUc6VIycQA60C4cBG2BJhqVNiPY0M9Ka50wrcyYXsyYIJsSsMcn
 TuOqBn7R+xKalM8AKwunEBumHTAXFVPA94jhS8lyEtDFweI60WXGAy/QSXAg7Lx4hqEJ
 qUuknLxX4Z7GlRsZXcuK8mNBpceDwAoTPOOUUE9px6+g0CzEYbKhDaTMRpNLQzV6+z9L
 zpdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=RoxWRZi8xpgVnwHO+P7sYuz+yWhlDSTJ4ZXbTN1VfYw=;
 b=Lwi/hATw9fBM0B929IUYRKeKdtwwIz6VIpT7UGGxvjtl2aCOtT4NiB5tl2rusywY88
 SGaOh7c6uVBnP66lE9EVK7bS9Xwd99WcKG+PYhAFPBLi1syT/PnxNuf78FQVHiH/1MVY
 Lsy7aN5IK9EGkPnbtfxOwhSONeyLpPh5xUVz0FvbiBSHIo+jk2UR/z1DB55hhIa07pJq
 rIlW2+DQ2QrA9v4K4UwtM+/gr8To/jqj6sVFhJmdIWGisP4ciH1DxeDw1W6aMB5WyDYi
 UMkZVHFJZ9L16OFcZEIAwOmTqHe7AGQPaWUg+F5B4caWpTNpsbDOiGkbyxmlesFUJ15O
 gHoQ==
X-Gm-Message-State: AOAM532fpY3iIfwWWoA3Yo7Rl+1Veu/3t8K3CYYppyB28hYIGwdeUHnD
 WTWGBWhOG3bxItUIqCkcEjUWaEtvWMKOhWuje90=
X-Google-Smtp-Source: ABdhPJz7GFcj4wLre8jWrZnb5dO/ifEobCYEYU5eGT4ojTv2kedVPxbVrsgttkgmEGNHX4C57sHI+S9IAclVN3708qs=
X-Received: by 2002:a02:6a24:: with SMTP id l36mr9106019jac.4.1627805638949;
 Sun, 01 Aug 2021 01:13:58 -0700 (PDT)
MIME-Version: 1.0
From: Anuj Pandey <anujpandey785@gmail.com>
Date: Sun, 1 Aug 2021 13:43:46 +0530
Message-ID: <CACuAKu1KbnZEvMDCUT1PJwqUqfEoGQWCuZKUhB=FSk10Ju8p0w@mail.gmail.com>
Subject: Linux Kernel: Checkpatch Documentation
To: lukas.bulwahn@gmail.com, dwaipayanray1@gmail.com, 
 linux-kernel-mentees@lists.linuxfoundation.org
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
Content-Type: multipart/mixed; boundary="===============4997939314925628371=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============4997939314925628371==
Content-Type: multipart/alternative; boundary="000000000000df7cc205c87b0803"

--000000000000df7cc205c87b0803
Content-Type: text/plain; charset="UTF-8"

I am interested in the Checkpatch Documentation mentorship program and I
would like to work on the tasks for the mentee selection

Thanks & Regards,
Anuj Pandey

--000000000000df7cc205c87b0803
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"color:rgb(33,37,41);font-family:Poppins,Rob=
oto,&quot;Helvetica Neue&quot;,Arial,sans-serif;font-size:12.8px;white-spac=
e:pre-line">I am interested in the Checkpatch Documentation mentorship prog=
ram and I would like to work on the tasks for the mentee selection</span><b=
r><div><span style=3D"color:rgb(33,37,41);font-family:Poppins,Roboto,&quot;=
Helvetica Neue&quot;,Arial,sans-serif;font-size:12.8px;white-space:pre-line=
"><br></span></div><div><span style=3D"color:rgb(33,37,41);font-family:Popp=
ins,Roboto,&quot;Helvetica Neue&quot;,Arial,sans-serif;font-size:12.8px;whi=
te-space:pre-line">Thanks &amp; Regards,</span></div><div><span style=3D"co=
lor:rgb(33,37,41);font-family:Poppins,Roboto,&quot;Helvetica Neue&quot;,Ari=
al,sans-serif;font-size:12.8px;white-space:pre-line">Anuj Pandey</span></di=
v></div>

--000000000000df7cc205c87b0803--

--===============4997939314925628371==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============4997939314925628371==--
