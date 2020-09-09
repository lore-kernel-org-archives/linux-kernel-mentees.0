Return-Path: <SRS0=P4BV=CS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E70BC2D0A8
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  9 Sep 2020 09:14:17 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D967120708
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  9 Sep 2020 09:14:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="eD5VbT/f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D967120708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=disroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 5368D2E150;
	Wed,  9 Sep 2020 09:14:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m7M++0-8o8FG; Wed,  9 Sep 2020 09:14:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 34ECF2E114;
	Wed,  9 Sep 2020 09:14:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1CEADC0859;
	Wed,  9 Sep 2020 09:14:14 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BB200C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 09:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A5FBE86FC6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 09:14:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G4y5rc1jlioV
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 09:14:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from knopi.disroot.org (knopi.disroot.org [178.21.23.139])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6EF7186FCC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 09:14:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id D9D3351C76;
 Wed,  9 Sep 2020 11:14:08 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at disroot.org
Received: from knopi.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5KiG4s1ZA_Vo; Wed,  9 Sep 2020 11:14:07 +0200 (CEST)
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1599642847; bh=2mtyDLl9AR12mnIeq4KnFjvIjLGpAe4pNB4aTwpVQS4=;
 h=Date:From:Subject:To:Cc:In-Reply-To:References;
 b=eD5VbT/ftfejlJTUA/2BrPc5th11tkaGjewyoNlUHvXB7nVjyXUuBn8E1oJzFNb3R
 wICEMdrpFL778sb0Qjh9c7gJYYXZthU+It8lyAWF2gZz9Rkr52XMIuLaFpQx70zt5B
 61G12FVBA3bXtMgK91tL/iUPrvXkmjtw4dv8zXrETHoPMKhbfxjXF+a6k8ptUCqfF5
 ouUwct9tDgWJpJ2qHCM+Fwp/m1zrz0bmdOUkpok0sfjGJg6TqBrISqYy6zcyfrzCzf
 UTpENdalaXaHbWldH/4d1sA3NkpHebT8D/FD1RHH0m3ezJnrb8A4P+kFO2tbcWxaZM
 5Osqs1mVX+RiA==
Date: Wed, 09 Sep 2020 09:14:07 +0000
From: "Ayush" <ayush@disroot.org>
Message-ID: <65d03f2a884a92f5094dc417d0bf47e0@disroot.org>
To: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
In-Reply-To: <CAKXUXMxBxyQ9KM1d92d0vGuaGRLe6+aVHa3s_O=E-YTq_jLPJA@mail.gmail.com>
References: <CAKXUXMxBxyQ9KM1d92d0vGuaGRLe6+aVHa3s_O=E-YTq_jLPJA@mail.gmail.com>
 <alpine.DEB.2.21.2008270707440.9436@felia>
 <alpine.DEB.2.21.2008221002290.12792@felia>
 <alpine.DEB.2.21.2008171142310.8645@felia>
 <20200810125354.xeijyh3v5upatrez@salamander>
 <4f5612540c184970157a98d103d7cd04@disroot.org>
 <32595de077ee7d674a628df11c58152f@disroot.org>
 <97cef44dfa6c692c20ef7a0d981e4863@disroot.org>
 <alpine.DEB.2.21.2008310702520.8556@felia>
 <a6f436fe39f48d9b7e537bdfad07fc7e@disroot.org>
 <CAKXUXMz8MphA5PYtLe_mB+3qNV-PSimmSVS2+P5vpv=4+VsBFw@mail.gmail.com>
 <8802360392ba3dd9ded3999c3f57560b@disroot.org>
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

> No, that is allowed. There can be of course a line break after commit
> and before the hash, it is just that the current checkpatch.pl script
> does not handle this case yet.
> 
> That would need improvement.

I have already sent a patch for handling quotes in commit messages.
(https://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/2020-September/004026.html)

I have created another patch which fixes line breaks after commit and
before hash.

It can handles cases like:

- commit
1234567890ab ("foo bar")

- commit
1234567890ab ("Revert "foo bar"")

But, my question is, should I send this as a new patch or append it with
my last patch and make a patch v2?
My last patch is still under review.

> I do not think that it is disallowed, but maybe a new check in
> checkpatch.pl is recommended to make aware that quotes in commit
> message subject lines cannot be properly handled and are discouraged.

So, should we give a warning if (no. of quotes > 4)?


Regards,
Ayush
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
