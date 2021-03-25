Return-Path: <SRS0=iE2U=IX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46DBDC433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 25 Mar 2021 17:48:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D684261A23
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 25 Mar 2021 17:48:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D684261A23
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7584F40E63;
	Thu, 25 Mar 2021 17:48:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fy4qyg2Q4r0d; Thu, 25 Mar 2021 17:48:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 388A140645;
	Thu, 25 Mar 2021 17:48:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 17398C000D;
	Thu, 25 Mar 2021 17:48:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 379A1C000A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Mar 2021 17:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 271C0401DA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Mar 2021 17:48:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=lwn.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Koofmi8hleTD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Mar 2021 17:48:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 296BB40191
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Mar 2021 17:48:14 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 3E5AE31A;
 Thu, 25 Mar 2021 17:48:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3E5AE31A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1616694494; bh=1B890Iy2jDxHXnAfsSRVgQsOzs8wckrMqh8VbJvh/MY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Tteod0QDH1rCSgf1AUuTLlve0npQBxvY/lUJq2h3zTcrQce2ZfbA19LpyoBNqGivg
 mSNP5OIee3NzAEY4M9eD8UrKuWQkfa84KwVtuTj9xwIOeC1pweyvpMUOmh+ZW9YcIS
 6n18ZWU6BMncWl3VAHnm4dPuD3Eit64aDXXEGgnwul9UYP1Wg2DKppjN1u3lSGJUhT
 jd8oNQWA3xh4YlaqjL5b5rObM+owYmYLQO3yJFOspXcLvL34DRK2PlLF3w6XZXdTzN
 L9RL5Cg5ztgtg6tgDpgWCbvvpNxiM3IOSY+6SFgFvcLBjmU7lYka9sgqORgefFmTyA
 h8NiaDRnhLwHw==
From: Jonathan Corbet <corbet@lwn.net>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>, mchehab@kernel.org
Subject: Re: [PATCH -next v4] docs: document all error message types in
 checkpatch
In-Reply-To: <20210322082139.33822-1-dwaipayanray1@gmail.com>
References: <20210322082139.33822-1-dwaipayanray1@gmail.com>
Date: Thu, 25 Mar 2021 11:48:13 -0600
Message-ID: <87sg4j15wi.fsf@meer.lwn.net>
MIME-Version: 1.0
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
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

> All the error message types now have a verbose description.
>
> Also there are two new groups of message types:
>
> - Macros, Attributes and Symbols
> - Functions and Variables
>
> Rearrange the message types to fit these new groups as needed.
>
> Reviewed-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> ---
>
> Changes in v4:
> - Use lore.kernel.org links
> - modify explanation for DEFINE_ARCH_HAS
>
> Changes in v3:
> - Add more explanation for LOCKDEP
> - Minor grammar fixes
>
> Changes in v2:
> - Replace 4.10 kernel doc links by latest
>
>  Documentation/dev-tools/checkpatch.rst | 318 ++++++++++++++++++++++---
>  1 file changed, 280 insertions(+), 38 deletions(-)

Applied, thanks.

jon
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
