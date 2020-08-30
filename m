Return-Path: <SRS0=kRYb=CI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C0CCC433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 30 Aug 2020 18:51:17 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3C752071B
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 30 Aug 2020 18:51:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="cAIahZRh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3C752071B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=disroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B97BD20452;
	Sun, 30 Aug 2020 18:51:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B2Id4bRnR+lc; Sun, 30 Aug 2020 18:51:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 31455204C3;
	Sun, 30 Aug 2020 18:51:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1EC86C0052;
	Sun, 30 Aug 2020 18:51:09 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E1A3FC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Aug 2020 18:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D0E63854DB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Aug 2020 18:51:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l3AcumQlZnaU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Aug 2020 18:51:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from knopi.disroot.org (knopi.disroot.org [178.21.23.139])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2142184D3A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Aug 2020 18:51:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 940235291F;
 Sun, 30 Aug 2020 20:51:03 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at disroot.org
Received: from knopi.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wX5z8epEo0Va; Sun, 30 Aug 2020 20:51:01 +0200 (CEST)
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1598813461; bh=ntQ2urAA8DcabGNm8nvg87m1Jg9RTCSyMRJ121z6c98=;
 h=Date:From:Subject:To:Cc:In-Reply-To:References;
 b=cAIahZRh1MdbvXOh0aflc2YF0xh3eyK89fKv+VG0AgTm1NdSLEBKvRT4sC6m+csAb
 Mw/9v4yHdJ2pIDkLXBTjmPOTjmsjLWyMnpFe6KRRJ7YuQSZFFqA+UXL29lFJ4EXbOE
 +H3Rg8dK8nUfEpMjPZAfd6+XjXI1DlnoJbyDz+DQGOL/JjCorfw02cvvPQHpYAzVQQ
 M2RuVb5pFk7TjuJS6uQlUNPsweAHKlug4KIlaIFBrS6eoksRLFUKlz9tmKRhVqyWWA
 8+g0ZzjgHCG2O1HyQL7HsK18KCGvTvFEol3ylKdlD4jmbHnNNA9HmdT/eKjA/Ubzco
 gJLQqaI5em4vw==
Date: Sun, 30 Aug 2020 18:51:00 +0000
From: "Ayush" <ayush@disroot.org>
Message-ID: <97cef44dfa6c692c20ef7a0d981e4863@disroot.org>
To: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
In-Reply-To: <alpine.DEB.2.21.2008270707440.9436@felia>
References: <alpine.DEB.2.21.2008270707440.9436@felia>
 <alpine.DEB.2.21.2008221002290.12792@felia>
 <alpine.DEB.2.21.2008171142310.8645@felia>
 <20200810125354.xeijyh3v5upatrez@salamander>
 <4f5612540c184970157a98d103d7cd04@disroot.org>
 <32595de077ee7d674a628df11c58152f@disroot.org>
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

August 27, 2020 10:59 AM, "Lukas Bulwahn" <lukas.bulwahn@gmail.com> wrote:

> On Mon, 24 Aug 2020, Ayush wrote:
> 
>> August 22, 2020 1:36 PM, "Lukas Bulwahn" <lukas.bulwahn@gmail.com> wrote:
>> 
>> On Fri, 21 Aug 2020, Ayush wrote:
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
>> 
>> So far, so good.
>> 
>> Here are the questions we want to answer:
>> 
>> - So what are the 20 categories that occur most?
>> 
>> You are getting close to that answer, but you are not there yet.
>> 
>> Then look at the findings. For those 20 categories, are there specific
>> findings that are multiple times false positives?
>> 
>> So, the script complains about something, but it does not get that the
>> patch author wrote something completely unrelated to the error message.
>> 
>> Lukas
>> 
>> Sir,
>> 
>> I tried the given tasks and it can be found here,
>> 
>> https://github.com/eldraco19/evalute_improve_checkpatch_pl/blob/master/STATS.md
> 
> The solution is implemented a bit complicated, but well, at least, it
> works if I believe your report. (I only read the code, but did not run
> it.)
> 
> The goal now is to find a class of false positives and improve
> checkpatch.pl accordingly.
> 
> I suggest that you look at the specific DIFF_IN_COMMIT_MSG reported
> errors?
> 
> Provide a short assessment for each DIFF_IN_COMMIT_MSG error in the
> 10 commits.
> 
> It should tell:
> - what lines in the commit message did checkpatch.pl complain about?
> - what is the pattern in the commit message?
> - does patch(1) really stumble over that pattern?
> - how would this pattern need to be provided to patch(1) so that it
> would stumble over it?
> - if no, why not?
> - can we change checkpatch.pl to not raise an error for such a
> situation? So, only raise an error when the pattern would really make
> patch stumble on it?
> 
> Depending on the evaluation, we might continue to improve checkpatch.pl
> for reporting this error type, or we decide to look at GIT_COMMIT_ID
> errors, where I can quickly spot some false positives.
> 
> Best regards,
> 
> Lukas

Sir,

I analysed the given error type and my analysis can be found here:

https://github.com/eldraco19/evalute_improve_checkpatch_pl/blob/master/DIFF_IN_COMMIT_MSG.md

Please review it.

Thanks.
Ayush
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
