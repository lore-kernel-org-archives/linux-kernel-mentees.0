Return-Path: <SRS0=zqa/=NN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF8E5C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 22 Aug 2021 17:52:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DC05611AF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 22 Aug 2021 17:52:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7DC05611AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42FDB80DFB;
	Sun, 22 Aug 2021 17:52:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zj_GwBJ0EVFI; Sun, 22 Aug 2021 17:52:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 48CC680DE8;
	Sun, 22 Aug 2021 17:52:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1F424C0010;
	Sun, 22 Aug 2021 17:52:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 85670C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Aug 2021 17:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6166680DEF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Aug 2021 17:52:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M-kXY_68t19u
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Aug 2021 17:52:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 64AC080DE8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Aug 2021 17:52:22 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id x27so32823414lfu.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Aug 2021 10:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ptqPczM6h2KTMteq+cwIm1CvrZ+yK47br58x+5AZ0Zw=;
 b=PQQnbMBLRrO+8A2O/ZAmh2m6peWJLoctc7kT32sggfOPADUAU9CmYLUwXxskOKfkOT
 Yc3NCviDIgkDeVjTXAwNeiTLtutafQW6blKO2nzlmxXBdqtzFoH8Ef3Bzm+ZRYKbM4eq
 6JCJFXsdVOSf4pqm3Y0YlEM+jLn6KseEcsSmby+KRA+MhNqhD+zn0usFho460gUIduvi
 /08/SbriyW+lh/fcwZ899Nf91jW+Kig07qDbS839K6+iWryyj7/IKCLPzH9is38/wzIC
 +jjM4DCbSv0RedvTAwZbLsC7qS7lfPzzm43IPLQDpYE8FN5W0wFg8xvUDuPDxZ9RF89l
 rT5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ptqPczM6h2KTMteq+cwIm1CvrZ+yK47br58x+5AZ0Zw=;
 b=amj1hdl7d6rKWwtJbrjIrVj4fqlO9Pp3crgE2jCpxCZmSlmusoqPWyYeAdVI4Rtehc
 8JetOIeDBgNAGUa2NdIAZYJEAnv3dKct5B+MKravQDY9J1PkRmwsEy4B1p3cYLPNlZ+2
 CA1DiKtF4CPsxH7/Bpw78J0V627nfcmE3iWK9tinflMmwkR/NdKur+l8+Y0WQb/nKbtd
 PghkGyP/ANnbMgJaEeTFgjloeyvhNdBnIqLR9qe7JHAvn8JrHBpK0/O34JYh1XiMPOp/
 EySLvZ8rCqXXsOtLvbo2N4W9NUlwOcgLXC+dF3vmTV/Cfslsa1IBrm+O35GknssyPzqF
 mrkQ==
X-Gm-Message-State: AOAM533eucVl6h+yDho40R37zfIoUxyHCMj228Z3RDncjypaXwKOqDTk
 mUnBRwWVTJMNi19WFDdIHaUQworsG5+tS85AoNo=
X-Google-Smtp-Source: ABdhPJwym20L/4XZiIHmSbqd7UHC9UM2X4y5TtkcQehiNBekr81gKY7IlK8yFhcV3ScD70JzMNUIi/V9ExPjq0AOQsc=
X-Received: by 2002:a05:6512:368c:: with SMTP id
 d12mr20373025lfs.64.1629654740139; 
 Sun, 22 Aug 2021 10:52:20 -0700 (PDT)
MIME-Version: 1.0
References: <CABJPP5BCdB7CdV4q9vw7tz=8ZOWry+aoyiqpzoXqriY2-ONEhw@mail.gmail.com>
 <20210806201026.2537-1-utkarshverma294@gmail.com>
In-Reply-To: <20210806201026.2537-1-utkarshverma294@gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sun, 22 Aug 2021 23:22:08 +0530
Message-ID: <CABJPP5DF6ki2Q6PoO42sKY=N_GkJvmnjEubOEJfZDn7_ccQ11w@mail.gmail.com>
Subject: Re: [PATCH v4] Documentation: checkpatch: Add SYMBOLIC_PERMS message
To: Utkarsh Verma <utkarshverma294@gmail.com>
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

On Sat, Aug 7, 2021 at 1:41 AM Utkarsh Verma <utkarshverma294@gmail.com> wrote:
>
> Add a new message type SYMBOLIC_PERMS under the 'Permissions'
> subsection. Users should use octal permission bits instead of their
> symbolic macro names.
>

Like Lukas said, the reader could use a better explanation as to why octal
permission bits are preferred.

However, I think this message shall be fine too as it's pretty much
self-explanatory.

So, with that:

Reviewed-by: Dwaipayan Ray <dwaipayanray1@gmail.com>

> Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Signed-off-by: Utkarsh Verma <utkarshverma294@gmail.com>
> ---
>  Documentation/dev-tools/checkpatch.rst | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
> index f0956e9ea..009957cda 100644
> --- a/Documentation/dev-tools/checkpatch.rst
> +++ b/Documentation/dev-tools/checkpatch.rst
> @@ -957,6 +957,12 @@ Permissions
>      Permission bits should use 4 digit octal permissions (like 0700 or 0444).
>      Avoid using any other base like decimal.
>
> +  **SYMBOLIC_PERMS**
> +    Permission bits in the octal form are more readable and easier to
> +    understand than their symbolic counterparts.
> +
> +    See: https://lore.kernel.org/lkml/CA+55aFw5v23T-zvDZp-MmD_EYxF8WbafwwB59934FV7g21uMGQ@mail.gmail.com/
> +
>
>  Spacing and Brackets
>  --------------------
> --
> 2.17.1
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
