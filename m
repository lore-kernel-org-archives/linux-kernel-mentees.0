Return-Path: <SRS0=s3T2=MJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_RED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AFB2C636C9
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 17 Jul 2021 07:23:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA6CB61396
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 17 Jul 2021 07:23:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA6CB61396
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EE6D605C3;
	Sat, 17 Jul 2021 07:23:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vJW1jTYxrDsx; Sat, 17 Jul 2021 07:23:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id BAD666061A;
	Sat, 17 Jul 2021 07:23:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 911F3C001A;
	Sat, 17 Jul 2021 07:23:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 09697C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 07:23:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E0D22606D4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 07:23:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TVQK4ySxYJ8B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 07:23:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AA6E06061A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 07:23:31 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id k184so18590044ybf.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 00:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p9FJSrbRFZlYpZJqqyAt5K2i/72NIobSDb04Of8MCOk=;
 b=p30BcNrLw3gpBax2xzzyBwN1ck566QazLJCvk2p/RR+Gg27RVik7Lv2Rwvit1OxEh9
 uFzXakj+CbozOESh7A2PKlXtH/0ZEK28GezrwLevMsU+dzGsr5hx7gqEFdMXcJ7u7lwn
 C6I7B7AnoHwFG3KOfu1iqs4c8dzyeA3o8hyrS07SzuTlz2pYawZktKncTeoIrEnxZ/+H
 febtkHDFkdq007k2Gv/7m33kL/e89KZnCS0oOKGRoBPnB8+idpza1AVIqQURh6HG0k7M
 5J8fEeRL80ywmIQtnCtnvZ/S3LNHjjgVx4V351Ct0Qpe+qgbY7+1CpRhFmLOfrmBhQ5V
 j3lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p9FJSrbRFZlYpZJqqyAt5K2i/72NIobSDb04Of8MCOk=;
 b=Ha2fASMdNahf4PL0tPt4SrBhZisaYmsQVA0LrsL/Y41+PO+XHw7hZiCB40Ktfg6fuH
 aqkNlm40OtiOj4ZjdDW4d2iFvzEScqgBGUlT7ga3QcnZ2fFU9yQVnaDlzX0RuhlYCO2B
 XowNWUlqbtO2ZM/aFsgzr4d5KVFTNBGJlmcTR2BCy1FgTpzsAdxQNHAjPGBLIW0P6t3o
 09R5n1swb5xPHRjP+FvoNum+dZ2MdwBIsuU6ISQO++4DNRBYoW7Hcn4dXtuYS3AsPU1L
 RP2PfNdQI6PqTGBHb+XroB3O8F52FbAfcoPxbZtV4VZIBcmVGcVL5MRfuC72zjUfYk13
 CkrA==
X-Gm-Message-State: AOAM533npjpV74ZOJcr8fNKBo8fL0g3aW4zSeR0V6kUklrw1/xvU9Jg8
 wb7MYVrE0GPA5cuAPv0PzvbwZQhIqvIKlL4vWzQ=
X-Google-Smtp-Source: ABdhPJwvJUeoFQt/STqAKa1MQwZksxk/Ak+cbfqFjN4aIshgp7sUjAbZ2To/MHk4f5XASQtYCZwSn3KblY5E5zCk2HA=
X-Received: by 2002:a25:1804:: with SMTP id 4mr17811590yby.157.1626506610653; 
 Sat, 17 Jul 2021 00:23:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210717064653.GA4873@uver-laptop>
In-Reply-To: <20210717064653.GA4873@uver-laptop>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sat, 17 Jul 2021 09:23:19 +0200
Message-ID: <CAKXUXMwTs=JoMUFaigLsUmnG3XTs3B1NF+VTsYcQYgTSygWXVA@mail.gmail.com>
Subject: Re: Linux Kernel: Checkpatch Documentation Mentorship Tasks
To: Utkarsh Verma <utkarshverma294@gmail.com>
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

On Sat, Jul 17, 2021 at 8:47 AM Utkarsh Verma <utkarshverma294@gmail.com> wrote:
>
> I am interested in the Checkpatch Documentation mentorship program and I would like to work on the tasks for the mentee selection.
>

Thanks for your interest.

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

drivers/acpi/acpica/acapps.h
drivers/usb/serial/iuu_phoenix.c

Which information on these rules that checkpatch warns about is
available in the Checkpatch Documentation?

If documentation of these rules is available, explain your
understanding of the rules in your own words.
If no information is available in the documentation, explain your
understanding of the rule.

In any case, explain the violation that is checked and raised in the
checkpatch script, i.e., what is implemented in checkpatch to check
the rule and possible violations. Which code in the checkpatch script
is raising the warning? What does it check and how is that
implemented?

Explain how to possibly fix this code in the files above with regards
to that violation.

Once you succeed on this first task, we inform you about the further
second and third task. If you fail on any of those tasks, you are out
of the selection process.

The selection of the mentee will happen according to schedule, at
earliest on August 12th and at latest at the end of August. More
information is available at
https://docs.linuxfoundation.org/lfx/mentorship/mentorship-program-timelines.


Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
