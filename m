Return-Path: <SRS0=zhe+=HQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30104C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 14 Feb 2021 09:20:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB90364E26
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 14 Feb 2021 09:20:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB90364E26
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B0626F48D
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 14 Feb 2021 09:20:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uOXzeeG_jszC
	for <linux-kernel-mentees@archiver.kernel.org>;
	Sun, 14 Feb 2021 09:20:38 +0000 (UTC)
Received: by smtp3.osuosl.org (Postfix, from userid 1001)
	id 34C1C6F500; Sun, 14 Feb 2021 09:20:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 029FF6F4F1;
	Sun, 14 Feb 2021 09:20:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BBAFBC0174;
	Sun, 14 Feb 2021 09:20:35 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9A8BFC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Feb 2021 09:20:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8EF5B869A5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Feb 2021 09:20:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o52D37ffdN6K
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Feb 2021 09:20:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4D96986980
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Feb 2021 09:20:33 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id m17so3818342ioy.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Feb 2021 01:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mE5XyZIe/5dyZetDnEsXNK2q18KLqaBWzTVs4yuNLR4=;
 b=t/hZCeZqo7n6xJuX88D25O+8HtLo546NbDtASqxTkRBy2ZvYP9+gdVcY3pEQ5M3Uno
 lmBGv8Co32LmE7HE+kwepmkrgd7xvYQzw2PIZyIyxAMpa70LBPy7OcW/phUiuPB+BIHe
 TEGtEN8brO7Kq08Tu33Nw/1nNZqbngG0crjJcJGsc3/MdOLO4uKj70gjhl5LgLwp/RXH
 zUpYFEaotUSsmtn1iGlxiM7V0zuK3ivGvFZheK7btXu1YQLZtaGKUIN++FgFkkQEDrdB
 5FwUxkjLnKwOOOodhJIVgcovWlgY/+BSwVUdkhIi8DZuhPqfpaVDduwGO8CovsiiZ7hA
 ApLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mE5XyZIe/5dyZetDnEsXNK2q18KLqaBWzTVs4yuNLR4=;
 b=Ma1ZmAW/yFsRVRTin/2vwbKeNJ9bO5EQk2DVgibT34Yc/Of7WTYu+Fjdpcu/oo86kP
 ZBxwjPhlvfYqAQH5mulLskprwwrcWDAprFu1hzjGnM9ojQfauAhz4D3cmoskhM3Nu2LQ
 8gcKii7eTtuIjcQgWogpz4hGubiORyDq+j8fCtXru9rY3kBr4ZSYJtNxpBjrC9FLQ1Vu
 f/UC+hp23zDJXgUT+ubOuGvE+eGBZ+LAEv8wUTOklq+cBU9SsgmV+6oVO0toyuuINtr3
 NfqoM8wcboQseKk1v8bREkmlakzlxLsMAoDF49smYK6fS6fSY93gVQv+JfzPbv5yXWb6
 2UFA==
X-Gm-Message-State: AOAM530RX+n+yC5P0qZE62fxvRm2L4ZPpId8Qxdvf7W7WfJNEcWm3eRu
 XIPjRhakjBqpYvatIE4QnNXBTIYTYUiD8+Am94M=
X-Google-Smtp-Source: ABdhPJyb1XWeHsUwHPFEwV33MHs/V8hnel23uOJjxFv/mXbpq0e34gc/PTMeZUDOp62dwY17Gk+WAiQF9ZZHfi/zhlY=
X-Received: by 2002:a05:6638:138e:: with SMTP id
 w14mr10297504jad.98.1613294432450; 
 Sun, 14 Feb 2021 01:20:32 -0800 (PST)
MIME-Version: 1.0
References: <CAKXUXMzje=kiC5NwdWuFT4sO8d8WXXx3TQkT6HdybrgMU7NBFw@mail.gmail.com>
 <78c992f7-41c7-dca7-877d-839cb2b1dba0@gmail.com>
 <324545a0-4d3b-1435-f9d5-4f72ea0cc6a7@gmail.com>
 <CAKXUXMyegja847_6Hz2xA5fkiWgy2-kqU8g6vN4-g5wXRUcJzg@mail.gmail.com>
 <6cd694f5-1f24-55ec-2c8e-5a903e3a9cec@gmail.com>
 <361d4ce2-06d7-b646-5f10-7977fcaa09d9@gmail.com>
In-Reply-To: <361d4ce2-06d7-b646-5f10-7977fcaa09d9@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sun, 14 Feb 2021 10:20:21 +0100
Message-ID: <CAKXUXMzEQoMd--1D1DUMO4EAWhwkOOTBFZsyiQ__bQA+dg71AA@mail.gmail.com>
To: Aditya <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Investigating ./scripts/kernel-doc for
	third phase of mentorship
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

