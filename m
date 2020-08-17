Return-Path: <SRS0=pv6u=B3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F0A8C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 17 Aug 2020 09:43:55 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D412220758
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 17 Aug 2020 09:43:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iclJ8twb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D412220758
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B33E387A4D;
	Mon, 17 Aug 2020 09:43:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bYhPUPC1YFOo; Mon, 17 Aug 2020 09:43:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C4BB887A2E;
	Mon, 17 Aug 2020 09:43:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B8A8EC07FF;
	Mon, 17 Aug 2020 09:43:52 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B63A3C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 09:43:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A62DD85F90
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 09:43:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y4-gcsg3Hy7X
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 09:43:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id EA1B985F84
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 09:43:50 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id f24so16967946ejx.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 02:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=641+fi8G+CD/G6tPxDyo2lAgJdgLmYRymVhV8FSJDHs=;
 b=iclJ8twb3oT6yBkLad7+k+6X1VQQBTJDIz5g5XbKJErTiiYdytlgSy4JMFdC/ODU0+
 8rMHuh2abLr8JKt8IfvoGVO7SiZA9UQSgWsFFx9OY9PxrgPztSep3pckuMMXxTwplztd
 sWCcLJet1zb7KhpdM8CHCjDzz9P/3lKczivan2GW5vQV1v22h3zf2SlkT4ukwTQYFcqm
 LFMG+1cWEbI8K/VpdKUU9Bt2GRXKGbB1+4K58Tb+1Wl9cTxfyGlBLYWQL6Zoya0EM1rD
 f/BunMMsNB5S7NF2gC3ZO2TIJajFrfHtqdpOaEaDm3FjzkziynJ+CUVKuiMG5G5RRAxj
 i4Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=641+fi8G+CD/G6tPxDyo2lAgJdgLmYRymVhV8FSJDHs=;
 b=HMFZGTMYRHTF6TO5QShIVO8d+MeYeS4GZGYDk82HaIphBiTXZcuxeyVODXmnp3srHO
 8LN/JEEQVps4xOkOm9s0B3WzZGkOXjW9YJw4wZ1zEBdvwrvu8QO8CJeYcLRnvIDxa/OF
 yEg4BwP6sko6R12fmaXt8jZEI2elBPBL7spfzWmhOx4nay1Tcx0Cl8JpEYyXx0xXTb5j
 aCZZP382/1l27O6zhOLqiT1o7TKOh7LwItdn/UAQ1Pthsjs4Wx0V6O72hWQIBRj9qann
 7ivAPEIVX8Z0I4G5SfMPSh65xG/37jLBZaneA9h3yaXRVk947ibE0SGVZKXrqlNFXV0V
 71Xg==
X-Gm-Message-State: AOAM533nGcAJGJvw+Vb4+XFBFOVM3JLIjEDBMJGcWQ4EHOo0VsIjyD0Q
 vfveNRpStAOTc8IADKCe2ng=
X-Google-Smtp-Source: ABdhPJzqtlODdlH/1IyjrI99ZCd61dmmTY2eYMkpTLHDsbjGe7AF3aFE6/1jF31XPaT64UvYapFxBQ==
X-Received: by 2002:a17:906:2542:: with SMTP id
 j2mr13804721ejb.442.1597657429299; 
 Mon, 17 Aug 2020 02:43:49 -0700 (PDT)
Received: from felia ([2001:16b8:2d33:f300:9831:2be0:da37:973a])
 by smtp.gmail.com with ESMTPSA id rv14sm13835365ejb.33.2020.08.17.02.43.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 02:43:48 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Mon, 17 Aug 2020 11:43:47 +0200 (CEST)
X-X-Sender: lukas@felia
To: Ayush <ayush@disroot.org>
In-Reply-To: <20200810125354.xeijyh3v5upatrez@salamander>
Message-ID: <alpine.DEB.2.21.2008171142310.8645@felia>
References: <20200810125354.xeijyh3v5upatrez@salamander>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Regarding "Linux Kernel: Evaluate and
	Improve checkpatch.pl"
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


Dear Ayush,

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

Second, please always CC: linux-kernel-mentees@lists.linuxfoundation.org.

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
