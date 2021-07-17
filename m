Return-Path: <SRS0=s3T2=MJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_RED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B99DC636CA
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 17 Jul 2021 07:59:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 194846128C
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 17 Jul 2021 07:59:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 194846128C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D42CD400DB;
	Sat, 17 Jul 2021 07:59:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nZIt3z44aS24; Sat, 17 Jul 2021 07:59:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id C41F1400C1;
	Sat, 17 Jul 2021 07:59:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AE69DC001A;
	Sat, 17 Jul 2021 07:59:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F0B9CC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 07:59:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D15B142259
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 07:59:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tR5tZQ8QLlBJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 07:59:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6215242256
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 07:59:49 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id v6so19994041lfp.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Jul 2021 00:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KoN2IZwNAIdhTvtezmGo+3JxQWab1XqJ4ox4cO5sQF8=;
 b=pV14+xYyfsKYsHAq+CGej5WLKbbqUMYBQ9jy6QmoEiF8rxCHU4OPaooH6cONNLsYzX
 xijVNCLO548yHaKYNJIzyNhDWt+qOjdcKVGkPnG2LS4Rs+zif+msWG77UntZ0YkwpTM8
 fYa6mgHafvzqW5vu6GVSYwzMbKcvbhYFVtuHWv0dafcz5E/P0z4GL5aI+WWtWQIjHumu
 09kSmSO0SfSwpGokH9sX73RETnq+WigghlRWcelD0Pwq2HP2C7VFADh6khbD2FDlfP8S
 xacB47YP6xeFuI354vIFGaHpNdCmqBeM7AhB+3faouywkkaq4USKV/BtsW0cFNZCbCY2
 gBoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KoN2IZwNAIdhTvtezmGo+3JxQWab1XqJ4ox4cO5sQF8=;
 b=ery0u9B1GfhUH7XwJXxMoih1daBvJnt1ls0unmrlUarJ3kxBhJkyyIBn2qZ+u7Evq3
 YHf9UUoLNCBuhK4OAeMntkwGG4Y3Vqbu16m4KWQPHYUO93mDlfongYGczj/0t7xwIuXu
 QG0Q+HjVSKNe/RHLQQnnF+fHp+Xu/9AQY0qhjNSXCTeUxyqpLLsDp7z30CJ7IEdXO+Zy
 c3wCLfVbaxabLeAuILYvSQCGR2anFT79rlG5rJMLJupwZ5qy/CqwFwW/4hAKjkX8qBGj
 y6grltVknImrpkbl7lzHGyWj6DiNLQzhxSYPc29hvWh3N4odB7U3KQR3LJt0PPdLYrRA
 Ar7w==
X-Gm-Message-State: AOAM532kIzj251MvNfnx4J4GsQMfQxqzTE33q7esCa4OunaLh7CNZJCE
 SyykEr1iogMgwXJ37P8gzewe0VeDcZhpEIbm+gE=
X-Google-Smtp-Source: ABdhPJxrLG/oV3BLphA4yhLk/QbS0cKQqvHFkwP1nYQ/3aa+xcbaKi5E/trDJ1sRUYYVv3piRzpZx7xOU6ovn4DBG28=
X-Received: by 2002:ac2:5dd5:: with SMTP id x21mr10868657lfq.31.1626508787162; 
 Sat, 17 Jul 2021 00:59:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAEQwXtiEpzO_8T7VC8dFp3tieV+1JpW1O7m0MTgw4vvdy09gsg@mail.gmail.com>
In-Reply-To: <CAEQwXtiEpzO_8T7VC8dFp3tieV+1JpW1O7m0MTgw4vvdy09gsg@mail.gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sat, 17 Jul 2021 13:29:35 +0530
Message-ID: <CABJPP5CgAFP8ejqjha62T9GEW2gau=-GC3CTO1s6eq=_ADsnOA@mail.gmail.com>
Subject: Re: Regarding LFX Mentorship Project
To: Ashutosh Sharma <b18010@students.iitmandi.ac.in>
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

On Sat, Jul 17, 2021 at 1:09 PM Ashutosh Sharma
<b18010@students.iitmandi.ac.in> wrote:
>
> Hello Dwaipayan,
> I am writing this email to you regarding the Linux Kernel: Checkpatch Documentation project. I am interested in the Checkpatch Documentation mentorship program and I would like to work on the tasks for the mentee selection.
> I have been a SDE intern at Amazon where I have worked on AWS, React and Java, Other than that I have also worked as a student developer in GSoC 2020 under The Mifos Initiative organisation. Currently, I am looking for opportunities to learn and grow my skill set. I am really excited about the project.
> Hoping for a positive response.
> Thank you
> Ashutosh Sharma

Dear Ashutosh,
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

drivers/scsi/bfa/bfad_bsg.c
drivers/soc/fsl/dpio/dpio-service.c

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
