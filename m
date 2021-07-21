Return-Path: <SRS0=/QuR=MN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAC81C12002
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Jul 2021 17:52:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 803B561241
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Jul 2021 17:52:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 803B561241
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 352C64030A;
	Wed, 21 Jul 2021 17:52:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dH-GN-zvefgH; Wed, 21 Jul 2021 17:52:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id EABCB402EE;
	Wed, 21 Jul 2021 17:52:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B87DDC001A;
	Wed, 21 Jul 2021 17:52:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9D005C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jul 2021 17:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84F27404F5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jul 2021 17:52:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zFAwCCD_Ahg2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jul 2021 17:52:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E807D400F1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jul 2021 17:52:54 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id u7so3317205ion.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jul 2021 10:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=lPoxqKnr4A0L6EFU9klrkVsWUUlWb+N4N9+dc/kYmFE=;
 b=dCf1N4papYGLijIIqMlekqxKCgibthMyy5UkT9tS5BUwSb1WzoM9ZE/RCJ40Rt/jAp
 azXs5GTQDLDQi55JprLlC+RLfWyVUhnZ32I5dGwRfs6H64hGjk5edRQ+ecwPIANnVzUX
 5IRvd+bjIAoXB43GTzlRQSSeZnNw0atgtny3To98899XxXb0tSDcmAy59HD4grVRC0J6
 4iE4Hx5RDokl5tVEqvcpKJlrXc4IvIlkaal46KOieuT6llAxvC6VflfZNmpl+Nwm7NWt
 TFroiFxm3joh4U5mWnDkRUWSb+VVSuc7IehO6oZNlTTBuiC2/D2bssjj8wTnHyaSyjs0
 pMaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=lPoxqKnr4A0L6EFU9klrkVsWUUlWb+N4N9+dc/kYmFE=;
 b=P0WTPqXteNTY/JzOB8dekprvZBwjoK+OFIhPHH8HDA1m0cYzx/eNWVPtcfKr4H4UxN
 DwO7twE/prCfxoiuoNU+kwrfz2fuPlpoG6yJ5p2MCbapmzs97cQs1ZtTq+v/J52phJau
 Q53MkSINo5CYeESjfY0xHzWmCeRr3YQXeARzW9XZgZOO224PZ87lmebNTbgnXe2WnQxt
 zIgzlw28z8Zrne1RdjSeLzoKmFZHxKnkCiz0HwjNo3TnGWMAE8HkOJMTGTmGp0Ieg5ui
 M4LlKTSb6ZbXpTFxi0f6Y1w0Wm7A/n7TtV/sNxZftHCNM+PYc/m5Hv8ukX+GHZph4M15
 Gjrg==
X-Gm-Message-State: AOAM531A7NdqjwPJ3wM3UNUyM8Oycj8ZAgjCvwY8l4jT9XCPJStAYr3v
 L/uoCZjlQTN4+vjpAsDc5cisrUV9p64nMS2PTxOMDASMTGS83Q==
X-Google-Smtp-Source: ABdhPJwwSol/f8aUCDBfhueNn6T+kFBU/lmp7mIa7ZyCAsfRMhxUwqHs1Jma3ZjB2SizJaqtZUnk8N3E2458pP5Mfa4=
X-Received: by 2002:a5d:97c6:: with SMTP id k6mr25154516ios.69.1626889973633; 
 Wed, 21 Jul 2021 10:52:53 -0700 (PDT)
MIME-Version: 1.0
From: monalisha ojha <monalishaojha974@gmail.com>
Date: Wed, 21 Jul 2021 23:22:42 +0530
Message-ID: <CAOvyDyw+DrnPzS+EEf=eQefNTTiGzQ75sFTTZ5eTn3Wds1r+qg@mail.gmail.com>
Subject: Mining Maintainers mentorship program
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
Content-Type: multipart/mixed; boundary="===============9128929778546420482=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============9128929778546420482==
Content-Type: multipart/alternative; boundary="000000000000f795e105c7a5d676"

--000000000000f795e105c7a5d676
Content-Type: text/plain; charset="UTF-8"

Hello,

I am interested in the Mining Maintainers mentorship program and I would
like to work on the tasks for the mentee selection.

Monalisha Ojha

--000000000000f795e105c7a5d676
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><div>Hello,</div><div><br></div><div>I am interested in the Mining Maintainers mentorship program and I would like to work on the tasks for the mentee selection.</div><div><br></div><div>Monalisha Ojha<br></div></div>

--000000000000f795e105c7a5d676--

--===============9128929778546420482==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============9128929778546420482==--
