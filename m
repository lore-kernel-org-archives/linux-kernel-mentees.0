Return-Path: <SRS0=BNSL=HN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC4D6C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 11 Feb 2021 10:43:43 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C17464E2E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 11 Feb 2021 10:43:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C17464E2E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4AF9286DDB;
	Thu, 11 Feb 2021 10:43:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vh5Te5dlJNOV; Thu, 11 Feb 2021 10:43:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7DDD086DD9;
	Thu, 11 Feb 2021 10:43:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 743E1C0891;
	Thu, 11 Feb 2021 10:43:41 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1EA5EC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Feb 2021 10:43:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 039378734F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Feb 2021 10:43:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id klulvlTlV1oJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Feb 2021 10:43:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
 [209.85.166.180])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2DAC7871E0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Feb 2021 10:43:39 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id m20so4600326ilj.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Feb 2021 02:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SQoMs+J9dhRUopg0oxPVU/bvqEWWTUDgXyS1HfkXf+o=;
 b=vDAB+60ib73nFtO5UAKakIawtJuNASCF6iVax/shTxD9vYBFCcJljMgsol4sVsYPoZ
 uGSp7UbemLDsT+m+Isl3ku9fvuZJfGsJRgiUXfpsTZgmxlX66roxBzjZMqAFFhWd5vcq
 JSAnenfjKqDLLeNUeEeq5vY/MNwjVixs8u+AgxjYvFhd8WxMJk79eWP2ColPcCndU/Yn
 QwhLhhVasMv4desP+0LFXZcjcl3CuDeCtmqC9MCmvtzMT04y4PMdjsKvv1YNj7/cFgj9
 Spo0ZuzQWV3Kthpe5c3VxXUUB+2cv8ouFIc4wIRJohu1DAhx0Uef19Qs2CPUBEA28vWC
 hGng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SQoMs+J9dhRUopg0oxPVU/bvqEWWTUDgXyS1HfkXf+o=;
 b=c6JVcHNU25a3DzM9MsyDvBPzA1Puv7QJeNd6ApxhiKxkkKKdDauee827nQmnuI38C2
 40ns99ykErbZCRSYBwORKvQjt9VtZz40WoKL+ly8+/EVmkbjUZNxBQxnaQURNMBc4NPf
 wwYkVodCRMS+FozrSnVzXPG6AfKdjNz+ciJZ9GF0qEVaFpNVGhTrYVfagx09Px1XpKEl
 iLsF6y/k9J2M7dzZxKCCFv4NcnQYkjZQIqJyDMt9xctKFaMtilL8kod2OPf2f0jSIHgj
 MTxO1lENfkXrT4dejz2GDPT25par+10ukAuS1QUTjd/MAGntcGi9sAbFuUeShnzqE4LK
 jgVg==
X-Gm-Message-State: AOAM530RYsipfGNhyxMFgmVcpNh4LiF5fpWym7qU8ZPRvJfuWHm2MWaP
 2rLVv3t68pO9nLSXqGubr0PDn01Uty75gSteB2o=
X-Google-Smtp-Source: ABdhPJyEtOSLsNVmed/rttUiNeTDlOf4HZew6B5mi+WNISph6NCIuMr4d+3IUSUt1Gr+iBrSIRh46JUAxqgvUqXKcYk=
X-Received: by 2002:a92:d1c9:: with SMTP id u9mr5335049ilg.125.1613040218416; 
 Thu, 11 Feb 2021 02:43:38 -0800 (PST)
MIME-Version: 1.0
References: <CAKXUXMzje=kiC5NwdWuFT4sO8d8WXXx3TQkT6HdybrgMU7NBFw@mail.gmail.com>
 <78c992f7-41c7-dca7-877d-839cb2b1dba0@gmail.com>
 <324545a0-4d3b-1435-f9d5-4f72ea0cc6a7@gmail.com>
In-Reply-To: <324545a0-4d3b-1435-f9d5-4f72ea0cc6a7@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Thu, 11 Feb 2021 11:43:36 +0100
Message-ID: <CAKXUXMyegja847_6Hz2xA5fkiWgy2-kqU8g6vN4-g5wXRUcJzg@mail.gmail.com>
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

