Return-Path: <SRS0=B4mk=H4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E9F6C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 26 Feb 2021 08:37:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8CFF64EE3
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 26 Feb 2021 08:37:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8CFF64EE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97B3E8414E;
	Fri, 26 Feb 2021 08:37:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rGKHsOas9p5o; Fri, 26 Feb 2021 08:37:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F0E984150;
	Fri, 26 Feb 2021 08:37:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 77D53C000A;
	Fri, 26 Feb 2021 08:37:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6729BC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Feb 2021 08:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40B1B4EF58
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Feb 2021 08:37:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n9RWeCpSog7h
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Feb 2021 08:37:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E1E634EF54
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Feb 2021 08:37:13 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id u4so9721803lja.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Feb 2021 00:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jSZBqZAXKahwfjTFGR80Ph8JTZn6RkUpzBNuGwlAGdI=;
 b=gfVIEn0beAIzxTVbSLHOYYvkrceeXVeuGg7fF498f0/AzHxE28/Ozur2NMncMjnPGQ
 oxvslqVUlxCf1d0tn29rQYQ92y7Dwu46eErFrnLly48vf3KhFy4v1UIvWfDEmRxsbmgB
 Zw5rjDOj6XKB5MYum4ES7bZK4643V0faI8kB3PNMowmZ4z/UiUBcuwBaGDYD3B2GE1bH
 dzEBfGqkwK3LOMiEcYbF3ebaR3obGrSiVe6JNyHQsXR7BjbUvvxsOdO+6MHMEieyUKJf
 mDtUmUWegsz4po7HIZvChnujfU8FdigZGmQqsiAeeTrWz6vjV73ri18uvJF9P/aZiYwi
 0Zxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jSZBqZAXKahwfjTFGR80Ph8JTZn6RkUpzBNuGwlAGdI=;
 b=Xum8g7eMGssDWARES3BwBzB94aVzRidqvmOFU4dByrH6bEwVHyxs6fWhyjvwQ/h1AF
 34Jx0jP4WjJejRPk4vIhGZrxir5GVeav5McWiffFtd+Jrna64KTM3LazH/v+IxnuugXA
 H73PKpPEoURVyLpCteEQepx78JjjoXHC0qsX7rC4AQKWffV0Gvd2Wdcs8pxvzM9zqiG2
 ljedd4uVrjcNPNnkwZ42j1CZjSTNUq0dWU2lq4R9BHcaNYYmTGGanNDFArCm7hpp67VE
 rD9+OVTX0dQ3MOqAcgrUzMlWQH79IbQxtHltz++2XKOJmxx9HIM0EAs3njUQtdpPsC7r
 sASQ==
X-Gm-Message-State: AOAM530qmgYGUkT0RPTNTlOkk5uj8ZVATYNoCfuxSls+Yqpqojxiz1ml
 It+kT0ZpyXtUhRbcnyYsVdvMT2nN6PZtMcjdxr8=
X-Google-Smtp-Source: ABdhPJwq5DG6Je3O4p6W7g8qgiWIQD4z9T1oUesfkIf9Sl8aSAeRZk6isjff68ct9wosc259MA1cNg5OImBP3W2znfA=
X-Received: by 2002:a2e:b814:: with SMTP id u20mr1091741ljo.370.1614328631073; 
 Fri, 26 Feb 2021 00:37:11 -0800 (PST)
MIME-Version: 1.0
References: <20210226064029.1143-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20210226064029.1143-1-lukas.bulwahn@gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Fri, 26 Feb 2021 14:07:11 +0530
Message-ID: <CABJPP5CZMecYBy3026JwTTW1d5zGp84xS0XiFFoarMVwUGDdDQ@mail.gmail.com>
Subject: Re: [PATCH for Dwaipayan] MAINTAINERS: clarify responsibility for
 checkpatch documentation
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Joe Perches <joe@perches.com>,
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

On Fri, Feb 26, 2021 at 12:10 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> As discussed, Dwaipayan and Lukas take the responsibility for maintaining
> the checkpatch documentation that is currently being built up.
>
> To be sure that the checkpatch maintainers and the corresponding
> documentation maintainers can keep the content synchronized, add them as
> reviewers to the counterpart.
>
> Link: https://lore.kernel.org/lkml/bcee822d1934772f47702ee257bc735c8f467088.camel@perches.com/
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> applies cleanly on next-20210226
>
> Dwaipayan, you probably want to add this patch to your patch series for checkpatch
> documentation.
>
Sure I will add it to my series.

Thanks,
Dwaipayan.

> Feel free to add your Signed-off-by tag just following mine.
>
>  MAINTAINERS | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 16ada1a4b751..6b48b79ba284 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4181,9 +4181,18 @@ X:       drivers/char/tpm/
>  CHECKPATCH
>  M:     Andy Whitcroft <apw@canonical.com>
>  M:     Joe Perches <joe@perches.com>
> +R:     Dwaipayan Ray <dwaipayanray1@gmail.com>
> +R:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
>  S:     Maintained
>  F:     scripts/checkpatch.pl
>
> +CHECKPATCH DOCUMENTATION
> +M:     Dwaipayan Ray <dwaipayanray1@gmail.com>
> +M:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
> +R:     Joe Perches <joe@perches.com>
> +S:     Maintained
> +F:     Documentation/dev-tools/checkpatch.rst
> +
>  CHINESE DOCUMENTATION
>  M:     Harry Wei <harryxiyou@gmail.com>
>  M:     Alex Shi <alex.shi@linux.alibaba.com>
> --
> 2.17.1
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
