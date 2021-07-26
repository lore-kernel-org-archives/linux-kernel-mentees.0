Return-Path: <SRS0=f8HV=MS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCC67C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 26 Jul 2021 21:56:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88CBF60C51
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 26 Jul 2021 21:56:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 88CBF60C51
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AD9840226;
	Mon, 26 Jul 2021 21:56:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r24qYrHxxuhW; Mon, 26 Jul 2021 21:56:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 3216240204;
	Mon, 26 Jul 2021 21:56:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 17237C001A;
	Mon, 26 Jul 2021 21:56:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 44D00C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Jul 2021 21:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3AD4840377
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Jul 2021 21:56:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QSLunyIGOXAM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Jul 2021 21:56:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 56E224033B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Jul 2021 21:56:43 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id d17so18221330lfv.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Jul 2021 14:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZVflEJxI5V2y/j4CXqRurn13gV21uhtGkAKQPWQ/zII=;
 b=CCQM5OASdDHZdxC9JvH9cMuLQvN2rEjKDv84z+7iHuFF+1JDQxCzFTBZf7Tt4fgSax
 1VRQfCnzPMNB2a3rZFafgsnc0VqraUxHKltEaqmoYtCrHTg3b6hvCFuQ65ZXHR24KUf1
 E4DdvBnlB+JlAaBQEDDtPWUF6CMH1oeGW8SacVfpF6TNUwJ28Nt2FBtYgW+wO6Qy9reS
 9Zf8D9GfJwxSaCKMIgrq+USGAH2u1qdti659vj+PBzJD7faaWKhJvj4EosfTSTZK3odU
 GHDpnKwoX4dsnQD37dTsyYjJJcGV9wBsEWqo7rVIiS2qbY+FvVdUJ1jflIkPHmgF7u7w
 b9nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZVflEJxI5V2y/j4CXqRurn13gV21uhtGkAKQPWQ/zII=;
 b=A3btcJKwWRMuJVw8m0gkcn4Aq8l+Hv0Srd6/sPq+X+FstlS9pPOHR6c/EU8O/ULQ82
 ziKoNbY2uNBRjYUqVPlxoR9LOdBb2vPQfuqe86T8e4PEKONogfkEMFhikYbYx+mTLpSr
 oiWj9VUzQdFXjIUV4fTJ+af4gw1mj8YlE27mBwbfLySqRbNotYRd5ld1Tmr1+9syYJOX
 fHaLnmLcA470VEDghDpF9LR3OnEL1S4+8skWg9VmRGlGvZw/zLWKUOYfQOlnZS99nbG8
 3YOSXQHO4CW7BqavQE7pEV4chJOaf94W9d532UzTq1e/dpAk2BzNxcvBqxq1tTHaiVLG
 BbSw==
X-Gm-Message-State: AOAM531WYfTals+CAI23+CRq7vTenSXAdmknxRE1Mb8jR98idQwfozkT
 RBMC6GKdYVFQAz7P2NcpspqRKltQ1V1O9aCiaJg=
X-Google-Smtp-Source: ABdhPJwPQBwlzalylCjWbuc+DRneMjccE4sjwUE/Q7CsX4WjmQ49lnC9horxnOS74bMTY19lTJQm2KLwv/aXNPiMk18=
X-Received: by 2002:a19:ae0f:: with SMTP id f15mr14439021lfc.117.1627336601145; 
 Mon, 26 Jul 2021 14:56:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAFwExaPX6qRh1kZqYVeyxyiG21d1M+ioybMvZe2XVaUVTKQ-Lw@mail.gmail.com>
In-Reply-To: <CAFwExaPX6qRh1kZqYVeyxyiG21d1M+ioybMvZe2XVaUVTKQ-Lw@mail.gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Tue, 27 Jul 2021 03:26:29 +0530
Message-ID: <CABJPP5DMBXCcBaYSiMYc6mX++2vgzXO2eZaKWXew11nUTrsW3g@mail.gmail.com>
Subject: Re: Linux Kernel: Checkpatch Documentation Mentorship program
To: Yash Singhal <ramusinghal112@gmail.com>
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

drivers/staging/media/atomisp/pci/sh_css.c
drivers/gpu/drm/nouveau/nouveau_gem.c

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
