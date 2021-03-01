Return-Path: <SRS0=9x8T=H7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3857FC433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  1 Mar 2021 21:51:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4A7F60231
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  1 Mar 2021 21:51:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4A7F60231
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8685F6067F;
	Mon,  1 Mar 2021 21:51:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XvTyR-e3D-7d; Mon,  1 Mar 2021 21:51:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEAE260697;
	Mon,  1 Mar 2021 21:51:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9A311C000B;
	Mon,  1 Mar 2021 21:51:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 16264C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Mar 2021 21:51:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC1FB60697
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Mar 2021 21:51:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o5bwcSSujmzY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Mar 2021 21:51:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 73FDC6067F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Mar 2021 21:51:46 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id BC63E2B8;
 Mon,  1 Mar 2021 21:51:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net BC63E2B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1614635505; bh=7QCiNeV/LGx+Kezp++PV+sgJR5/h7g4Lbc34vL/8M5s=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=gZ/Kt8NN2Vb1oGoXs3Q0bIixByIlGIlihtkjAUgBcXVLQ2Ewl5HbDG1rWY/CNHhkQ
 FLLNJdBvha8CxdZCDXVcs8VCqar3+8YZH3SKmMWAvsv4UmajSQpGuCTxRz8SkHpvFa
 JO5G/CiECqKGJkwHMWuGdywEt6lMURtKiwVDqk5b7igOaozdRwUqEbXct+5DcdZkP4
 zr7Tn0ZdnlJtXqAZYToGUjZwqYFEX9UYz4eDhuHfI2a6EUDrbINCwIhKksNjikXjTx
 8+ISYgkWcR7POvqPkg71rsmb53fUcRyzlZYO25r29rkhcP+6TlQB8o552yKZCQgOQM
 icLzFJs8ptgQg==
From: Jonathan Corbet <corbet@lwn.net>
To: Aditya Srivastava <yashsri421@gmail.com>
Subject: Re: [RFC v3] scripts: kernel-doc: fix typedef support for
 struct/union parsing
In-Reply-To: <20210225145033.11431-1-yashsri421@gmail.com>
References: <CAKXUXMzHPnM=ie06ZGuFXyJ7RcRjYomjyASbp3ND9-Mb2Es+2w@mail.gmail.com>
 <20210225145033.11431-1-yashsri421@gmail.com>
Date: Mon, 01 Mar 2021 14:51:44 -0700
Message-ID: <87pn0i35lb.fsf@meer.lwn.net>
MIME-Version: 1.0
Cc: linux-doc@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, yashsri421@gmail.com
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

> Currently, there are ~1290 occurrences in 447 files in the kernel tree
> 'typedef struct/union' syntax for defining some struct/union. However,
> kernel-doc currently does not support that syntax. Of the ~1290
> occurrences, there are four occurrences in ./include/linux/zstd.h with
> typedef struct/union syntax and a preceding kernel-doc; all other
> occurrences have no preceding kernel-doc.
>
> Add support for parsing struct/union following this syntax.
>
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>

Applied, thanks.

jon
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
