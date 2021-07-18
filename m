Return-Path: <SRS0=+xMb=MK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7FDCC636C8
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 18 Jul 2021 11:13:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40D7C61108
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 18 Jul 2021 11:13:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40D7C61108
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 003AB60647;
	Sun, 18 Jul 2021 11:13:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YzaCgeaXO89u; Sun, 18 Jul 2021 11:13:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 3230F60629;
	Sun, 18 Jul 2021 11:13:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 10CDEC0010;
	Sun, 18 Jul 2021 11:13:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 96B7FC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jul 2021 11:13:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 85A6560629
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jul 2021 11:13:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j38swhVpfIBx
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jul 2021 11:13:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 89523605F7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jul 2021 11:13:44 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id go30so23064252ejc.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jul 2021 04:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=FLBjE4jAyZAKACEgPEaCLGjXEvHagdZfYaIuCrn8R9A=;
 b=PwqJQlnRBfpn/B9hbhxn6RBGWsVBPfwBK7SDwCNxsXQOakgVgQ6wVk9Yr24+UhBgu6
 vn2R1jGIQoFJfLdqLymsWGi3CRBObkmbCCuFDBT1SBnzcCod84KfVNS42bvtr1t8vdWc
 he+EELeBGtC0mdaByZcMrOY/uxtMdRkWcg2H+P1FOSJZUJIb2yhT0AkMOLFMMmSJlgeb
 z7rHYofU26f6+RWFsE7jZ1IQzyEGmM6FhwVMhlvBsTg0PSQwT5eEAk8/2JCSxdDxNg2p
 FrAOhe9PQ+vAbdngI6jJi+UaqqvOr//zXydxaLhIJTkMp3dmkkkHnHsr8N9sDsZOKAYJ
 Cl2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=FLBjE4jAyZAKACEgPEaCLGjXEvHagdZfYaIuCrn8R9A=;
 b=hQg2rifYs1am2ARTM3gusSLBcrd+ZJM7jfru9p0IO6VJoWtlC0vlvSxoYbWOC0o09J
 ARu+oUfg+pBKPGjSq5SSygY3Bi9t+0K5mXWa1KAf+TjzhmcPoR1AIknpNgF2SUEkyD17
 4TGKUM6hSP3QuxElFgpWxr9ihXHAH4aJol5Md3CD1/aEp5rnbOUIviSVpJdUwN88JXhC
 dya/6lC4RgRjtap85fsFNjsnTN05zLfP5Jl5Q81BXu9MXHF0pQPyL5dYGLQmp/XS5Njh
 skHjBMU+ptnApQyF/sW5L7Oce8ujqjaIpPEvigQMmwJuEHCPUdv6/jyWd3lBTqp+3A+4
 rprA==
X-Gm-Message-State: AOAM533U/uGfg6NggHm7iI68LpTLgSFfxrh/wCIyqVklHLcXektnNXPh
 D7lP1pU/+Yzp0VnHWH5+9U+RcjuMmip0hfl0SZ8=
X-Google-Smtp-Source: ABdhPJwHORDDOik5BunH0vT9arel8rAl5Y1mdRO8kgTlWKQWuN4aEKjXrUq7EEad6aDZCyjwkp0g9HvjdYJG/WXkhNs=
X-Received: by 2002:a17:906:3399:: with SMTP id
 v25mr22497573eja.357.1626606822714; 
 Sun, 18 Jul 2021 04:13:42 -0700 (PDT)
MIME-Version: 1.0
From: Nitin Wartkar <nitinwartkar58@gmail.com>
Date: Sun, 18 Jul 2021 16:43:31 +0530
Message-ID: <CAKuLduzhBT_kgp1-za=w2FeD51xAo7=zj1dxvA07YSex2-r44g@mail.gmail.com>
Subject: Mentorship Program
To: dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com, 
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
Content-Type: multipart/mixed; boundary="===============2392639776945732789=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============2392639776945732789==
Content-Type: multipart/alternative; boundary="000000000000db700005c763e9df"

--000000000000db700005c763e9df
Content-Type: text/plain; charset="UTF-8"

I am interested in the Checkpatch Documentation mentorship program and I
would like to work on the tasks for the mentee selection.

--000000000000db700005c763e9df
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"color:rgb(33,37,41);font-family:Poppins,Rob=
oto,&quot;Helvetica Neue&quot;,Arial,sans-serif;font-size:12.8px;white-spac=
e:pre-line">I am interested in the Checkpatch Documentation mentorship prog=
ram and I would like to work on the tasks for the mentee selection.</span><=
br></div>

--000000000000db700005c763e9df--

--===============2392639776945732789==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============2392639776945732789==--
