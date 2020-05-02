Return-Path: <SRS0=N6Le=6Q=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EB6FC3A5A9
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  2 May 2020 06:40:50 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 038962184D
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  2 May 2020 06:40:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="hnRu6Cpv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 038962184D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A26F8874FB;
	Sat,  2 May 2020 06:40:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gRtVurF85oxk; Sat,  2 May 2020 06:40:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E2F12874D4;
	Sat,  2 May 2020 06:40:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C7E3FC0888;
	Sat,  2 May 2020 06:40:46 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C3E1BC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  2 May 2020 06:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id ADCE488F2E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  2 May 2020 06:40:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mBSrXBH43N8X
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  2 May 2020 06:40:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1461F88E43
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  2 May 2020 06:40:44 +0000 (UTC)
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de
 [95.90.213.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CC0D9208DB;
 Sat,  2 May 2020 06:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588401643;
 bh=veIQRujR2PEfdzDRCn259XTGbonPxwJS0bLgO0dYJow=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hnRu6CpvgMhn0bbEWa/fuaEznaD7Btef4wx+nXWNi23HKCun+vzAKXlt2DEYAjPt0
 Z609NbD7xnw4+xNd0SZIB7ZR+GvxFCkQu94nHGtLnS+9OEKnGC70zV1nwl+INl6YGt
 8WmmJH5A84NCaJVXNadNZtG1tUBx0gT++5bHyW/E=
Date: Sat, 2 May 2020 08:40:38 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <20200502084038.07c38c4b@coco.lan>
In-Reply-To: <20200502032216.197977-7-dwlsalmeida@gmail.com>
References: <20200502032216.197977-1-dwlsalmeida@gmail.com>
 <20200502032216.197977-7-dwlsalmeida@gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: kstewart@linuxfoundation.org, sean@mess.org, linux-kernel@vger.kernel.org,
 tglx@linutronix.de, linux-kernel-mentees@lists.linuxfoundation.org,
 allison@lohutok.net, linux-media@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [RFC, WIP,
 v4 06/11] media: vidtv: add wrappers for memcpy and memset
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

Em Sat,  2 May 2020 00:22:11 -0300
"Daniel W. S. Almeida" <dwlsalmeida@gmail.com> escreveu:

> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> 
> A lot of code in this driver is for serializing structures. This is
> error prone.
> 
> Therefore, prevent buffer overflows by wrapping memcpy and memset,
> comparing the requested length against the buffer size.
> 
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> ---
>  drivers/media/test-drivers/vidtv/Makefile     |  3 ++
>  .../media/test-drivers/vidtv/vidtv_common.c   | 44 +++++++++++++++++++
>  .../media/test-drivers/vidtv/vidtv_common.h   | 28 ++++++++++++
>  3 files changed, 75 insertions(+)
>  create mode 100644 drivers/media/test-drivers/vidtv/vidtv_common.c
>  create mode 100644 drivers/media/test-drivers/vidtv/vidtv_common.h
> 
> diff --git a/drivers/media/test-drivers/vidtv/Makefile b/drivers/media/test-drivers/vidtv/Makefile
> index a9f1993dd5443..9ea9485d42189 100644
> --- a/drivers/media/test-drivers/vidtv/Makefile
> +++ b/drivers/media/test-drivers/vidtv/Makefile
> @@ -1,3 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
> +vidtv_demod-objs := vidtv_common.o
> +vidtv_bridge-objs := vidtv_common.o
> +
>  obj-$(CONFIG_DVB_VIDTV)	+= vidtv_tuner.o vidtv_demod.o vidtv_bridge.o
> diff --git a/drivers/media/test-drivers/vidtv/vidtv_common.c b/drivers/media/test-drivers/vidtv/vidtv_common.c
> new file mode 100644
> index 0000000000000..28f10630499a9
> --- /dev/null
> +++ b/drivers/media/test-drivers/vidtv/vidtv_common.c
> @@ -0,0 +1,44 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * The Virtual DVB test driver serves as a reference DVB driver and helps
> + * validate the existing APIs in the media subsystem. It can also aid
> + * developers working on userspace applications.
> + *
> + * Written by Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> + */
> +
> +#include <linux/types.h>
> +#include <linux/string.h>
> +#include <linux/printk.h>
> +
> +u32 vidtv_memcpy(void *to,
> +		 const void *from,
> +		 size_t len,
> +		 u32 offset,
> +		 u32 buf_sz)
> +{
> +	if (buf_sz && offset + len > buf_sz) {
> +		pr_err("%s: overflow detected, skipping. Try increasing the buffer size",
> +		       __func__);
> +		return 0;

shouldn't it return an error?

> +	}
> +
> +	memcpy(to, from, len);
> +	return len;
> +}
> +
> +u32 vidtv_memset(void *to,
> +		 int c,
> +		 size_t len,
> +		 u32 offset,
> +		 u32 buf_sz)
> +{
> +	if (buf_sz && offset + len > buf_sz) {
> +		pr_err("%s: overflow detected, skipping. Try increasing the buffer size",
> +		       __func__);
> +		return 0;
> +	}
> +
> +	memset(to, c, len);
> +	return len;
> +}
> diff --git a/drivers/media/test-drivers/vidtv/vidtv_common.h b/drivers/media/test-drivers/vidtv/vidtv_common.h
> new file mode 100644
> index 0000000000000..64072c010dc66
> --- /dev/null
> +++ b/drivers/media/test-drivers/vidtv/vidtv_common.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * The Virtual DVB test driver serves as a reference DVB driver and helps
> + * validate the existing APIs in the media subsystem. It can also aid
> + * developers working on userspace applications.
> + *
> + * Written by Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> + */
> +
> +#ifndef VIDTV_COMMON_H
> +#define VIDTV_COMMON_H
> +
> +#include <linux/types.h>
> +#include <media/dvb_frontend.h>
> +
> +u32 vidtv_memcpy(void *to,
> +		 const void *from,
> +		 size_t len,
> +		 u32 offset,
> +		 u32 buf_sz);
> +
> +u32 vidtv_memset(void *to,
> +		 int c,
> +		 size_t len,
> +		 u32 offset,
> +		 u32 buf_sz);
> +
> +#endif // VIDTV_COMMON_H


On a generic note, I don't like seeing functions or macros like those
re-defining existing Kernel functions like memcpy(), memset(), etc. 

This is actually a very common pattern when vendors try to submit
new drivers upstream: several of them have a generic code, and use an
OS-specific abstraction layer, with lots of defines, inline functions
and re-definitions for Kernel functions.

Before upstreaming a driver (or removing one from staging), the driver
should get rid of those.

On **this very specific case**, I see the value of having it there, as
you're not doing it as a normal Digital TV driver, but, instead, using
those in order to emulate an MPEG-TS encoding.

Yet, as this driver is meant to be a sort of "tutorial" for ones
implementing such features, please add a WARNING at both the header and
at the source code, saying that normal drivers should not do that,
explaining why, in this specific case (where you're simulating a MPEG-TS
in software) it makes sense to have such functions.

Thanks,
Mauro
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
