Return-Path: <SRS0=YKtx=CQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 599A0C43461
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  7 Sep 2020 14:28:27 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BD442064B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  7 Sep 2020 14:28:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="OLaAfO9U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BD442064B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=disroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id AD9F987117;
	Mon,  7 Sep 2020 14:28:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4gWXvoeJiOhc; Mon,  7 Sep 2020 14:28:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id F30EE8710D;
	Mon,  7 Sep 2020 14:28:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DEFF0C0052;
	Mon,  7 Sep 2020 14:28:23 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EACC5C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 14:28:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id CC05887117
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 14:28:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jVBIrMQNFAsO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 14:28:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from knopi.disroot.org (knopi.disroot.org [178.21.23.139])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 672288710D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 14:28:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 0010F51C71;
 Mon,  7 Sep 2020 16:28:17 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at disroot.org
Received: from knopi.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VeD7siAsxbW7; Mon,  7 Sep 2020 16:28:16 +0200 (CEST)
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1599488870; bh=JxmZzKiTa84XYsrPySzAS8ruU+nKUf+6uYlW9eRS5QY=;
 h=Date:From:Subject:To:Cc:In-Reply-To:References;
 b=OLaAfO9UqyVBgRvR9ElxV9xFP8RznLH1nxiSRz/0oZ8W714Hri0jpoorOaH1btVja
 5fbpblXyylfVD/IV99zk7pL7l7IsyOcZjL1LjySAVlGpnDlQ475vqBVvbSAoCrjLMi
 P1OiuP3Q5t5LEfENXJUgA/gxpgm5RoBWgg8I40FQHzuyFmcKp6bE0kJMT7D4ZGvjF+
 eTwPJvO3jFvGvOm22FIQju4h6t3cLVPRl24//pwINxqPpYJC3j0bFEfQbyD7K7qNPl
 fS4swEJcRYAv5Sg2/88hH/J20sh8l5EoHU7jEmKgPUO4GcYxpIy7AmPdOQa/nx42O8
 ilMQxcBNSLM+Q==
Date: Mon, 07 Sep 2020 14:27:50 +0000
From: "Ayush" <ayush@disroot.org>
Message-ID: <8802360392ba3dd9ded3999c3f57560b@disroot.org>
To: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
In-Reply-To: <CAKXUXMz8MphA5PYtLe_mB+3qNV-PSimmSVS2+P5vpv=4+VsBFw@mail.gmail.com>
References: <CAKXUXMz8MphA5PYtLe_mB+3qNV-PSimmSVS2+P5vpv=4+VsBFw@mail.gmail.com>
 <alpine.DEB.2.21.2008270707440.9436@felia>
 <alpine.DEB.2.21.2008221002290.12792@felia>
 <alpine.DEB.2.21.2008171142310.8645@felia>
 <20200810125354.xeijyh3v5upatrez@salamander>
 <4f5612540c184970157a98d103d7cd04@disroot.org>
 <32595de077ee7d674a628df11c58152f@disroot.org>
 <97cef44dfa6c692c20ef7a0d981e4863@disroot.org>
 <alpine.DEB.2.21.2008310702520.8556@felia>
 <a6f436fe39f48d9b7e537bdfad07fc7e@disroot.org>
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

September 7, 2020 1:09 PM, "Lukas Bulwahn" <lukas.bulwahn@gmail.com> wrote:
 
> I think you should extend this whole check to work properly with line
> breaks. You can see how this is implemented currently in checkpatch.pl
> just a few lines above, right?

I have written the conditions for handling line breaks.

I will be sending the patch to the mailing list after this mail.

> Can you provide a full list of checkpatch.pl findings in v5.4..v5.8
> where all the different commit 1234567890ab ("Revert "..."") variants
> in the commit message appear?
> 
> Then, we can use those commits directly as test cases for your extension?

Actually, I have made a list for some of the similar commits which are correct but
checkpatch.pl will give GIT_COMMIT_ID error on them. I have tested my patch with 30+ commits.

Here is the list of commits: 

https://gist.githubusercontent.com/eldraco19/f78e637ead0e47e1bb187f83a391a904/raw/1ee853ab1b7db86d663f6537b7c43e284e30dad2/commits.txt

Some doubts I still have:
- commit
1234567890ab ("Revert "foo bar"")

is not allowed as per the rules, right? 

- if the commit mentioned has double-quotes like:
commit 1234567890ab ("Revert "foo "lorem ipsum" bar"")

example: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-5.8.y&id=9d7c249a1ef9bf0d5696df14e6bc067004f16979

For now, checkpatch.pl is giving an error in such cases too. But there can be `n` cases like these, we 
can have so many quotes nested, so I think it's better to avoid this pattern, please give your opinions on this.

Thanks,
Ayush
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
