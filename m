Return-Path: <SRS0=DeHd=KT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C94AC04FF3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 24 May 2021 16:19:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3665561400
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 24 May 2021 16:19:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3665561400
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F120940144;
	Mon, 24 May 2021 16:19:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FJaOZr-MxO5R; Mon, 24 May 2021 16:19:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1450640001;
	Mon, 24 May 2021 16:19:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F3198C000D;
	Mon, 24 May 2021 16:19:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D1924C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 May 2021 16:19:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C00A283521
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 May 2021 16:19:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8cihD-Su2AOD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 May 2021 16:19:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C854482EDB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 May 2021 16:19:14 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id m11so41499326lfg.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 24 May 2021 09:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0kf2yWdVbkRqs+bMEO1NKGIdlMUWGm1xOLGvrOPLjt4=;
 b=siVLuUrX2iJDjIMKj11QkDrVbWD20O3bdeKafOY4Az+kzj0cBcXYB8DAMH5SBwI5f3
 LmJMXv9s7WrxOUsLH27BlMFNbEuZ6VYvsBrOvpK3/m3Kv8iw4v+REp2WXAUWKqtfkT6o
 Ewju3QXK0AzIg/3jJkH+yyFiA/e2rsddFysAzGxUtJOtnkgK6LGWTvPOk9YABQ+DVStC
 iScj5C9rWLjQz7xhRab/zDUudP+wkXODJeP598uowFDAWo50TsGC5OnqZ8P47EkWclvS
 /ysFJLZ5EF5o09PQQAoGNjufttsAyPxDx6lYIG7Xj1mUeuc8EF7lH/IQEfxY1fsyJZdr
 p2Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0kf2yWdVbkRqs+bMEO1NKGIdlMUWGm1xOLGvrOPLjt4=;
 b=BZZPVJr6ZAuIDwip6HNx30j1T4iT5BLDtRH9LZTrYGPgueIHerV8uawDwBw7sWp5HC
 rlvUw28wQuiYjEhfz8GO+qjt6NFgF8LJvI/kkYRxiYIhImm1gOu2Xlzmbih9+ZP3bsSC
 cB07/DulyrVhJ0qIlfDWUq9DZTiqGYPCMKEO4Etf6qTjVgzR1qKsOGa6HscaKTbDeO5v
 kVONU234CwHDSdq0/ZZwkGPYj3xebPHLCPxP+7cJcUwroASoQjCr9FkulzpV2U0KkbgD
 q5HNCK2QKvDzVXhiNpXYCDS0A9pVMwCfPO1J8J3x2E+lZ/bvk6glsNMsV0uT6+0Hc+w5
 JvnQ==
X-Gm-Message-State: AOAM532MhpjXkBpDh41pedS9wRV3K3QTqBtBUuQGFRCUPV8NZ5e6vp3u
 bHpbpii2eUejHyBdQhXID/4=
X-Google-Smtp-Source: ABdhPJyZEJVfnEdg1e0qu8e7bfG527tsGB0W+iXPgJL+SX9msLyAqMJQSNuhz/x2ZO3OEGpKa/1ILw==
X-Received: by 2002:a05:6512:3587:: with SMTP id
 m7mr11429149lfr.282.1621873152704; 
 Mon, 24 May 2021 09:19:12 -0700 (PDT)
Received: from localhost.localdomain ([46.61.204.60])
 by smtp.gmail.com with ESMTPSA id u23sm1459860lfq.287.2021.05.24.09.19.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 09:19:12 -0700 (PDT)
Date: Mon, 24 May 2021 19:19:07 +0300
From: Pavel Skripkin <paskripkin@gmail.com>
To: Aviral Gupta <shiv14112001@gmail.com>
Subject: Re: [PATCH] This patch fixes the warning generated due to use of
 symbolic
Message-ID: <20210524191907.034efdd6@gmail.com>
In-Reply-To: <20210524155705.5138-1-shiv14112001@gmail.com>
References: <20210524155705.5138-1-shiv14112001@gmail.com>
X-Mailer: Claws Mail 3.17.8git77 (GTK+ 2.24.33; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Cc: axboe@kernel.dk, richard.peng@oppo.com, ulf.hansson@linaro.org,
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
 adrian.hunter@intel.com, guoqing.jiang@cloud.ionos.com, satyat@google.com,
 avri.altman@wdc.com, linux-kernel-mentees@lists.linuxfoundation.org,
 beanhuo@micron.com
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

On Mon, 24 May 2021 21:27:06 +0530
Aviral Gupta <shiv14112001@gmail.com> wrote:

> It's better to use octal permissons instead of symbolic ones because
> peoples are more familiar with octal permissons.
> WARNING: Symbolic permissions 'S_IRUGO | S_IWUSR' are not preferred.
> Consider using octal permissions '0644'.
> +	md->force_ro.attr.mode = S_IRUGO | S_IWUSR;
> 
> WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider
> using octal permissions '0444'.
> +			mode = S_IRUGO;
> 
> WARNING: Symbolic permissions 'S_IRUGO | S_IWUSR' are not preferred.
> Consider using octal permissions '0644'.
> +			mode = S_IRUGO | S_IWUSR;
> 
> WARNING: Symbolic permissions 'S_IRUSR' are not preferred. Consider
> using octal permissions '0400'.
> +			debugfs_create_file("ext_csd", S_IRUSR,
> root, card,
> 
> Signed-off-by: Aviral Gupta <shiv14112001@gmail.com>
> ---
>  drivers/mmc/core/block.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Hi, Aviral!

I guess, you missed my and Greg's mails last time... 

Anyway, subject line is strange, it should be smth like "mmc: core:
fix symbolic permissions".

Please, refer to
https://www.kernel.org/doc/html/latest/process/submitting-patches.html.


With regards,
Pavel Skripkin
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