On Sat, Feb 13, 2021 at 10:46 AM Aditya <yashsri421@gmail.com> wrote:
>
> On 11/2/21 4:46 pm, Aditya wrote:
> > On 11/2/21 4:13 pm, Lukas Bulwahn wrote:
> >> On Thu, Feb 11, 2021 at 9:02 AM Aditya <yashsri421@gmail.com> wrote:
> >>>
> >>> On 9/2/21 10:31 pm, Aditya wrote:
> >>>> On 9/2/21 9:43 am, Lukas Bulwahn wrote:
> >>>>> Hi Aditya,
> >>>>>
> >>>>>
> >>>>> I have been using ./scripts/kernel-doc lately and noticed a few issues
> >>>>> with this script.
> >>>>> For the third phase, I expect you to investigate the issues on
> >>>>> ./scripts/kernel-doc below, describe the issue to the kernel-doc
> >>>>> maintainer, and work on proper support for this parser in kernel-doc.
> >>>>>
> >>>>> When running kernel-doc on these files below, you should observe these errors:
> >>>>>
> >>>>> ./scripts/kernel-doc -none kernel/gcov/gcc_4_7.c
> >>>>>
> >>>>> Use of uninitialized value $param in regexp compilation at
> >>>>> ./scripts/kernel-doc line 1559, <IN_FILE> line 95.
> >>>>> Use of uninitialized value $actual in substitution (s///) at
> >>>>> ./scripts/kernel-doc line 1523, <IN_FILE> line 95.
> >>>>> Use of uninitialized value $actual in substitution (s///) at
> >>>>> ./scripts/kernel-doc line 1523, <IN_FILE> line 95.
> >>>>> Use of uninitialized value $param in substitution (s///) at
> >>>>> ./scripts/kernel-doc line 1617, <IN_FILE> line 95.
> >>>>> Use of uninitialized value $param in hash element at
> >>>>> ./scripts/kernel-doc line 1651, <IN_FILE> line 95.
> >>>>> Use of uninitialized value $param in pattern match (m//) at
> >>>>> ./scripts/kernel-doc line 1651, <IN_FILE> line 95.
> >>>>> Use of uninitialized value $param in hash element at
> >>>>> ./scripts/kernel-doc line 1652, <IN_FILE> line 95.
> >>>>> Use of uninitialized value $param in pattern match (m//) at
> >>>>> ./scripts/kernel-doc line 1654, <IN_FILE> line 95.
> >>>>> Use of uninitialized value $param in concatenation (.) or string at
> >>>>> ./scripts/kernel-doc line 1655, <IN_FILE> line 95.
> >>>>> Use of uninitialized value $param in hash element at
> >>>>> ./scripts/kernel-doc line 1672, <IN_FILE> line 95.
> >>>>>
> >>>>>
> >>>>> ./scripts/kernel-doc -none include/linux/zstd.h
> >>>>>
> >>>>> include/linux/zstd.h:153: error: Cannot parse struct or union!
> >>>>> include/linux/zstd.h:170: error: Cannot parse struct or union!
> >>>>> include/linux/zstd.h:180: error: Cannot parse struct or union!
> >>>>> include/linux/zstd.h:230: error: Cannot parse struct or union!
> >>>>> include/linux/zstd.h:273: error: Cannot parse struct or union!
> >>>>> include/linux/zstd.h:365: error: Cannot parse struct or union!
> >>>>>
> >>>>> include/linux/zstd.h:421: error: Cannot parse struct or union!
> >>>>>
> >>>>> include/linux/zstd.h:537: error: Cannot parse struct or union!
> >>>>> include/linux/zstd.h:682: error: Cannot parse struct or union!
> >>>>>
> >>>>> include/linux/zstd.h:935: error: Cannot parse struct or union!
> >>>>>
> >>>>> Can you reproduce these issues?
> >>>>>>>
> >>>>> Further, I would see that you can create two new features for kernel-doc:
> >>>>>
> >>>>> - Support for warning types and configuration of build warning flags,
> >>>>> i.e., with -W command-line arguments and output as known for compilers
> >>>>> - Support of default arguments
> >>>>>
> >>>>> Let us start with investigation of those issues in the files, though.
> >>>>> Then, we see how complicated it is to resolve those and discuss that
> >>>>> with the maintainer.
> >>>>>
> >>>>>
> >>>>
> >>>> Alright Lukas. Sounds interesting. I'll get back to you with my findings.
> >>>>
> >>>
> >>> Hi Lukas
> >>>
> >>> I was able to reproduce the issues. In my investigation I found the
> >>> following to be the cause of this:
> >>>
> >>> - For scripts/kernel-doc -none kernel/gcov/gcc_4_7.c :-
> >>> Cause:
> >>> struct gcov_info is a structure in this file, which has a parameter:
> >>> void (*merge[GCOV_COUNTERS])(gcov_type *, unsigned int)
> >>>
> >>> This argument goes to the elsif condition for argument parsing "elsif
> >>> ($arg =~ m/\(.+\)\s*\(/)"
> >>> But the regex match at Line 1556 ($arg =~
> >>> m/[^\(]+\(\*?\s*([\w\.]*)\s*\)/;) is not able to capture the $param.
> >>>
> >>> In my investigation, I found that it was expected to capture
> >>> "*merge[GCOV_COUNTERS]" as $param. But the regex does not take into
> >>> account the presence of square brackets("["."]"). As a result, the
> >>> $param capture does not happen as expected.
> >>> As $param remains undefined in this case, it causes the above error to
> >>> occur.
> >>>
> >>> - For scripts/kernel-doc -none include/linux/zstd.h :-
> >>> Cause: Certain struct definitions present in the file do not follow
> >>> the expected format for parsing.
> >>> For eg. for "struct ZSTD_compressionParameters", it is defined with
> >>> the help of typedef syntax, ie
> >>> typedef struct {
> >>>         unsigned int windowLog;
> >>>         unsigned int chainLog;
> >>>         unsigned int hashLog;
> >>>         unsigned int searchLog;
> >>>         unsigned int searchLength;
> >>>         unsigned int targetLength;
> >>>         ZSTD_strategy strategy;
> >>> } ZSTD_compressionParameters;
> >>>
> >>> Here, the definition might be compiler error free, but for kernel-doc
> >>> parsing, the definition was probably supposed to go like:
> >>>
> >>> typedef struct ZSTD_compressionParameters {
> >>>         unsigned int windowLog;
> >>>         unsigned int chainLog;
> >>>         unsigned int hashLog;
> >>>         unsigned int searchLog;
> >>>         unsigned int searchLength;
> >>>         unsigned int targetLength;
> >>>         ZSTD_strategy strategy;
> >>> } ZSTD_compressionParameters;
> >>>
> >>> OR
> >>>
> >>> struct ZSTD_compressionParameters {
> >>>         unsigned int windowLog;
> >>>         unsigned int chainLog;
> >>>         unsigned int hashLog;
> >>>         unsigned int searchLog;
> >>>         unsigned int searchLength;
> >>>         unsigned int targetLength;
> >>>         ZSTD_strategy strategy;
> >>> };
> >>>
> >>> The parser probably expects struct struct_name to occur together,
> >>> causing the above error.
> >>>
> >>
> >> Good initial analysis. Do you want to extend those patterns, such that
> >> these definitions are properly parsed as well?
> >>
> >> Then, we should check if we observe any other difference (caused any
> >> regression) running kernel-doc on the complete tree.
> >>
>
> Hi Lukas
>
> I generated the report by running kernel-doc on complete tree.
> The report in itself is quite large (~20k lines). So, I shortened it
> in no-warning(error_report.txt) and less-common
> warnings(reduced_report.txt) versions.
>
> No-warning version(error_report.txt):
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/kernel-doc/error_report.txt
>
> Less common warning version:
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/kernel-doc/reduced_report.txt
>
> Complete report:
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/kernel-doc/report.txt
>
> For the Uninitialized $param error, apart from kernel/gcov/gcc_4_7.c
> file, drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.h also
> emits the same error with the script. The reason is same as gcc_4_7.c
> file though, ie presence of square brackets in the params and regex
> not taking into account the same.
>
> Similarly, there is a total of 67 errors for "Cannot parse *".
> 58 of these are for "error: Cannot parse struct or union!". Rest are
> for enum.
>
> In addition, I observed that if data variables are mentioned in a
> comma separated fashion ie @var1, var2, var3 in comments(as they have
> common description), they may not be considered described.
>
> For eg. running scripts/kernel-doc -none include/linux/mhi.h, we get:
> include/linux/mhi.h:451: warning: Function parameter or member 'M0'
> not described in 'mhi_controller'
> include/linux/mhi.h:451: warning: Function parameter or member 'M2'
> not described in 'mhi_controller'
> include/linux/mhi.h:451: warning: Function parameter or member 'M3'
> not described in 'mhi_controller'
>
> However, these are described in comments as:
> * @M0, M2, M3: Counters to track number of device MHI state changes
>
> and present in struct definition as:
> u32 M0, M2, M3;
>
> I think that comma separated members are allowed in definition, but
> maybe they are not yet supported in comment descriptions, hence
> causing the error. But as the variables are described already in
> comments, maybe this is an example of false positive.
>
> Similarly there may be more such cases for false positives for
> warnings, but it was taking a lot of time to analyze all of them, so I
> decided to take feedback on the findings till now.
>
> What do you think Lukas?
>

I suggest to start to extend the parser to handle those Uninitialized
$param errors. Then look into parsing those structs.

Once kernel-doc can handle those patterns, we can start thinking about
extending the kernel-doc capabilities, e.g., support comma-separated
argument lists, support default argument definitions within a file,
support ignoring/skipping  some definitions between kernel-doc
description and the code (which otherwise cause warnings), etc., etc.

Please reach out with your report to the kernel-doc maintainer,
Jonathan Corbet, and to linux-doc, and explain what you want to do.

Then get started on writing the patches for the parser extension, if
you have not already started anyway.

As soon as you have something to test, send around those patches as
RFC and let everyone know.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
