Return-Path: <SRS0=NgQV=MM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5373C07E95
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 20 Jul 2021 05:56:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 304136113A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 20 Jul 2021 05:56:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 304136113A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2C414046D;
	Tue, 20 Jul 2021 05:56:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KICgu69yp3T0; Tue, 20 Jul 2021 05:56:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id C64594046E;
	Tue, 20 Jul 2021 05:56:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9D0A4C0010;
	Tue, 20 Jul 2021 05:56:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8B619C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 20 Jul 2021 05:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79FF44046E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 20 Jul 2021 05:56:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yP37mi-rK1HJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 20 Jul 2021 05:56:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2F7044046D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 20 Jul 2021 05:56:43 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id i5so34104283lfe.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Jul 2021 22:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CBD1knAzk+VjDivoTxnqpCW9+n90vUFxP5SjTcJjrt8=;
 b=jLORLwuGXD9PTM9XI5cIccE59M0axeAjWXWAufT8C3ZxNH+cakwmczfhENpQmDzUxs
 KHl83/rw+NJtNmY+xw6Pq/s1wLPGG1CBEceLWQCTzaZWtVjKBfHnSsm6xgmVq8qt5EAR
 yAoBbp7ksLAzDyJcYR9h/GYVzzsP2bE0fJb9ImsvoYDjZ7RU8FSvT6V9Zr7K1p/kb+6+
 9duECIwkC0dkafVWCFP5RW5bWBHjHJnFD8uVEtf4YSoPp6+/t2rvr4T564YvlMuJm03r
 B15MTjr1pysNKNNIdt0AFV0oO+NCpgzwM8uemVJ2BgzRqhvcG7XoPQ3ETQicIta/ja4L
 gMkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CBD1knAzk+VjDivoTxnqpCW9+n90vUFxP5SjTcJjrt8=;
 b=cCef+FIhIm1cfagZqm577D9u0DJrp7ZBigEIxz8/LYvCMf/zw4GTkyV0S65XKpHe8X
 X8DCBU2CdAYIVGNC+xN1xRHDQCqUk8L8fFbTUGN7aeaFrh54Z1GSYbBewk2EakxNlMHo
 bb/I8WhnQvJOic3Lb4IjgfRx8WahYC1EFIwGEfIn7TSKZ1wBP/HlQ1ET/TavjQjXuynb
 r8nTzegiDfDyMjWA9pBhG5sqeHVoFm4c48qc4YH+qAIuonU/uKzNh2B6+nAuBpZ5TGxF
 tuDMnQ5odT/ucym5RVpO4wIZqo9ZfzA9s5LxF9XZKvH6RSVqCyuXgBBRHzyNBZHnThcJ
 l+AQ==
X-Gm-Message-State: AOAM532PB0Xc9jCfhUcv9LAMNrC8pLxn1Nuj+olBPv2wc9lm9hAsjV6j
 RwT1sxSVF3wQFr0/tKdAmugZnjNONL7z2LL2R+4=
X-Google-Smtp-Source: ABdhPJwYA69z96urWtFxcGeOJklDlTyDa9H00LSJsDFpKogUzW3w9AkVymyZ6Wc1uBVQ7hjV0jxdrpYdjNZedUHH1WE=
X-Received: by 2002:ac2:5dd5:: with SMTP id x21mr20783664lfq.31.1626760600844; 
 Mon, 19 Jul 2021 22:56:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAMqN5U6TDXVsJy3YEw-QOY9saktrWpNELtNKnBW9VegdQG2x3Q@mail.gmail.com>
In-Reply-To: <CAMqN5U6TDXVsJy3YEw-QOY9saktrWpNELtNKnBW9VegdQG2x3Q@mail.gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Tue, 20 Jul 2021 11:26:27 +0530
Message-ID: <CABJPP5AUm4fmiNPem3S1pw-S89E70H4UoVyGRq_vmCef1B4Qvw@mail.gmail.com>
Subject: Re: LFX Mentorship application
To: Vinesh Vilas Raut <vineshraut2017@gmail.com>
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

On Tue, Jul 20, 2021 at 2:49 AM Vinesh Vilas Raut
<vineshraut2017@gmail.com> wrote:
>
> Hello, community ..!
> I am interested in the Checkpatch Documentation mentorship program and I would like to work on the tasks for the mentee selection.
> - Vinesh

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

drivers/message/fusion/mptlan.c
drivers/infiniband/hw/hfi1/sysfs.c

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
