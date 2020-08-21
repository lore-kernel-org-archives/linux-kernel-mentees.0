Return-Path: <SRS0=fjKG=B7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D84EC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 Aug 2020 16:18:22 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 209E322CF8
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 Aug 2020 16:18:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="bco/78fI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 209E322CF8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=disroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E04D7204D1;
	Fri, 21 Aug 2020 16:18:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TVTdbrcj-jAa; Fri, 21 Aug 2020 16:18:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0208D20398;
	Fri, 21 Aug 2020 16:18:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E0078C088B;
	Fri, 21 Aug 2020 16:18:19 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E6A80C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 16:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D5A9686C22
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 16:18:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DNyLmJLscZXo
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 16:18:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from knopi.disroot.org (knopi.disroot.org [178.21.23.139])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5F04186BA9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 16:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 6E7915299A;
 Fri, 21 Aug 2020 18:18:13 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at disroot.org
Received: from knopi.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with UTF8SMTP id 5Ntkex4fzIXQ; Fri, 21 Aug 2020 18:18:11 +0200 (CEST)
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1598026690; bh=8yNSk+lcEP7lIyCPZYLfT+/na4Cj+K248MUsBPujNKo=;
 h=Date:From:Subject:To:Cc:In-Reply-To:References;
 b=bco/78fIYak+QWqDmf29+zbmEJx+a7kRmPvXEnE2b4A86NrmUSGLLb+Yvp7LwHsty
 K/6VU0y3/ssNljIskkejuwsLfPYb3Ay/UWIy2XOqQt/SNS4XFBAvf9qp2nUT/3C3tQ
 riUnUXpf/HNCS5Ool/w3Wr7TO6+8hZgiiGQzADltmQguYz3BAqVq2R8qTHlZpraV3i
 MG5k1zUEma3ZFXNFdVWcQpxqyvJ6j04vy8ZyLob7RWmvdS6paXq/HyZotJVIuziAeD
 kL82noVp4+M0+Qhe0weIuZ40+TSl8TJZpZgXi0aYFNXOMW59CaKDWPKl87We4Nq+84
 LXtruOp3fqsjg==
Date: Fri, 21 Aug 2020 16:18:10 +0000
From: "Ayush" <ayush@disroot.org>
Message-ID: <4f5612540c184970157a98d103d7cd04@disroot.org>
To: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
In-Reply-To: <alpine.DEB.2.21.2008171142310.8645@felia>
References: <alpine.DEB.2.21.2008171142310.8645@felia>
 <20200810125354.xeijyh3v5upatrez@salamander>
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

August 17, 2020 3:13 PM, "Lukas Bulwahn" <lukas.bulwahn@gmail.com> wrote:

> Dear Ayush,
> 
> The zeroth task is to learn suitable netiquette for the communication with 
> the kernel community.
> 
> First, please do not top-post.
> 
> A: Because we read from top to bottom, left to right.
> Q: Why should I start my reply below the quoted text?
> 
> A: Because it messes up the order in which people normally read text.
> Q: Why is top-posting such a bad thing?
> 
> A: The lost context.
> Q: What makes top-posted replies harder to read than bottom-posted?
> 
> A: Yes.
> Q: Should I trim down the quoted part of an email to which I'm 
> replying?
> 
> Second, please always CC: linux-kernel-mentees@lists.linuxfoundation.org.
> 
> Third, set up your email client according to the kernel community rules.
> 
> Then, the first task is to run checkpatch.pl on a few kernel patches and
> collect the results. When you have that, please share your script with
> me, e.g., in a github repository.
> 
> Hints to the first task:
> 
> Can you create a list of all non-merge commits that were added in the
> version v5.8 of the kernel, i.e., all non-merge commits that are in v5.8
> and not already in v5.7?
> 
> Can you share the script/command you executed and the resulting list on 
> github?
> 
> Can you run your script on all commits of this list above and record
> all checkpatch.pl reports, and store them in your github repository?
> 
> Can you suggest ideas how to aggregate the findings and create a
> statistics? For example: Which type of error is reported most?
> Can you implement that idea?
> 
> I also suggest to have a look at
> the options ./scripts/checkpatch.pl --list-types and
> ./scripts/checkpatch.pl --show-types. The option --show-types changes
> the output of checkpatch.pl to list type identifiers, so it is easier
> to parse and aggregate the output.
> 
> Please also share the script you create for that purpose on your
> github repository.
> 
> The second task is to pick one warning that appears often and improve
> checkpatch.pl to handle that better and get it accepted by the kernel
> community.
> 
> Hints to the second task follow when the first task is solved.
> 
> If you fail on any of those tasks, you are out of the selection process.
> 
> Lukas

Sir,

I have attempted the task 1 and pushed the same to GitHub.

Please have a look and suggest improvements.

https://github.com/eldraco19/evalute_improve_checkpatch_pl

Please let me know if there are any issues with this.

Thanks,
Ayush Karn
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
