Return-Path: <SRS0=/QuR=MN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA080C6377B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Jul 2021 21:09:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66C7B613F8
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Jul 2021 21:09:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66C7B613F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34AED606E5;
	Wed, 21 Jul 2021 21:09:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UKY-7BLrRyFx; Wed, 21 Jul 2021 21:09:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 41F01605DA;
	Wed, 21 Jul 2021 21:09:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2A35DC0010;
	Wed, 21 Jul 2021 21:09:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0E41CC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jul 2021 21:09:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EFD3640196
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jul 2021 21:09:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W3GlKnbYBfnD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jul 2021 21:09:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BC59A4018F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jul 2021 21:09:00 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id b26so5253201lfo.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jul 2021 14:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=suTcVXIJ0MLL8Nna8mWXEbuvkZ97NDa5Foya9Vh7ZlM=;
 b=GRQVFbLQyYNK8RXxXyJ3d1XwEGLh4vLEHheCJj56UisnfsLDoYP0J4VcMqoTWN59CU
 6frCTzQwwYM3pgq2/GTF7AoBXWcHLNPPUkTsJiLE/JOonhDmvum6aUtBu4zcltkR4hde
 zg/dPTnE4c0ksFPXRDUwEn1nyz2mwFX5Oqy4zv+Bx2E2Na+G4jsUbJHJVen+/sUTyCTJ
 foJwDdt5ptDbvdgiVlaZuRIQn3olgHIr2JWKbSf5xa7/DSD11CjalVx6cZFa9lLA3TAc
 xceNNFgzf5dZKVm849uxHKEqOgNgey2mpXa4vtPOHahFC+WqxNsli42q/65KDQ3/XtyL
 nX0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=suTcVXIJ0MLL8Nna8mWXEbuvkZ97NDa5Foya9Vh7ZlM=;
 b=aJQjj+BaVt8ubHhH7AIK7Ux/RwJrBm+M9RpuUaDS8Jo03EN0/j05ilmVvowvEoqb0w
 6C+tZM/BWfwc+v8lmUJgT4GGIJ8ikhdTbLHGgqah7GwICJHRSwLaRpqpnlBclTr1gfdN
 Y2xwUsR4lttWYaz8jEvuFCkvcUNaLdjYl4OeC7kImcF/Tk7IreQnMZfo7kZDsqQom4It
 UKtrPRMYLVhJzguXx2k/zNnAQrZYbirxAFzUxJy/zMMLot7NbNtCJf6dHZmZTa96bw7J
 VqYNQonvU53ijoiUe05TYi7flXUy5b1/Uukkce5h0bNMSJYtwfEH4FkkjMzHNbQS/Nfm
 lGgA==
X-Gm-Message-State: AOAM532iyMSJyhcBIRpVnFNXa/3PoWYyNcyq9IS9GQ4HidyiVVpbl95x
 8CZTv0AiHv5yeNy0ghQwda9TQ531HKxwo0H68wg=
X-Google-Smtp-Source: ABdhPJx7Qdj0yG6HqmNbGQgULnd+XIc81xEs+hyw+h7q2FdTgv2XwygXbiF1paS1YJ39RcDZziatDvqP/EreSiTVBJE=
X-Received: by 2002:ac2:4ed9:: with SMTP id p25mr26425935lfr.576.1626901738494; 
 Wed, 21 Jul 2021 14:08:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAHTkpbUFQ0jH7wowLzAzTjRuXBKpMB0qonj4RQV9i6VWnb2hZA@mail.gmail.com>
In-Reply-To: <CAHTkpbUFQ0jH7wowLzAzTjRuXBKpMB0qonj4RQV9i6VWnb2hZA@mail.gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Thu, 22 Jul 2021 02:38:47 +0530
Message-ID: <CABJPP5D4MazftKO78Hrm+phKP=HqpLeNxpe234cNZOSJF=iRhw@mail.gmail.com>
Subject: Re: Application for Linux Mentorship under Linux Kernel
To: Chaytanya Sinha <chaytanyas4@gmail.com>
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

On Thu, Jul 22, 2021 at 2:24 AM Chaytanya Sinha <chaytanyas4@gmail.com> wrote:
>
> Respected Mentor,
>
> I am interested in the Checkpatch Documentation mentorship program and I would like to work on the tasks for the mentee selection.
>
> I will try my best to complete the tasks as soon as possible.
>
> Regards

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

drivers/crypto/ux500/hash/hash_core.c
drivers/crypto/ux500/cryp/cryp_core.c

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
