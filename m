Return-Path: <SRS0=gjYE=ND=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_IMAGE_ONLY_08,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A989EC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 12 Aug 2021 15:35:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1378D6056B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 12 Aug 2021 15:35:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1378D6056B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=me.vjti.ac.in
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D25C940385;
	Thu, 12 Aug 2021 15:35:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t8CdLRbASOpG; Thu, 12 Aug 2021 15:34:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 72EC04017A;
	Thu, 12 Aug 2021 15:34:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 40E31C001A;
	Thu, 12 Aug 2021 15:34:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0FF0CC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Aug 2021 15:34:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F0605401DA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Aug 2021 15:34:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=me-vjti-ac-in.20150623.gappssmtp.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ItSFGnYFSpti
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Aug 2021 15:34:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E3A77401B2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Aug 2021 15:34:50 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 e13-20020a9d63cd0000b02904fa42f9d275so8259500otl.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Aug 2021 08:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=me-vjti-ac-in.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=HvWK6d10MXyUB6Avcl39ADGxnYQqO3BpRq4UDdx7hLE=;
 b=r6oI7uNAmMkIi077AEJDcKfSKosidOdHF2lZ7tK4FO2cdjYsO3MOHzOC4TZ1CdAUl5
 sNXtpf2c9Brm5OxtJxOO2AZBieKWyf5ks3kRJRelsU2Ql+ab+ZX/UVT90SOs5fq8dGcJ
 DiQMgeY1xXvNmI4gx19pV3PNwAKscd6gWOhBMlR9pdgoGmjmZ588ucf5FqXL4f2OGX2w
 SUJgYyBxHAvJ1Tg6KWeGrZldkbbuV3Lij5rXSkV55HtH/dQJ0yKnGEZZEFfrk7zqJh1a
 uTxaAezaYrpmCDG/Md/Yb/TNekjd75PTzek9tKBw9ty1unXTwiRkI3xKkxJjkDeYbBFi
 /yiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=HvWK6d10MXyUB6Avcl39ADGxnYQqO3BpRq4UDdx7hLE=;
 b=NiQyXEukUCZkioqGSgPYcviv+/jV2HdP1wDBEbeIs+gr/05kxruFlNF0meYEJfUfed
 Mza91hkckjTVLwYcDAf8viv3Fu9zEJtHS2ASbierQoK/3IfrfkXA7zSDtaxExmjhWfun
 oT80+lmk8lsKwGTg1AcXTRiRg17yXp+H0FhBd6E3aepaXVl0+tq/5W57ZceaxyGKFzfe
 w7NqecJ3hYwwxKvQmV88ieMIi35hu9om45un6gYjQnbxHFLuvdytT5bNYU9EsRqkZQJ9
 jW9tpzT5HT2PrjPEt22NtNuWHUSkhhwCYnrAio5RqouvbrvvvRXHAsw9/95XgEM9L9ox
 3JFQ==
X-Gm-Message-State: AOAM531O/XRKS/DpzGI4FZlGRSnDdSKva4oX8UBZa5IsXd6llFPFajhE
 pzQXEwWvnFc1AOHm7UIv8RxEP20IQlgMbueWkWU+LP5H7mDVj3Zs
X-Google-Smtp-Source: ABdhPJy+/tY0syAQaCL3seWLC37ZKY+mXRU9mzjr1kXBIbAGAD1x4fk4IVeuok5AKX9MdoHEp5Vv4NXYGR2Ujrp3BIg=
X-Received: by 2002:a9d:67d9:: with SMTP id c25mr3862093otn.65.1628782489519; 
 Thu, 12 Aug 2021 08:34:49 -0700 (PDT)
MIME-Version: 1.0
From: ANUSHREE SABNIS <absabnis_b19@me.vjti.ac.in>
Date: Thu, 12 Aug 2021 21:04:38 +0530
Message-ID: <CAE3uYxtgef1YPKsWBqt232f62y14gtFvy1S-mTZ2woU+uR5TzA@mail.gmail.com>
Subject: Linux Kernel: Checkpatch Documentation
To: linux-kernel-mentees@lists.linuxfoundation.org, dwaipayanray1@gmail.com, 
 lukas.bulwahn@gmail.com
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
Content-Type: multipart/mixed; boundary="===============3984751558071364280=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============3984751558071364280==
Content-Type: multipart/alternative; boundary="000000000000b45c1d05c95e7962"

--000000000000b45c1d05c95e7962
Content-Type: text/plain; charset="UTF-8"

Respected mentors,   I am interested in the Checkpatch Documentation
mentorship program and I would like to work on the tasks for the mentee
selection.
Sincerely,
Anushree Sabnis

--000000000000b45c1d05c95e7962
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"color:rgb(33,37,41);font-family:Poppins,Rob=
oto,&quot;Helvetica Neue&quot;,Arial,sans-serif;font-size:12.8px;white-spac=
e:pre-line">Respected mentors,
=C2=A0
I am interested in the Checkpatch Documentation mentorship program and I wo=
uld like to work on the tasks for the mentee selection.
</span><font color=3D"#212529" face=3D"Poppins, Roboto, Helvetica Neue, Ari=
al, sans-serif"><span style=3D"font-size:12.8px;white-space:pre-line"><br><=
/span></font>Sincerely,<br>Anushree Sabnis<br><img id=3D"snvTrackImg" src=
=3D"https://signaldomn.online/track/1628782478547.png?eId=3D-718349774" wid=
th=3D"1" height=3D"1" alt=3D""></div>

--000000000000b45c1d05c95e7962--

--===============3984751558071364280==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============3984751558071364280==--
