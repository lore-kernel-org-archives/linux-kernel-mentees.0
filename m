Return-Path: <SRS0=Q5UI=MQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA387C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 24 Jul 2021 13:12:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D74F60E98
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 24 Jul 2021 13:12:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7D74F60E98
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39678835C9;
	Sat, 24 Jul 2021 13:12:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uBVzAuQsb5nl; Sat, 24 Jul 2021 13:12:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 0AF1183560;
	Sat, 24 Jul 2021 13:12:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E2806C0010;
	Sat, 24 Jul 2021 13:12:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3292DC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Jul 2021 13:12:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2AC984042F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Jul 2021 13:12:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e66vts1W-agn
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Jul 2021 13:11:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 62BE540412
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Jul 2021 13:11:59 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id d10so4123815ils.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Jul 2021 06:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=b+8ZMHVHm41f6rNa3X+WrH/NGz8bAWc63ZbLjCUBOt8=;
 b=tyqqNmZxIiO6lMJInyXAf6RnnHgWf12kcaySVI3xHCrcGoAP0qx1nD5u2qb6axacHN
 q3L9/pEO5XaTxtQxrijYToRo7DxF5OLCWPNcs6iVw4Sa0jlimSrUyI2vwPbn4rRT2xT+
 +hJQ9iuE5qQmtKRrXDCAERwrMqU7YjfPW6CpUsQ49lQxkDP/xcBFaeq0QfFpQyKaey40
 gCVJpTeACOw4Zso3UzLEJFXOnHm4A9wAaPaf8LaRhXT/tyRGaxNjTpvsxNta6qEMRxkQ
 gy85zrZxhiJ167AxhTgYDfNe7Sfxhz+gFT9QYKzPOqh3xD6ZNgykGTh5fWq8/5gTNZ/G
 GKQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=b+8ZMHVHm41f6rNa3X+WrH/NGz8bAWc63ZbLjCUBOt8=;
 b=e4Z6ie901M15Ws/iWD90UCm50nc24O7VYWStC0VzTVjLynJzSNePsxa8n82zdc5Ysz
 xEobj4eUb663Hwa3osyKiaNjTw53qBujbeZFtJyjBl6lJ2qnsHidjTMEvmtno/sxWGkR
 a/GlhoN7fUIwOd5JrVFvG3iY7nXHlLaaphjvfynsNcNg94Kr7lz3vmt1AgEfFWr79UyO
 qiud6FZIVsPQtjHnbKoL/NIhv8gl3/0lLZ/DHnHWnmu/Lu7P9YcuANyM0oGhaP3XkcKi
 xC5cqfWys/C2mbqzUMIM629KgLEOQ4aq0dStMHNjU6/5ciBhU7GwZ2ohjGe1pucXJNTt
 dBrA==
X-Gm-Message-State: AOAM530ELsME2DAEiloz0tJC1ayUqmqs4mbA6Lt7eIIiyFlQKvu3OcJJ
 wpQIiQ6s0zKdPqmjQgKMyiDk6Flxk4RwVq7/IY0=
X-Google-Smtp-Source: ABdhPJy8MzPA1C5/ejWFmrxMDKE9zII2TLvqy1M2FvMa9pKJQgkDk+y6Blj1Hq+uqBYJ831BS6OYXM7I2kNHwXJG6rA=
X-Received: by 2002:a92:b308:: with SMTP id p8mr6661158ilh.296.1627132318368; 
 Sat, 24 Jul 2021 06:11:58 -0700 (PDT)
MIME-Version: 1.0
From: Yash Singhal <ramusinghal112@gmail.com>
Date: Sat, 24 Jul 2021 18:41:47 +0530
Message-ID: <CAFwExaPX6qRh1kZqYVeyxyiG21d1M+ioybMvZe2XVaUVTKQ-Lw@mail.gmail.com>
Subject: Linux Kernel: Checkpatch Documentation Mentorship program
To: dwaipayanray1@gmail.com
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
Content-Type: multipart/mixed; boundary="===============2463877181407347548=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============2463877181407347548==
Content-Type: multipart/alternative; boundary="000000000000d6c73a05c7de430a"

--000000000000d6c73a05c7de430a
Content-Type: text/plain; charset="UTF-8"

Hello Mentors,
I am interested in the Checkpatch Documentation mentorship program and I
would like to work on the tasks for the mentee selection.

--000000000000d6c73a05c7de430a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Mentors,<br><span style=3D"color:rgb(33,37,41);font-=
family:Poppins,Roboto,&quot;Helvetica Neue&quot;,Arial,sans-serif;font-size=
:12.8px;white-space:pre-line">I am interested in the Checkpatch Documentati=
on mentorship program and I would like to work on the tasks for the mentee =
selection.</span><br></div>

--000000000000d6c73a05c7de430a--

--===============2463877181407347548==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============2463877181407347548==--
