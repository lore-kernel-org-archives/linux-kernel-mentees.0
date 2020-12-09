Return-Path: <SRS0=JFU2=FN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EFB6C433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  9 Dec 2020 15:22:40 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3CAF23AA8
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  9 Dec 2020 15:22:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3CAF23AA8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8616D2E2D0;
	Wed,  9 Dec 2020 15:22:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jkhlM5M2niy4; Wed,  9 Dec 2020 15:22:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9052A204D1;
	Wed,  9 Dec 2020 15:22:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 79CE2C0893;
	Wed,  9 Dec 2020 15:22:38 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 53FBCC013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Dec 2020 15:22:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4311C875FB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Dec 2020 15:22:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4sJRcbI0Sg1t
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Dec 2020 15:22:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 80CE18758F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Dec 2020 15:22:36 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id c1so2151339wrq.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 09 Dec 2020 07:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TTgwVeeqci2xCcDuc9NOyWDrkF20FO+ohqACUzZkke0=;
 b=WnILBfwlCP0Q0e3BrnCYKb3P0YWTRXpVBH/BJmLF5J1Pd8ffrhvQBMo7V8u+rbAVVg
 4suonF/4o9Wmp/xvl2yym/d9/a6QbjNS2WPA4qUfqdDTDXGfXEMa0R6F65RB+aCQABFg
 1FD5x9caoY38cIY0UP/uzgco/iiDxoeLVbmynNkhaRVGMlmzTBPXhqID01Yo5FT5i6I3
 q4S04LDaqbSVIbhWlilxvNfZ4tcSbpHrouU8MEEBAmhFBQHBX+TGcuZ4Dm4f7qeN+UPE
 /NHRP12oWzncxsV1cQhxlj3mz2gxj+PPt+KkLuuLJPJaHFe0+zhXZyIMha6FLW+FqYYn
 feSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TTgwVeeqci2xCcDuc9NOyWDrkF20FO+ohqACUzZkke0=;
 b=PlwBuv4CdovuHZyxmhZq9V1ee/XKkaDnPihv2CnuEZbGNpcgQd0GAxkzSzihxcJt6y
 ti9o4mAPTc5J+WrRrHPGGHmrUhERizc95XK8PqvPl0/6RtcX96HcW2uVPUacPSGicm+S
 hrkrW9xPGsRz46rdA/B/SorHpHEOMv1lPOeSKZEG/kUi9CUj9YyG0Nx1S5fhTdhHO5lF
 KkkBDvF1hRIMBBJZ9KflhXZMTzy0xEDB1ar7bu8XNT8JWGvGywydsoM7VT95dMDXTZ/I
 MjYEklu9o8EwUjlA/ys8Cd0bgksB8YbdK48aPdw5gurxIM3t4uFb0thXg1EwwKnI/bmZ
 PcBA==
X-Gm-Message-State: AOAM531TnmhGAVNJDANaYTVSodJ5EY5mh3nOrjZrYwessXHCH8qvETua
 y15DDBEl/OsODqy2N6Ox69Em52xXhUgfxvfuyCQ=
X-Google-Smtp-Source: ABdhPJyZLOqHJZEwBlxAiDLN5z/ofKNjNxvzAaQG0i7Geg3uaEI2LcKDglXptmQa/kD3A0kSSfMDLu8quGpd+sBl6bs=
X-Received: by 2002:a5d:66c3:: with SMTP id k3mr3264563wrw.123.1607527354801; 
 Wed, 09 Dec 2020 07:22:34 -0800 (PST)
MIME-Version: 1.0
References: <20201206152352.35026-1-dwaipayanray1@gmail.com>
 <CAKXUXMxD9wyaKf1TrZchOY1NBkFKSrHhFefQc9AK-bfH8fu8oA@mail.gmail.com>
In-Reply-To: <CAKXUXMxD9wyaKf1TrZchOY1NBkFKSrHhFefQc9AK-bfH8fu8oA@mail.gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Wed, 9 Dec 2020 20:52:08 +0530
Message-ID: <CABJPP5CKC3QafB7LvP758Gsoqe7xinYT7P9CED_j1kU-LVGFFQ@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Joe Perches <joe@perches.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v3] checkpatch: add --fix option
	to include linux checks
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

> Dwaipayan, can you run this rule from checkpatch.pl on all files in
> the current linux-next tree and share all findings with me?
>
> Maybe, we can fix a few places and improve the rule.
>
> Lukas
>
Hi,
I am actually a bit confused here. I couldn't find any particular place in
documentation which demarcates where to include asm or linux headers.
As far as my understanding, include/linux headers are meant to be
architecture independent.

There are several places in the kernel tree which use the <asm/*> headers.
Checkpatch emits warnings for the following headers in kernel/ :

kernel/dma/swiotlb.c:43:#include <asm/io.h>
kernel/exit.c:69:#include <asm/mmu_context.h>
kernel/fork.c:103:#include <asm/mmu_context.h>
kernel/irq_work.c:21:#include <asm/processor.h>
kernel/module-internal.h:9:#include <asm/module.h>
kernel/module.c:45:#include <asm/mmu_context.h>
kernel/resource.c:27:#include <asm/io.h>
kernel/power/snapshot.c:36:#include <asm/mmu_context.h>
kernel/power/snapshot.c:38:#include <asm/io.h>
kernel/sys.c:73:#include <asm/io.h>
kernel/sysctl.c:78:#include <asm/processor.h>
kernel/sysctl.c:81:#include <asm/nmi.h>
kernel/sysctl.c:83:#include <asm/io.h>
kernel/time/timer.c:52:#include <asm/io.h>

drivers/ had yet a more number of such uses.

I am not entirely sure that changing them will break more stuff or not.
It would be great to have your opinions on this as experienced kernel
programmers.

Thank you,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
