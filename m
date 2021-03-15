Return-Path: <SRS0=ha8c=IN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C337C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Mar 2021 19:26:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6F2764F43
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Mar 2021 19:25:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6F2764F43
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4787E4AAB4;
	Mon, 15 Mar 2021 19:25:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FPzXglhCV8-U; Mon, 15 Mar 2021 19:25:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38ADC471E6;
	Mon, 15 Mar 2021 19:25:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0F255C000A;
	Mon, 15 Mar 2021 19:25:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 03CA1C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Mar 2021 19:25:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E64E183563
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Mar 2021 19:25:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=lwn.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RoTcWtRNRCvE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Mar 2021 19:25:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9401083410
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Mar 2021 19:25:52 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id A38B72C4;
 Mon, 15 Mar 2021 19:25:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A38B72C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1615836351; bh=P6fZS9Ge8p5a2gEMWcTKjltBgeGGppmH6MaIdBUw2gY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=fhmvWeKci/KsWAejS6d+VbNvx9GG6w47Mzfz6k7KSP53roiSpLmeitw6Vr4TXOdCh
 qMf7IMnK+6yWgxjiWT3C3eOnF9tUMKDbIcVOdBTYQVoJCivxejbjS/rc/1hNtU4AAd
 pxuOA54i/g2pTypnkBysyGtCwLJGHyRId896zcOmm7Ant68/Dk+QIYcnIrZ1krkYMV
 3hgr/HL5o8MOlYK0d9URDKZnKXIbGh8bnD1xSXQK9pjo8iLWVWeY3Wk/2z071n7c1p
 tUsX2P+SdgZQpHCA8l/xMHFj5wz6hvPDLXv4RJjR4VI0VcSUvd0mixbYdcsBogp0TG
 F3N3EG+NKYV+g==
From: Jonathan Corbet <corbet@lwn.net>
To: Aditya <yashsri421@gmail.com>, Markus Heiser <markus.heiser@darmarit.de>
Subject: Re: [RFC] scripts: kernel-doc: avoid warnings due to initial
 commented lines in file
In-Reply-To: <c673e76f-72db-bbee-39d6-f5428e765173@gmail.com>
References: <20210309125324.4456-1-yashsri421@gmail.com>
 <8959bf29-9ee1-6a1d-da18-f440232864f3@darmarit.de>
 <c673e76f-72db-bbee-39d6-f5428e765173@gmail.com>
Date: Mon, 15 Mar 2021 13:25:51 -0600
Message-ID: <871rcg2p8g.fsf@meer.lwn.net>
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
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

Aditya <yashsri421@gmail.com> writes:

>> The opening comment mark /** is used for kernel-doc comments [1]
>> 
>> [1]
>> https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html#how-to-format-kernel-doc-comments
>> 
>
> Hi Markus!
> That's true. But the content inside the comment does not follow
> kernel-doc format.
> For e.g., try running kernel-doc -none/man/rst on the above file in
> the example("sound/pci/ctxfi/ctresource.c").
> The starting 2-3 lines in files generally do not contain any
> struct/enum/function, etc. declaration.

The problem is that it's marked as a kerneldoc comment without actually
being one; it looks like somebody's internal corporate formatting.  The
fix is not to put a hack into kernel-doc - we have more than enough of
those in the file already!  The right thing to do is to remove the extra
"*" so that the comment doesn't look like a kerneldoc comment anymore.

Thanks,

jon
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
