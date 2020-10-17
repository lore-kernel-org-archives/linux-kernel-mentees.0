Return-Path: <SRS0=PE7C=DY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 137B0C433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 17 Oct 2020 06:03:23 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 808AC20720
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 17 Oct 2020 06:03:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="trNNUHdd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 808AC20720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1979E88B0D;
	Sat, 17 Oct 2020 06:03:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dO8YBRu5lmiR; Sat, 17 Oct 2020 06:03:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9A43B88AD1;
	Sat, 17 Oct 2020 06:03:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 81D3AC07FF;
	Sat, 17 Oct 2020 06:03:21 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AF764C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Oct 2020 06:03:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7E8A12075B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Oct 2020 06:03:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 47pswJyxf1R8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Oct 2020 06:03:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 by silver.osuosl.org (Postfix) with ESMTPS id B991820399
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Oct 2020 06:03:19 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id u17so5115902oie.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Oct 2020 23:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h/xratYsaG9m9w7i50w062IVAUzhi04mGQ958Rmk2Lk=;
 b=trNNUHddJseMNBbnfx6kOTFiOLH2xL3FWPjEFHEs+AWDnATUzeCkTXMAQRM1gNYo8V
 Awd9+hF3HofiKGXgPw9yaCJcJ7V6UzLbruEgfIQuum0q0mpzX0ll3ElLtPETZUtFLul6
 NP51oTOrb79s/cl9VUiZOejqE2skgJHeR+1kNCuWwfQxX0CjD5vRlmupasD/+Bflsx8v
 Y4tv1JkfgvPDCqZz8pVhgcJnQ9wkQyGmZ2Trgp7vdsacW7sPH+gY1bmAo9WG0+HBwNBJ
 L6ctlqrFRt2A87H2g5neimD8ZjYgWC/HWc9MNWMSo2HydT99BSkLbRrEaKDhLYPOz5dA
 OQDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h/xratYsaG9m9w7i50w062IVAUzhi04mGQ958Rmk2Lk=;
 b=CjFuGXh//NidDIDJRQt+8oWNy3kZEEoYQUdD6EsW/+c5RWomrlY/DAvD7X9a57sWyP
 AK6qSoH5wJuUBdP3IEjQfODPetQyDISrf011UhTBw2k9stvTUFFYQ4oLAUqv5oeiQEhj
 P0Ny281qJW9V4NY7Wi97/vH06rc16PTUFo8Kp3Qx8gsiuncZI3IjClP0vQQ/BSlqZSFJ
 K+YF7dGrXC+7gCz61es26m2BlPT2TmUtKDIZEnh7Hm/F7aGR3Tub1r71+UEpXVrHtf+6
 Ter+m9p1IGuJCIu7FL3tz6X5j/AGHkuMPGjdPsF6tXfX9BhpFkIsNO08xlxLatjFgzg0
 9wKA==
X-Gm-Message-State: AOAM533Em3ADJrH4nTAXZzOiigytQh4PYDWnKB/PtO2LifqDaM8RSjWd
 /QlZ8pqLLZ8ypO/N+VZ1s/rCMXneNqO5YydcKzE=
X-Google-Smtp-Source: ABdhPJxm9gt3p83GA5uwReGmw4Qs3y5MplDWeDvo4ggBqpcBaZPtjfHFWni47vt6vLpVOP30jN7kj1XetyWyQpIcJeI=
X-Received: by 2002:aca:420a:: with SMTP id p10mr4547482oia.117.1602914598788; 
 Fri, 16 Oct 2020 23:03:18 -0700 (PDT)
MIME-Version: 1.0
References: <20201017052243.17095-1-dwaipayanray1@gmail.com>
 <fc47f1e6babab1044c9dece4b30200e239438931.camel@perches.com>
In-Reply-To: <fc47f1e6babab1044c9dece4b30200e239438931.camel@perches.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sat, 17 Oct 2020 11:32:52 +0530
Message-ID: <CABJPP5CBh2TDwo9Z1hoaLPjk=d00N0r4VkLVdwAuMbWPyNbDYA@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v3] checkpatch: add new exception
	to repeated word check
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

> Why include a + character here?
>
Hi,
I tried it without + first, but then lines like
"The the repeated word."
didn't register a warning.

I think checkpatch adds a + to the line when used on
files. Am not sure but my $rawline was:
+The the repeated word.

> Please use "next if (test);" to be similar to the other uses above.
>
> And this doesn't work on end of phrase or sentence.
>
> ie: "my sentence is is, a duplicate word word."
>
> so $end_char could be a comma or a period.
>
> so likely the $end_char test should be !~
>

I tried on "my sentence is is, a duplicate word word.",
and got the following:

WARNING: Possible repeated word: 'is'
#8: FILE: MAINTAINERS:8:
+my sentence is is, a duplicate word word.

WARNING: Possible repeated word: 'word'
#8: FILE: MAINTAINERS:8:
+my sentence is is, a duplicate word word.

Am I doing something wrong?

> What is the reason to add and use $exclude_chars?
>
I am comparing both start_char and end_char to find
whether they have the characters which will exclude them
from repeated word check. So i am keeping the common
variable to match from. I thought I would do that so that
more exceptions could be added later on easily.

I might be wrong in doing that. What do you think?

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
