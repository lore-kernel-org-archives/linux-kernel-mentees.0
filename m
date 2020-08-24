Return-Path: <SRS0=ht7Q=CC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E861C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 24 Aug 2020 10:06:46 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A14D12074D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 24 Aug 2020 10:06:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="h+S3kw/9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A14D12074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=disroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7128187CD6;
	Mon, 24 Aug 2020 10:06:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gKKOhjKNhV88; Mon, 24 Aug 2020 10:06:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9DFAB87987;
	Mon, 24 Aug 2020 10:06:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 856CCC07FF;
	Mon, 24 Aug 2020 10:06:44 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 47624C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Aug 2020 10:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3061720781
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Aug 2020 10:06:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zoU+3MpSrlmD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Aug 2020 10:06:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from knopi.disroot.org (knopi.disroot.org [178.21.23.139])
 by silver.osuosl.org (Postfix) with ESMTPS id 978B02076E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 Aug 2020 10:06:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 59D6A52936;
 Mon, 24 Aug 2020 12:06:38 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at disroot.org
Received: from knopi.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iwak4ifH3_Xw; Mon, 24 Aug 2020 12:06:36 +0200 (CEST)
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1598263596; bh=cbJqtrQ/HIGh2TuOJ1PoMN9VygbdIvXxxTVvU1nfFyM=;
 h=Date:From:Subject:To:Cc:In-Reply-To:References;
 b=h+S3kw/9c39N8BiFxkr0pHd2qkNKykwDnDscLfGtoB/xrM3PMvS4J2eIsgWOmQk3R
 dm3JXNVlmaFjUTYtSrZCSartDGdBRUM7cmYVRSCnW4wxc0/3T+VDPoOda1z8awS+Qy
 6TWtW2D+o2VXZKVsGeOYdtPs2BZYeJXFALB72YHGAHXNSEbCNMQkERP3mEZWeWMGf1
 OwO0dSN8LkIn7egRrJvqirksmww3j2gsjQJYIASQ0Ltk9nHDFXxp5h3cLmPf3Vsbox
 Gv7sTXEL6rYiMPYA6d4cOWbwPvG/17wALh8VOCcq/35bOED9aAICXJT7tv6ef9ryct
 Q0+obaj/24BSw==
Date: Mon, 24 Aug 2020 10:06:36 +0000
From: "Ayush" <ayush@disroot.org>
Message-ID: <32595de077ee7d674a628df11c58152f@disroot.org>
To: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
In-Reply-To: <alpine.DEB.2.21.2008221002290.12792@felia>
References: <alpine.DEB.2.21.2008221002290.12792@felia>
 <alpine.DEB.2.21.2008171142310.8645@felia>
 <20200810125354.xeijyh3v5upatrez@salamander>
 <4f5612540c184970157a98d103d7cd04@disroot.org>
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

August 22, 2020 1:36 PM, "Lukas Bulwahn" <lukas.bulwahn@gmail.com> wrote:

> On Fri, 21 Aug 2020, Ayush wrote:
> 
>> August 17, 2020 3:13 PM, "Lukas Bulwahn" <lukas.bulwahn@gmail.com> wrote:
>> 
>> Dear Ayush,
>> 
>> The zeroth task is to learn suitable netiquette for the communication with
>> the kernel community.
>> 
>> First, please do not top-post.
>> 
>> A: Because we read from top to bottom, left to right.
>> Q: Why should I start my reply below the quoted text?
>> 
>> A: Because it messes up the order in which people normally read text.
>> Q: Why is top-posting such a bad thing?
>> 
>> A: The lost context.
>> Q: What makes top-posted replies harder to read than bottom-posted?
>> 
>> A: Yes.
>> Q: Should I trim down the quoted part of an email to which I'm
>> replying?
>> 
>> Second, please always CC: linux-kernel-mentees@lists.linuxfoundation.org.
>> 
>> Third, set up your email client according to the kernel community rules.
>> 
>> Then, the first task is to run checkpatch.pl on a few kernel patches and
>> collect the results. When you have that, please share your script with
>> me, e.g., in a github repository.
>> 
>> Hints to the first task:
>> 
>> Can you create a list of all non-merge commits that were added in the
>> version v5.8 of the kernel, i.e., all non-merge commits that are in v5.8
>> and not already in v5.7?
>> 
>> Can you share the script/command you executed and the resulting list on
>> github?
>> 
>> Can you run your script on all commits of this list above and record
>> all checkpatch.pl reports, and store them in your github repository?
>> 
>> Can you suggest ideas how to aggregate the findings and create a
>> statistics? For example: Which type of error is reported most?
>> Can you implement that idea?
>> 
>> I also suggest to have a look at
>> the options ./scripts/checkpatch.pl --list-types and
>> ./scripts/checkpatch.pl --show-types. The option --show-types changes
>> the output of checkpatch.pl to list type identifiers, so it is easier
>> to parse and aggregate the output.
>> 
>> Please also share the script you create for that purpose on your
>> github repository.
>> 
>> The second task is to pick one warning that appears often and improve
>> checkpatch.pl to handle that better and get it accepted by the kernel
>> community.
>> 
>> Hints to the second task follow when the first task is solved.
>> 
>> If you fail on any of those tasks, you are out of the selection process.
>> 
>> Lukas
>> 
>> Sir,
>> 
>> I have attempted the task 1 and pushed the same to GitHub.
>> 
>> Please have a look and suggest improvements.
>> 
>> https://github.com/eldraco19/evalute_improve_checkpatch_pl
>> 
>> Please let me know if there are any issues with this.
> 
> So far, so good.
> 
> Here are the questions we want to answer:
> 
> - So what are the 20 categories that occur most?
> 
> You are getting close to that answer, but you are not there yet.
> 
> Then look at the findings. For those 20 categories, are there specific
> findings that are multiple times false positives?
> 
> So, the script complains about something, but it does not get that the
> patch author wrote something completely unrelated to the error message.
> 
> Lukas

Sir,

I tried the given tasks and it can be found here,

https://github.com/eldraco19/evalute_improve_checkpatch_pl/blob/master/STATS.md

Please look into it.

Thanks,
Ayush
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
