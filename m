Return-Path: <SRS0=1nBW=7O=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E4F5C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  1 Jun 2020 16:51:45 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10A5F2073B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  1 Jun 2020 16:51:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JaPe6H9A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10A5F2073B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CF4FB8615E;
	Mon,  1 Jun 2020 16:51:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xuZvw9I6VOBm; Mon,  1 Jun 2020 16:51:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 328A686031;
	Mon,  1 Jun 2020 16:51:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 136EEC0178;
	Mon,  1 Jun 2020 16:51:44 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 984DBC0176
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Jun 2020 16:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 55D6C8610F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Jun 2020 16:51:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AfB1bcXUAzKC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Jun 2020 16:51:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oo1-f66.google.com (mail-oo1-f66.google.com
 [209.85.161.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0E02185F37
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Jun 2020 16:51:38 +0000 (UTC)
Received: by mail-oo1-f66.google.com with SMTP id v3so1559717oot.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 01 Jun 2020 09:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=T7w7j4yQwplmXQxxnc/dAqR0xCmeWec60t3EIHBSr/c=;
 b=JaPe6H9A/OWTCRY9H5QuCuNhjT4T6J4+XtVy7aU5HUXhaR5LkOr1czyxIYmF6D7lDf
 EWOcnaDeVZYPoPmxuv/1kjqIseUe0OS8nNvkBEY9+6qinMQarEQc8zWsUx9shc6yPDbg
 omwwhEDhV5ilKLyWvYOMMKTScvHprq7LR3lLA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T7w7j4yQwplmXQxxnc/dAqR0xCmeWec60t3EIHBSr/c=;
 b=GjNRde+H1JaMh+1lGcGJ0YDrccV1wvO30IYRtGrnTlthGlbuYkgRz10Vv9tP+YUkt4
 hV1YRP0XMfx2z8claJRB2EmJHiEsb/vj5T/GXHOtwBnxliFyONzC02Dco9cCYIoxwbL4
 mjK81CoumTR6EPTxBp+XeiTwPpHqIcOV/MpodJX3ljDdIblp091+NrTrpYU4f6W0Gz9a
 OlzKCBwYjzHNq9zYnlVk30t05Wit9xcuW2ADAAPfBNbkVUBqQwzoRwZDvPpbLRji5UMk
 yxemfjgOtyNgtEwVEthQtkpIExmsmeRlPn0gA08rTakm5iZAvYmIpg+z5LbCij3QGEwY
 CgXg==
X-Gm-Message-State: AOAM532+TM+IcyBwQ8sO3i1EAXwY6sdrBsj27XVRhv6y9UzHglah1XFj
 FmVs8hOx0y1rhL/gcL5jcifx1Rkk
X-Google-Smtp-Source: ABdhPJyeVfnGsjB7FHe6WfKM3RmmWvuRQH99VnMLxtmhXrtfmi5Cw9fJvC5C7Qov1rzbjhrALU9CgA==
X-Received: by 2002:a4a:2c88:: with SMTP id o130mr17528761ooo.81.1591030297092; 
 Mon, 01 Jun 2020 09:51:37 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id c184sm5388325oif.3.2020.06.01.09.51.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2020 09:51:36 -0700 (PDT)
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
 mchehab+huawei@kernel.org, sean@mess.org, kstewart@linuxfoundation.org,
 allison@lohutok.net, tglx@linutronix.de
References: <20200520070334.1778751-1-dwlsalmeida@gmail.com>
 <20200520070334.1778751-6-dwlsalmeida@gmail.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <2b00fc7a-8818-b0be-7e42-a2df9787876b@linuxfoundation.org>
Date: Mon, 1 Jun 2020 10:51:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200520070334.1778751-6-dwlsalmeida@gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [RFC, WIP,
 v6 05/10] media: vidtv: add wrappers for memcpy and memset
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

Hi Daniel,

On 5/20/20 1:03 AM, Daniel W. S. Almeida wrote:
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
>   .../media/test-drivers/vidtv/vidtv_common.c   | 86 +++++++++++++++++++
>   .../media/test-drivers/vidtv/vidtv_common.h   | 27 ++++++
>   2 files changed, 113 insertions(+)
>   create mode 100644 drivers/media/test-drivers/vidtv/vidtv_common.c
>   create mode 100644 drivers/media/test-drivers/vidtv/vidtv_common.h
> 

I don't see these added to Makefile. Building the driver with the patch
has no effect.

In any case I don't see any value in adding the wrappers here. They
really do nothing other than doing range checks. It adda a layer of
indirection that is unnecessary.

> diff --git a/drivers/media/test-drivers/vidtv/vidtv_common.c b/drivers/media/test-drivers/vidtv/vidtv_common.c
> new file mode 100644
> index 0000000000000..6810212087c17
> --- /dev/null
> +++ b/drivers/media/test-drivers/vidtv/vidtv_common.c
> @@ -0,0 +1,86 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * The Virtual DVB test driver serves as a reference DVB driver and helps
> + * validate the existing APIs in the media subsystem. It can also aid
> + * developers working on userspace applications.
> + *
> + * Written by Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ":%s, %d: " fmt, __func__, __LINE__
> +
> +#include <linux/printk.h>
> +#include <linux/ratelimit.h>
> +#include <linux/string.h>
> +#include <linux/types.h>
> +
> +#include "vidtv_common.h"
> +
> +/**
> + * vidtv_memcpy() - wrapper routine to be used by MPEG-TS
> + *	generator, in order to avoid going past the
> + *	output buffer.
> + * @to:	Starting element to where a MPEG-TS packet will
> + *	be copied.
> + * @to_offset:	Starting position of the @to buffer to be filled.
> + * @to_size:	Size of the @to buffer.
> + * @from:	Starting element of the buffer to be copied.
> + * @len:	Number of elements to be copy from @from buffer
> + *	into @to+ @to_offset buffer.
> + *
> + * Note:
> + *	Real digital TV demod drivers should not have memcpy
> + *	wrappers. We use it here because emulating MPEG-TS
> + *	generation at kernelspace requires some extra care.
> + *
> + * Return:
> + *	Returns the number of bytes written
> + */
> +u32 vidtv_memcpy(void *to,
> +		 size_t to_offset,
> +		 size_t to_size,
> +		 const void *from,
> +		 size_t len)
> +{
> +	if (unlikely(to_offset + len > to_size)) {

Use of unlikely isn't necessarily beneficial in all cases.

> +		pr_err_ratelimited("overflow detected, skipping. Try increasing the buffer size\n");
> +		return 0;
> +	}
> +
> +	memcpy(to + to_offset, from, len);
> +	return len;
> +}
> +
> +/**
> + * vidtv_memset() - wrapper routine to be used by MPEG-TS
> + *	generator, in order to avoid going past the
> + *	output buffer.
> + * @to:	Starting element to set
> + * @to_offset:	Starting position of the @to buffer to be filled.
> + * @to_size:	Size of the @to buffer.
> + * @from:	Starting element of the buffer to be copied.
> + * @ten:	Number of elements to be copy from @from buffer
> + *	into @to+ @to_offset buffer.
> + *
> + * Note:
> + *	Real digital TV demod drivers should not have memset
> + *	wrappers. We use it here because emulating MPEG-TS
> + *	generation at kernelspace requires some extra care.
> + *
> + * Return:
> + *	Returns the number of bytes written
> + */
> +u32 vidtv_memset(void *to,
> +		 size_t to_offset,
> +		 size_t to_size,
> +		 const int c,
> +		 size_t len)
> +{
> +	if (unlikely(to_offset + len > to_size)) {
> +		pr_err_ratelimited("overflow detected, skipping. Try increasing the buffer size\n");
> +		return 0;
> +	}
> +
> +	memset(to + to_offset, c, len);
> +	return len;
> +}
> diff --git a/drivers/media/test-drivers/vidtv/vidtv_common.h b/drivers/media/test-drivers/vidtv/vidtv_common.h
> new file mode 100644
> index 0000000000000..a3cb303cc7423
> --- /dev/null
> +++ b/drivers/media/test-drivers/vidtv/vidtv_common.h
> @@ -0,0 +1,27 @@
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
> +
> +u32 vidtv_memcpy(void *to,
> +		 size_t to_offset,
> +		 size_t to_size,
> +		 const void *from,
> +		 size_t len);
> +
> +u32 vidtv_memset(void *to,
> +		 size_t to_offset,
> +		 size_t to_size,
> +		 int c,
> +		 size_t len);
> +
> +#endif // VIDTV_COMMON_H
> 

thanks,
-- Shuah
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
