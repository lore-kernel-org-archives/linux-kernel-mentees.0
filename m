Return-Path: <SRS0=NgQV=MM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35B2EC07E95
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 20 Jul 2021 11:15:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D35D86023D
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 20 Jul 2021 11:15:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D35D86023D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9320C83563;
	Tue, 20 Jul 2021 11:15:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dFZ67f5MtlMl; Tue, 20 Jul 2021 11:15:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A77D383506;
	Tue, 20 Jul 2021 11:15:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7DFD9C0010;
	Tue, 20 Jul 2021 11:15:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0F56EC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 20 Jul 2021 11:15:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F241A60659
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 20 Jul 2021 11:15:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vLfUqaVXeNKz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 20 Jul 2021 11:15:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4E5F26061B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 20 Jul 2021 11:15:46 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 d9-20020a17090ae289b0290172f971883bso1696041pjz.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 20 Jul 2021 04:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=FRQWBsq8sxwokqf6okKT5qMA7wLaeWUKqWXlQJ6NQKI=;
 b=X5skPa4zck/7yCXO4M/GbEghx7qX28rv6+A9CPKP+qcHgZ5QWsp+YZ4LAKryc7dXHn
 0UAJ435scD4ePYJ54V0w2AcLEoYc6N4MltsPUis5JU9D1jzRTITikIOEfC8C5BEVg/6n
 nTzl3zhjvePj9Ay0Gg9UHlbwpx/EyMWMMMkOgIY6xuGyV0WcD1uTJ4teaZ/q5fq04HwY
 HIJMia+kauzPwN5ZwbdeWcC+jUnI82o0ixb0EP6ltv8A4ctXaCRWBtaYmY2FxYxivwoZ
 Ch3kbdRGcl5u/uXPVKXnmZem1+mNiXmpPkdicT07XsFErCYZUYXSF6Loo77qOCGNI6KE
 jpiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FRQWBsq8sxwokqf6okKT5qMA7wLaeWUKqWXlQJ6NQKI=;
 b=hgspDHHJ/uUa2T6JL6zmtC3vj3rcZ6+phEtntif5MIfXiDpUwAdPpQPbsUU8aedD6H
 MvWTIGMpJeg1h4N/TV6bI6PT345327Osl1l/R28XYF6KraXsJ1M/kaNMnOtMLij7Xgz/
 EnB2iVK4z80Nitk76L98q6I3iGaZD6VbDdfhNLW2gGogcFs423FfQKzj0701481PTFvF
 foQOnsb3Cq6PLbNDvaY1cA66AafEqI2ktooBXfWiB5/I53dMFa1TPv/EPQOl4+6Es/Sz
 m/GLmeHa/Phnm3AJhwpH55Ioc2Oa6JAFZz704bLvvRZoqg6Mj7aEHMsTF2vJwXaHQ2de
 nuXg==
X-Gm-Message-State: AOAM530fWf4U6xPF9p3c/Ki9+r0wJGvxN3b2UOpEJyrO20VO1rs3JfeS
 IMFC/Hrd+Ew6fWxq2PzT9RE=
X-Google-Smtp-Source: ABdhPJyJCh2VoZl3uWXsBfsVyDZw8fLjvqdf/6Gs6U6N/6WqFlLAA5OybCAWgbZtp+pS9uZ1MFk2BQ==
X-Received: by 2002:a17:90b:945:: with SMTP id
 dw5mr29739584pjb.3.1626779745630; 
 Tue, 20 Jul 2021 04:15:45 -0700 (PDT)
Received: from uver-laptop ([47.9.156.98])
 by smtp.gmail.com with ESMTPSA id p24sm24309459pfh.17.2021.07.20.04.15.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 04:15:45 -0700 (PDT)
Date: Tue, 20 Jul 2021 16:45:34 +0530
From: Utkarsh Verma <utkarshverma294@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: Linux Kernel: Mining for Maintainers Mentorship Tasks
Message-ID: <20210720111443.GA4496@uver-laptop>
References: <20210717065427.GB4873@uver-laptop>
 <CAKXUXMy9cTVSLYd4hFgq5xiTTwj=YPae8tJxyWM4rvsom5WH6A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKXUXMy9cTVSLYd4hFgq5xiTTwj=YPae8tJxyWM4rvsom5WH6A@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Sun, Jul 18, 2021 at 06:41:45AM +0200, Lukas Bulwahn wrote:
> 
> First, download the kernel git repository and compile the kernel with
> the x86-defconfig build configuration.

I successfully cloned the Linus's Kernel repository and compiled and
installed the kernel on a virtual machine.
$ uname -a
Linux uver-laptop-vm 5.14.0-rc2-mining-maintainers-mentorship #1 SMP Tue Jul 20 14:46:26 IST 2021 x86_64 x86_64 x86_64 GNU/Linux


> There is a file called MAINTAINERS in the root directory of the git
> repository. Read the introduction at the beginning of the MAINTAINERS
> file and understand the content in the file and its organisation.
> 
> Explain in your words: What is stored in the MAINTAINERS file?

The MAINTAINERS file consists of 3 parts:

1) First section consists of tips that one should follow for submitting
the patches.

2) Second section consists of the description of the abbreviations used
in the file.

3) Third section contains the details about the subsystems like the
names of the maintainers, reviewers, mailing list etc of the subsystems.


> Now, search for specific MAINTAINER entries; Please answer: Who are
> the maintainers and reviewers of the following sections?
> 
> EDAC-SBRIDGE
Maintainer: Tony Luck <tony.luck@intel.com>
Reviewer: Qiuxu Zhuo <qiuxu.zhuo@intel.com>

> EROFS FILE SYSTEM
Maintainers: Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>
Reviewer: NA

> INTERRUPT COUNTER DRIVER
Maintainer: Oleksij Rempel <o.rempel@pengutronix.de>
Reviewer: Pengutronix Kernel Team <kernel@pengutronix.de>

> MARVELL MV643XX ETHERNET DRIVER
Maintainer: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Reviewer: NA
Although the maintainer seems to not be active.

> MSI LAPTOP SUPPORT
Maintainer: "Lee, Chun-Yi" <jlee@suse.com>
Reviewer: NA

> PCI DRIVER FOR ALTERA PCIE IP
Maintainer: Joyce Ooi <joyce.ooi@intel.com>
Reviewer: NA

> SECO BOARDS CEC DRIVER
Maintainer: Ettore Chimenti <ek5.chimenti@gmail.com>
Reviewer: NA

> SOEKRIS NET48XX LED SUPPORT
Maintainer: Chris Boot <bootc@bootc.net>
Reviewer: NA
Although the driver seems to be old and outdated. Also the maintainer
isn't active.

> TOPSTAR LAPTOP EXTRAS DRIVER
Maintainer: Herton Ronaldo Krzesinski <herton@canonical.com>
Reviewer: NA
Although the driver seems to be old and the maintainer isn't active.

> TTY LAYER
Maintainers: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
             Jiri Slaby <jirislaby@kernel.org>
Reviewer: NA


> Please let us know about your answers and always send your responses
> to the linux-kernel-mentees mailing list. After that first exercise,
> exercises 2 and 3 will follow.
> 


Thanks and Regards,

Utkarsh Verma
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
