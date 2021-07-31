Return-Path: <SRS0=pOiW=MX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22C23C4320A
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 31 Jul 2021 08:27:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8C5561077
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 31 Jul 2021 08:27:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C8C5561077
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9138240286;
	Sat, 31 Jul 2021 08:27:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dlwMcAbIKjgP; Sat, 31 Jul 2021 08:27:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 5A5F7401C8;
	Sat, 31 Jul 2021 08:27:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 38A3CC0010;
	Sat, 31 Jul 2021 08:27:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F0ECFC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Jul 2021 08:27:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DFCEE605BF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Jul 2021 08:27:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pdN8-HWmWhIE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Jul 2021 08:27:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B9A9F606A0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Jul 2021 08:27:17 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id x192so20081582ybe.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Jul 2021 01:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yb0r+jublcaTIwk9GtLEG2LXqptIE5yKzUM3Fbdlaq4=;
 b=HiDfBIVaSOfemBklcUpBMzn0ZU+GG1EVFSZZ/ah2be2Wpo8gsWtDIIrtT2q8Y/MA46
 2A2paUWQOmZuBd1jCr0oUkRzpC5dJlRD+dWPXNH7X40nZ8wOx00y5jsZszE2jMs0iyA3
 kfpW9cZvBDQ6jPEaWgqGm2ACvkG7abzaESXKX+955V718whXOpPXqi8EZ5O5leOpWFQ6
 pOVZLX5WGpQnASpofWbIdswGHciExWGTSsXrsGOmGBEHiEz8dQvVxC47ylBSQlOsaRbF
 Gn4tBKEDZkzy4zId9bYV71yQLMREtsI5hgHCQfgfbflyLmDrF8aYbRSg6NINtng0La1c
 mQHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yb0r+jublcaTIwk9GtLEG2LXqptIE5yKzUM3Fbdlaq4=;
 b=bFqxS1Cftsq+J2JjKGu9PTfCptabyn0ktBhrLI2SnRfqvA3PKAslz2r/7tL0qrvpvC
 TEnPO1ZIKZvlQFyPB3FFxUP0OcvA6YubXbC0BGSRW3ZGdb+vOfrYbq/sXEwihGbGZtMR
 x/yHpkHBcDuX2skj9TspmDxp9L2eq49iz32kYrH64aGQ7hcIAcmWpR22HLuEx09I1VEP
 XItswebWEy0XN3aechMmJSGiLtaL5rwTwGclG3+TE7UFNpB2alFcBKn/XwTR9x2UvmYo
 STI5XoFAgDQycOw+GUxIYncfkPuXNLcgFsrsCIz6iubcpEEg6ylWYjYM7Ryn1aGk9MvR
 0VNw==
X-Gm-Message-State: AOAM531wTZC+y76cPhUQgAB0li61576V5Zx9aErFynDyYu6P6dAg1ZNi
 fSBUSiHuPA9PF1mmN7f9WpZ63BiCggqYfZHbY5g=
X-Google-Smtp-Source: ABdhPJzyKmRaADkVW1sHnsUE8BLlUF5di7jOehg2rdY0z2xofi4QU+sh5w6qSv0fTM09mlVVhp6obbWLSRN3s8oZzQU=
X-Received: by 2002:a25:7409:: with SMTP id p9mr7701310ybc.22.1627720036502;
 Sat, 31 Jul 2021 01:27:16 -0700 (PDT)
MIME-Version: 1.0
References: <CADywMdqcPV5TaB64TbujGdRFL0WiGUqJLi-pOSpf81_ZLMg+iA@mail.gmail.com>
In-Reply-To: <CADywMdqcPV5TaB64TbujGdRFL0WiGUqJLi-pOSpf81_ZLMg+iA@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sat, 31 Jul 2021 10:27:07 +0200
Message-ID: <CAKXUXMzjPLKpLW7VsyaWPjgAHmyQ1==cgO5dAxv=gFvOsJU0DA@mail.gmail.com>
Subject: Re: Request for tasks regarding Checkpatch Documentation mentorship
 program (LFX)
To: Rahul Balaji <rahulbalaji78@gmail.com>
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

On Sat, Jul 31, 2021 at 10:14 AM Rahul Balaji <rahulbalaji78@gmail.com> wrote:
>
> Respected sir,
>
> I am interested in working on the checkpath documentation project under your mentorship and would like to work on tasks for the selection process.
>

Rahul,

The zeroth task is to learn suitable netiquette for the communication
with the kernel community. Below are some basic rules and pointers for
this mentorship. More information on kernel netiquette is also at
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

Once the zeroth task is understood, you can now move on to the first
task: Running checkpatch on a specific file

Get a clone of the Linux kernel repository. The script checkpatch.pl
is under the scripts directory.

Then, the first task is to run checkpatch.pl on a few files below and
share the results:

drivers/mtd/ubi/block.c
drivers/net/ethernet/amazon/ena/ena_netdev.c

Which information on these rules that checkpatch warns about is
available in the Checkpatch Documentation?

If documentation of these rules is available, explain your
understanding of the rules in your own words.

If no information is available in the documentation, explain your
understanding of the rule.

In any case, explain the violation that is checked and raised in the
checkpatch script, i.e., what is implemented in checkpatch to check
the rule and possible violations. Explain how to possibly fix this
code with regards to that violation.

Once you succeed on this first task, we inform you about the further
second and third task.

If you fail on any of those tasks, you are out of the selection process.

The selection of the mentee will happen according to schedule, at
earliest on August 12th and at latest at the end of August. More
information is available at
https://docs.linuxfoundation.org/lfx/mentorship/mentorship-program-timelines.


Good luck,

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
