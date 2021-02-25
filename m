Return-Path: <SRS0=c32l=H3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7B3CC433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 25 Feb 2021 21:16:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41ADD64EBA
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 25 Feb 2021 21:16:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41ADD64EBA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E086C43306;
	Thu, 25 Feb 2021 21:16:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q_5r3qDb-Rx1; Thu, 25 Feb 2021 21:16:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 193ED43300;
	Thu, 25 Feb 2021 21:16:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EB5BCC000B;
	Thu, 25 Feb 2021 21:16:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7460DC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Feb 2021 21:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 53D6C84058
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Feb 2021 21:16:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=lwn.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Unm0UHqlnhUd
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Feb 2021 21:16:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0A0E284056
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Feb 2021 21:16:13 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 45E198B2;
 Thu, 25 Feb 2021 21:16:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 45E198B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1614287773; bh=HXpU5t4ZCsLP8BkNSkXT52ij4c0xZVCAGleignyH9bg=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ABQS9PRvrjPCv+E6gZQLBMdV5A2FJVPv3sJNXZa96r/K8dhE4XCb+R0woxkawPqMn
 ziNBF7D6cDFnYnFqptQuIv7vQq/TnfkIaCkDqKpUCMOzAEqs/GWP85oevPvJagIFHl
 dT8SyzvvMyaey2bRPLIP5HHCcEoPCZzRdbPj4Q8ZTep2anqHTO7FItElfSQXXFPrqO
 /6pdiZNKelme2tLDcF38+AAoXMm09JRgGjD2gg59xkiPTeTV5dQ10HWashMAvMKyDj
 HmGafbew6zeDLFWTWpK3xCMCCoEHfR9uDCULBlOAqjQdZOk53OaagBv61WaKQvuqQE
 bJVkswBCvH1Vg==
From: Jonathan Corbet <corbet@lwn.net>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>, Joe Perches <joe@perches.com>
Subject: Re: [PATCH v7 0/2] checkpatch: add verbose mode
In-Reply-To: <CABJPP5AARO3h2mt-piPWuOD3kY_XzNfW-s2mi=btfOayVPURHg@mail.gmail.com>
References: <20210222075205.19834-1-dwaipayanray1@gmail.com>
 <bcee822d1934772f47702ee257bc735c8f467088.camel@perches.com>
 <CABJPP5AARO3h2mt-piPWuOD3kY_XzNfW-s2mi=btfOayVPURHg@mail.gmail.com>
Date: Thu, 25 Feb 2021 14:16:12 -0700
Message-ID: <87mtvrc0gz.fsf@meer.lwn.net>
MIME-Version: 1.0
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
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

Dwaipayan Ray <dwaipayanray1@gmail.com> writes:

> On Thu, Feb 25, 2021 at 11:03 PM Joe Perches <joe@perches.com> wrote:
>> I don't have any real objection to this patch set, but as this
>> might be added to the Documentation tree and in .rst format,
>> perhaps Jonathan Corbet and/or Mauro Carvalho Chehab might have
>> some opinion.
>>
>> Also I do not want to be a maintainer of this .rst file and
>> likely neither Jon nor Mauro would either.  Perhaps you?
>>
>
> I could take it up if everybody is okay with it!
>
>> Ideally, the patch order would be reversed so the .rst file
>> is added first, then checkpatch updated to use it.
>>
>
> Sure, if Jonathan or Mauro has no objections to it, I will be happy
> to resend it so that it can be picked up properly.

So I haven't been copied on this for a while.  Looking in the archives,
I see that you have a manual table of contents at the top of the
document; you could take that out and let Sphinx generate it (and keep
it current!) for you.

Either way, though, if you want to merge this via some other path, it's
OK by me:

Acked-by: Jonathan Corbet <corbet@lwn.net>

Thanks,

jon
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
