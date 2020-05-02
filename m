Return-Path: <SRS0=N6Le=6Q=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF138C47247
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  2 May 2020 04:58:11 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 839FA2184D
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  2 May 2020 04:58:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="fZ5iGBxY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 839FA2184D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 49CD888C92;
	Sat,  2 May 2020 04:58:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bI6h-V64csNT; Sat,  2 May 2020 04:58:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 98CAF88F7E;
	Sat,  2 May 2020 04:58:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7DE49C0888;
	Sat,  2 May 2020 04:58:10 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 89321C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  2 May 2020 04:58:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 744248850A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  2 May 2020 04:58:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j+j5Kdu+DRc7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  2 May 2020 04:58:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DAF5A88546
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  2 May 2020 04:58:08 +0000 (UTC)
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de
 [95.90.213.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B207A208DB;
 Sat,  2 May 2020 04:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588395488;
 bh=Z+otAQneYfqHhtTr/kcWGv2dvBqsPgkDZ6RhF2u47sk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fZ5iGBxYMQtFy2pi/3pWB6Gftl+GybrebqQ+MXe7RPq3FiyZbU0njTCEMmhBpUJSl
 CdZRi0kiZyvDez7u8LtIJU4PW+2Q3S1SES492RdLxsw1Hi3xIcukpGU8MbhDwV1Q/c
 wNsKhOZaTi+/+ssuS6x8ITq1bIqCFXGbgfDA5B9Q=
Date: Sat, 2 May 2020 06:58:03 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <20200502065803.37d40feb@coco.lan>
In-Reply-To: <20200502032216.197977-2-dwlsalmeida@gmail.com>
References: <20200502032216.197977-1-dwlsalmeida@gmail.com>
 <20200502032216.197977-2-dwlsalmeida@gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: kstewart@linuxfoundation.org, sean@mess.org, linux-kernel@vger.kernel.org,
 tglx@linutronix.de, linux-kernel-mentees@lists.linuxfoundation.org,
 allison@lohutok.net, linux-media@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [RFC, WIP,
	v4 01/11] media: vidtv: add Kconfig entry
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

Em Sat,  2 May 2020 00:22:06 -0300
"Daniel W. S. Almeida" <dwlsalmeida@gmail.com> escreveu:

> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> 
> Add the necessary Kconfig entries and a dummy Makefile to compile the new
> virtual DVB test driver (vidtv).

Patch looks good. Please notice that this should be the last patch at the 
series, as otherwise it would break git bisect.

> 
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> ---
>  drivers/media/test-drivers/Kconfig        | 10 ++++++++++
>  drivers/media/test-drivers/Makefile       |  1 +
>  drivers/media/test-drivers/vidtv/Kconfig  | 11 +++++++++++
>  drivers/media/test-drivers/vidtv/Makefile |  2 ++
>  4 files changed, 24 insertions(+)
>  create mode 100644 drivers/media/test-drivers/vidtv/Kconfig
>  create mode 100644 drivers/media/test-drivers/vidtv/Makefile
> 
> diff --git a/drivers/media/test-drivers/Kconfig b/drivers/media/test-drivers/Kconfig
> index 188381c855939..7d273a8a7acc2 100644
> --- a/drivers/media/test-drivers/Kconfig
> +++ b/drivers/media/test-drivers/Kconfig
> @@ -4,6 +4,10 @@ menuconfig V4L_TEST_DRIVERS
>  	bool "V4L test drivers"
>  	depends on VIDEO_DEV
>  
> +menuconfig DVB_TEST_DRIVERS
> +	bool "DVB test drivers"
> +	depends on DVB_CORE && MEDIA_SUPPORT && I2C
> +
>  if V4L_TEST_DRIVERS
>  
>  source "drivers/media/test-drivers/vimc/Kconfig"
> @@ -24,3 +28,9 @@ config VIDEO_VIM2M
>  source "drivers/media/test-drivers/vicodec/Kconfig"
>  
>  endif #V4L_TEST_DRIVERS
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
>  obj-$(CONFIG_VIDEO_VIVID)		+= vivid/
>  obj-$(CONFIG_VIDEO_VIM2M)		+= vim2m.o
>  obj-$(CONFIG_VIDEO_VICODEC)		+= vicodec/
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
> +	  The virtual DVB test driver serves as a reference DVB driver and helps
> +	  validate the existing APIs in the media subsystem. It can also aid developers
> +	  working on userspace applications.
> +
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



Thanks,
Mauro
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
