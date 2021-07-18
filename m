Return-Path: <SRS0=+xMb=MK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1CE8C636CA
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 18 Jul 2021 04:48:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D6F66100A
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 18 Jul 2021 04:48:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D6F66100A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A1E283BBF;
	Sun, 18 Jul 2021 04:48:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YMi4TR1V5pcC; Sun, 18 Jul 2021 04:48:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 1830882A4E;
	Sun, 18 Jul 2021 04:48:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EC801C0010;
	Sun, 18 Jul 2021 04:48:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BC059C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jul 2021 04:48:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A215E40534
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jul 2021 04:48:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kVIZpk1asF7s
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jul 2021 04:48:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9FDA740530
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jul 2021 04:48:08 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id i18so21841003yba.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 21:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vmehoIxhxj7D/4oTUn3AZGgqgvAd7Jz7jOwRektDbsU=;
 b=Bug/M1KgaztyU+jGDLq+GEEYhVR1l3BPAmzcD02O5VCo6Jfxag2TN3ciOxaVowu49+
 bq+pWTht3COZm+qiat/fT4ND4bN194Jdxd6Mrz5IKVz39o5s+0vrZ63dnLyXS6wEqxLo
 JivJquguVi6wnVSCuZqe0UYpYClW0liN5KIuotcRcWaBpaKswLebNcqKhxy9ZlYzNeiM
 DxCx7lmgoRiqCMPHCL0vvaGz4bZ+3m4J7T3IV2hQjmkJOVPZKPnkRGk5cgUGc1GRKXKB
 ub7BKXtwi5YST/DBMru6CshVNdaq4YnNOqc1pm+AhPoFFZ3uT9DFgn0TBNQd0/TVvoKu
 G8zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vmehoIxhxj7D/4oTUn3AZGgqgvAd7Jz7jOwRektDbsU=;
 b=kjZNiNdpAnDNedCgBoDCuuY3NwFyRYZ2uBRtIUB8CrYFhbbf+/21/6wupWSjDaEh0S
 L0o/RqOASsK2wKriF+GAZO1lLpVJALsuRncdELHjfLT/G5+0jzn9gP4wg0+MLU0kETA8
 iVeKEtss7d5aZ8ZSF9BMESyikjq92JJMhEPMBaRPgHdMRN39hStgl4WVhgCkxHnc82+1
 pVht2Vt0IJbmW6tkVvdiF2QiVPVc1lzEf8W7QDnTRtY5mtDlumXNDls6We07EcKSXLPo
 AhlewOkPo/fF9SoCvU/1Oz77drFMNiYVNJ4D92Oevk+E/IqW2A6lKUP+5AjVG1SAKiOn
 H9Vw==
X-Gm-Message-State: AOAM533QbNCDBkjMBKFYAnlrQjyWaom5thr8I/ZKv+eoCHczNILm6ybX
 jAoH1ykyn4wwaHrtcwdszKUQeiid6dB03RdNSYQ=
X-Google-Smtp-Source: ABdhPJwnWHdXVfWnTqNVH6bxNGWxlMyE5kag4x/RFczkqMtQSlulSpwtP/RznqMPvQwP42h6p2six/pUR0MkgLEX/ZU=
X-Received: by 2002:a25:f30d:: with SMTP id c13mr22382977ybs.134.1626583687558; 
 Sat, 17 Jul 2021 21:48:07 -0700 (PDT)
MIME-Version: 1.0
References: <97dc8d5f-ebeb-c12e-d214-7c5591f1f4db@gmail.com>
In-Reply-To: <97dc8d5f-ebeb-c12e-d214-7c5591f1f4db@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sun, 18 Jul 2021 06:47:56 +0200
Message-ID: <CAKXUXMzmn2fvM50Q7edAKk5gQzJs47gxOzyM4LuaaJKxcnbXPg@mail.gmail.com>
Subject: Re: Linux Kernel: Mining for Maintainers
To: Piyush Thange <pthange19@gmail.com>
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

On Sat, Jul 17, 2021 at 1:20 PM Piyush Thange <pthange19@gmail.com> wrote:
>
> I am interested in the Mining Maintainers mentorship program and I would
> like to work on the tasks for the mentee selection.

The zeroth task is to learn suitable netiquette for the communication with
the kernel community. Below are some basic rules and pointers for this
mentorship. More information on kernel netiquette is also at
https://people.kernel.org/tglx/notes-about-netiquette.

First, please do not top-post.

    A: Because we read from top to bottom, left to right.
    Q: Why should I start my reply below the quoted text?

    A: Because it messes up the order in which people normally read text.
    Q: Why is top-posting such a bad thing?

    A: The lost context.
    Q: What makes top-posted replies harder to read than bottom-posted?

    A: Yes.
    Q: Should I trim down the quoted part of an email to which I'm replying?

Second, please always CC: linux-kernel-mentees@lists.linuxfoundation.org.

Third, set up your email client according to the kernel community rules.
Here is some information to that:

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#no-mime-no-links-no-compression-no-attachments-just-plain-text
https://www.kernel.org/doc/html/latest/process/email-clients.html

Generally more information on submitting patches and responding on
replies is at https://www.kernel.org/doc/html/latest/process/submitting-patches.html

Once the zeroth task is understood, you can now move on to the first task:

First, download the kernel git repository and compile the kernel with
the x86-defconfig build configuration.

There is a file called MAINTAINERS in the root directory of the git
repository. Read the introduction at the beginning of the MAINTAINERS
file and understand the content in the file and its organisation.

Explain in your words: What is stored in the MAINTAINERS file?

Now, search for specific MAINTAINER entries; Please answer: Who are
the maintainers and reviewers of the following sections?

DVB_USB_GL861 MEDIA DRIVER
FREESCALE USB PHY DRIVER
HYPERBUS SUPPORT
I2C-TINY-USB DRIVER
IMON SOUNDGRAPH USB IR RECEIVER
INTEL PRO/WIRELESS 2100, 2200BG, 2915ABG NETWORK CONNECTION SUPPORT
NVM EXPRESS DRIVER
PS3VRAM DRIVER
PWM FAN DRIVER
UNSORTED BLOCK IMAGES (UBI)

Please let us know about your answers and always send your responses
to the linux-kernel-mentees mailing list. After that first exercise,
exercises 2 and 3 will follow.


Best regards,

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
