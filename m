Return-Path: <SRS0=2/a+=CV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01DBEC433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 12 Sep 2020 15:39:02 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE5FF20796
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 12 Sep 2020 15:39:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="D2X/tX2i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE5FF20796
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=disroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 534BD20379;
	Sat, 12 Sep 2020 15:39:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id trER98RvF1AJ; Sat, 12 Sep 2020 15:38:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 793652034B;
	Sat, 12 Sep 2020 15:38:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 64910C0052;
	Sat, 12 Sep 2020 15:38:59 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DFB93C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 15:38:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D551D20380
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 15:38:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QRL5+h3u+xPd
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 15:38:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from knopi.disroot.org (knopi.disroot.org [178.21.23.139])
 by silver.osuosl.org (Postfix) with ESMTPS id 049EE2034B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 15:38:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id E093F52A2A;
 Sat, 12 Sep 2020 17:38:53 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at disroot.org
Received: from knopi.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sUvoO2QGr5i9; Sat, 12 Sep 2020 17:38:52 +0200 (CEST)
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1599925132; bh=f7F0VmEgpWXIJuh8IjRdd0StyKISb5dk+KbFfetBZDo=;
 h=Date:From:Subject:To:Cc:In-Reply-To:References;
 b=D2X/tX2iuj1Ik2+INLekOoX7IT/gdLz5/34MArK3QfkLFFfTdP34ZXcYPUDS4AvcT
 CHFhtd6wqIlTf30tEjDemg/4ZPlw/4BDGvRu23cgsmJqaISVCb2UWhnBsvSRJ1C171
 82d/wg5pYV6KWXUAd1kM6heTRaYGlA10UXY0E0TDSirGOTZmDusdiSRFShcWzP1o47
 qg3JmpOzfb8LaVmggZc8u0LDPg+cmoVzxxjG3ogTLDA2gpI6ZVt1yGu50c6UCXiOi4
 YxMMoM0JM6SGcQnrUhNsSq/7zUhsgvEBfzGFxTbSoyxuq/ySzb7a82rM1xDwwU8q+e
 GPpjv9nYM6zbA==
Date: Sat, 12 Sep 2020 15:38:50 +0000
From: "Ayush" <ayush@disroot.org>
Message-ID: <193982aa3ddb7fcc7ee790d254cbdee0@disroot.org>
To: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
In-Reply-To: <alpine.DEB.2.21.2009121608490.22523@felia>
References: <alpine.DEB.2.21.2009121608490.22523@felia>
 <20200912094826.150170-1-ayush@disroot.org>
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

Sir,

> I could not reproduce those numbers.
> 
> Can you share exactly what you are running? And can you share the list of
> differences in your report?
> 
> I have seen that the line number now has also changed in some cases.
> 
> We can check if the script really improves the detection or not.

I am re-evaluating my output and will give you a analysis of all commits
which are getting affected by my patch.
It will take time to run checkpatch.pl again on those commits, so I will
share as soon as it's finished.

>> my ${CONFIG_} = "CONFIG_";
>> -
>> +my $c_count = 0;
> 
> Why do you think this variable definition is supposed to be placed here?
> 
> Where are other variables with similar use defined in the checkpatch.pl
> script?

I think this variable should not be defined here, similar variables are added in
the subroutine "process".

In cases like:
- commit
1234567890ab ("foo bar")

It was checking line 1, then it was checking line 2 and then reports the error, which
should not be the case.

This variable is used to track such cases and do not check line 2 in such cases.

It need not be a global variable to work.
I will do the necessary changes in the next version.

Ayush
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
