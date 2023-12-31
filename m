Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFA71873
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 31 Dec 2023 09:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="al0S0BLw"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81B2A607C0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 31 Dec 2023 09:39:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81B2A607C0
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=al0S0BLw
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sGDMgmDn00JH
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sun, 31 Dec 2023 09:39:18 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 830C860783
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 31 Dec 2023 09:39:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 830C860783
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704015557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MSsXgXAWfLN2ei8onO/BaPZdF6p5wfeK/YpnlP6sL2w=;
	b=al0S0BLw6ZwJNGRWCv4uyDM6uP4k0wZ81/TuhrK9f8Pb0tNG2KcthayAAXnr9qROgQGSP4
	DY5PUVl3QZ99Uxu58jF5ajZJ7fE5IfBVd7HxPg+EuuigVDch4pLxOx3zoYBb/MvAqTzkaI
	+LZ61aGmIusWP9T86g3mi63MamZlEF0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-79-3LCEO-QTNJOupSViToQ_cA-1; Sun, 31 Dec 2023 04:39:15 -0500
X-MC-Unique: 3LCEO-QTNJOupSViToQ_cA-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5551f8ec1c8so2428321a12.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 31 Dec 2023 01:39:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704015555; x=1704620355;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MSsXgXAWfLN2ei8onO/BaPZdF6p5wfeK/YpnlP6sL2w=;
        b=v1SjmRO8JAAkj/3zltZpG+QEdOnf1quowQFFRCYgYLaTszobjizSiZq+J5MYh2ZG14
         VjhdA4hQVLXMlLwBYrXE1U0CqurMqPcWRmM6eGXOxf0a21AgeVDTmMPLzSbI53eqAhU+
         BNe0eANi7bcqoVOGdqb/bTya5MN4GlFp8cUgNwrhjiQt0jyPngxKTZwT2KCSNvE2neJj
         j4br+z7APLd7idRRbyw6z70FhGLxhA3Jg85dPlxcT7ZdJhNCn4SAk3+F/F8hTg4vO+Oj
         rbMl1GqEcqBAOsF81yzOiD9x2WvhZ9z9gPA+o50hblWZE1STJks8xMKFZpU/tX+diP6O
         /nVg==
X-Gm-Message-State: AOJu0Yw+Jg6bDQnJCee7T5DgErbbOtmuNVA++3SmgOxxkbM50rgTJ+5a
	S9uznDV1QyOZ+HSU6jBRqrJrf2aQaAHYOaa1v/o9llhPjIFRcYwPMiQ2MQayup/7bpJtVEzeiGT
	jYVSSZeVF3x/SVK0S+fVx9njx0R5bm+ZUBv4GjrbV9yGuztivfjlevl4A
X-Received: by 2002:a05:6402:148f:b0:555:b7b8:6d58 with SMTP id e15-20020a056402148f00b00555b7b86d58mr2236137edv.68.1704015554869;
        Sun, 31 Dec 2023 01:39:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG7gkqwiv08UWlPI2wSdTw3bR46a7OJotvXDUCIQsB1EFFE5OYNb2PjBotp4aybJT+sJK7bXQ==
X-Received: by 2002:a05:6402:148f:b0:555:b7b8:6d58 with SMTP id e15-20020a056402148f00b00555b7b86d58mr2236127edv.68.1704015554550;
        Sun, 31 Dec 2023 01:39:14 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ew10-20020a056402538a00b005546ba152f4sm10900308edb.71.2023.12.31.01.39.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Dec 2023 01:39:13 -0800 (PST)
Message-ID: <b78d7f1d-ced8-42d2-8523-7b26f917d3e9@redhat.com>
Date: Sun, 31 Dec 2023 10:39:13 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers: staging: media: atomisp: pci: Fixes a spelling
 mistake in sh_css_defs.h
To: Dipendra Khadka <kdipendra88@gmail.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
References: <20231218153200.450148-1-kdipendra88@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231218153200.450148-1-kdipendra88@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/18/23 16:32, Dipendra Khadka wrote:
> The script checkpatch.pl reported a spelling error
> in sh_css_defs.h as below:
> 
> '''
> WARNING: 'upto' may be misspelled - perhaps 'up to'?
> /* The FPGA system (vec_nelems == 16) only supports upto 5MP */
>                                                     ^^^^
> '''
> 
> This patch corrects a spelling error,
> changing "upto" to "up to".
> 
> Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>

Thank you for your patch.

I have merged this in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And this patch will be included in my next
pull-request to Mauro (to media subsystem maintainer)

Regards,

Hans


> ---
>  drivers/staging/media/atomisp/pci/sh_css_defs.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/sh_css_defs.h b/drivers/staging/media/atomisp/pci/sh_css_defs.h
> index 7eb10b226f0a..2afde974e75d 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_defs.h
> +++ b/drivers/staging/media/atomisp/pci/sh_css_defs.h
> @@ -131,7 +131,7 @@ RGB[0,8191],coef[-8192,8191] -> RGB[0,8191]
>   * invalid rows/columns that result from filter initialization are skipped. */
>  #define SH_CSS_MIN_DVS_ENVELOPE           12U
>  
> -/* The FPGA system (vec_nelems == 16) only supports upto 5MP */
> +/* The FPGA system (vec_nelems == 16) only supports up to 5MP */
>  #define SH_CSS_MAX_SENSOR_WIDTH           4608
>  #define SH_CSS_MAX_SENSOR_HEIGHT          3450
>  

