Return-Path: <SRS0=D/cX=MZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87AA1C4320A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Aug 2021 11:16:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BB6060F36
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Aug 2021 11:16:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1BB6060F36
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C09E34033A;
	Mon,  2 Aug 2021 11:16:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id duGapRXBagUN; Mon,  2 Aug 2021 11:16:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 0BDB640337;
	Mon,  2 Aug 2021 11:16:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DA732C0010;
	Mon,  2 Aug 2021 11:16:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9A999C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Aug 2021 11:16:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 896FC607F6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Aug 2021 11:16:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iI8xAzwnRCdI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Aug 2021 11:16:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9884560657
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Aug 2021 11:16:44 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 u13-20020a17090abb0db0290177e1d9b3f7so2026608pjr.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 02 Aug 2021 04:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=R6GXUz7kzvPzppSdt3z4/dwHpwHS0zM/rSsMW9Edp1o=;
 b=IB3AOEneq/zsq6WG+K9Dx+tGjfWRzwSos4X1zR4PK+YOdHjaXNYL+0d057isGuH2bp
 U1W2OX/daOjme+rPee8zQnzgqRJAaGgxNrWL0BzDRHlIRLSoBhqcfSAbhSGu9/V/5ZGX
 pNXt5U9rcLjZaMOLU5H4hquh/+M0URu80NcCEFuDGcn/C6XhLUpotKnW6HWdgmRsr7i5
 YdLHgFQcEcMvs9YG3QjLXQwRP3jCFCoIewoczCg5c3CpsUT9AGa5ZJqy/aDQdLiVANFk
 iS3wKFtJaCr2GGVr7SSUY99Te33U+xpiBOFLChL37z3CgkwBq+XxxT0cm3YNiAnUGEps
 nhcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=R6GXUz7kzvPzppSdt3z4/dwHpwHS0zM/rSsMW9Edp1o=;
 b=UpHZEi+vGYFjBCqIQY52B1tXIFLYcAVIi4garnDcI9tyVbm299N2kCHMXSwuqMcWEC
 DxgvsaUy1rH7P6Xg95MBwJCn1hs6uSBqiO2C0Y03S5+YU14EnexQvrXMUqZlfAgZehY9
 T2uK3V+0tF1i+UV9gq817ZXt2EemwuOgHOU+YVY1dLVekNOHKsxRIF5GgTOptaZ9eSU2
 N9gKF2cp4s6AD8ssx/lupLbB1+O5ttRQvsKMYPDrk6buAFN9hQEstha0hSOwoibZQ2pN
 7H9fdlKLyf9AcJ7CN8XkcctiLyoRTjP8Z9CAGAcmXqd8QdTaPuGT9EsTiKk3v3cTDFpE
 8QSw==
X-Gm-Message-State: AOAM533WAMt143mb7wbFhzueN28OmJJfnbiL+SiSAQDsXKzewPPW5zAi
 yLip8zPm3RPg4DoDmQlASM4=
X-Google-Smtp-Source: ABdhPJwfTXmmpUNkLpa4I7JfKlBw46SS76hdMpnno6UD5NxuaRk4EFtZTA3ZOXumH8zJRoqx6KSJCw==
X-Received: by 2002:a17:90a:e2c8:: with SMTP id
 fr8mr16316205pjb.131.1627903004035; 
 Mon, 02 Aug 2021 04:16:44 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id p11sm10231087pju.20.2021.08.02.04.16.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 04:16:43 -0700 (PDT)
Subject: Re: [PATCH] mtd: fix lock hierarchy in deregister_mtd_blktrans
To: miquel.raynal@bootlin.com
References: <20210717100719.728829-1-desmondcheongzx@gmail.com>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <999b1450-949e-fd90-6bf2-7fd4452158bb@gmail.com>
Date: Mon, 2 Aug 2021 19:16:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210717100719.728829-1-desmondcheongzx@gmail.com>
Content-Language: en-US
Cc: Hillf Danton <hdanton@sina.com>, vigneshr@ti.com, richard@nod.at,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 17/7/21 6:07 pm, Desmond Cheong Zhi Xi wrote:
> There is a lock hierarchy of major_names_lock --> mtd_table_mutex. One
> existing chain is as follows:
> =

> 1. major_names_lock --> loop_ctl_mutex (when blk_request_module calls
> loop_probe)
> =

> 2. loop_ctl_mutex --> bdev->bd_mutex (when loop_control_ioctl calls
> loop_remove, which then calls del_gendisk)
> =

> 3. bdev->bd_mutex --> mtd_table_mutex (when blkdev_get_by_dev calls
> __blkdev_get, which then calls blktrans_open)
> =

> Since unregister_blkdev grabs the major_names_lock, we need to call it
> outside the critical section for mtd_table_mutex, otherwise we invert
> the lock hierarchy.
> =

> Reported-by: Hillf Danton <hdanton@sina.com>
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> ---
>   drivers/mtd/mtd_blkdevs.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
> index 7d26cfe24d05..87e26788ef60 100644
> --- a/drivers/mtd/mtd_blkdevs.c
> +++ b/drivers/mtd/mtd_blkdevs.c
> @@ -563,8 +563,8 @@ int deregister_mtd_blktrans(struct mtd_blktrans_ops *=
tr)
>   	list_for_each_entry_safe(dev, next, &tr->devs, list)
>   		tr->remove_dev(dev);
>   =

> -	unregister_blkdev(tr->major, tr->name);
>   	mutex_unlock(&mtd_table_mutex);
> +	unregister_blkdev(tr->major, tr->name);
>   =

>   	BUG_ON(!list_empty(&tr->devs));
>   	return 0;
> =


Hi Miqu=E8l,

Just a friendly ping, this patch is part 2 of fixing the lock hierarchy =

inversion between major_names_lock and mtd_table_mutex that was =

identified by Hillf Danton.

Best wishes,
Desmond
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
