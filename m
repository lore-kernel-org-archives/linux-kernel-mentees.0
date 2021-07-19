Return-Path: <SRS0=VrTg=ML=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C840EC07E95
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 19 Jul 2021 21:19:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C3B66113A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 19 Jul 2021 21:19:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C3B66113A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 443748366E;
	Mon, 19 Jul 2021 21:19:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uTp1hcHPgGwi; Mon, 19 Jul 2021 21:19:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 7BB0C83123;
	Mon, 19 Jul 2021 21:19:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 56390C001A;
	Mon, 19 Jul 2021 21:19:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 526A4C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Jul 2021 21:19:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40AF260619
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Jul 2021 21:19:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BoCYPmbHNTOK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Jul 2021 21:19:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0DD4660613
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Jul 2021 21:19:11 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id d15so13987256qte.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Jul 2021 14:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=0txh1/Ss5qhBmbOQRLQa51wIWjkARwXLTjtqUfZ0yCQ=;
 b=bi4iLxkYW9uBtRv2rFbHBjPxFd3uXBUbP8GPh0ezP5nnvAyfH2ENfNWHEsyiCK7V8n
 QcWCpDmh7X0oJ2CWj/skuMTYPmVAxZcwNPMfDbHSi1SXVkt1AEn0FPFv0KwOb7BrhSrl
 WNNEC959whT9CltZZ9Ig2+iAq5IORHv6BIBgG/4ud5Xv0GzlAtKAedfNPNOMv7crnIZO
 yQtMj0PAf77MRd5WZ35anMtlY24LPwQgqrQNYWPOZFGprGK9SeREn7zYUNVFzd/LESuA
 jnFIYaM4nP7U1PBl3kXQnwsnhagfFWkBmpTtsZw4xmu6Z/OE6VtOVfMlYsuzOVFJOmWS
 K6qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=0txh1/Ss5qhBmbOQRLQa51wIWjkARwXLTjtqUfZ0yCQ=;
 b=F03puDm4Qk9Pmgb+O5YmZy0jlgpj3/C0mYNIg7mIXxnLyWDjs+5UJqN2Chchdhn500
 reTSTGGvBjEsDVWwannrIqrfrLg2+INiWKhnsXxqoFcMJ34xlbnlhKkf44lA5WMSuKAP
 BaNY/mELcpHmGxrbb9V7UZXEDs5Cgxdet3lppHhKEmClEH9SWALhV+FPcV5a/CwSHdcj
 +jIVnJehgqENiS1RdztyhG7MtQYEHb4cF941dhPnUrhMKyEEfPim8V5tRd4tY3ziof0c
 F451Vd8IaZGvC5KJfhvhqDjUhvXM923mKFr1O9jlHHkFjAoXJDGHv65HI0gzoaDw+qWo
 fU0g==
X-Gm-Message-State: AOAM530N9xpJ93rDTmsd9xxb/V+CIMDPjVLBK20Y4Cb9eEc4mkgKD+zH
 dblZ9Oj4ogDxtA3raL3Us+WLe6TLEp+N3nx2SMM=
X-Google-Smtp-Source: ABdhPJzWDBHLA8ZMQYnKg1eXBt0zGzw2YsDDPP4XI+rHqn8WLWJ8XzcwgEE0og5Gv2VV+G63WbcE6KYhNLaiweYoGew=
X-Received: by 2002:ac8:6ec1:: with SMTP id f1mr23264727qtv.104.1626729550957; 
 Mon, 19 Jul 2021 14:19:10 -0700 (PDT)
MIME-Version: 1.0
From: Vinesh Vilas Raut <vineshraut2017@gmail.com>
Date: Tue, 20 Jul 2021 02:48:57 +0530
Message-ID: <CAMqN5U6TDXVsJy3YEw-QOY9saktrWpNELtNKnBW9VegdQG2x3Q@mail.gmail.com>
Subject: LFX Mentorship application
To: dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com
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
Content-Type: multipart/mixed; boundary="===============4669260569692844930=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============4669260569692844930==
Content-Type: multipart/alternative; boundary="00000000000007ceca05c7807ddb"

--00000000000007ceca05c7807ddb
Content-Type: text/plain; charset="UTF-8"

Hello, community ..!
I am interested in the Checkpatch Documentation mentorship program and I
would like to work on the tasks for the mentee selection.
- Vinesh

--00000000000007ceca05c7807ddb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><span style=3D"color:rgb(33,37,41);font-family:Poppin=
s,Roboto,&quot;Helvetica Neue&quot;,Arial,sans-serif;font-size:12.8px;white=
-space:pre-line">Hello, community ..!</span></div><span style=3D"color:rgb(=
33,37,41);font-family:Poppins,Roboto,&quot;Helvetica Neue&quot;,Arial,sans-=
serif;font-size:12.8px;white-space:pre-line">I am interested in the Checkpa=
tch Documentation mentorship program and I would like to work on the tasks =
for the mentee selection.</span><div><span style=3D"color:rgb(33,37,41);fon=
t-family:Poppins,Roboto,&quot;Helvetica Neue&quot;,Arial,sans-serif;font-si=
ze:12.8px;white-space:pre-line">- Vinesh=C2=A0</span><br class=3D"gmail-App=
le-interchange-newline"></div></div>

--00000000000007ceca05c7807ddb--

--===============4669260569692844930==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============4669260569692844930==--
