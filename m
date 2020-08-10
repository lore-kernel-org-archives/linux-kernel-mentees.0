Return-Path: <SRS0=Vbn0=BU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5062AC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Aug 2020 18:44:23 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CD1322B4E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Aug 2020 18:44:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="n2rI8nqq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CD1322B4E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C78EA8761E;
	Mon, 10 Aug 2020 18:44:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZBdfPH7RRf3a; Mon, 10 Aug 2020 18:44:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 23556875FD;
	Mon, 10 Aug 2020 18:44:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1352DC013C;
	Mon, 10 Aug 2020 18:44:20 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C5908C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 18:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C204B85A74
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 18:44:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S03uSm0AMQmV
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 18:44:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0B21685A4B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Aug 2020 18:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=PzoXtefc2xa4aDuZ2kahfOK5e4Ic5jpl/FUwSRINSMw=; b=n2rI8nqq9g27Fx4PaBWbXc/5s8
 MaiThRqzynKZI8KRWOT5ciRt4PXAjekSHawWYDocen++frKVMugPmyz5D6d3GgJzzx3w7w4Z115E8
 d7DwQSrgdfEKHY4tZagFh+nlwA9YjlSYXRyt9ahdq1JFk/ppXj+3UZjW7ETam/VVydw4Qzyl/opYq
 GBMkv5SglxD4anzP1i1RZ4JdXYwLvWUTUuUx0n2cxlDtrXRyzEy3XYJVHutecQg8mSBi/DxKS5hVU
 ayW1wfVR3fext3XddEbN1u4U91HkvNRoLew+qr8qplaRy4Hmox7Vjcoj3W1OTheKNs12y+Vp0zsUf
 2xtCPMRw==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1k5CmL-0008PC-DZ; Mon, 10 Aug 2020 18:44:13 +0000
Date: Mon, 10 Aug 2020 19:44:13 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Puranjay Mohan <puranjay12@gmail.com>
Message-ID: <20200810184413.GO17456@casper.infradead.org>
References: <20200810182107.18577-1-puranjay12@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200810182107.18577-1-puranjay12@gmail.com>
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-doc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>
Subject: Re: [Linux-kernel-mentees] [PATCH] Driver-API: Documentation:
 Replace deprecated :c:func: Usage
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

On Mon, Aug 10, 2020 at 11:51:07PM +0530, Puranjay Mohan wrote:
> Replace :c:func: with func() as the previous usage is deprecated.

Generally, reflowing text as part of these patches is discouraged,
but I'd make an exception here:

> @@ -135,15 +135,15 @@ Accessing Port Space
>  
>  Accesses to this space are provided through a set of functions which
>  allow 8-bit, 16-bit and 32-bit accesses; also known as byte, word and
> -long. These functions are :c:func:`inb()`, :c:func:`inw()`,
> -:c:func:`inl()`, :c:func:`outb()`, :c:func:`outw()` and
> -:c:func:`outl()`.
> +long. These functions are inb(), inw(),
> +inl(), outb(), outw() and
> +outl().

...
+long. These functions are inb(), inw(), inl(), outb(), outw() and outl().

The others are more of a judgement call where we could go either way.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
