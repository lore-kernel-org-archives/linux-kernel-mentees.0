Return-Path: <SRS0=pv6u=B3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 155F7C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 17 Aug 2020 09:41:43 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D14F520758
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 17 Aug 2020 09:41:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="juXxrUNM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D14F520758
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 92C74204A7;
	Mon, 17 Aug 2020 09:41:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VLQu3TyrNova; Mon, 17 Aug 2020 09:41:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 86D1420474;
	Mon, 17 Aug 2020 09:41:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6B266C07FF;
	Mon, 17 Aug 2020 09:41:41 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9DEF5C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 09:41:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 86194861FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 09:41:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kZVHImoU5MK9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 09:41:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id ABDA2861CE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 09:41:36 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id c10so11744361edk.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 02:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=BEUqYMEuMNy+9jvN9Pr/3HzHfv805zNgYcW7+x1q1F0=;
 b=juXxrUNMLVeayoLvb+0iiJfKPQrfqELHQCabdE2sV6n88UHgEurU16ZTayGWAslpuN
 ePGdxU8NTO+GPRxj/yBBMqVeN/4bNLV3xzCUovEXD5G5refNOcvgLZKyE+hEUcnBAIRx
 nuSVU22t7HQOWSQZpIxBxkc1Ev0m4aIvBGEpFw/qQUJs7aEPqCkeFq/cTIZCNk7p396M
 kCr2H2SNBRgn/isHTIZVgfzXSLQpa4UYfqTy7kyn+Z3iyVjTaiI/d+gzWAWM/uHsLBj2
 zPd/ucfBKsYDM/AqogqiOpkcRO6QdKSVjda+abnOdL6zO0doJrs98KZP9DoUOixfcz0c
 BdwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=BEUqYMEuMNy+9jvN9Pr/3HzHfv805zNgYcW7+x1q1F0=;
 b=jFSgz1280OO9nu3aZcqigeqHWpUPLTdCkXF/rUFOwdWXDGtOkKzyKDKcIVDXCX3Rab
 G33eGCCid+mhtsHixxbdhVgi6mPsRwFNpCdbzq7b/+aMHBaBL4SqMb6CXuG8vevGQJLq
 ypZLMGKzaJZRZw+LpHr5RdByC/Z4NO1RGOnRxKUPE1S1UMfhCtuX8k2IQvZ+7YrXn9Ed
 MVNXL4xh4Vvl5I6SoZ57/olv5wxc00Es65uJd/0f4XjnRGp07Di6xaCsBwBz6CwfBKNz
 y7YhfiShjCG7fJJcfPoVYpe0ZmTiP9ZJqlgUTs02IJf3xKjNeVZGfObvLCgqwCD0lv5M
 qt6A==
X-Gm-Message-State: AOAM533PCUJcqQ7rUFjEdvREvUmaAkKdC5USTpyCxS+MqNsp9jrXHGdA
 NT4KbkDX31E/PL2HfDzymYowunrYElyiIA==
X-Google-Smtp-Source: ABdhPJz1SNyZzDpootYxbESyCp9VX4Qm1uCDvwDOWXJkK66ATEF2gxpZad0e8coi2Sa+d+Q+T8JrRg==
X-Received: by 2002:a50:fb94:: with SMTP id e20mr14317252edq.103.1597657294903; 
 Mon, 17 Aug 2020 02:41:34 -0700 (PDT)
Received: from felia ([2001:16b8:2d33:f300:9831:2be0:da37:973a])
 by smtp.gmail.com with ESMTPSA id di5sm13374031edb.16.2020.08.17.02.41.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 02:41:34 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Mon, 17 Aug 2020 11:41:33 +0200 (CEST)
X-X-Sender: lukas@felia
To: Dinesh Bhagat <db.dineshbhagat07@gmail.com>
In-Reply-To: <CAPsWyckZfNnBtOS7h+2Zxjeai5FpaPgs7OwumMFn9SAT7QAA3g@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2008171140231.8645@felia>
References: <CAPsWyc=499DuOz_XXmT+DktO3ap1Q0DQ_UFy8aSyyJOSQBtFxA@mail.gmail.com>
 <CAPsWyckZfNnBtOS7h+2Zxjeai5FpaPgs7OwumMFn9SAT7QAA3g@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] checkpatch.pl project in Community Bridge
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

Hi Dinesh,


The zeroth task is to learn suitable netiquette for the communication with 
the kernel community.

First, please do not top-post.

    A: Because we read from top to bottom, left to right.
    Q: Why should I start my reply below the quoted text?

    A: Because it messes up the order in which people normally read text.
    Q: Why is top-posting such a bad thing?

    A: The lost context.
    Q: What makes top-posted replies harder to read than bottom-posted?

    A: Yes.
    Q: Should I trim down the quoted part of an email to which I'm 
replying?

Second, please always CC: linux-kernel-mentees@lists.linux-foundation.org.

Third, set up your email client according to the kernel community rules.



Then, the first task is to run checkpatch.pl on a few kernel patches and
collect the results. When you have that, please share your script with
me, e.g., in a github repository.


Hints to the first task:

Can you create a list of all non-merge commits that were added in the
version v5.8 of the kernel, i.e., all non-merge commits that are in v5.8
and not already in v5.7?

Can you share the script/command you executed and the resulting list on 
github?

Can you run your script on all commits of this list above and record
all checkpatch.pl reports, and store them in your github repository?

Can you suggest ideas how to aggregate the findings and create a
statistics? For example: Which type of error is reported most?
Can you implement that idea?


I also suggest to have a look at
the options ./scripts/checkpatch.pl --list-types and
./scripts/checkpatch.pl --show-types. The option --show-types changes
the output of checkpatch.pl to list type identifiers, so it is easier
to parse and aggregate the output.

Please also share the script you create for that purpose on your
github repository.



The second task is to pick one warning that appears often and improve
checkpatch.pl to handle that better and get it accepted by the kernel
community.

Hints to the second task follow when the first task is solved.

If you fail on any of those tasks, you are out of the selection process.


Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
