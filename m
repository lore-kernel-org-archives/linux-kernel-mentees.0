Return-Path: <SRS0=pv6u=B3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBDBDC433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 17 Aug 2020 09:35:35 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D9EF20758
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 17 Aug 2020 09:35:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pnjt+1Sw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D9EF20758
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 296AC204B4;
	Mon, 17 Aug 2020 09:35:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e2bG3Up5CCwr; Mon, 17 Aug 2020 09:35:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id ACB17204A7;
	Mon, 17 Aug 2020 09:35:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 954A7C07FF;
	Mon, 17 Aug 2020 09:35:33 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 13B25C0051
 for <linux-kernel-mentees@lists.linux-foundation.org>;
 Mon, 17 Aug 2020 09:35:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 014CA204A7
 for <linux-kernel-mentees@lists.linux-foundation.org>;
 Mon, 17 Aug 2020 09:35:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a-fnp0jnVdkU
 for <linux-kernel-mentees@lists.linux-foundation.org>;
 Mon, 17 Aug 2020 09:35:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by silver.osuosl.org (Postfix) with ESMTPS id 4D6CE20474
 for <linux-kernel-mentees@lists.linux-foundation.org>;
 Mon, 17 Aug 2020 09:35:31 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id kq25so16945331ejb.3
 for <linux-kernel-mentees@lists.linux-foundation.org>;
 Mon, 17 Aug 2020 02:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=scsOQ8kjO1hfVV9acI+FT0mt/WFLhyZEflxDBqDxGOM=;
 b=Pnjt+1SwPo2tk1IB4ubPdlQHtMfl7d5I+HPHncpCD30Sg7hL2Ze6suaBvVfFK22wOf
 al7cKmijejiQPr1ZATYfXoUEmfE6KgRDKDBmI1uMiAWEV9Yu5OWrLc3Wsats6qCQL4ft
 uEGhV9NImZF1pXE6b4pqx48VhRw1TadNvykhCNao1uovScQV5e7rJ1ggI0oArUgNg7IQ
 F1JtGeWv4yhf37EgvZoj075HBAiIVao2+1ojTHsEjF3NoWqCSU1UU82r0AsccM3ZMFxW
 1fKowsq4nYzJUXP2NGt5UTv1jeCYNraa8Fj08FbmAzX5QrfGKoJZW4DzPPNpIO6U3ivI
 eGqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=scsOQ8kjO1hfVV9acI+FT0mt/WFLhyZEflxDBqDxGOM=;
 b=GwYRwx7cnrEkIE/4gpHdEMjOMk7/ftBeoTAQWJr3a2Ir10P6TTaNwwV93MH+KrkSd/
 ddqYAOppzO7atudtw5/+1mxt4bJRmsuJEXWUFtImFj2ALCyDDPMNb53kLNGWO6n04Gyb
 zMk0v9KpQ+jUk0LDgKpLxW1hWPrx9mR4zP2Dm0xGOJ7Ics+McuEy+XusZB5eb/zyMgSw
 D51aj7yAsRpd9YRujZYpJNIx43PlJNsmx152vqpK8tC6qnjsef6U2ZQMjOP8LF1kx/nl
 yQYKfjFlo+7L9uXvBrM/asnjG7/nSC7QGuie+/dx1zA0gUxCftMgr3tuNNLN1F5nptor
 rOCA==
X-Gm-Message-State: AOAM530acTzcbLKCLko3WYN6cWnoSszOqM5YuRLqn/OMSbx1JlapMjZQ
 owkHsLD/OMgi/sw77mZboqw=
X-Google-Smtp-Source: ABdhPJxAVF6NtRPx8L13uA1QRUphLUxTdfwK8IgpLHubzmpNDH9IuA92XZEwUEXC02dF5/Fn+fwQCw==
X-Received: by 2002:a17:906:a4b:: with SMTP id
 x11mr14963380ejf.83.1597656929576; 
 Mon, 17 Aug 2020 02:35:29 -0700 (PDT)
Received: from felia ([2001:16b8:2d33:f300:9831:2be0:da37:973a])
 by smtp.gmail.com with ESMTPSA id p12sm12266489edt.27.2020.08.17.02.35.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 02:35:28 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Mon, 17 Aug 2020 11:35:20 +0200 (CEST)
X-X-Sender: lukas@felia
To: Piyush Thange <pthange19@gmail.com>
In-Reply-To: <b842e923-f7b0-e732-7c0e-bdd795d905ae@gmail.com>
Message-ID: <alpine.DEB.2.21.2008171132050.8645@felia>
References: <b842e923-f7b0-e732-7c0e-bdd795d905ae@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linux-foundation.org
Subject: Re: [Linux-kernel-mentees] Evaluate and Improve checkpatch
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


Hi Piyush,

On Fri, 14 Aug 2020, Piyush Thange wrote:

> Hello sir, myself Piyush Thange I'm a junior student of Computer Engineering.
> I'm interested in the project - "Evaluate and Improving checkpatch.pl" and
> willing to contribute to the project.
> Please I would like to know more about this project and if you have any
> specific task please provide it to me.
>

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
