Return-Path: <SRS0=5laK=KM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84395C433ED
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 17 May 2021 17:49:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 044AA6109E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 17 May 2021 17:49:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 044AA6109E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF7004013A;
	Mon, 17 May 2021 17:49:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DZl6FcpTWHPC; Mon, 17 May 2021 17:49:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id F085B4039B;
	Mon, 17 May 2021 17:49:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C948DC000E;
	Mon, 17 May 2021 17:49:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1E549C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 May 2021 17:49:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2493608B5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 May 2021 17:49:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=lwn.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M8jRTcSY6aaP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 May 2021 17:49:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 534496075E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 May 2021 17:49:10 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 3614F2E7;
 Mon, 17 May 2021 17:49:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3614F2E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1621273749; bh=iWmm4hnq2CtqA3pXgnL0gun99p0HjfnwoUQ5bnL5xUw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Dh6l9slO5Rjlx2Alqras6Ho1QBga++8vMcOzhoQq+BQYowEF3ttjETzhETTjfdVmQ
 z0UxwlG29pu7+czVO5o40Airn26gLaKCDwcCOfHtUMPh75ZoQ30WvmKu8xB1X064tf
 MGTqEPO4GK0YVwV7Ril2VTX3kyaVRFgPD0wVVKMIbYSNnuGGFLEMpskVswlDQ0EhfX
 DW2E6tbY2VfINtDO4FIjpYs500ukh0XkVb4NXfcmHrLe9NjgkclljQuDiVfc2Cnekk
 eOiuU3zgf7sN8CqdSD9gEgURb6Q1V2Xr2PkaW6KFhhWuzu+cT9XePDAPhwrnNVMXsX
 X/2KK8OeVnODQ==
From: Jonathan Corbet <corbet@lwn.net>
To: Aditya Srivastava <yashsri421@gmail.com>
Subject: Re: [RFC v4] scripts: kernel-doc: reduce repeated regex expressions
 into variables
In-Reply-To: <20210514144244.25341-1-yashsri421@gmail.com>
References: <87bl9ujy2r.fsf@meer.lwn.net>
 <20210514144244.25341-1-yashsri421@gmail.com>
Date: Mon, 17 May 2021 11:49:08 -0600
Message-ID: <878s4d45ez.fsf@meer.lwn.net>
MIME-Version: 1.0
Cc: linux-doc@vger.kernel.org, yashsri421@gmail.com,
 linux-kernel@vger.kernel.org, willy@infradead.org,
 linux-kernel-mentees@lists.linuxfoundation.org
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

Aditya Srivastava <yashsri421@gmail.com> writes:

> There are some regex expressions in the kernel-doc script, which are used
> repeatedly in the script.
>
> Reduce such expressions into variables, which can be used everywhere.
>
> A quick manual check found that no errors and warnings were added/removed
> in this process.
>
> Suggested-by: Jonathan Corbet <corbet@lwn.net>
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
> Changes in v4:
> - Fix htmldocs warning at function parsing, involving repeated $type2 identifiers capture
> - Re-tested against all files in kernel tree

Applied, thanks for stickint with this.

jon
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
