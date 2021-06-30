Return-Path: <SRS0=IXLA=LY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C98D2C11F65
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Jun 2021 08:04:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F4D661C82
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Jun 2021 08:04:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F4D661C82
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38EB940630;
	Wed, 30 Jun 2021 08:04:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jJDlp_mZGFSW; Wed, 30 Jun 2021 08:04:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 3194340602;
	Wed, 30 Jun 2021 08:04:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 104D6C001A;
	Wed, 30 Jun 2021 08:04:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DFF6EC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Jun 2021 08:04:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD8FD40608
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Jun 2021 08:04:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r6CrzqnfR9fg
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Jun 2021 08:04:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8FB4D40602
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Jun 2021 08:04:22 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id i6so1706287pfq.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Jun 2021 01:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hbH/z7OhdU+iVEdzRBnCUZFHkiZm6uSMAwD77kW53EQ=;
 b=BU3Qv47LJ81s3KJ3CZ5YBfYg/zGxqG3yu7jvAU1zg+c4dyh4CHtk9+15weOuX+ekvR
 s5IR6Lc7yD9ogLG+sT0ClErracxfeatoIlo7LixKA+shMhWJ37eweKAx6IeZqmbem4E5
 y0/zaKpJ8qYYp08lmdIJ/wyT7RkHksR1W5PA2DPZul9i5EhhrAe0cJuhKfICraRe/FFl
 5eZp2XvnEy3z9zDnTZYWAFYWPMuhIANMlm7joFeZnNVruXlnxzWrS8W7hI7OiuWl6nMQ
 8+4ACl127VruEaP/flWaidFrolQ412tebQW6LDHQOJjqGmhS2FEPcqholPo/2jllLZR/
 E7fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hbH/z7OhdU+iVEdzRBnCUZFHkiZm6uSMAwD77kW53EQ=;
 b=s9DDWgvpNUqJBiXaie7JoZKT6oCp5khw2DzSteb/EoyX8ds1mDq/GsDvGxitFiSWeC
 9YrKNJJx6zycrUwvuKnAFFo3bMTkuxJbebwCUNsGEYFDA75zVcblnYGpcLSo7toxYwu/
 2s5vK5E+idp8mT7NdSynVtkMF18kI26npHiV4fhUiFWlKhlEG8QpmqnMpQNMJ92WvKag
 ++MLULKmrMmaLZt8V0s12j8rgSY9fLB2cUjqsNecosTVGTE5cyRr8oIwf8LzxcPXTps3
 Nvw9YBzFd7BLUkVhqWq3gWpgLe3yEq2n34g6C7+8utapcRooM3F4KfT2S5zzQ5PElxFr
 h09w==
X-Gm-Message-State: AOAM533CJY8O0ZDC4PodQoxVQjr6V1lJyxbRb8HQcvH7y3CIQLAwmSIp
 qASCH+E7jhqXgwTn7PKsTvo=
X-Google-Smtp-Source: ABdhPJwU7Js4B1W8/rGXy4VQ9j/bnj9+1GWTfaVi89y5ddU0/qI7UeO4aI37dst1hKTJofIDx5tAHg==
X-Received: by 2002:aa7:9e0d:0:b029:30f:fb8b:2584 with SMTP id
 y13-20020aa79e0d0000b029030ffb8b2584mr1816966pfq.24.1625040262354; 
 Wed, 30 Jun 2021 01:04:22 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id z5sm20296398pfb.114.2021.06.30.01.04.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jun 2021 01:04:21 -0700 (PDT)
Subject: Re: [PATCH v2] mtd: break circular locks in register_mtd_blktrans
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
References: <20210617160904.570111-1-desmondcheongzx@gmail.com>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <03e19ec8-7479-9be2-3563-a2fcf9d0ec0c@gmail.com>
Date: Wed, 30 Jun 2021 16:04:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210617160904.570111-1-desmondcheongzx@gmail.com>
Content-Language: en-US
Cc: linux-kernel@vger.kernel.org,
 syzbot+6a8a0d93c91e8fbf2e80@syzkaller.appspotmail.com,
 linux-mtd@lists.infradead.org, linux-kernel-mentees@lists.linuxfoundation.org,
 Christoph Hellwig <hch@lst.de>
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

