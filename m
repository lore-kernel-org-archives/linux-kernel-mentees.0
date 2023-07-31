Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC69C001DC
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 31 Jul 2023 05:20:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0074C6101F;
	Mon, 31 Jul 2023 05:20:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0074C6101F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id If16NN9FUPkp; Mon, 31 Jul 2023 05:20:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id D0E1760E58;
	Mon, 31 Jul 2023 05:20:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0E1760E58
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AF00EC0072;
	Mon, 31 Jul 2023 05:20:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C2261C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 05:20:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 958D660FAE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 05:20:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 958D660FAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8cGmzT_36ehG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 05:20:17 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A1B4F60E58
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 05:20:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1B4F60E58
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-4fe28e4671dso2061081e87.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Jul 2023 22:20:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690780815; x=1691385615;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1PCaV7jz4ZhQusEGOkRMQPvD1GkLtKnvc9bqZW1yacw=;
 b=L37+DtksJwBE+6La8PSMN+V1jQWvop6OfoBtzzv0SARxfMtdVB1ITbkVoNROPo6v7D
 Qu3McljzZ3NBOQQ4xItiJQM9YTmBC+0O0GpyCMWHNnsIjtrF0yVBdfvtHhE4Dfzte3MN
 W1DgefJGZRq8fkYBxy8je7Yl73AT561Qe6GBhklG1s++sa5bWu94rZOQ5I+gC5ZmkX6F
 ZjnPPZVvBQZZoRGr3GVTbgLZShnN/F9ee6dQU3v5zrnXocs8+a3wFY5MstUws8uVB9SL
 vp6alzU0bBWKxZT33qAQE+OUyn2OW/GMoTUmyaUW3Z8kJ3acce3i/fhOpMWsqpG2+bEz
 LWxA==
X-Gm-Message-State: ABy/qLY4VN3vAx3zua2dgn8BM1KJ5camKa83HyVroU0ti/2icqhFTYAI
 mIgHgI+12yAvJuvz/RZyzhE=
X-Google-Smtp-Source: APBJJlGK6TLfK80q1RYfkwG2/SJEzHxRS0T9UKRwbX9NrS83Sc9RKwlda1+Sn43xdx2oArIubQhClw==
X-Received: by 2002:a19:8c09:0:b0:4fe:1e74:3f3a with SMTP id
 o9-20020a198c09000000b004fe1e743f3amr4545975lfd.58.1690780814940; 
 Sun, 30 Jul 2023 22:20:14 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::aaaa:59? ([2a0b:e7c0:0:107::aaaa:59])
 by smtp.gmail.com with ESMTPSA id
 l22-20020a1c7916000000b003fe22da3bc5sm803508wme.42.2023.07.30.22.20.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jul 2023 22:20:14 -0700 (PDT)
Message-ID: <e411e3c4-37ae-f5ea-b50b-4a5c0718c857@kernel.org>
Date: Mon, 31 Jul 2023 07:20:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] ath5k: Fix debugfs_create_dir error checking
Content-Language: en-US
To: Atul Raut <rauji.raut@gmail.com>, mickflemm@gmail.com, mcgrof@kernel.org, 
 kvalo@kernel.org
References: <20230731023820.26571-1-rauji.raut@gmail.com>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20230731023820.26571-1-rauji.raut@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 31. 07. 23, 4:38, Atul Raut wrote:
> The debugfs_create_dir function returns ERR_PTR
> in case of error and the correct way to check an
> error is 'IS_ERR' inline function.
> This patch will replace the null-comparison with IS_ERR
> 
> This issue was found with the help of Coccinelle.
> ./drivers/net/wireless/ath/ath5k/debug.c:985:6-12: Wrong debugfs call error processing on line 985
> 
> Signed-off-by: Atul Raut <rauji.raut@gmail.com>
> ---
>   drivers/net/wireless/ath/ath5k/debug.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath5k/debug.c b/drivers/net/wireless/ath/ath5k/debug.c
> index 4b41160e5d38..08058b3f7e22 100644
> --- a/drivers/net/wireless/ath/ath5k/debug.c
> +++ b/drivers/net/wireless/ath/ath5k/debug.c
> @@ -982,7 +982,7 @@ ath5k_debug_init_device(struct ath5k_hw *ah)
>   	ah->debug.level = ath5k_debug;
>   
>   	phydir = debugfs_create_dir("ath5k", ah->hw->wiphy->debugfsdir);
> -	if (!phydir)
> +	if (IS_ERR(phydir))

Already fixed by:
https://patchwork.kernel.org/project/linux-wireless/patch/20230714081619.2032-1-duminjie@vivo.com/

-- 
js
suse labs

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
