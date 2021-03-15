Return-Path: <SRS0=ha8c=IN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4DA3C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Mar 2021 08:02:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84F3464E49
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Mar 2021 08:02:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84F3464E49
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50D5A4954E;
	Mon, 15 Mar 2021 08:02:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id psexgmCl--sD; Mon, 15 Mar 2021 08:02:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4600249B64;
	Mon, 15 Mar 2021 08:02:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 25342C000A;
	Mon, 15 Mar 2021 08:02:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9E174C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Mar 2021 08:02:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8BE6640146
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Mar 2021 08:02:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hJiMS05cahGw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Mar 2021 08:02:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0140D4016C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Mar 2021 08:02:07 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id a7so32354766iok.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Mar 2021 01:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tqMwSsxE8mSsOZPr95VkNebuiZwi7tRKMS9S8b6s9Z4=;
 b=XaFtGW31ERcEkEBmeuxVBQMgfDZzcM7jLzZ2lxTuy48U6hIHhrgaBBXd/9RZ5ZyLHE
 m7uDowuJ1+i9fVsBYUvzPkSOxrHjS8pO+sIIN4YZHkErzAAMalREgcaVDKq+i8D4zWZR
 a/yH+Z2RpMsOMih5g41EzlrbFKjZ4oXMOFXQxzLuKZHUNkGD1faHt3GCuCXKnCnvKobQ
 Pjl5Fl0FBHw8fZsN1cW14dVc3ELjvGhBoX9Q5qM+C3+A2zqa7sPmF3F96vzsRP8Zko5o
 OOm1cjB7i8WzzWqnWZUHtAowiURhqlsBN+oTYhrR0tKTcmKsdbUn3ezhy8mQw6x7fOzd
 aC6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tqMwSsxE8mSsOZPr95VkNebuiZwi7tRKMS9S8b6s9Z4=;
 b=XxFP7vvVtyZaDAUYz045Z+WuR8Hs3PUOmMHBXV0tHfqiso4Li8MZ4XaRq30ALZpZgZ
 zr+nqdZxHCbZZQIX1nH3ID8YVLoNZQUIDTlXq8AWs0AfLwFNHMpVCJJfM+S5R3EvD2Wz
 4Cd0CMOVGU16MlOkRigLRPasTfos7CRzQ1j95S1qFfYuIXXYcr3niLUUKpowgYXlsc+S
 yZqiLG7s+8ePxleNU0EbVPmy4bVvLr8r2yeBmjSGNkYUMF/ro55o6+nJIq3yJ1QTU73P
 j3bYK1FgdquQbhVtF3yAU8s0MTFqZeK0tkREMjnR3KoPBUBTmuXfJgBAspMEI7fRafhL
 zAsA==
X-Gm-Message-State: AOAM5307T1/WweKNFKbYaWIBEgs2z4nOYZcyRulYPSbH5oRUoZ8nL16r
 874oWeR24yC2tx55PX3aGSd1AcSkCy0igzUIrkg=
X-Google-Smtp-Source: ABdhPJwQiYkuELW/9smSceH+H6tbTZaziR6zdehTzqcKsNFxphJsP1z9Jk3ej+O9RkGa5WpzAuPeRZ0ptaBZXwPlggY=
X-Received: by 2002:a02:6a14:: with SMTP id l20mr8693220jac.12.1615795327125; 
 Mon, 15 Mar 2021 01:02:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210314201818.27380-1-yashsri421@gmail.com>
In-Reply-To: <20210314201818.27380-1-yashsri421@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 15 Mar 2021 09:01:56 +0100
Message-ID: <CAKXUXMzH-cUVeuCT6eM_0iHzgKpzvZUPO6pKNpD0yUp2td09Ug@mail.gmail.com>
Subject: Re: [PATCH 00/10] rsi: fix comment syntax in file headers
To: Aditya Srivastava <yashsri421@gmail.com>
Cc: Netdev <netdev@vger.kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, amitkarwar@gmail.com,
 siva8118@gmail.com, Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 David Miller <davem@davemloft.net>, kvalo@codeaurora.org
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

On Sun, Mar 14, 2021 at 9:18 PM Aditya Srivastava <yashsri421@gmail.com> wrote:
>
> The opening comment mark '/**' is used for highlighting the beginning of
> kernel-doc comments.
> There are files in drivers/net/wireless/rsi which follow this syntax in
> their file headers, i.e. start with '/**' like comments, which causes
> unexpected warnings from kernel-doc.
>
> E.g., running scripts/kernel-doc -none on drivers/net/wireless/rsi/rsi_coex.h
> causes this warning:
> "warning: wrong kernel-doc identifier on line:
>  * Copyright (c) 2018 Redpine Signals Inc."
>
> Similarly for other files too.
>
> Provide a simple fix by replacing the kernel-doc like comment syntax with
> general format, i.e. "/*", to prevent kernel-doc from parsing it.
>

Aditya, thanks for starting to clean up the repository following your
investigation on kernel-doc warnings.

The changes to all those files look sound.

However I think these ten patches are really just _one change_, and
hence, all can be put into a single commit.

Hints that suggest it is one change:

- The commit message is pretty much the same (same motivation, same
explanation, same design decisions)
- The change is basically the same (same resulting change in different files)
- All patches are sent to the same responsible people, all of the
patches would be reviewed and accepted by the same people.
- All ten patches can be reviewed at once.

How about merging all ten patches into one patch and sending out a v2.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
