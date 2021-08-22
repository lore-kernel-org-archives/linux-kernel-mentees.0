Return-Path: <SRS0=zqa/=NN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 209BFC4320A
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 22 Aug 2021 18:25:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9F0961354
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 22 Aug 2021 18:25:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C9F0961354
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1BB880D3F;
	Sun, 22 Aug 2021 18:25:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f3jqCiR8qEIJ; Sun, 22 Aug 2021 18:25:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 668EA80D71;
	Sun, 22 Aug 2021 18:25:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 46513C001A;
	Sun, 22 Aug 2021 18:25:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4EBD1C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Aug 2021 18:25:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C5DF4028F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Aug 2021 18:25:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TH-R_6_szGW5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Aug 2021 18:25:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B07234028E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Aug 2021 18:25:28 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id q21so27128178ljj.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Aug 2021 11:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CGlpFI2A/Omrn6AT9zdbpM+H431IHufHUF37ZzbeAm0=;
 b=HauK/JbQiDv+alzUmKjoeBvUMa637N1p/NxcVk9fjtUFb8Ry+DC4QEWEt0barrTArJ
 ev6vmBDfOELmho1EfoLyMiGLWuYc8O63MHSxZ+eX9G9ik+kFSe+ys175fLjxqcF0jEFA
 KEnauiOXHiXsvQ+0Lem3xnOuKA4N9wOmxWM++E+Np2DFINzT6TDsBUWj0kodKG6cQ6AV
 gQgJQcrGnhLWVgAeSrGBlgy4I0bE9IbVAjC45lX+5Ny34jb4SMF4U2LQbIy1j4As8OKY
 wwFRhmUsO1HbKbLFRUlu8ILzDuffFjWQ+bcUZ8+HYs8QHWujtsRrNg2sByoi7Si0/Qv5
 j8tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CGlpFI2A/Omrn6AT9zdbpM+H431IHufHUF37ZzbeAm0=;
 b=N121BBD2SIpUlYuPRiBj3tKsPKWR/Ai3epio8Di0xhdn7FO3jEMA96W2by3/oFH7mk
 mXfmpyKtcTZ2ndYjFO8thCHRq0izeGLzoY3DTqPSM/qrYBxRjHNziRR3CndNjFy+5jXQ
 w6CUh7xl5hISZCSWYKzpkzfDqoUiRXeVHyAtK/jXjTTaTm51Kqcpw4zoB/pfeIXB7H09
 rtG1c87g0RIXQ91KRY3kS813g8eArcgmqGMfQNMTAEM2c+VF5KOiEy0dJNSMeBdmn1sp
 caWsJeFjxAcJVPDdsASYfkkOdqMeNlYGk4C22e3JZf8mwuPLRLkNV7bCoHOaDAAvhRSA
 YVmQ==
X-Gm-Message-State: AOAM531Qg0TqN5ErBEApWomznzndV0e4YM93xZzuNnFWKbWy+AR1Fkuw
 Uo4wW9QMf+I9I0spT2cycqSjtfSO2CBE1Wy0frU=
X-Google-Smtp-Source: ABdhPJxqXJ4px0tC9Hub5R3dL1owVDmjP1dJRimIivVmTvbvbY4wdvu9jJAH6Wr66GmIZWlzMq0nsgQo0bDc34q68is=
X-Received: by 2002:a2e:22c1:: with SMTP id i184mr10148945lji.89.1629656726395; 
 Sun, 22 Aug 2021 11:25:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAJFG7WW=B9FNnDZSGM80vkCJ1R9n-_TKLkB6BYAzXxNGvwGo1w@mail.gmail.com>
In-Reply-To: <CAJFG7WW=B9FNnDZSGM80vkCJ1R9n-_TKLkB6BYAzXxNGvwGo1w@mail.gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sun, 22 Aug 2021 23:55:15 +0530
Message-ID: <CABJPP5CunxsoAdvq9fB_G6uahk=RoJwSj2TUPFZwAAvs2kYOfw@mail.gmail.com>
Subject: Re: Regarding Linux Kernel: Checkpatch Documentation
To: Shantanu Shukla <shantanushukla64@gmail.com>
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

On Sun, Aug 15, 2021 at 1:51 AM Shantanu Shukla
<shantanushukla64@gmail.com> wrote:
>
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

drivers/net/dsa/qca/ar9331.c:217
drivers/dma-buf/st-dma-fence.c

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
