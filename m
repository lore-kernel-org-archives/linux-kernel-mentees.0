Return-Path: <SRS0=D/cX=MZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30B8CC4320A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Aug 2021 12:21:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAF6B60F4C
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Aug 2021 12:21:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DAF6B60F4C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A00BE83077;
	Mon,  2 Aug 2021 12:21:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UUJGCGBe86Xc; Mon,  2 Aug 2021 12:21:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id C1DD78300C;
	Mon,  2 Aug 2021 12:21:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8FD78C001B;
	Mon,  2 Aug 2021 12:21:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 666D7C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Aug 2021 12:21:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42C314032C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Aug 2021 12:21:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OTqQuiyn28NP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Aug 2021 12:21:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 746A440328
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Aug 2021 12:21:43 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id m193so13504304ybf.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 02 Aug 2021 05:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AQ/oJqoqJAckgD1PcT+WeXcoongZPmAgp1wXGhBaCDI=;
 b=t7HoHgW7QKatrGcFgLh9oy3DsGrKex2E+pLgsGK1/iAft8423b0SSmIkymNDF4KLPW
 P/L9FeVdE/1fJrKg8pxj3AJbed11a7+NirtnamIE+5lYnF7sbEI02A6ZfQzW7tAvaQsc
 sfaz11RJife5ahy7+8nmnfqNbpzWZXqg165s9sr4xHg/i0xcObGoNI/RMuqNjtPgCGmX
 rDfYH7Ac7OqxBfzrW6gZVlDhJfzuRF3ZwDWjJx7YZcSa08uVSODUZV6+q9uVzBrRHJKf
 HA/0Jr3e+Nuv6fKu+WoaX3njE4aW/imuKAPLehbLztuR0n/NKuAhf5KJfDKYnuyA6bVu
 TAsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AQ/oJqoqJAckgD1PcT+WeXcoongZPmAgp1wXGhBaCDI=;
 b=ll+pMUtrQMZAuKWyh8lfDvwPeIpNlA4VmZa+NaS6kRnEumfQLxs4h+QhrLLBL3nmWF
 zqi8uiwVjPlVtFH0KopZI9qp4ZZ7/ujjqBN3PAWZLcMZ9tqOpioRJxKSpBJXDxixoQbu
 HL5ZUn+tXZNV7oP91/iD9WFBocMGQgEIBilliryqLiLAJkRPZzvrHwaG5vP708xW6WR/
 AMiHNpMhz07CrfbXUmFy4/47J/+Y0x/zPmhtRud0NsTy8oLYUiYS4zVG9bWkaSOU/YWN
 RtU8rhBt+oQDoRxN4lp3p1G2TqssVU5oZApQ6ff5IkjE3/lPuKzwSZKLaN/uL/lW7sRQ
 9pjg==
X-Gm-Message-State: AOAM533yW4Vo5ASP0stcdUQF2QHisd0unfXen+IbrZmqQGdcUmHPzJUS
 1gD2NRC19ly1HzwfC4rXeT5K0y3P362aDl3XRf8=
X-Google-Smtp-Source: ABdhPJxzfip8D2NPNauP347IRG3OX9Cxu4xkwRj1Sr9cssY0dpdpAcGpoyRmDv807YBcCMP1H54PfEdncrh/ZVUfHA4=
X-Received: by 2002:a25:d290:: with SMTP id
 j138mr22276550ybg.151.1627906901956; 
 Mon, 02 Aug 2021 05:21:41 -0700 (PDT)
MIME-Version: 1.0
References: <CANx6jmdBVOPVEWMnZyreYGaKc_Unf30V2eVCucOCkbgu1mN1-A@mail.gmail.com>
 <CABJPP5CpnsWWkd=geXmX4986_E6yNq=J57cDfpu3RKwKPwnXgA@mail.gmail.com>
 <CANx6jmdwOpEgPV9fo2ETtmuKccNFszB0nRjmjppE6BgFK_AAmg@mail.gmail.com>
