Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D9020B7F9
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  7 Aug 2025 11:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754567743; cv=none; b=OGFPXiIURruiWv9R+BOQgyltvWPCvMguFDzbchE3azU2GWxbzHu69+6aQJ1sbM5hHUH3m4cOjPU4L7SLnDE3mIS7r9Yszf0J1KNTfPCk9mDA02m6X/cyvFPfbYIuQSun2+gqQbtkBVDPQ2MWGooc6IgDwaaHhYSoimJgdHYT3sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754567743; c=relaxed/simple;
	bh=lbQa2W/bR/FxgQYKWNOpVN+CNFSYZp4dz5+1eJ3QlwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PUsuie0naA6qEXYFvz6cEB9TvpEarXeg26yUrrgjTcvSo3sP/QeZiVODDt/IGuWZopBh0zTisQnLodeA06/xBX0IDdA+ox5RluS8VjsK7JxxB/Eb46URs2KYt7rfJ29rycXuOFJxUj/ct73vJ4JAVrgg/TPrE65Rn+tO2Kdnbi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=P4RLm2Zh; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="P4RLm2Zh"
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-88105a23088so28543739f.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 07 Aug 2025 04:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1754567741; x=1755172541; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jDJav/l0x6TJpNlmvipxLhkS/rO66KRXVU4Ugz2QqFU=;
        b=P4RLm2Zhux+rIDMCYruiJSHM+m46BX7XSCf2w7Adr1sC2f5Eext4KQVtg+3eyOBBoj
         3VUtSNS6yUBV2H9tvhK8psBSJ5vrwUTSWvAeVqXWD1QwnFD44Thy6tajw7MtNalWAiAc
         mmgVozkGXSsBvRoA3J5PqaRajl6lHLA5ww1wE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754567741; x=1755172541;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jDJav/l0x6TJpNlmvipxLhkS/rO66KRXVU4Ugz2QqFU=;
        b=t8bWn43+Ha/SJQYr2AsOuBd8BaZ/m4XyWC9wPwhfgv29+Kjyp427aS4T7ZylnNFke0
         UnAwiJ7rzqYo8h45pgbJtteN8cXcQHDBHo9IF4bUBxGpuD0iTYDC408zp8qxQJQrgMZ4
         Agrse8tLbciyfLo5Ft2MiurJwVA9nN98nD2iriMh7S1qBMFwCpfNsL24JjOw0Thqp5oO
         ZXXyRt8gr9Bglm6IhgILoxXqcQ3nBUST1gbAyX3/lb39XgZisgqA6HR9ItXxlwbOZIQS
         0GECNO+0fcC6mGjN6H+n/k2TD0IED82MX+GqyIKbuCE2THXhyJ55ZmXay3Df6zMSX5sy
         IW4g==
X-Forwarded-Encrypted: i=1; AJvYcCV7SkqhQ/Wrs/BTM8Kq6DpQMzvmdejDqVTOJpSJQParlr68pVHGbsbqmsof0EN4UEz7/qFbILotilI3ZHBZyrXcCTD2ug==@lists.linux.dev
X-Gm-Message-State: AOJu0YxQ9KoALwFc1S15rSF8oZqRtn0q/2YljXE041rZ05urxkYqkrZ9
	HCXrOGpWieGnoyZiyeTMENLwJUglHAQExRrmabl0NQSJy/M6hp3djV947gjBIhvW4Vs6gVNM1UF
	+iTTRZg==
X-Gm-Gg: ASbGncv8GL188M6DeG22mYy+Tg6szB7LnqEzsJltXlVVyc0dnB7k7inSHWv7fUdufnh
	p0UP4GGsaCnliKbo4TBjzlSKc3f7hgnrPfWohaZWRc5Aot2YXTJfZW99VXG8RYM0vcgIoqyL6Px
	T1TscO7MEL91qfPPrppocpbcLmtawN/xXg+lyNhGpbQNIhjkWsplSAU1cQoj+RJqxRdWA4dleOM
	yN4fGp+xaXuAGbaL5Av17S+H/cTao2RRQOLxr6iOMVp7yMb34ZdH3ZdEKVtgyEOQRaEsZppMQDD
	pmO5pDHaRLhv3F5IkaIf4NV7lus4iYlmuhZaNTlndiJ5hCaLc6wg/+lpyR2VNFTjn6jTR6IKMyz
	SshrZ/ICUAIIUtauzJvpvW36SLJHyyNRVdQ2HrdqAe4AqY0txmaPvtev/
X-Google-Smtp-Source: AGHT+IEtBJjhUCVSUlXC+oL0iY/rk/JMAXniUp/7F2ZuuNi14gQDrMaDUSgLUnyC6w992pz9L32QZw==
X-Received: by 2002:a05:6e02:1a04:b0:3e3:f8c4:2bcf with SMTP id e9e14a558f8ab-3e51b882290mr102842575ab.5.1754567740689;
        Thu, 07 Aug 2025 04:55:40 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3e4029d41a6sm69781285ab.24.2025.08.07.04.55.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 04:55:39 -0700 (PDT)
Message-ID: <81913369-783f-4e7e-8172-41f808537b3a@ieee.org>
Date: Thu, 7 Aug 2025 06:55:37 -0500
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] greybus: svc: use string choice helpers instead of
 ternary operator
To: Nai-Chen Cheng <bleach1827@gmail.com>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>, linux-kernel-mentees@lists.linux.dev
References: <20250806-greybus-string-choices-v1-1-3e1c91048b62@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20250806-greybus-string-choices-v1-1-3e1c91048b62@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/6/25 1:27 AM, Nai-Chen Cheng wrote:
> Replace ternary operator with str_enabled_disabled() helper to improve
> code readability and consistency.
> 
> Generated using Coccinelle semantic patch.
> 
> Signed-off-by: Nai-Chen Cheng <bleach1827@gmail.com>

Looks good to me.  Thanks.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/greybus/svc.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/greybus/svc.c b/drivers/greybus/svc.c
> index 4256467fcd35..35ea7147dca6 100644
> --- a/drivers/greybus/svc.c
> +++ b/drivers/greybus/svc.c
> @@ -10,6 +10,7 @@
>   #include <linux/kstrtox.h>
>   #include <linux/workqueue.h>
>   #include <linux/greybus.h>
> +#include <linux/string_choices.h>
>   
>   #define SVC_INTF_EJECT_TIMEOUT		9000
>   #define SVC_INTF_ACTIVATE_TIMEOUT	6000
> @@ -73,7 +74,7 @@ static ssize_t watchdog_show(struct device *dev, struct device_attribute *attr,
>   	struct gb_svc *svc = to_gb_svc(dev);
>   
>   	return sprintf(buf, "%s\n",
> -		       gb_svc_watchdog_enabled(svc) ? "enabled" : "disabled");
> +		       str_enabled_disabled(gb_svc_watchdog_enabled(svc)));
>   }
>   
>   static ssize_t watchdog_store(struct device *dev,
> 
> ---
> base-commit: 7881cd6886a89eda848192d3f5759ce08672e084
> change-id: 20250806-greybus-string-choices-e6d53d2382a6
> 
> Best regards,

