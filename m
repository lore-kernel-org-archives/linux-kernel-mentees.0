Return-Path: <SRS0=onbg=7K=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADD1BC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 May 2020 22:50:43 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FD75208B8
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 May 2020 22:50:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="f91ZHvUn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FD75208B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E97C28819D;
	Thu, 28 May 2020 22:50:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7hK59YpMSKwo; Thu, 28 May 2020 22:50:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 207ED810B4;
	Thu, 28 May 2020 22:50:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ED419C088D;
	Thu, 28 May 2020 22:50:41 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 88BFFC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 22:50:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 79927204F0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 22:50:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hYDbtsumUdTA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 22:50:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 504BB204E3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 22:50:39 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id b3so736477oib.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 15:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=csvE8B9NObrx6Z6u0s31dzfK5G3kL5lknGsNZ4HgzUY=;
 b=f91ZHvUnnUuUyEPs8F+1h7EZTnYqrnj607Y+Teopym8lgL8vPJyuLayeCRdwnWXfdZ
 dphgysRgodNh05q5bMX9hdXqQla3mR8uHNxJFcV2ltRtKlLo+wd4O8lkkUbZoSQz3UMM
 0RcJ2wg9pvQrBw54gGT0yTZ9rNF+7jj7lov3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=csvE8B9NObrx6Z6u0s31dzfK5G3kL5lknGsNZ4HgzUY=;
 b=DZd87IKIKqAte5q+xcw+bywm2IAH273VRUFgLbq6DY5a7GmnlNLxx8nMZt6i/H0HiF
 NHT7W3/n05t+kpGmg9q0zk/lYivs3g/T7DEcwQgYNzLJKii2iLiuOKTH4QQoWLqo9d1C
 ewz9DXoaafdS1RtD+rd+k3CY/dhFpkgXDPizSrA2vr4l9V+zi1JjF4V3CdK+/VmB7XO/
 i/81FyRynstzTpKGdTQ/HxBDC8rQFagYZIYCdDVwrBuibNOdS5MluBlI5BkCusX9jeaA
 pMrVBqRfQ7CmnyYi7ZGpv5Ock2WsOcNGS4hOFReLIFMRm1AxDHDaf+q8JPAyHYizjeiZ
 6SEw==
X-Gm-Message-State: AOAM5301H0dm7mz8u5rZkk7Wy1lRMuczK92Gf21jbTahFwa6poEu8uwK
 ZV8E1qA5ipJdsz0u5u30qNomckiH
X-Google-Smtp-Source: ABdhPJxRChsgcY0pJfdxAbM0G8c9t7bFLwwgX5Mh8OtIGV5PP90XtzFfQu8QSJhF2Pi5TyiXzr9J3A==
X-Received: by 2002:a05:6808:1c8:: with SMTP id
 x8mr3742504oic.30.1590706238485; 
 Thu, 28 May 2020 15:50:38 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id a64sm43393oib.43.2020.05.28.15.50.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 May 2020 15:50:37 -0700 (PDT)
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
 mchehab+huawei@kernel.org, sean@mess.org, kstewart@linuxfoundation.org,
 allison@lohutok.net, tglx@linutronix.de
References: <20200520070334.1778751-1-dwlsalmeida@gmail.com>
 <20200520070334.1778751-2-dwlsalmeida@gmail.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <5fa52855-7f99-1e35-9116-6e165a92e23c@linuxfoundation.org>
Date: Thu, 28 May 2020 16:50:36 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200520070334.1778751-2-dwlsalmeida@gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [RFC, WIP,
	v6 01/10] media: vidtv: add Kconfig entry
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

On 5/20/20 1:03 AM, Daniel W. S. Almeida wrote:
> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> 
> Add the necessary Kconfig entries and a dummy Makefile to compile the new
> virtual DVB test driver (vidtv).
> 
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> ---
>   drivers/media/test-drivers/Kconfig        | 10 ++++++++++
>   drivers/media/test-drivers/Makefile       |  1 +
>   drivers/media/test-drivers/vidtv/Kconfig  | 11 +++++++++++
>   drivers/media/test-drivers/vidtv/Makefile |  2 ++
>   4 files changed, 24 insertions(+)
>   create mode 100644 drivers/media/test-drivers/vidtv/Kconfig
>   create mode 100644 drivers/media/test-drivers/vidtv/Makefile
> 
> diff --git a/drivers/media/test-drivers/Kconfig b/drivers/media/test-drivers/Kconfig
> index 188381c855939..7d273a8a7acc2 100644
> --- a/drivers/media/test-drivers/Kconfig
> +++ b/drivers/media/test-drivers/Kconfig
> @@ -4,6 +4,10 @@ menuconfig V4L_TEST_DRIVERS
>   	bool "V4L test drivers"
>   	depends on VIDEO_DEV
>   
> +menuconfig DVB_TEST_DRIVERS
> +	bool "DVB test drivers"
> +	depends on DVB_CORE && MEDIA_SUPPORT && I2C
> +
>   if V4L_TEST_DRIVERS
>   
>   source "drivers/media/test-drivers/vimc/Kconfig"
> @@ -24,3 +28,9 @@ config VIDEO_VIM2M
>   source "drivers/media/test-drivers/vicodec/Kconfig"
>   
>   endif #V4L_TEST_DRIVERS
> +
> +if DVB_TEST_DRIVERS
> +
> +source "drivers/media/test-drivers/vidtv/Kconfig"
> +
> +endif #DVB_TEST_DRIVERS
> diff --git a/drivers/media/test-drivers/Makefile b/drivers/media/test-drivers/Makefile
> index 74410d3a9f2d2..9f0e4ebb2efe7 100644
> --- a/drivers/media/test-drivers/Makefile
> +++ b/drivers/media/test-drivers/Makefile
> @@ -7,3 +7,4 @@ obj-$(CONFIG_VIDEO_VIMC)		+= vimc/
>   obj-$(CONFIG_VIDEO_VIVID)		+= vivid/
>   obj-$(CONFIG_VIDEO_VIM2M)		+= vim2m.o
>   obj-$(CONFIG_VIDEO_VICODEC)		+= vicodec/
> +obj-$(CONFIG_DVB_VIDTV)			+= vidtv/
> diff --git a/drivers/media/test-drivers/vidtv/Kconfig b/drivers/media/test-drivers/vidtv/Kconfig
> new file mode 100644
> index 0000000000000..22c4fd39461f1
> --- /dev/null
> +++ b/drivers/media/test-drivers/vidtv/Kconfig
> @@ -0,0 +1,11 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config DVB_VIDTV
> +	tristate "Virtual DVB Driver (vidtv)"
> +	depends on DVB_CORE && MEDIA_SUPPORT && I2C
> +	help

Add one line summary/name for the driver "Virtual DVB test driver" is
a good description.

> +	  The virtual DVB test driver serves as a reference DVB driver and helps
> +	  validate the existing APIs in the media subsystem. It can also aid developers
> +	  working on userspace applications.
> +

Wrapped lines. Split this to read better.

Take a look at others e.g: drivers/media/test-drivers/vimc/Kconfig
for reference.

> +
> +	  When in doubt, say N.
> diff --git a/drivers/media/test-drivers/vidtv/Makefile b/drivers/media/test-drivers/vidtv/Makefile
> new file mode 100644
> index 0000000000000..d1558d84eeaed
> --- /dev/null
> +++ b/drivers/media/test-drivers/vidtv/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> 

btw. Did you test it with just this patch?

thanks,
-- Shuah
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
