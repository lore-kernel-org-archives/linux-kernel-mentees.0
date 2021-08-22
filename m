Return-Path: <SRS0=zqa/=NN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59872C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 22 Aug 2021 18:21:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F006D610A3
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 22 Aug 2021 18:21:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F006D610A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA3F9401AE;
	Sun, 22 Aug 2021 18:21:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Ir1AhaFxmKr; Sun, 22 Aug 2021 18:21:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 59652401CC;
	Sun, 22 Aug 2021 18:21:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 26A44C001A;
	Sun, 22 Aug 2021 18:21:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0EEDCC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Aug 2021 18:21:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F153C605E5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Aug 2021 18:21:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b_QW-MFzETYW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Aug 2021 18:21:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 69D37605B7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Aug 2021 18:21:18 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id j12so12728963ljg.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Aug 2021 11:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lWIuKPtlYp8NWvxoAjn22hpyvsTyyw67h9SN+AMNHqA=;
 b=NE5nY39JJRwWgANHjk0ZBLi4VwH/8lwkMy8/K947P4MvpAfMRL9qDekLV8ys05qM6S
 yGHEqIQeTn6cFrmogb0F9x9R+X4h89ZVOqnmiM0ZKHSf/e0hvXvZnvuKC3dMqzX/yy4U
 mWLac0LkvoC4lCH0GUh8eMhg1a/23BW4cyQcSplqZ+LBggASu/1XqI1boeZe2ZcYgoKA
 orCZvoiYLmcSfWTdLjIzpbEJE3feo+uk7FhrcEa8th83q7keXktzoWykTcxPp/gNlJev
 JZW0cRGZvY0oTYKq+zkdhsV917QUu6pwZ87Pgh9O+6WFd+Ay6PNAL8dKcZ3Jgx4lh4Mg
 /S/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lWIuKPtlYp8NWvxoAjn22hpyvsTyyw67h9SN+AMNHqA=;
 b=KjJVNHVpmsvsajDdJfd3OPFKspaRCzSknfTFuYysalpBin1FlurqN4FMHd7pf2uNFI
 rSbMb5G9/IjTSqdtw38CzAvmG6pC7jn6CDNq91V6FBAs1cljXp3Wg9X191S6ul56gTik
 CVi0J0vIHUdHEelXbsdQ3N1Kbsp6RAREm4g4qUh7Ph2TJJm2fxcT7o3+qTBzPl7epzxm
 rI2XJS1gIZZ9hUY4daeN0YhM4yoVvdIZVcIDpJxuqI9hzF+SoymjF4d28GsmVUuU/qLU
 /ebawyQ0xQgsTwaRZNaTUFoaVERJoqnZFuRJ4//DoEFRC3nWfP/BlisPE2LBHd1PyLRY
 SxmQ==
X-Gm-Message-State: AOAM532mWQjxVUQ0kzCK96cmOknwZUJl0E+mFHcMcWA59xZv7gYcjivK
 4UMM91XF2NRIB6N8gvLv0GaFRAPAdoL77yR6NPo=
X-Google-Smtp-Source: ABdhPJzbO0wvU4+Vo1FPr5sByCgVH1nDU4ejP/GwlsDud+Ivd9DoFJ3TNY5elPKkkJxtWwYfGVNsadAsuzwNC1zietM=
X-Received: by 2002:a2e:9a03:: with SMTP id o3mr23937705lji.75.1629656476140; 
 Sun, 22 Aug 2021 11:21:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAE3uYxtgef1YPKsWBqt232f62y14gtFvy1S-mTZ2woU+uR5TzA@mail.gmail.com>
In-Reply-To: <CAE3uYxtgef1YPKsWBqt232f62y14gtFvy1S-mTZ2woU+uR5TzA@mail.gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sun, 22 Aug 2021 23:51:04 +0530
Message-ID: <CABJPP5AUxhvn=r9fW5xc5Ux2+Ya8dR=P6_JjG-xU8x3RJFesJQ@mail.gmail.com>
Subject: Re: Linux Kernel: Checkpatch Documentation
To: ANUSHREE SABNIS <absabnis_b19@me.vjti.ac.in>
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

On Thu, Aug 12, 2021 at 9:04 PM ANUSHREE SABNIS
<absabnis_b19@me.vjti.ac.in> wrote:
>
> Respected mentors,   I am interested in the Checkpatch Documentation mentorship program and I would like to work on the tasks for the mentee selection.
> Sincerely,
> Anushree Sabnis

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

drivers/dma/qcom/gpi.c
drivers/pinctrl/berlin/berlin.c

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

All the best,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