In-Reply-To: <CANx6jmdwOpEgPV9fo2ETtmuKccNFszB0nRjmjppE6BgFK_AAmg@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 2 Aug 2021 14:23:15 +0200
Message-ID: <CAKXUXMzT6dy-RmoH-g2v7vyGLUxY0nYQvtgU2EoksEvRDfiWBA@mail.gmail.com>
Subject: Re: Request for mentee selection tasks (Checkpatch Documentation)
To: sri vathsa <srivathsa729.8@gmail.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
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

Dear Sri,

> > Then, the first task is to run checkpatch.pl on a few files below
> > and share the results:
> >
> > drivers/usb/gadget/legacy/raw_gadget.c
>
> Result:
>
> ./drivers/usb/gadget/legacy/raw_gadget.c:52: WARNING: consider using a
> completion

(snip)

>
> WARNING: consider using a completion
> (Not Documented)
> This warning suggests to use completion instead of semaphore.
>
> checkpatch.pl checks for iniialized semaphores, by checking
> for sema_init, if semaphores is initialized warns to use completion
> instead of semaphore.
>
> if ($line =~ /^.\s*sema_init.+,\W?0\W?\)/) {
>        WARN("CONSIDER_COMPLETION",
>             "consider using a completion\n" . $herecurr);
> }
>
> fix: completion has to be used instead of semaphore.
>

Can you do some further investigation and research what this warning is about?

E.g., Look at the commit and its commit message that introduced this
rule in checkpatch. Look in the kernel documentation for relevant
information on semaphores and completions, the difference and the
reasons to use one or the other synchonisation mechanism.

Summarize this information and provide some documentation on this
warning with various pointers for further reading and share that with
us.

We found 16 cases in the kernel tree:

drivers/crypto/ux500/cryp/cryp_core.c:1593:
WARNING:CONSIDER_COMPLETION: consider using a completion
drivers/crypto/ux500/hash/hash_core.c:1946:
WARNING:CONSIDER_COMPLETION: consider using a completion
drivers/gpu/drm/udl/udl_main.c:213: WARNING:CONSIDER_COMPLETION:
consider using a completion
drivers/infiniband/ulp/isert/ib_isert.c:2275:
WARNING:CONSIDER_COMPLETION: consider using a completion
drivers/input/misc/hp_sdc_rtc.c:88: WARNING:CONSIDER_COMPLETION:
consider using a completion
drivers/input/serio/hil_mlc.c:934: WARNING:CONSIDER_COMPLETION:
consider using a completion
drivers/input/serio/hp_sdc.c:904: WARNING:CONSIDER_COMPLETION:
consider using a completion
drivers/input/serio/hp_sdc.c:1033: WARNING:CONSIDER_COMPLETION:
consider using a completion
drivers/md/dm-region-hash.c:217: WARNING:CONSIDER_COMPLETION: consider
using a completion
drivers/parport/share.c:465: WARNING:CONSIDER_COMPLETION: consider
using a completion
drivers/usb/gadget/legacy/raw_gadget.c:52:
WARNING:CONSIDER_COMPLETION: consider using a completion
drivers/video/fbdev/udlfb.c:1888: WARNING:CONSIDER_COMPLETION:
consider using a completion
fs/xfs/xfs_buf.c:237: WARNING:CONSIDER_COMPLETION: consider using a completion
include/drm/task_barrier.h:59: WARNING:CONSIDER_COMPLETION: consider
using a completion
include/drm/task_barrier.h:60: WARNING:CONSIDER_COMPLETION: consider
using a completion
kernel/seccomp.c:1769: WARNING:CONSIDER_COMPLETION: consider using a completion

Can you please check which of these cases should be refactored (so the
checkpatch warning points to a valid suggestion to refactor the code)
or if checkpatch is wrong with its suggestion and why?

Thanks,

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
