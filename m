Return-Path: <SRS0=59bo=NL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25542C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Aug 2021 05:53:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B895160C3E
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Aug 2021 05:53:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B895160C3E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 813FD613DC;
	Fri, 20 Aug 2021 05:53:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j9Bh-WVkdkEH; Fri, 20 Aug 2021 05:53:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 80A8A60607;
	Fri, 20 Aug 2021 05:53:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 579ECC0010;
	Fri, 20 Aug 2021 05:53:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BF669C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Aug 2021 05:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 57041600BA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Aug 2021 05:53:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 48CD7lJPjoJK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Aug 2021 05:53:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1344260B53
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Aug 2021 05:53:37 +0000 (UTC)
Received: by mail-vs1-xe2f.google.com with SMTP id k24so5512198vsg.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Aug 2021 22:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=GPlzlEkzSKJc2tuQ6+54jgzxPfI7D6o4lW6NxKmpymo=;
 b=GuLDW4qQl3riB+XjXcSh7BHojfLT/f6a3rTsTHXXeu127dSs7gNHDjSQcihPfp4Pwm
 82j6uGjrSpW9hh5J2ihJkiFZWEhYJRKFv0O1aB05DRF5cPh/6Ye05C87fh/LTVzR6OZM
 Y7ZgQQwnjCk3HSpbVhh6AMPWT0trFMgqacJDdTqHJCXMsKS31Ro+aqLI3CGCc3TFlgmX
 thMJowPJHSkvDS8rB6Hox5QTYdKoR8ZZT7iMLJoBqFI2G0PnnQ8pWdgSi93Jm9GvjAQf
 i9Taw2O7VQllXor+oP7/V+nnYlVZRp11PNirQ7w6gpyuNBhUK1Z6rTtq2/Ycvmiov2uQ
 9s/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=GPlzlEkzSKJc2tuQ6+54jgzxPfI7D6o4lW6NxKmpymo=;
 b=uViu+lgrpOBZssYgA4426t0VfZYQ95gLReu2URmRBfJAVBmDUNkUqSpYLpLAKaSVo6
 NWqLse+178lDUxc22NExYheJL4oTMxCPhjuLIz8XbaGoFE6G1NhFlX1K5ygxoq2+1NVQ
 /GsRCoh6mRkx2haLp/PhoD2XWK+wWi1ZUxkRxGWkFOVT8Qx/py6nUVpmi0awRQaRJw6m
 nPIfEj3VJcBrbqu/fcy/zP+/SJ5lQWJz3a3gRRgpmLz7iQTwNIdl4jZrKZmhV7k+W7Nq
 PP/i88eQnkXiBaTwRj0aNkl+SK2OQLcIpJZBFFgYWVx1q1l3hX5jTlXVUYXIQjHB5LyQ
 kewA==
X-Gm-Message-State: AOAM532cLGzbJQUs49jadmBqKH/JFdGNeouS3SN9CVcsFL5ldeEqYMyv
 fnE+tCCsQ0lb4gKdVVKZ8Ohavtclk6imJStZeTc=
X-Google-Smtp-Source: ABdhPJy8qvH8Hweh0sgu6InsXkp0OMOXOVaNJ/y91S1PPZpeaqatbs3BOI2KCpXxvGVCUoM3kycv6t7IsJDrS/v6awY=
X-Received: by 2002:a05:6102:c50:: with SMTP id
 y16mr13990872vss.58.1629438817000; 
 Thu, 19 Aug 2021 22:53:37 -0700 (PDT)
MIME-Version: 1.0
From: 1JS16CS094 _Shraddha prasad <shraddhavp.1js16cs094@gmail.com>
Date: Fri, 20 Aug 2021 11:23:00 +0530
Message-ID: <CAGAi+zOEv93cp85LPGRL1NkCB6ox+cEg-cbarLKt0Pgh+zKVgw@mail.gmail.com>
Subject: LFX MENTORSHIP -LINUX kernel checkpath documentation
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
Content-Type: multipart/mixed; boundary="===============8979531343647773837=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============8979531343647773837==
Content-Type: multipart/alternative; boundary="000000000000dede4b05c9f749f0"

--000000000000dede4b05c9f749f0
Content-Type: text/plain; charset="UTF-8"

Hello,
I am Shraddha Vasant Prasad, applying for the mentorship program.
I am interested in the Checkpatch Documentation mentorship program and I
would like to work on the tasks for the mentee selection. Thanks and
regards
Shraddha

--000000000000dede4b05c9f749f0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<br>I am Shraddha Vasant Prasad, applying for the me=
ntorship program.<br><span style=3D"color:rgb(33,37,41);font-family:Poppins=
,Roboto,&quot;Helvetica Neue&quot;,Arial,sans-serif;font-size:12.8px;white-=
space:pre-line">I am interested in the Checkpatch Documentation mentorship =
program and I would like to work on the tasks for the mentee selection.
</span>Thanks=C2=A0and regards=C2=A0<br>Shraddha</div>

--000000000000dede4b05c9f749f0--

--===============8979531343647773837==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============8979531343647773837==--
