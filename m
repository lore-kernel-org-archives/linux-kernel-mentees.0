Return-Path: <SRS0=f8HV=MS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 395E6C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 26 Jul 2021 21:54:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE1F960F37
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 26 Jul 2021 21:54:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DE1F960F37
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2DAD8381F;
	Mon, 26 Jul 2021 21:54:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tLX4ZLN5f01j; Mon, 26 Jul 2021 21:54:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D8793837AD;
	Mon, 26 Jul 2021 21:54:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B5012C001A;
	Mon, 26 Jul 2021 21:54:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7706CC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Jul 2021 21:54:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 56EB78381F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Jul 2021 21:54:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mk-NNVVKJ_mL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Jul 2021 21:54:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C48BB837AD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Jul 2021 21:54:11 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id g13so18061572lfj.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Jul 2021 14:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UzjKD8S55e8H77/2XjcNJdZuEnQjXLrTi7JdtoOvEe8=;
 b=YWWso7aIIV9Fzu0fLOMa9F8CkMJ+FT1mCBGZYpqLRCrGPNkqsmx+Cj1KUmuzusOOOt
 NQ4TF4FyVPtTT4pdGPb+fsaQwtqbL1sTZmRjJmrTNElKkjMvGLn4llCxfPQwlTkY3noj
 +V5oAMAnIvfCVMJE2gYkRLkPEXyyHPU6UNuQQxv5mEAzu6pd4CfOqkAneyVL2GNhzHyc
 UMJhwZa6J+jJ9KTVW5Jbb1qBHcSMFPLHYjxsdPexZVj1G4x6ev6QIVIwdKb7cNo/dStM
 icYGCCG4fa/nowGHT/xY2r4TnwDzQD9bGFlGwZqWoBZY/KPCj9s94c62jldF0xebAk3W
 DPrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UzjKD8S55e8H77/2XjcNJdZuEnQjXLrTi7JdtoOvEe8=;
 b=W9YId4QTL92QREwb4i+1R82SX4xuVY2xcRNe9XpaX630AWCsqyAq6QsvciTnF9UaoF
 qrRdt1zGkWqlYEcXvKYpHNWC5jaGwJFvroMxfirH0iFVwM1W77cW3uDjowtFJXnMkVyK
 wuvdw8oCZug475B2I4LvbgmO867DgtQT5g37Ra3Cf1HviPXbCMZmbfm05ZX0e79xU5rL
 ORV5OMIRnvy76/gEYUV/QXrsPuCS9a6Sz3W0Ag9+wtWQmZ9BFXF5Ine1woPIjj7Ct3jp
 Fl30XsCJ8KDdnFepxw8qvLOzyvZwpGf24XDQJ/GS0NNbFmTwBcv0wZuAn0VtffOk1QBB
 rBRQ==
X-Gm-Message-State: AOAM530p1zQU9vLPQwCRR+//umFdkJxqMaMOQ9NoxsGyovcSSZ/RPmUh
 VINztdIG1gQlAJH9NPmjkByBw4CRy3r1QE+2maM=
X-Google-Smtp-Source: ABdhPJzW5qlWaJAngGHYWVBzFzKoTH0qKL9yJEcDiWn2vvV5tRJBOnj21NW08X6XocdFYJ1kYu0iXI8FMunkHbpXGFo=
X-Received: by 2002:a05:6512:a89:: with SMTP id
 m9mr13968373lfu.342.1627336449171; 
 Mon, 26 Jul 2021 14:54:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAFY-XHTSXBrvHfYjxft=eWCR1JLoz7gZ0HzvTVoEL=8w=J6Ozw@mail.gmail.com>
In-Reply-To: <CAFY-XHTSXBrvHfYjxft=eWCR1JLoz7gZ0HzvTVoEL=8w=J6Ozw@mail.gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Tue, 27 Jul 2021 03:23:57 +0530
Message-ID: <CABJPP5C9oEiJPpyRSxL2qiMQ48w_VnaRLpMCrk86cFxRuHarLg@mail.gmail.com>
Subject: Re: Linux Kernel: Checkpatch Documentation Mentorship program
To: 4PS19CS059 Mahendra Reddy <reddymahendra52@gmail.com>
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

On Sat, Jul 24, 2021 at 12:30 PM 4PS19CS059 Mahendra Reddy
<reddymahendra52@gmail.com> wrote:
>
> Hello Mentors,
> I am interested in the Checkpatch Documentation mentorship program and I would like to work on the tasks for the mentee selection.

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
and share the results:

drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
drivers/staging/media/atomisp/pci/hmm/hmm_reserved_pool.c

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
