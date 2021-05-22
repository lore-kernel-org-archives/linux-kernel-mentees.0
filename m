Return-Path: <SRS0=hd2V=KR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4FCFC2B9F2
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 May 2021 15:15:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47A9E61131
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 May 2021 15:15:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47A9E61131
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0697F4019A;
	Sat, 22 May 2021 15:15:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u8OiUMoTyI0t; Sat, 22 May 2021 15:15:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id D19764015B;
	Sat, 22 May 2021 15:15:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9C76DC000E;
	Sat, 22 May 2021 15:15:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 39045C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 May 2021 15:15:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2715E4029B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 May 2021 15:15:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IUDuwcBzi80U
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 May 2021 15:15:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 545124016B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 May 2021 15:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=M8xEYJUOS1PH8zqwRp4HnULXuuhN/mYcj4cUJQVCOX8=; b=LnPT1shAR3Mz03jGrAq1VIYXDy
 wTIBxj+XN+tZ+tm3MFi0vs28hDbfUOGVK5k+GuCpdmM7nq1tDLRp8uorsCO//5d7VQq9JcgeEFuCV
 jbN9o4lXwLL/Tk0eZV1XjQ9GFxYamuRUQY5oSt1xGLmIkGXMnTlFD8yrRUl7kuxuGayIn1JdMHOO7
 1tp8IASsKV+YP/Itu4JI+2SrmNSW1fU9QTV2hi4ZCiu8c0AQgfFF9bvaYNqczbePgcKwLp8Bm7acK
 45CGZdU6/i3B2+Ur82wgfAFpxmdD+s5unpQCJBEte4O+CUmAOfBKzuNaTFQgPM7oYOKfOA37qwm37
 xXkiZVzw==;
Received: from [2601:1c0:6280:3f0::7376]
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lkTLG-0008dF-Em; Sat, 22 May 2021 15:15:06 +0000
Subject: Re: [PATCH v2] f2fs: fix kernel-doc syntax and remove file name from
 file header
To: Aditya Srivastava <yashsri421@gmail.com>, jaegeuk@kernel.org
References: <d1e7aaa1-4f59-2480-003d-5a5a37443c75@infradead.org>
 <20210522114351.9538-1-yashsri421@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <d9d527e1-f23e-c8a1-cc80-be8a445457cc@infradead.org>
Date: Sat, 22 May 2021 08:15:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210522114351.9538-1-yashsri421@gmail.com>
Content-Language: en-US
Cc: linux-doc@vger.kernel.org, chao@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net,
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

On 5/22/21 4:43 AM, Aditya Srivastava wrote:
> The opening comment mark '/**' is used for highlighting the beginning of
> kernel-doc comments.
> The header for include/linux/f2fs_fs.h follows this syntax, but the
> content inside does not comply with kernel-doc.
> 
> This line was probably not meant for kernel-doc parsing, but is parsed
> due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
> causes unexpected warning from kernel-doc:
> warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>  * include/linux/f2fs_fs.h
> 
> Provide a simple fix by replacing this occurrence with general comment
> format, i.e. '/*', to prevent kernel-doc from parsing it.
> 
> Also remove the redundant file name from the comment headers.
> 
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
> Changes in v2:
> - Remove file name information from header comments, as suggested by Randy
> 
>  include/linux/f2fs_fs.h | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
> index 5487a80617a3..b5a081aa86c4 100644
> --- a/include/linux/f2fs_fs.h
> +++ b/include/linux/f2fs_fs.h
> @@ -1,7 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0
> -/**
> - * include/linux/f2fs_fs.h
> - *
> +/*
>   * Copyright (c) 2012 Samsung Electronics Co., Ltd.
>   *             http://www.samsung.com/
>   */
> 


-- 
~Randy

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