On 18/6/21 12:09 am, Desmond Cheong Zhi Xi wrote:
> Syzbot reported a circular locking dependency:
> https://syzkaller.appspot.com/bug?id=7bd106c28e846d1023d4ca915718b1a0905444cb
> 
> This happens because of the following lock dependencies:
> 
> 1. loop_ctl_mutex -> bdev->bd_mutex (when loop_control_ioctl calls
> loop_remove, which then calls del_gendisk; this also happens in
> loop_exit which eventually calls loop_remove)
> 
> 2. bdev->bd_mutex -> mtd_table_mutex (when blkdev_get_by_dev calls
> __blkdev_get, which then calls blktrans_open)
> 
> 3. mtd_table_mutex -> major_names_lock (when register_mtd_blktrans
> calls __register_blkdev)
> 
> 4. major_names_lock -> loop_ctl_mutex (when blk_request_module calls
> loop_probe)
> 
> Hence there's an overall dependency of:
> 
> loop_ctl_mutex   ----------> bdev->bd_mutex
>        ^                            |
>        |                            |
>        |                            v
> major_names_lock <---------  mtd_table_mutex
> 
> We can break this circular dependency by holding mtd_table_mutex only
> for the required critical section in register_mtd_blktrans. This
> avoids the mtd_table_mutex -> major_names_lock dependency.
> 
> Reported-and-tested-by: syzbot+6a8a0d93c91e8fbf2e80@syzkaller.appspotmail.com
> Co-developed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> ---
> 
> Changes in v1 -> v2:
> 
> Break the circular dependency in register_mtd_blktrans instead of blk_request_module, as suggested by Christoph Hellwig.
> 
>   drivers/mtd/mtd_blkdevs.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
> index fb8e12d590a1..7d26cfe24d05 100644
> --- a/drivers/mtd/mtd_blkdevs.c
> +++ b/drivers/mtd/mtd_blkdevs.c
> @@ -528,14 +528,10 @@ int register_mtd_blktrans(struct mtd_blktrans_ops *tr)
>   	if (!blktrans_notifier.list.next)
>   		register_mtd_user(&blktrans_notifier);
>   
> -
> -	mutex_lock(&mtd_table_mutex);
> -
>   	ret = register_blkdev(tr->major, tr->name);
>   	if (ret < 0) {
>   		printk(KERN_WARNING "Unable to register %s block device on major %d: %d\n",
>   		       tr->name, tr->major, ret);
> -		mutex_unlock(&mtd_table_mutex);
>   		return ret;
>   	}
>   
> @@ -545,12 +541,12 @@ int register_mtd_blktrans(struct mtd_blktrans_ops *tr)
>   	tr->blkshift = ffs(tr->blksize) - 1;
>   
>   	INIT_LIST_HEAD(&tr->devs);
> -	list_add(&tr->list, &blktrans_majors);
>   
> +	mutex_lock(&mtd_table_mutex);
> +	list_add(&tr->list, &blktrans_majors);
>   	mtd_for_each_device(mtd)
>   		if (mtd->type != MTD_ABSENT)
>   			tr->add_mtd(tr, mtd);
> -
>   	mutex_unlock(&mtd_table_mutex);
>   	return 0;
>   }
> 

Hi maintainers,

Any chance to review this patch?

For additional reference, the mtd_table_mutex --> major_names_lock 
hierarchy that can be removed by this patch also appears in a different 
lock chain:
https://syzkaller.appspot.com/bug?id=cbf5fe846f14a90f05e10df200b08c57941dc750

Best wishes,
Desmond
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