On Thu, Feb 11, 2021 at 9:02 AM Aditya <yashsri421@gmail.com> wrote:
>
> On 9/2/21 10:31 pm, Aditya wrote:
> > On 9/2/21 9:43 am, Lukas Bulwahn wrote:
> >> Hi Aditya,
> >>
> >>
> >> I have been using ./scripts/kernel-doc lately and noticed a few issues
> >> with this script.
> >> For the third phase, I expect you to investigate the issues on
> >> ./scripts/kernel-doc below, describe the issue to the kernel-doc
> >> maintainer, and work on proper support for this parser in kernel-doc.
> >>
> >> When running kernel-doc on these files below, you should observe these errors:
> >>
> >> ./scripts/kernel-doc -none kernel/gcov/gcc_4_7.c
> >>
> >> Use of uninitialized value $param in regexp compilation at
> >> ./scripts/kernel-doc line 1559, <IN_FILE> line 95.
> >> Use of uninitialized value $actual in substitution (s///) at
> >> ./scripts/kernel-doc line 1523, <IN_FILE> line 95.
> >> Use of uninitialized value $actual in substitution (s///) at
> >> ./scripts/kernel-doc line 1523, <IN_FILE> line 95.
> >> Use of uninitialized value $param in substitution (s///) at
> >> ./scripts/kernel-doc line 1617, <IN_FILE> line 95.
> >> Use of uninitialized value $param in hash element at
> >> ./scripts/kernel-doc line 1651, <IN_FILE> line 95.
> >> Use of uninitialized value $param in pattern match (m//) at
> >> ./scripts/kernel-doc line 1651, <IN_FILE> line 95.
> >> Use of uninitialized value $param in hash element at
> >> ./scripts/kernel-doc line 1652, <IN_FILE> line 95.
> >> Use of uninitialized value $param in pattern match (m//) at
> >> ./scripts/kernel-doc line 1654, <IN_FILE> line 95.
> >> Use of uninitialized value $param in concatenation (.) or string at
> >> ./scripts/kernel-doc line 1655, <IN_FILE> line 95.
> >> Use of uninitialized value $param in hash element at
> >> ./scripts/kernel-doc line 1672, <IN_FILE> line 95.
> >>
> >>
> >> ./scripts/kernel-doc -none include/linux/zstd.h
> >>
> >> include/linux/zstd.h:153: error: Cannot parse struct or union!
> >> include/linux/zstd.h:170: error: Cannot parse struct or union!
> >> include/linux/zstd.h:180: error: Cannot parse struct or union!
> >> include/linux/zstd.h:230: error: Cannot parse struct or union!
> >> include/linux/zstd.h:273: error: Cannot parse struct or union!
> >> include/linux/zstd.h:365: error: Cannot parse struct or union!
> >>
> >> include/linux/zstd.h:421: error: Cannot parse struct or union!
> >>
> >> include/linux/zstd.h:537: error: Cannot parse struct or union!
> >> include/linux/zstd.h:682: error: Cannot parse struct or union!
> >>
> >> include/linux/zstd.h:935: error: Cannot parse struct or union!
> >>
> >> Can you reproduce these issues?
> >>>>
> >> Further, I would see that you can create two new features for kernel-doc:
> >>
> >> - Support for warning types and configuration of build warning flags,
> >> i.e., with -W command-line arguments and output as known for compilers
> >> - Support of default arguments
> >>
> >> Let us start with investigation of those issues in the files, though.
> >> Then, we see how complicated it is to resolve those and discuss that
> >> with the maintainer.
> >>
> >>
> >
> > Alright Lukas. Sounds interesting. I'll get back to you with my findings.
> >
>
> Hi Lukas
>
> I was able to reproduce the issues. In my investigation I found the
> following to be the cause of this:
>
> - For scripts/kernel-doc -none kernel/gcov/gcc_4_7.c :-
> Cause:
> struct gcov_info is a structure in this file, which has a parameter:
> void (*merge[GCOV_COUNTERS])(gcov_type *, unsigned int)
>
> This argument goes to the elsif condition for argument parsing "elsif
> ($arg =~ m/\(.+\)\s*\(/)"
> But the regex match at Line 1556 ($arg =~
> m/[^\(]+\(\*?\s*([\w\.]*)\s*\)/;) is not able to capture the $param.
>
> In my investigation, I found that it was expected to capture
> "*merge[GCOV_COUNTERS]" as $param. But the regex does not take into
> account the presence of square brackets("["."]"). As a result, the
> $param capture does not happen as expected.
> As $param remains undefined in this case, it causes the above error to
> occur.
>
> - For scripts/kernel-doc -none include/linux/zstd.h :-
> Cause: Certain struct definitions present in the file do not follow
> the expected format for parsing.
> For eg. for "struct ZSTD_compressionParameters", it is defined with
> the help of typedef syntax, ie
> typedef struct {
>         unsigned int windowLog;
>         unsigned int chainLog;
>         unsigned int hashLog;
>         unsigned int searchLog;
>         unsigned int searchLength;
>         unsigned int targetLength;
>         ZSTD_strategy strategy;
> } ZSTD_compressionParameters;
>
> Here, the definition might be compiler error free, but for kernel-doc
> parsing, the definition was probably supposed to go like:
>
> typedef struct ZSTD_compressionParameters {
>         unsigned int windowLog;
>         unsigned int chainLog;
>         unsigned int hashLog;
>         unsigned int searchLog;
>         unsigned int searchLength;
>         unsigned int targetLength;
>         ZSTD_strategy strategy;
> } ZSTD_compressionParameters;
>
> OR
>
> struct ZSTD_compressionParameters {
>         unsigned int windowLog;
>         unsigned int chainLog;
>         unsigned int hashLog;
>         unsigned int searchLog;
>         unsigned int searchLength;
>         unsigned int targetLength;
>         ZSTD_strategy strategy;
> };
>
> The parser probably expects struct struct_name to occur together,
> causing the above error.
>

Good initial analysis. Do you want to extend those patterns, such that
these definitions are properly parsed as well?

Then, we should check if we observe any other difference (caused any
regression) running kernel-doc on the complete tree.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
