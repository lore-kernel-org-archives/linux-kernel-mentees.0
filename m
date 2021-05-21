Return-Path: <SRS0=yYPO=KQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1C7DC43460
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 May 2021 11:41:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7307361353
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 May 2021 11:41:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7307361353
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3389740F6C;
	Fri, 21 May 2021 11:41:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Iiw-tK2PSRFn; Fri, 21 May 2021 11:41:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 325C04054A;
	Fri, 21 May 2021 11:41:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0E354C000E;
	Fri, 21 May 2021 11:41:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3FAB5C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 May 2021 11:41:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2035D40EE2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 May 2021 11:41:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lfLSR6BcjfMc
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 May 2021 11:41:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DFDD14054A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 May 2021 11:41:33 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id c15so23567801ljr.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 May 2021 04:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wFYeACD6ntHDr3ZzL7zrrnF7+KzQ9eLPKf1tdFUUddQ=;
 b=C19rWBqLdiJcQCPCyqFA0u37icaVwV4D09Rt8zjZm5Hxl+j78AQ/TO1W0R01yYFuqr
 EKzIgdDPIkW2YGGY8ow+B91Ne2XTmXgnuMeK2Kel7XbaBTDt5BpFWF/PpyuSyIJBM0GK
 vUf4fh8ZyIjNn2CbfXQ8WDNGZNH+KGtbYyiIck6MzNQf2jSqpjOeZqOfv6jvOvxioOv1
 QzCVTJAMxOAalZ2kwdzofV709K/FHkJpMZPXNA1xjiJ7MKE5ZKuGfvbjybHvhgN8ymy9
 v2XdB5ZHlExKxkErQwEDWvAEE8zzrbBaJvcB9y7KakQDKkYPUvIkU2dugfm1ltdjFYBr
 ZgDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wFYeACD6ntHDr3ZzL7zrrnF7+KzQ9eLPKf1tdFUUddQ=;
 b=Ft7VUMeNo7QemPH2J/JXDrzTDn5iXF8tYrevnp+Py+ELQbderTTfmoLjnAcQpwFk2X
 uBiAeHDuokbapNT64LG1EIkaKPmF1f+210aTsH7tBcwjKtMcP6jpUBLBvgD8wfoGfDI7
 4UN0FwP04Ckz6+2cyoUSd0IvxQORggsgZMs7zOt6GLRCW33G+15TNXCRzAlBwjmPHwca
 fWHaG6rlTGy5hr/lZRasly7m/Jyvrv37PC2YCX0SpyAliTarOpa39bq4ecp/ZoJM1hAz
 7aL6R5pfskCEiuMW+4sDWanyAUgfzEdGKhHqLvw3jmHKhZNcbGAgmSAvueZPsoGsrgFm
 QBVQ==
X-Gm-Message-State: AOAM531HSjJe0KeFqghtPqUzZuJ4yDt021GFdynwTrdt/VnhyOtZj6ec
 dWhL4c8olD9gac9EFpUT9tU=
X-Google-Smtp-Source: ABdhPJykWgciebUg4UHyYyvCEuObukTkXyH+IRrTgfovQF4Kf899lKrwftO2wF8cWlzIIMGgSQJYVA==
X-Received: by 2002:a2e:a594:: with SMTP id m20mr6911414ljp.114.1621597291530; 
 Fri, 21 May 2021 04:41:31 -0700 (PDT)
Received: from localhost.localdomain ([94.103.229.140])
 by smtp.gmail.com with ESMTPSA id z41sm597991lfu.88.2021.05.21.04.41.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 04:41:31 -0700 (PDT)
Date: Fri, 21 May 2021 14:41:28 +0300
From: Pavel Skripkin <paskripkin@gmail.com>
To: Aviral Gupta <shiv14112001@gmail.com>
Subject: Re: [PATCH] This commit fixes the error generated due to the wrong
 indentation which does not follow the codding style norms set by
 Linux-kernel and space- bar is used in place of tab to give space which
 causes a visual error for some compilers
Message-ID: <20210521144128.052e3c48@gmail.com>
In-Reply-To: <20210521105654.4046-1-shiv14112001@gmail.com>
References: <20210521105654.4046-1-shiv14112001@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Cc: shuah@kernal.org, linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, viro@zeniv.linux.org.uk,
 linux-kernel@vger.kernel.org
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

On Fri, 21 May 2021 16:26:54 +0530
Aviral Gupta <shiv14112001@gmail.com> wrote:

> ERROR: switch and case should be at the same indent
> +	switch (whence) {
> +		case 1:
> [...]
> +		case 0:
> [...]
> +		default:
> ERROR: code indent should use tabs where possible
> +                              void (*callback)(struct dentry *))$
> 
> Signed-off-by: Aviral Gupta <shiv14112001@gmail.com>
> ---
>  fs/libfs.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 

Hi, Aviral!

Always check your patches with ./scripts/checpatch.pl. It will warn You
if your patch has common errors (ex: too long subject line like yours). 

I think, this link might be helpful
https://www.kernel.org/doc/html/latest/process/submitting-patches.html.
This document contains canonical patch format and other useful
info about "how to send patches".

Goog luck! 


With regards,
Pavel Skripkin
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
