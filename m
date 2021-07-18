Return-Path: <SRS0=+xMb=MK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 276BEC636C8
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 18 Jul 2021 06:13:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8EB761182
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 18 Jul 2021 06:13:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8EB761182
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7463760613;
	Sun, 18 Jul 2021 06:13:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T1A9Xm9yuqrM; Sun, 18 Jul 2021 06:13:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 69D0C6061C;
	Sun, 18 Jul 2021 06:13:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3EC8AC0010;
	Sun, 18 Jul 2021 06:13:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 42E83C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jul 2021 06:13:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 17475401F2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jul 2021 06:13:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2K6MTZPl2hUG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jul 2021 06:13:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C636B4012C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jul 2021 06:13:02 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id v189so22163546ybg.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 23:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NcEASKGp8wLQ436639YS5tgZdgFeREFCMemOq4T1rlo=;
 b=HcOAMW69MV8DgEsVY0XT22gS4XGYSI0YnGNPEqrTadQxab7tYBVIHhudQywZmlWEg3
 rDpZn9Oez2Z4FsZdmqdvkwgSNwSfaQnrDKNAb/S9dAt1scNX5KWOkFP71E/c6sXbl71f
 GU0a1cu8qButf8+Iih9qeryTLFDFpl+TskT1f72wfVKnjjHY2aY8qXFwrqfnFsVWg4Z6
 sKMELpDvvJZ55bjGeI8BfKFiHCYB9TrG3CquGmpg8lQqbRnbCJ16rqC0y52ZX25pg4HE
 jnEkSJdIb8E6jk7Sk0p3u6Y7Ps2feb+uwbJnwbtiif7FVSx77KsPKEN7MKZ0yBNQHrgP
 iI1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NcEASKGp8wLQ436639YS5tgZdgFeREFCMemOq4T1rlo=;
 b=go0Cor/tctDosyFwqpqo3VX/9mgTqJahkYFU9yr9q5sYeZ1wDQOlyFYDPHRJTRgdRy
 jzcrJMMRR8geOh9SKnlD+Upovy9t7yqM14BtFc2XMVbrb2uL7mlMnh5xEZFtjR4U/FD2
 EfDcQej890Scuob0vH46xshQqlqesAghTKMc5a61XEtLsCR6jrcPTg9s32ZhgZhZ5d7p
 mUpZu6Na9TlaMnBEhhJpBf2UZei/1QOFw2xolG+9DRNA4yr/i1+LXlAHP+AEi93MCgiz
 gQT3CuVVDSQgtNT/NOsg3AagWNlcxRM9Qtl5LmLZjhlhfkGdIh6+/QfJi2ycMCuF+a9Z
 vJsw==
X-Gm-Message-State: AOAM530XN09Tnz3Cq4EgBOdzviMgyp4nE9vY2sEeEX91/pyvgNTA5l7l
 hCAllJ1h9qmD7EyEx2ArFq6BwTuOA99XIuAJrs0=
X-Google-Smtp-Source: ABdhPJxGE53vVsoCASnzPA1JTzlzbXZIEpBQY6L4Vwo2IMcV5OXQ7lPwuKP2gd0ymcm14zib+9SX5ykbAQ43onibLfs=
X-Received: by 2002:a25:f0b:: with SMTP id 11mr23081967ybp.518.1626588781624; 
 Sat, 17 Jul 2021 23:13:01 -0700 (PDT)
MIME-Version: 1.0
References: <1FF02F6E-8958-4039-805F-E071955D6B2B@hxcore.ol>
In-Reply-To: <1FF02F6E-8958-4039-805F-E071955D6B2B@hxcore.ol>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sun, 18 Jul 2021 08:12:50 +0200
Message-ID: <CAKXUXMzqbXU0_XfeUXvF9s68JFq0ALU=he-5pWDXMGay0YC8yg@mail.gmail.com>
Subject: Re: Regarding LFX Mentorship
To: "shiv14112001@gmail.com" <shiv14112001@gmail.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>
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

On Sun, Jul 18, 2021 at 7:44 AM shiv14112001@gmail.com
<shiv14112001@gmail.com> wrote:
>
> I am Aviral Gupta an aspiring mentee and I am interested in the Checkpatch Documentation mentorship program and I would like to work on the tasks for the mentee selection.
>
>
Thanks for your interest.

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

Once the zeroth task is understood, you can now move on to the first
task: Running checkpatch on a specific file

Get a clone of the Linux kernel repository. The script checkpatch.pl
is under the scripts directory.

Then, the first task is to run checkpatch.pl on a few files below and
share the results:

lib/vsprintf.c
tools/perf/arch/arm/util/dwarf-regs.c

Which information on these rules that checkpatch warns about is
available in the Checkpatch Documentation?
If documentation of these rules is available, explain your
understanding of the rules in your own words.
If no information is available in the documentation, explain your
understanding of the rule.

In any case, explain the violation that is checked and raised in the
checkpatch script, i.e., what is implemented in checkpatch to check
the rule and possible violations.

Explain how to possibly fix this code with regards to that violation.

Once you succeed on this first task, we inform you about the further
second and third task.

If you fail on any of those tasks, you are out of the selection process.

The selection of the mentee will happen according to schedule, at
earliest on August 12th and at latest at the end of August. More
information is available at
https://docs.linuxfoundation.org/lfx/mentorship/mentorship-program-timelines.

Good luck.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
