Return-Path: <SRS0=Pn+h=MV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC34BC432BE
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 29 Jul 2021 02:08:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B7296056C
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 29 Jul 2021 02:08:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7B7296056C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DCB0606E2;
	Thu, 29 Jul 2021 02:08:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c22uWe1W-Uxo; Thu, 29 Jul 2021 02:08:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 74E3B606CF;
	Thu, 29 Jul 2021 02:08:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4B732C001A;
	Thu, 29 Jul 2021 02:08:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2106EC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Jul 2021 02:08:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB274606E0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Jul 2021 02:08:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZWJUGEsJCvei
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Jul 2021 02:08:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 57E76606CF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Jul 2021 02:08:23 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 e2-20020a17090a4a02b029016f3020d867so6938463pjh.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Jul 2021 19:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=cJ2YAzvV2grxpblefxRH5sWxBwV+LXH1cBTuYwH02aA=;
 b=GG5fH252mJoK2CmmR4s5MPNmxzHP+20K+BnuhE9cQJ1cjem18pspd6qSt/b3adxdYX
 pykQHtdCpon3f1aOI/zS9M+YU1RVypegezcK/oo29cugzVhb5qSSRjgcM9zGF7KW+YV9
 zhKSa0e4WWeWdgeqM2yHmVB0ka/BPdQPFYuaqYremTQWYuw5uz/JF30n5TaZL+IrvOR/
 /nXWuv5hu/oMrXJA2w4jaOCdbtIuJkqMcClxk2TSGP2l4a/lENPu2wBAeebTe99nvofa
 TtFDsPyvwTlaRneikwGwRNw70CtRGcQyhsd1x1YcAGOrfxD66IiLdg0wuqzRaxonVVyl
 EKWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=cJ2YAzvV2grxpblefxRH5sWxBwV+LXH1cBTuYwH02aA=;
 b=iF9jQJzULo9ImyK9WQCLEXiGAEz7HWKQaI4czpgp34/Kjv1nflko7f0Qxv4wxeIJta
 XlSZkCRiTGgaWf644YY3xOLjXkNYbCUhsqVD9kSJfQqQaBCaP2GNg+LoBLa8+dH0g1cY
 rN994SLo1x8c6IVxi3ZZMyBn/uS60xHLAoTbs/h4RVSy+gMo2Un0K6Ad0tHVTfyQRleh
 1va/fwNX2e4ZHr+ARsgFaPw6MEflZYNP6epVIfcHngK3w4qNrvvtYa0q5iVkQdUgDUBN
 qrsh8Exq+iPyE8w02Ll5sI+6pCzR/fLYyeFxjw4Jm32kGkoAuRsS8yqCRCONGN11kvEf
 BvLw==
X-Gm-Message-State: AOAM533GGOXOqT+HNeb8jfAk6SGpK5kF4tJDogt8678HGFVxr9MN+Al0
 SS8Frsy9kvS0aAI2H3RAgw+v7lHWa5fsIEjkxNc=
X-Google-Smtp-Source: ABdhPJwbjNW4n1iE3SY+LJ55iRtjwPcpTH2ZMLAGafN3VVCSBjXftZxr9har3rDzUMdhrAgAfxUBk8mH7wR0Sd6JIdg=
X-Received: by 2002:a17:90a:154e:: with SMTP id
 y14mr2732532pja.184.1627524502671; 
 Wed, 28 Jul 2021 19:08:22 -0700 (PDT)
MIME-Version: 1.0
From: Amit Kumar Yadav <amit.ydv055@gmail.com>
Date: Thu, 29 Jul 2021 07:38:11 +0530
Message-ID: <CAP87k--WtYX6_niVaYJvdJPC3XjUgta3XZxrEssLUx9_ubDiZA@mail.gmail.com>
Subject: Request for mentee selection tasks (Checkpatch Documentation)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

I am interested in the Checkpatch Documentation mentorship program and
I would like to work on the tasks for the mentee selection.
Thanks.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
