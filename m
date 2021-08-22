Return-Path: <SRS0=zqa/=NN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86735C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 22 Aug 2021 18:34:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 284ED6124B
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 22 Aug 2021 18:34:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 284ED6124B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B410380D6F;
	Sun, 22 Aug 2021 18:34:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lx5A0ZHSLnd5; Sun, 22 Aug 2021 18:34:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 77BD680D7F;
	Sun, 22 Aug 2021 18:34:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 48667C001A;
	Sun, 22 Aug 2021 18:34:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F245FC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Aug 2021 18:34:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D377A40365
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Aug 2021 18:34:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J24GQmhvUlXA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Aug 2021 18:33:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3CDE34035E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Aug 2021 18:33:58 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id c12so27210394ljr.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Aug 2021 11:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FIB/EPqeTq5t/+wJ7T4+G1NV7oP356KV6jPBo+uUloA=;
 b=YukpPPzNLvG77ulMuHHmQFD7WBccjTWHxWZ8yD/C8CWPtt1hp5J4+xzIzs0p+rG+pi
 90lq5dvZ39hwAxLdKQRqvzTigkHJqCUjZT2tJZHrJXsAESCK+yClESpGa7nwqdJMAb9v
 264TH3L+vLKdbf9awc1Q7oG9IfoahdAgKMzd4BNAWV/hlbvtZoDFoNIPgZv+GhGnPuCB
 aHpok73bPeJmSupsABFjXoeBtxWRKPUkVNUrzFDL56njoMtfGinM9ryrJX14C22xGplD
 8sJA4rPbptX/lO3OEdwId9NVaEhqlNjcnA0ANVLILJp3z39pxCoW3KWnf8wkATI6W+iz
 mOEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FIB/EPqeTq5t/+wJ7T4+G1NV7oP356KV6jPBo+uUloA=;
 b=LjKzO0uDxY0iD+HjrofxWCvqdUL/i0ZtMatHJIp6MBSVzXwSOVvbi9n0I8FbRqLv6G
 tsEOZ7cegmygrLBAvoTvMLVxCqcO3GAs56EyBoixJyYsEta6m5Zyb6g0FwtjUjd1ahEL
 7KgRyJQ4fuCb7Gs+DS4Zue9jja/t7NF0bge/5Q7WMkVv1kcDuA58P2FB2Obu4/MMk0jC
 E6fbrwqjRYz8BtCZsfSG76oRZ83UYLtBrhaLaI+Wwwz/7o+/1v4A7qtL6u2heHWu4eSa
 ttr6WsZK/XUbbjOPDb+cRY51Ubtst0bwO1589/YwYv9GQtSFgA4jeBdg5SIjGzv5dApN
 3O5g==
X-Gm-Message-State: AOAM532OuT+tOQ4O0gDAd4jno95SvcpLHwAm3lOKber0ZAaxlZC7RXML
 sATid6Yv5Dg3QjSARxGNsvQdSeE1mEnWtq7YIHA=
X-Google-Smtp-Source: ABdhPJwzTjfrgxAUNct8oqANqimdlDlzPhfuqNrUp4c1mDidmdNgz1fnk6yxNOdYpt/EBztNa5CEEHibsnvgJnsFb6k=
X-Received: by 2002:a2e:b5b9:: with SMTP id f25mr22033593ljn.145.1629657236125; 
 Sun, 22 Aug 2021 11:33:56 -0700 (PDT)
MIME-Version: 1.0
References: <YR6eapF1R1YNbJpM@rachitt-ASUS-TUF-Gaming-A15-FA506IH-FA506IH>
In-Reply-To: <YR6eapF1R1YNbJpM@rachitt-ASUS-TUF-Gaming-A15-FA506IH-FA506IH>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Mon, 23 Aug 2021 00:03:44 +0530
Message-ID: <CABJPP5A7Kb_8ScarZjjD-0WvXD5VXp7d2Uxc=Z_aCjgmQ3Jc4A@mail.gmail.com>
Subject: Re: Checkpatch Documentation mentorship program
To: rachitt.lfx@gmail.com
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

On Thu, Aug 19, 2021 at 11:39 PM Rachitt Shah <rachitt.lfx@gmail.com> wrote:
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

drivers/gpu/drm/i915/i915_utils.h
drivers/staging/media/atomisp/pci/hmm/hmm.c

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
