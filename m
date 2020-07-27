Return-Path: <SRS0=tUVd=BG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AAFEC433E8
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 22:05:03 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F201B20809
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 22:05:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KKrVFetT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F201B20809
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C1FFE85E06;
	Mon, 27 Jul 2020 22:05:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lc6pfn0nbZ4a; Mon, 27 Jul 2020 22:05:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 73B2384FA5;
	Mon, 27 Jul 2020 22:05:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5B226C004F;
	Mon, 27 Jul 2020 22:05:02 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1BFAFC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 22:05:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 117FA8785D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 22:05:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H6O-T-nea5CW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 22:05:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 553CA86B21
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 22:05:00 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id l23so16888994qkk.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 15:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=iVuPTRHNAeDbxJIJqGMzJ2wPysTPpDFSvpK97m2+rwo=;
 b=KKrVFetTr55OQ+1m/sHURefNlPvk09O9SSfcOdgGMAm4zuxZf2zAWC0vPdDs9StyHe
 gg5ArsycVSyP74J5m0Nsd0irvaQDUFdjymVgMbhv9dyfOVrSnBog0ABmlszMZjFpv8Qf
 FHk7u4eIF+rXkYulvQJ6a6XYBQVHXoiZJQmIMk1WuHF9HrUI2vcCrcnpmYpQ5LmmLEwe
 3g80DomwgA4a2yr2RnNFzlZPcwixL1rbxQV2gq0V2G6e1qkBPXNSoYDto4yKglTwBtLZ
 Hdu3c/oSdPzw1wZLuQxdmdVkcm7y32liptBK++zRSYLp7inGClfhqzU2MlOwEaWYCkxv
 NvWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iVuPTRHNAeDbxJIJqGMzJ2wPysTPpDFSvpK97m2+rwo=;
 b=I0gFu8VL/RPtj1BhHxwHrlkTBr1VYk+SP8v5BUMka+FAn7wiJdkbwyxOOjc7fjjG9Z
 ManCheINgn2VOscmPKvX2YOlGdh6NidP2V1gm5Jygo/OfGhKZmgQmOvGAYxrMhB72kXe
 XRvhESniG4CY2oOOZpDbjoZB+aXhnBcslO3fdyeJ4MQNqS/oa4IbMphEDv0jxR96Jvuz
 KZXBSmYBzlSI78PwIq4lSTcT8ReEhpYI/jCfpF+9rP3jbE3O4ooUbQx9Ngwp3ERSNPVy
 umMrb5c+kCQaWOOWhdfhOz3P6BZSlp45iS/iVvgS3zTb27gmjBkwmn/56aw2u9DuZ3gu
 Vcww==
X-Gm-Message-State: AOAM530k/UAu1ypbfGkpX9WAW1VJui/L8N1t7VenSIhptyhZyM6XeQin
 i/5wr02LqIE68pwq5TjgIQ==
X-Google-Smtp-Source: ABdhPJzfxFKdzL8nQ1KA2C516wzRCtGXJoI/WM2PqHeAK/4CHI1X4r58A9z6GhvCvrBKLEDROQUrkQ==
X-Received: by 2002:a05:620a:4ca:: with SMTP id
 10mr22310620qks.306.1595887499368; 
 Mon, 27 Jul 2020 15:04:59 -0700 (PDT)
Received: from PWN ([209.94.141.207])
 by smtp.gmail.com with ESMTPSA id l64sm5279365qkc.21.2020.07.27.15.04.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 15:04:58 -0700 (PDT)
Date: Mon, 27 Jul 2020 18:04:56 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <20200727220456.GA328887@PWN>
References: <20200726220557.102300-1-yepeilin.cs@gmail.com>
 <20200726222703.102701-1-yepeilin.cs@gmail.com>
 <CAK8P3a3NB2BVo9fH-Wcinrhhs-QJ=9dK59Ds83TvgLmEkRy3qA@mail.gmail.com>
 <20200727131608.GD1913@kadam>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200727131608.GD1913@kadam>
Cc: Niklas =?iso-8859-1?Q?S=F6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>, Arnd Bergmann <arnd@arndb.de>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Vandana BN <bnvandana@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v3] media/v4l2-core: Fix
 kernel-infoleak in video_put_user()
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

On Mon, Jul 27, 2020 at 04:16:08PM +0300, Dan Carpenter wrote:
> drivers/char/hpet.c:675 hpet_ioctl() warn: check that 'info' doesn't leak information (struct has a hole after 'hi_timer')

This one seems like a false positive.

drivers/char/hpet.c:670:

	mutex_lock(&hpet_mutex);
	err = hpet_ioctl_common(file->private_data, cmd, arg, &info);
	mutex_unlock(&hpet_mutex);

	if ((cmd == HPET_INFO) && !err &&
	    (copy_to_user((void __user *)arg, &info, sizeof(info))))
		err = -EFAULT;

`info` is only being copied to userspace when `cmd` is `HPET_INFO`.
However, hpet_ioctl_common() is already doing memset() on `info` in
`case HPET_INFO`:

drivers/char/hpet.c:612:

	case HPET_INFO:
		{
			memset(info, 0, sizeof(*info));
			^^^^^^

Thank you,
Peilin Ye
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
