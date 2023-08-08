Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 114A6C001DB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  8 Aug 2023 06:02:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 86517402D7;
	Tue,  8 Aug 2023 06:02:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86517402D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ph-OXvcw5tYA; Tue,  8 Aug 2023 06:02:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 9234040102;
	Tue,  8 Aug 2023 06:02:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9234040102
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6CAB0C0071;
	Tue,  8 Aug 2023 06:02:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6454DC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Aug 2023 06:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 27B114096D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Aug 2023 06:02:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27B114096D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iSoWlB4zMuCp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Aug 2023 06:02:54 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0149F4096B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Aug 2023 06:02:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0149F4096B
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2b9dc1bff38so82003601fa.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 07 Aug 2023 23:02:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691474571; x=1692079371;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jKx1/VaIgRqUN/ndVcw3NROdMrmRr8duDpEd8AClkoQ=;
 b=QiHYUrGQkcAabfjgqNgTVYG0Vp+a6X8ZFEhhwndoPpIlcD+FzshhCFzFkBdWqBGIcz
 0rcSqVT+lxPmyrjEWveJ183fCd/dLcTAlW/rGPz8jDsN6DL6FPzIFjJnoNtMo0kj+wPi
 9HU83jid//WEjBphaUJOvMmGpiJMj4Nj/4vANfswWhAL7De6O3icAUu8wHcvTpphu1z1
 lA9t2MsBRlyUzyLQ0lNISJoTT71L5QRtmaZD6K0X4LW64geyBHcWkZUv06ekaQqfeZoG
 tohXJEwyZ0JpuG3DOd3qbZHqWtVLWLBj4DQS5d5RhOQbYXyCCG7c3rElZbQnr+y0PbnT
 8ApA==
X-Gm-Message-State: AOJu0Yw5o5nnDlW6Y9qt/CsgVmWqvrt1cDF0kWiVXhJregP415kf9Yi0
 bAwof1axh8v95G3U0LG3jaE=
X-Google-Smtp-Source: AGHT+IEasP0f7uh5KfcBuXX9IzUxuEcy7FQjGihwCKiz0bxM6gSLGw/llf+xsy++JBMe+yBcn1yP/Q==
X-Received: by 2002:a2e:9d86:0:b0:2b6:df23:2117 with SMTP id
 c6-20020a2e9d86000000b002b6df232117mr8325133ljj.43.1691474571353; 
 Mon, 07 Aug 2023 23:02:51 -0700 (PDT)
Received: from [192.168.1.58] (185-219-167-24-static.vivo.cz. [185.219.167.24])
 by smtp.gmail.com with ESMTPSA id
 si10-20020a170906ceca00b00992e14af9c3sm6163483ejb.143.2023.08.07.23.02.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Aug 2023 23:02:50 -0700 (PDT)
Message-ID: <92a26f67-1b24-ea35-2f39-7c0b75027617@kernel.org>
Date: Tue, 8 Aug 2023 08:02:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH] ath5k: fix WARNING opportunity for swap.
Content-Language: en-US
To: Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>, mickflemm@gmail.com,
 mcgrof@kernel.org, kvalo@kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230807201057.340371-1-mahmoudmatook.mm@gmail.com>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20230807201057.340371-1-mahmoudmatook.mm@gmail.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 07. 08. 23, 22:10, Mahmoud Maatuq wrote:
> coccinielle reported the following:
> ./drivers/net/wireless/ath/ath5k/phy.c:1573:25-26: WARNING opportunity for swap()


OK, once again:
https://lore.kernel.org/all/0c3acbd4-6ab2-5cc5-6293-54e30093cce2@kernel.org/

> Signed-off-by: Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>
> ---
>   drivers/net/wireless/ath/ath5k/phy.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath5k/phy.c b/drivers/net/wireless/ath/ath5k/phy.c
> index 5797ef9c73d7..f87eb684f223 100644
> --- a/drivers/net/wireless/ath/ath5k/phy.c
> +++ b/drivers/net/wireless/ath/ath5k/phy.c
> @@ -1562,16 +1562,13 @@ static s16
>   ath5k_hw_get_median_noise_floor(struct ath5k_hw *ah)
>   {
>   	s16 sort[ATH5K_NF_CAL_HIST_MAX];
> -	s16 tmp;
>   	int i, j;
>   
>   	memcpy(sort, ah->ah_nfcal_hist.nfval, sizeof(sort));
>   	for (i = 0; i < ATH5K_NF_CAL_HIST_MAX - 1; i++) {
>   		for (j = 1; j < ATH5K_NF_CAL_HIST_MAX - i; j++) {
>   			if (sort[j] > sort[j - 1]) {
> -				tmp = sort[j];
> -				sort[j] = sort[j - 1];
> -				sort[j - 1] = tmp;
> +				swap(sort[j], sort[j - 1]);
>   			}
>   		}
>   	}

-- 
js
suse labs

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
