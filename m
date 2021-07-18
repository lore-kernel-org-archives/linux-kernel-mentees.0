Return-Path: <SRS0=+xMb=MK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1617C636CA
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 18 Jul 2021 12:43:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E65361166
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 18 Jul 2021 12:43:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E65361166
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E5CB40415;
	Sun, 18 Jul 2021 12:43:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8U1JSSOrFjP6; Sun, 18 Jul 2021 12:43:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id C848F4043B;
	Sun, 18 Jul 2021 12:43:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 88820C001A;
	Sun, 18 Jul 2021 12:43:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 35B25C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jul 2021 12:43:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 17048401DE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jul 2021 12:43:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ji0fXsAXG_1n
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jul 2021 12:43:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0F625401DB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jul 2021 12:43:31 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id r16so21480819ljk.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jul 2021 05:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ecWJ401suF5DWIgcyHdE5q1lprWQHPVaK3wQ0Xav3O8=;
 b=cDXHFHYgsR0M3golyWTXE6uUQFQ6h17ib9mRoMxqI/pfqQ2VyLwDuuLL9imqgz1nI5
 LbmYq2mRSxaLfCV8oykSOHbGiXaQMD8gAWUls+SCZkw0jfGvUeVVC3PeQxfKKh8mbMfv
 iNNu+a49ohmOo91hvHKXmD3yQpMqOcvL76oWpjRyaJGAEww1MZJ6BXYGQPCAqRUP35LO
 BF9Fk2+dfERnnjL4mK/3hMguEhokv+ok6/MxyvRmGb9JonuUPaFA0Mfe3f+i3B6pYp92
 zVqe+4G6NJmiv9axVnswoTNHtbe4chayrErdtQtVuNgHh/uCnXnL090FD9mXOA/l7X/g
 BK3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ecWJ401suF5DWIgcyHdE5q1lprWQHPVaK3wQ0Xav3O8=;
 b=VqndMbGDL19rEg1BRpOZjcKWKAyKhISaMlFbxzgljgpdzohqSuRmlgiDz5HsIF5qY1
 cV6AEs2RNa9EJ1ek8Kl5Fmx2pPaLYeWq7RGL0A1pSrLSyWBh3do45/mjl775KFg2adE3
 bnSowTyAcHqKtU+6Y18lHrzmN7excGwVDUVz0q5ROnSP4c13bymLPr28+IZOlHHUO9iF
 dLLlGCwQeolLCED3tKPKitZ8zFURb9zg4nr/VDfDhJelNWX0mo2vGlyG69mupfi3xos4
 IMHE9l1ph+x1Qab1xBmaO3ZnyMvN6lBSQV9Te30wAQz+JZs0FypJ4gLP9vfCHPxbJZtj
 g7yg==
X-Gm-Message-State: AOAM530aZ58mAw1cIWNP8Kxqbwg++VHN0feezP5ktWdDEDJF3z1wR1xT
 IcR1JEp2Fqtfuezu0k3a+BBYadHLTxa6QkyK9/s=
X-Google-Smtp-Source: ABdhPJz7fsQnA7jUWkGlMn0N5ES6D5VBJyKK5jgf0tCtb54B0E0acJsOBojHlzBvR3Dhj55v+lykELzF84yo5sQp88I=
X-Received: by 2002:a05:651c:882:: with SMTP id
 d2mr8999806ljq.370.1626612209909; 
 Sun, 18 Jul 2021 05:43:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAKuLduzhBT_kgp1-za=w2FeD51xAo7=zj1dxvA07YSex2-r44g@mail.gmail.com>
In-Reply-To: <CAKuLduzhBT_kgp1-za=w2FeD51xAo7=zj1dxvA07YSex2-r44g@mail.gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sun, 18 Jul 2021 18:13:18 +0530
Message-ID: <CABJPP5BaHEsbHJ=A5n-P31n1hi3MM5SQSamK=Go-Mwrdtk-smw@mail.gmail.com>
Subject: Re: Mentorship Program
To: Nitin Wartkar <nitinwartkar58@gmail.com>
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

On Sun, Jul 18, 2021 at 4:43 PM Nitin Wartkar <nitinwartkar58@gmail.com> wrote:
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
andshare the results:

tools/perf/arch/arm/util/dwarf-regs.c
drivers/scsi/libsas/sas_init.c

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
