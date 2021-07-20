Return-Path: <SRS0=NgQV=MM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19B04C07E9B
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 20 Jul 2021 09:06:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B06436120D
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 20 Jul 2021 09:06:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B06436120D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6ADE840357;
	Tue, 20 Jul 2021 09:06:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6RY1_vdQAKod; Tue, 20 Jul 2021 09:06:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 28BB840341;
	Tue, 20 Jul 2021 09:06:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0B149C0010;
	Tue, 20 Jul 2021 09:06:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BF0CBC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 20 Jul 2021 09:06:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A00FD4034A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 20 Jul 2021 09:06:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rafyy6PkOcIk
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 20 Jul 2021 09:06:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2C1DA40341
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 20 Jul 2021 09:06:33 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id f30so28172031lfv.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 20 Jul 2021 02:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eV0OylbiDrZR9vYp8flfFUNwZE88TXCVfz37TU587P0=;
 b=bf+v2rrZZySMeVtO+8yvwnYoGxIEHXW0MLOLqnGf5P2YDOG+103oMzrPT/ecvG7+y2
 JeC/keXMwDOEm+GZbINe2DjIQlVFcbKyBKwUViHawABz9u7guLZLVD1sUlKD6BVAj4IT
 bnP0tlp6UUYd6AAlVvtKpW+7oO5UCfjemndxuofEc7T8nbBqV70GUlCYl0LJyPR5alek
 CGd8M41Efn3xqOWWHfVd4B4vywkk2A1u6mAWiMsr3fLCg7eplUGA4qw28thmrWgTe80g
 g4P7o5K54rJXqtDU732txvh+HcrG2rY3NOxA494GH6ib+90J9Z+f75L4+pakXJkr2rAs
 wI1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eV0OylbiDrZR9vYp8flfFUNwZE88TXCVfz37TU587P0=;
 b=icDaSkOXGMnHS0h2Y454Bbw7aAJTzOOBUv7kMiHzSAgMmbgk/ofPfSqOQ9wdP97jGQ
 RL1viQSXtUjgZ7OnQVTQLNTxAtNjib+rOpj2IgW2/X4zxu1HoojlU+WSjh9tt6KBY9Ko
 4susT+GUOupEnUT1KGY9mTju2qhB7XxJaMqOCiAw90jZpGMvg62WZxkVY3urkJqXZKfA
 ArfovjaiUtGileOb5Dx4OhuV5tmk4P81z+jKJzKlC0J0m2QQm8cMKruFIN78Bc8jbCMj
 hwg8EGlhlKDfaiQTjNe3ohcMpWhcQda4uGrttgjg8MQk/g3kxF+c+TSs+ANfzh+hgv3s
 7lWA==
X-Gm-Message-State: AOAM533E9cnQ7hSygW9IJRU7qUIW2ud0IBR9h4HlFJgTmla58PG+tYBx
 PPSvu0QrN78RwIyqg12B5Po22HY1jpd7uXXn5pU=
X-Google-Smtp-Source: ABdhPJyKgkDNa6ghcDceG2HY41TmAQxF7tzAhUjbI2hyfmt/zkeIM3QQ/cEJHyik5LXmr2tL+t8pEgCEPXzDv2/YT+k=
X-Received: by 2002:ac2:4206:: with SMTP id y6mr20750148lfh.206.1626771990824; 
 Tue, 20 Jul 2021 02:06:30 -0700 (PDT)
MIME-Version: 1.0
References: <CANx6jmdBVOPVEWMnZyreYGaKc_Unf30V2eVCucOCkbgu1mN1-A@mail.gmail.com>
In-Reply-To: <CANx6jmdBVOPVEWMnZyreYGaKc_Unf30V2eVCucOCkbgu1mN1-A@mail.gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Tue, 20 Jul 2021 14:36:19 +0530
Message-ID: <CABJPP5CpnsWWkd=geXmX4986_E6yNq=J57cDfpu3RKwKPwnXgA@mail.gmail.com>
Subject: Re: Request for mentee selection tasks (Checkpatch Documentation)
To: sri vathsa <srivathsa729.8@gmail.com>
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

On Tue, Jul 20, 2021 at 2:13 PM sri vathsa <srivathsa729.8@gmail.com> wrote:
>
> Hi,
> I'm Srivathsa Dara, I am interested in the Checkpatch Documentation mentorship program and I would like to work on the tasks for the mentee selection.
>
> Thanks,
> Srivathsa Dara

Thanks for your interest in working with the checkpatch documentation.

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

Third, set up your email client according to the kernel community
rules. Here is some information to that:

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#no-mime-no-links-no-compression-no-attachments-just-plain-text
https://www.kernel.org/doc/html/latest/process/email-clients.html

Generally more information on submitting patches and responding on
replies is at https://www.kernel.org/doc/html/latest/process/submitting-patches.html

Once the zeroth task is understood, you can now move on to the first
task: Running checkpatch on a specific file.

Get a clone of the Linux kernel repository.
The script checkpatch.pl is under the scripts directory.

Then, the first task is to run checkpatch.pl on a few files below
andshare the results:

drivers/usb/gadget/legacy/raw_gadget.c
drivers/video/fbdev/udlfb.c

Which information on these rules that checkpatch warns about
is available in the Checkpatch Documentation?

If documentation of these rules is available, explain your
understanding of the rules in your own words.
If no information is available in the documentation,
explain your understanding of the rule.

In any case, explain the violation that is checked and raised in the
checkpatch script, i.e., what is implemented in checkpatch to check
the rule and possible violations. Which code in the checkpatch script
is raising the warning? What does it check and how is that
implemented?

Explain how to possibly fix this code with regards to that violation.

Once you succeed on this first task, we inform you about the further
second and third task. If you fail on any of those tasks, you are out
of the selection process.

The selection of the mentee will happen according to schedule,
at earliest on August 12th and at latest at the end of August.
More information is available at
https://docs.linuxfoundation.org/lfx/mentorship/mentorship-program-timelines.

Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
