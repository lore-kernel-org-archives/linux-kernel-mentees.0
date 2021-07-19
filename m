Return-Path: <SRS0=VrTg=ML=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE945C12002
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 19 Jul 2021 04:27:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AD0B610C7
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 19 Jul 2021 04:27:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AD0B610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B0DE60667;
	Mon, 19 Jul 2021 04:27:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YXj0khAEPzxf; Mon, 19 Jul 2021 04:27:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id E049960618;
	Mon, 19 Jul 2021 04:27:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B10C9C001A;
	Mon, 19 Jul 2021 04:27:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4FF0CC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Jul 2021 04:27:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3CF0F82792
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Jul 2021 04:27:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0m2sEPyFeXuS
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Jul 2021 04:27:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E82F88276E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Jul 2021 04:27:40 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id p22so25764125yba.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Jul 2021 21:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tUZHP3L/yuin/IKHsqqsdM62kcTeYD7nG3a6vt39wEU=;
 b=DajwAPI4lrTxm+AQPkDVKM/emKQcwh7z/Y5jyX60R7TW9bAESvesyhqfbXqx3u9rPq
 oA7AxDnvsh5zEMcG1dhabywjQllWB6yvV37odaSzAE9pR/DOQM3lx8qEcdtoWNGXuU9+
 KnQkICIjBKDHL3tttKv+Al30SNRGNPFDO1igNKnaNS7YJ2+A8DfoLZrQxSdV7Zk8/kui
 Im/Vl4sIAFVjnUsXZUIOE+g1GT/8FxZF09fipBpcbApyPs0KkZ9x0ayNLDGM/rbXzAjV
 +RRj0xQKs0kLQhCiD5vEXO7fuKAALdEf3h8Vm0u/lDedudkf+K4FAbLl16i/YpUzgt8X
 Hq3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tUZHP3L/yuin/IKHsqqsdM62kcTeYD7nG3a6vt39wEU=;
 b=UlW7Z3s8G/kSEMdZoot4lZ6NutdQe718fOQKAbWqWCXRWBGYLiujQ+bDCuS9evNAAI
 +l5CamZU+itHYhmQyDgAoNuNCqA2Jm5cg80p/aBzMoNpDNdXcd9OGg1qtsEHSZLCmAJt
 ieyRublLNYtWv6LejfkJJE0h0y4xcsnP9jxOhs0z5aiDMKq/H+FXYIUv/Lfd0zQB83Gk
 7eQGHhVQiY7JvxV8IaXJL8e8GDtQQg+UU95qK4ToNSl1X8ilI2tatKj+334dUXdBZlKo
 Hk8I/nO+kWR974gdTx11ouDt+RaY8ClX+cfmj/A2xgu7FQOPnE9eZD9ApyouMupbyOwP
 GFvg==
X-Gm-Message-State: AOAM5325XetQZiut7lcXMPulM3tmEs+1hEQ8egVI+y1+iOBELDd/r5cM
 p3m51aHx+l2N16XJJB1CVJxVYxiJmeXFYfN0zzE=
X-Google-Smtp-Source: ABdhPJzapO5FnhoQtoRAIF9QZtASHZsPr1sjEhT2mWIYN53yt/x9YBYRbyWxM1drZrikZUy2wG/DSAaE3Wyw9KhdAT8=
X-Received: by 2002:a25:f30d:: with SMTP id c13mr28326274ybs.134.1626668859823; 
 Sun, 18 Jul 2021 21:27:39 -0700 (PDT)
MIME-Version: 1.0
References: <CALDYK763Nr2qJ_W3KngG+H+kAfwtgcAa=PvXggYLyCdD+y-iHw@mail.gmail.com>
In-Reply-To: <CALDYK763Nr2qJ_W3KngG+H+kAfwtgcAa=PvXggYLyCdD+y-iHw@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 19 Jul 2021 06:27:29 +0200
Message-ID: <CAKXUXMxrBPmqhqQUuDxvO5nim9unXwiXcK0OaHOgNNamM9V1Sg@mail.gmail.com>
Subject: Re: Linux Kernel: Checkpatch Documentation mentorship
To: Rahul Joshi <mrjoshi0147@gmail.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

On Sun, Jul 18, 2021 at 8:20 PM Rahul Joshi <mrjoshi0147@gmail.com> wrote:
>
> I am interested in the Checkpatch Documentation mentorship program, and I would like to work on the tasks for the mentee selection.
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
net/sunrpc/xprtrdma/svc_rdma.c

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
