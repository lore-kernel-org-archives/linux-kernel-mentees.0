Return-Path: <SRS0=uiI8=IG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBD81C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  8 Mar 2021 23:52:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 302B665256
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  8 Mar 2021 23:52:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 302B665256
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D115D4014E;
	Mon,  8 Mar 2021 23:52:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ttVcZsFNqxwj; Mon,  8 Mar 2021 23:52:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 05AE54013B;
	Mon,  8 Mar 2021 23:52:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D28FDC000A;
	Mon,  8 Mar 2021 23:52:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2AC94C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  8 Mar 2021 23:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0BFAE6F5BD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  8 Mar 2021 23:52:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=lwn.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BFxMGLSy4b0x
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  8 Mar 2021 23:52:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6199B605C8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  8 Mar 2021 23:52:28 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 8905531A;
 Mon,  8 Mar 2021 23:52:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8905531A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1615247547; bh=xycfLJzH7pyVas2pNH0j+dx9g9bv6bAMeFDksMNb4Uc=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=OvY6G/WUvcr+5e7M4xo/eAnb2UeGdKtAJCIOB+Ep2KvkIqB722yBgRhHgfKImretx
 JZMnj9AXBbIvSsc02Ojls+pm/hqBnRbjYi7xOpZi245LLrJtOEPEuAI+IKyGttphLJ
 KLneNYEhvSJH5c01/Wpk4JbnKpeyRyncUUJDa+OugeEx6mxiQxXdLGeQZRnxE5bMQQ
 BL8hW5HsBzTfH4BhXhEDUpmHI9B8bTbkfLErwR6mrmBz0qTvu34zzNeNbXxgc+WhA8
 cIhBHCVcC32POwCErCVTTTyL8rUPTAZHbf+Ss95KbGQ4OCSSjH2f7SzzF0k8/QIolf
 aH0/J0jKE3zgA==
From: Jonathan Corbet <corbet@lwn.net>
To: Aditya Srivastava <yashsri421@gmail.com>
Subject: Re: [RFC v2] scripts: kernel-doc: fix attribute capture in function
 parsing
In-Reply-To: <20210306113510.31023-1-yashsri421@gmail.com>
References: <CAKXUXMwoYa6xbCsqnUYL5uSA71h_3xV7-8erF6XTpmkck8ozaw@mail.gmail.com>
 <20210306113510.31023-1-yashsri421@gmail.com>
Date: Mon, 08 Mar 2021 16:52:27 -0700
Message-ID: <8735x56w5g.fsf@meer.lwn.net>
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

> Currently, kernel-doc warns for function prototype parsing on the
> presence of attributes "__attribute_const__" and "__flatten" in the
> definition.
>
> There are 166 occurrences in ~70 files in the kernel tree for
> "__attribute_const__" and 5 occurrences in 4 files for "__flatten".
>
> Out of 166, there are 3 occurrences in three different files with
> "__attribute_const__" and a preceding kernel-doc; and, 1 occurrence in
> ./mm/percpu.c for "__flatten" with a preceding kernel-doc. All other
> occurrences have no preceding kernel-doc.
>
> Add support for  "__attribute_const__" and "__flatten" attributes.
>
> A quick evaluation by running 'kernel-doc -none' on kernel-tree reveals
> that no additional warning or error has been added or removed by the fix.
>
> Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
> Changes in v2:
> - Remove "__attribute_const__" from the $return_type capture regex and add to the substituting ones.
> - Add support for "__flatten" attribute
> - Modify commit message
>
>  scripts/kernel-doc | 2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks.

jon
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
