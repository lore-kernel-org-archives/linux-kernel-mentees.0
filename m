Return-Path: <SRS0=DUpp=CW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6091AC43461
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 13 Sep 2020 12:06:52 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A6DF2158C
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 13 Sep 2020 12:06:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="HAyul/SB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A6DF2158C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=disroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CA8F38608D;
	Sun, 13 Sep 2020 12:06:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qreQHwC0Ux6O; Sun, 13 Sep 2020 12:06:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C459385F34;
	Sun, 13 Sep 2020 12:06:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B0398C0864;
	Sun, 13 Sep 2020 12:06:49 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B32ECC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 12:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A1E19870B6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 12:06:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bMqUuEdMr7eN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 12:06:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from knopi.disroot.org (knopi.disroot.org [178.21.23.139])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 499DA870A0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 12:06:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id E59BA51C43;
 Sun, 13 Sep 2020 14:06:44 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at disroot.org
Received: from knopi.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ldix8dxj1Yb1; Sun, 13 Sep 2020 14:06:43 +0200 (CEST)
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1599998803; bh=QE/njWcWYEQkI7IpDoGM2COCkjIbp9jlIR+4N4ZwwOY=;
 h=Date:From:Subject:To:Cc:In-Reply-To:References;
 b=HAyul/SBGuFXcJnoV24bvMc2nD4T0d4+cMazCfZ2kUzNkOSFXYmxcUSJO2Jnv5/sh
 s9wIZrVq0S6ek+sA5qwuLIT+kZQc3UkIG76EFI5gQOx4Q1V7ZqK6xICXxXE3D2ouPv
 A60dVbIzBN7faGNX6G3FCaKEYORv+iLhZvJKVBwx4t8P0EoqZZ54M123GrqFfZY0jt
 1uAOiduzlr0sJt0lOHfmZ1+H90eorn+jKbH1H9zwXT9xtZr1UaetX0IpGn4mXt7iBd
 VPCCE0jERjs12oReXoDDV54o5vC4Gbrzucf0phi6dNQ71ZTUu4RMUd9rjmuID7TsKk
 GOYpwUo0BAd1A==
Date: Sun, 13 Sep 2020 12:06:43 +0000
From: "Ayush" <ayush@disroot.org>
Message-ID: <fc57f6016ed0405b87b99549e9de26fc@disroot.org>
To: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
In-Reply-To: <alpine.DEB.2.21.2009131220070.22585@felia>
References: <alpine.DEB.2.21.2009131220070.22585@felia>
 <193982aa3ddb7fcc7ee790d254cbdee0@disroot.org>
 <alpine.DEB.2.21.2009121608490.22523@felia>
 <20200912094826.150170-1-ayush@disroot.org>
 <2f6509d8dfcf8eb7322771aec1817104@disroot.org>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: handle line break
 between commit and hash value
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

> Did checkpatch.pl output on other types change?
> 
> One of the testers on this list reported that two COMMIT_LOG_LONG_LINE
> reports disappeared. That should not have happened, right?
> 
> I had a look at the checkpatch.pl output for commit 0a2bd55c194a ("dm
> integrity: document allow_discard option").
> 
> I think the reported line is wrong here.

After the patch, It reports the following line:

#6: 
Add decription of the allow_discard option added in commit

Which I think is right as the author wanted to refer commit, which started from the word "commit"
in the reported line only.

Please give your opinion on this. 


> Also, the line number for other cases have changed.


Actually I am noticing a weird thing. When I run checkpacth.pl on multiple commits using v5.7..v5.8,
It is not showing correct output, like for some commits, I can see the command when run on multiple commits
did not report an error but when I ran on that individual commit, it's reporting an error.


- Running scripts/checkpatch.pl --show-types -g v5.7..v5.8, gives (for this particular commit):

-----------------------------------------------------------------------------------------------
Commit 3dbf1ee6abbb ("pinctrl: cherryview: Add missing spinlock usage in chv_gpio_irq_handler")
-----------------------------------------------------------------------------------------------
total: 0 errors, 0 warnings, 15 lines checked

Commit 3dbf1ee6abbb ("pinctrl: cherryview: Add missing spinlock usage in chv_gpio_irq_handler") has no obvious style problems and is ready for submission.



- Running scripts/checkpatch.pl --show-types -g 3dbf1ee6abbb, gives:


ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit cdca06e4e859 ("pinctrl: baytrail: Add missing spinlock usage in byt_gpio_irq_handler")'
#11: 
cdca06e4e859 ("pinctrl: baytrail: Add missing spinlock usage in

total: 1 errors, 0 warnings, 15 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
      mechanically convert to the typical style using --fix or --fix-inplace.

Commit 3dbf1ee6abbb ("pinctrl: cherryview: Add missing spinlock usage in chv_gpio_irq_handler") has style problems, please review.



This is the reason the analysis on a large no. of commits was incorrect.

I need to investigate this more and check if it's an issue on my side or on the checkpatch.pl side.

Also, I noticed one more issue with my patch, it doesn't handle cases like:

- commit
1234567890ab ("foo
bar")


Due to this, some new GIT_COMMIT_ID errors were also reported.

So, I will try to address this in the next version.

Thanks,
Ayush
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
