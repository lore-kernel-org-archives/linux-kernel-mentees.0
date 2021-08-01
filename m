Return-Path: <SRS0=qNgb=MY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3B9BC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Aug 2021 21:03:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C89660F55
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Aug 2021 21:03:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5C89660F55
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E57A83704;
	Sun,  1 Aug 2021 21:03:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4yk0hcGIbz1g; Sun,  1 Aug 2021 21:03:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 7B2F483863;
	Sun,  1 Aug 2021 21:03:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4F415C0010;
	Sun,  1 Aug 2021 21:03:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1990EC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Aug 2021 21:03:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA479605BC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Aug 2021 21:03:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zjJpaUxMiQ0u
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Aug 2021 21:03:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9314760596
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Aug 2021 21:03:47 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id m9so21286191ljp.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 01 Aug 2021 14:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5xveRON2uusbs+MXcIuGHDvoLGbGkvYV2TtIX/fe5OE=;
 b=thsF/RnqH/ZBXwIqhT+WL5uvssWwROwdK2J4KO88AIFNDTcMHX2h3bI5KcBkkJmjJD
 U9KT59BIg15EQ1c/rRooXWyJhfhyxxsXWQThb2Jnzl0izG/1MxENqikK57Hz85ym5Yia
 JRENo0xoG4f7WYM8QgEGyA7x/pZM96vVFg4WwQ29bpnjMUpm4nkRyIXr4Do48JUXyJWH
 /TIdw5wl3blx/TVWmxy1Bq/1L37ccnbb1nX6iDhfLV99RJ9mBiOHIJ5e1AjDSv4Kx67A
 6lDdYaY5gHWXP44QHGt42gYykIAtndou3yYWrXfYiIW2HinuFlO1L7I+vWLIxHzxZ2KC
 akGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5xveRON2uusbs+MXcIuGHDvoLGbGkvYV2TtIX/fe5OE=;
 b=G1Hobw+Nfg6kPu3LD1Ijgo4dNo0NCNxDJiLDEyeK/hyxHH+AAgJkyMsrtf4Gxjb0Cc
 Uk0HltC9SGNCYaVzbysjO98fphr5bkYKB01oFcODXwW9AioqiN8NQx+4HJ57eVOMYihz
 3h+G2VtyGUaEqegVpVvIF69plbcbDs6uzOT7jSy7oYTiHAivPgPEPM4RQYpwTlzeCKIE
 RRnbnBmvtmwTpOR/vUHD0Ktzg2uEiFKyjLMGYfl9G9v9RfgXuyAE1pU4L/9dw/zEnpUp
 T0SmLJRHQBDoj+GqN1jgZIaN1NIqLjQB3o9JJEYD+ULCbczlFx/JXiMMzLIJPmnmpgeg
 FRmQ==
X-Gm-Message-State: AOAM531uQDDcwRzHqlCVd/vJRo1bUdfqzYoKSg1KobMwUEDbpc6YXxI3
 6bA7abjTw4VO4T3q8dKlAtDsdVLiXbHmSLzxOtw=
X-Google-Smtp-Source: ABdhPJxIEqZjVa42pFu2jQTkJz0OQI0mx6BlUxDCFmAsZ0N8i4c08HZFEWTifPN/RqGEo+qGfdflE8SyZ6Il/HTOqoM=
X-Received: by 2002:a2e:8618:: with SMTP id a24mr9074709lji.246.1627851825237; 
 Sun, 01 Aug 2021 14:03:45 -0700 (PDT)
MIME-Version: 1.0
References: <CADywMdoz9NMyEcx+Rd5_ne9eR4HZCTEc5yvKP3JuHAnfnnD0Yg@mail.gmail.com>
In-Reply-To: <CADywMdoz9NMyEcx+Rd5_ne9eR4HZCTEc5yvKP3JuHAnfnnD0Yg@mail.gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Mon, 2 Aug 2021 02:33:33 +0530
Message-ID: <CABJPP5DXD_gpaZs13MthNMf-cn=YTYtDSTw056UqRysu70-5ag@mail.gmail.com>
Subject: Re: Request for tasks regarding Checkpatch Documentation mentorship
 program (LFX)
To: Rahul Balaji <rahulbalaji78@gmail.com>
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

On Sat, Jul 31, 2021 at 12:26 AM Rahul Balaji <rahulbalaji78@gmail.com> wrote:
>
> Respected sir,
>
> I am interested in working on the checkpath documentation project under your mentorship and would like to work on tasks for the selection process.
>
> Sincerely,
> Rahul Balaji
>

On Sat, Jul 24, 2021 at 6:41 PM Yash Singhal <ramusinghal112@gmail.com> wrote:
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

drivers/pinctrl/renesas/pinctrl.c
drivers/clk/tegra/clk-tegra124-emc.c

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
