Return-Path: <SRS0=D/cX=MZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42F06C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Aug 2021 06:44:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C71F7610A0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Aug 2021 06:44:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C71F7610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A108606EA;
	Mon,  2 Aug 2021 06:44:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ri9eybWLvTVC; Mon,  2 Aug 2021 06:44:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id C17B0605E0;
	Mon,  2 Aug 2021 06:44:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A1175C001B;
	Mon,  2 Aug 2021 06:44:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C2638C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Aug 2021 06:44:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B1CC8402EE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Aug 2021 06:44:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xWsI8hTACGbP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Aug 2021 06:44:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 23786402C3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Aug 2021 06:44:36 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id z18so183003ybg.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 01 Aug 2021 23:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N01ijckjbOtepGu52at5PtJvb7u0CTqzXAhdQ0WOiyY=;
 b=OJRYkNcNd15cUfCmxRbQANyF0L0/0r0WbNazB647slxMlRcYl27fcmFXv4HnFfQlZ0
 /HAUxjHGbfqYh9hsxVACCnvWnQHlw90dS6ZexS5on3ZmhqGju6MhAk62UWs+Q2cpFW8a
 b4ROYxtoFIzw+aaK2e1avkSuqC0D0LBqVZUvTWkFEOYN7iFtYkMfIMsXo1uLpilRowMt
 dr9hEvp6KuWNshRznW9jPapCRTMw/qmMfqoAe2Euj/vMy512iXxbEW9TO66AAiT7UKtH
 uhjJ/GxujA0jSDnNkfpQ43jc04+aFUsUHvYAGaB4jv+tkBwjSDYmv/YjCX5R/6/RUmZM
 Z7AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N01ijckjbOtepGu52at5PtJvb7u0CTqzXAhdQ0WOiyY=;
 b=OncUkDU5xXPy3TiKXVRm6KaRSFCOVfHXa5mkcGGSOIOaQsWgo+GIa6LF6F4vo5rHjX
 5zHRbsfo3P34bO1Qsf7hNiGv2wJeJKfag2vqBDCTRT8RYj1mTNZEeNGAFXK86GsHJbuS
 dSrgLEHBG+Y9RQ2L1eeullTzt4mTeRy6MAPquyBD4fgZrdJG8bC1UWV+JYfdJmmfRHJR
 0pCmZMfFPY/mGlZUQTUjrVLM/ZBoIa6lABwGx4i+kYFtc0As1Jm3N++IviVeLx3D206U
 /yQv6MNQkPFeRkAYoq8ix9YvwxHUEkMNZPFoR3vt4KYiaS3W1t+Kk/scWIuT63YRfkQr
 PS3g==
X-Gm-Message-State: AOAM532U4qenifz5ijnMGZFFm5But2KwQydn/NRZeflYUSQBjjuzZLE1
 CpzjsDJn2bm8wQvz+Fzfjq+7A+0gQjNilLur0Bk=
X-Google-Smtp-Source: ABdhPJz2uc81lgf2T/0XtYHGb0gQFiLgef52h5k+U4rfGTwEix3wgvpe0qr4Xpii6A/H9cn2GdGW2/Gr4fdMaEhvYDs=
X-Received: by 2002:a25:f310:: with SMTP id c16mr12467556ybs.464.1627886675085; 
 Sun, 01 Aug 2021 23:44:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210801220453.17028-1-rahulbalaji78@gmail.com>
In-Reply-To: <20210801220453.17028-1-rahulbalaji78@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 2 Aug 2021 08:46:08 +0200
Message-ID: <CAKXUXMxneXFAdb6OBV6=-W0aYziHzums7JuKPejTAV-SRFjJmA@mail.gmail.com>
Subject: Re: [PATCH] drivers: mtd: ubi: fixed a semicolon style issue in
 block.c
To: Rahul Balaji <rahulbalaji78@gmail.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
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

Use imperative: Subject line shall be in imperative form.

On Mon, Aug 2, 2021 at 12:06 AM Rahul Balaji <rahulbalaji78@gmail.com> wrote:
>
> fixed a small coding style issue in using semicolon.
>

Mention your motivation, i.e., the investigation of the ONE_SEMICOLON rule.

Mention if this change modifies the code's behaviour.

If not, add to the comment message:

"No functional change."

> signed-off-by: Rahul Balaji <rahulbalaji78@gmail.com>

signed-off-by is written as "Signed-off-by:".

Did you run checkpatch on your patch? What is the checkpatch output
running your patch? Please share that with us.

Give it another try and create a PATCH v2.

Lukas

> ---
>  drivers/mtd/ubi/block.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
> index e003b4b44ffa..e0402c2f8959 100644
> --- a/drivers/mtd/ubi/block.c
> +++ b/drivers/mtd/ubi/block.c
> @@ -405,7 +405,7 @@ int ubiblock_create(struct ubi_volume_info *vi)
>         ret = blk_mq_alloc_tag_set(&dev->tag_set);
>         if (ret) {
>                 dev_err(disk_to_dev(dev->gd), "blk_mq_alloc_tag_set failed");
> -               goto out_free_dev;;
> +               goto out_free_dev;
>         }
>
>
> --
> 2.25.1
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
