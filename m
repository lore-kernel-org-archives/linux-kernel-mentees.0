Return-Path: <SRS0=ZEDA=M4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71235C432BE
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  5 Aug 2021 13:40:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2818F61178
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  5 Aug 2021 13:40:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2818F61178
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E664383794;
	Thu,  5 Aug 2021 13:40:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oK4cDsZSGa5Z; Thu,  5 Aug 2021 13:40:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2E8208376B;
	Thu,  5 Aug 2021 13:40:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 10A6DC001A;
	Thu,  5 Aug 2021 13:40:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5D5FCC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Aug 2021 13:40:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 404D58377F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Aug 2021 13:40:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3oeKaHXot54F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Aug 2021 13:40:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 350D28376B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Aug 2021 13:40:10 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id bq29so11195776lfb.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 05 Aug 2021 06:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vG+uX8wXA/pxPFsXZpKGuN5nShvzJaUdlnmdP9WwPrw=;
 b=fphdh6scSaC2lzEPq6GnxKfAfdOZn2KVSL8+1Sv8/zjKYwHrAdSGBQMxKoOA47bs4q
 jhFZMVURKO3JrKkkR46TTK4yGEhSeLjW3SztDnRESeuJowXMZtwenYcVA2emtaFfvTn+
 9i54F9TIc/ka5kt8dP6vrzhMoskEHy0a/g6o/fk6goy9TQe+jVgLAorZh3bekRudjxrY
 yaPPLP31wgGY2Zi51l6sKV4MxWVsjPGRZSLFHIaXnmyBN4r54+LsVCnco0XU8d7l5tdl
 oOx5KZdK4rD94MzlwMAd7etDEskxXArOPIVI2dUEhhZRCOHXJlIgPVxaArjmGT/n9MOL
 pOTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vG+uX8wXA/pxPFsXZpKGuN5nShvzJaUdlnmdP9WwPrw=;
 b=I0mwcID1Tgc/et6D2IEJw4j+AwKzOvV3cE1JmMo5Hv2cyy2uRVP6/QXDj6cjR0NJ1i
 xea+v9fWhVOb+Md0a2xrMpMTCAMw7GeIECPtxAEHtjaCKB4EBLw6+GP1CwlbEhQrd1Rj
 pkc/XmyRoO8X0xLs7E8xEb+KsMM2R/LzuujayGAUmg/15XgOZAp80sxAUpb+ohjvHZg9
 3nJG0wkj05dqKfdnaiFi5WCF1Yc8+wORWBkpehhhM1RzoszIvcNB9XuJZ0mNVE/9YfOS
 zl9SzgHhBQaMqPzVMb/qNzYIik3aXK+SeB17x0QBBgMOVzU+Ok7hmqtToCsHrn6FL/3Q
 zAIQ==
X-Gm-Message-State: AOAM532zftNPkmdqMzbRSd+lG6WYYR2Nz73g21Fe4nGvbuXKIABjFFyi
 3pdRkWioCjuaQRhzwAJLetjv4yEjwazo4p7qa1Q=
X-Google-Smtp-Source: ABdhPJxkjZK4bYx5bGz3JktgYlzEwqBomZ2CJ4XPs3HBobthYrVDgTcxNuN0Jr3LzOt86YZJVyDPXonGT/gbPztu4sE=
X-Received: by 2002:a05:6512:455:: with SMTP id
 y21mr3814939lfk.246.1628170805877; 
 Thu, 05 Aug 2021 06:40:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210805104946.17500-1-vineshraut2017@gmail.com>
In-Reply-To: <20210805104946.17500-1-vineshraut2017@gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Thu, 5 Aug 2021 19:09:53 +0530
Message-ID: <CABJPP5BN9MBxTUFQ=rw5wucKkTBnW0bWgyqqN2AZbfWjBcsnBg@mail.gmail.com>
Subject: Re: [PATCH] Documentation: Checkpatch.rst: Doc added UNNECESSARY_CAST
To: Vinesh Raut <vineshraut2017@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

On Thu, Aug 5, 2021 at 4:21 PM Vinesh Raut <vineshraut2017@gmail.com> wrote:
>
> Documentation was missing for UNNECESSARY_CAST Warning.
> Added it to checkpatch.rst with refers from https://lore.kernel.org
> Also, pointers been mentioned in Documentation

This message isn't particularly useful.
A simple:

Add verbose description for UNNECESSARY_CAST message type.

would have worked.

>
> Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Signed-off-by: Vinesh Raut <vineshraut2017@gmail.com>
> ---
>  Documentation/dev-tools/checkpatch.rst | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
> index f0956e9ea2d8..72c2f32b1515 100644
> --- a/Documentation/dev-tools/checkpatch.rst
> +++ b/Documentation/dev-tools/checkpatch.rst
> @@ -268,6 +268,16 @@ Allocation style
>
>      See: https://www.kernel.org/doc/html/latest/core-api/memory-allocation.html
>
> +   **UNNECESSARY_CASTS**
> +      Any alloc functions should not be cast. Because they usually returns the
> +      void pointer, which compiler then implicitly picks the type of pointer at

s/returns/return

The sentence sounds weird. Maybe refactor it a bit?

> +      run time. Hence, casting is not prefer on any alloc functions. cast may
> +      hide bugs if any exist, as compiler supresses the warnings after casting.

Here too. Simpler sentences are preferred.

> +
> +      See:
> +      http://c-faq.com/malloc/mallocnocast.html

Let's not use this link here. External websites are vulnerable to change.
However lore.kernel.org links are okay.

> +      https://lore.kernel.org/lkml/20070808024321.GA6316@redhat.com/
> +      https://lore.kernel.org/lkml/a5e60a2b93e10baf84af063f6c8e56402273105d.camel@perches.com/
>

You can enumerate these. See the format followed by other verbose
descriptions.

Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
