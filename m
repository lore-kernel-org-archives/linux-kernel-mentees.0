Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1634321C9F4
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 18 Jun 2025 20:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750279340; cv=none; b=Jnq0xhUYyRDpRKjK2Wm9Po0HUtyXEkQxOZjis2titAEi0R6e0k3R2wzd/pQb7QGoy+56R2gwP3DUCKUo79FTE1KnVhqjnkPcVFwI8rqHPRxi3JmZK6dHhrx2SMDeMhEE+m+61F1fOHQS4tlE8iNz0wznlgEIPm+hHS3UPn//U90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750279340; c=relaxed/simple;
	bh=L+cyLQGnllq28JQ6DaYTG1avcsFD5VA3UICOvndcs64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o6ez+w04NvFdJzEXCfT0pXCdEQ10MTESgL1Z5nMFIdm4RjdlJqYQ3KYXDxR086l66labJ4X+jG/vh37jdk+CeolNNCm1DZgDp8guN55zuyGkqzN9QqTJuo++/CQBIQSHoIbTlSLRXbKmDRTzBQub1ixzSfAVzH/FZB0X0Z68axs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Pa8gfA9i; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pa8gfA9i"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-72c09f8369cso36391a34.3
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 18 Jun 2025 13:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750279338; x=1750884138; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hYufF9gbGHCLXN7Cc7t3rq/6SWdHhk4SLqkzSCs6BiI=;
        b=Pa8gfA9iAa/10QHS7jXUFM8Km+EGRoWN/RYlZoIVwf6+jlY1NV1LeUinFIKeynskcw
         +CCSJmw7Hp0km52OBgy6nhuLetsl39OstNfp7ivtTfxRfTgtEsgmxhl7V1ZbEJYTDWsC
         C7DhSdmhnhnFNDadaosvZGOty9AXO3s7p1PpipiDvyUMTDcUZSJNEOkdFNqN+MxJLuH6
         100Xz9fo8Q0tIDPeWKnjcsKDMAVahBN0Bkp6aYuCl09HUMpYEGCERINqSLFIcfqBrPUS
         eM98hUqfY1N/ogXZ18vOaieto+irfhAL5H/682qxjGcsc0bREqfETX2YEEktF8nBRa6g
         6GjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750279338; x=1750884138;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hYufF9gbGHCLXN7Cc7t3rq/6SWdHhk4SLqkzSCs6BiI=;
        b=rJnDwwlioF00j/0wqOil0aseifMPX0ZF9TRPiEOx62MHbd9G3RbfbIPigcx6/r3F16
         ajxIbv40CgWwUnvsHTsckumWYQDl4KUbiD1W4O2/EZm/KYnBLfZZcYw0YWUigH1rkT+g
         daeUUfk0JbnmxYWDKzyyX5NKWfA6i6FMznWuUGKxc0yiPViHtkx8RXTX5sBf3iHarcGe
         3owm3TipTsTGt0EpojH/r9HduzqwDWVzrOs4vdD6+76hEnWDS2RX+GpEAViz/ddlNcFG
         b0ST0sEGpq7uq8Pai5q5Wk+eZV9ZBQJDOfVTrb26/3EAh1CKDaDlvDyylEjLuWV7a5nv
         papQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3e1sjMqYCID7FKFpyvKeWjvM33/PAa8Gk6TBkM8MAqSFtpgsnbDosLjgME+6O5jcl79w2ct8nBAhcDy0j5dV9Lukv2w==@lists.linux.dev
X-Gm-Message-State: AOJu0YxXjaWV/3Vqbs+8sdL8ZLkOXvSZukgnjtJ23KBr6KiVRDdZjIhW
	BJl82EKTrveu4m20Ap45PTOrzG19j2GgJR/5oxf1f6ZZZ64hB/jC0zsEYLEWv6oSjn8=
X-Gm-Gg: ASbGnct0KJLTqaGaDxZ6d4yjd123CVghvgYWhCAfX/dWsddB+vXUJJqnsyazOR5Fari
	hCOrEpCM3kUkA97sx02yuGQPxy3hAzQgFdIlfnA2REDW7kpzOujCts+v4OIbRDhUoWqdNZbJ61u
	WjCMNuj38/2lqwMkh87LsZqela7KQiQrKMl9EEbgFSZcl6QBLnDwblfqDo8icPICdEUIO3VPbAI
	zQObhhjf1udi6+gje9j/k/DCbj7ofUcgzCU8nMUop/e6EJkqy15XCfa6YMRPXm98M83ktQt4vTm
	EpPJD+LHy6pZq5HtE35GmXb1pVD/iuVtqp3RWcgXmMaFSjX+bf0ih+wClqVKVR0J96dmIGOPXPk
	hw+NQ
X-Google-Smtp-Source: AGHT+IGzzeXqvvtMYEhgelf1zxaiR/pha/QAgFAlvhTzf3pfuLBytIh1fL2ehaLfaCgrcdK94vSXtA==
X-Received: by 2002:a05:6830:8209:b0:72a:10ec:3542 with SMTP id 46e09a7af769-73a36318969mr11536449a34.13.1750279338012;
        Wed, 18 Jun 2025 13:42:18 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1b3b:c162:aefa:da1b])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a28403ed0sm2124977a34.26.2025.06.18.13.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 13:42:17 -0700 (PDT)
Date: Wed, 18 Jun 2025 23:42:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Pranav Tyagi <pranav.tyagi03@gmail.com>
Cc: johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org,
	vireshk@kernel.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] greybus: firmware: use strscpy, fix tag size
Message-ID: <29717a11-8867-4a28-81a6-2d847b254042@suswa.mountain>
References: <20250617125137.24503-1-pranav.tyagi03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617125137.24503-1-pranav.tyagi03@gmail.com>

On Tue, Jun 17, 2025 at 06:21:37PM +0530, Pranav Tyagi wrote:
> Increase the size of firmware_tag arrays in the following structs from
> GB_FIRMWARE_U_TAG_MAX_SIZE to GB_FIRMWARE_U_TAG_MAX_SIZE + 1 to
> accommodate null termination:
> 	- fw_mgmt_ioc_intf_load_and_validate
> 	- fw_mgmt_ioc_get_backend_version
> 	- fw_mgmt_ioc_backend_fw_update
> 	- fw_mgmt_ioc_get_intf_version
> 
> Replace strncpy() with strscpy() to ensure proper null termination as
> firmware_tag is interpreted as a null-terminated string
> and printed with %s.
> 
> Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
> ---
>  .../greybus/Documentation/firmware/firmware.c        | 12 ++++++------
>  drivers/staging/greybus/greybus_firmware.h           |  8 ++++----
>  2 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/staging/greybus/Documentation/firmware/firmware.c b/drivers/staging/greybus/Documentation/firmware/firmware.c
> index 765d69faa9cc..3b4061f4b34a 100644
> --- a/drivers/staging/greybus/Documentation/firmware/firmware.c
> +++ b/drivers/staging/greybus/Documentation/firmware/firmware.c
> @@ -63,8 +63,8 @@ static int update_intf_firmware(int fd)
>  	intf_load.major = 0;
>  	intf_load.minor = 0;
>  
> -	strncpy((char *)&intf_load.firmware_tag, firmware_tag,
> -		GB_FIRMWARE_U_TAG_MAX_SIZE);
> +	strscpy((char *)&intf_load.firmware_tag, firmware_tag,
> +		GB_FIRMWARE_U_TAG_MAX_SIZE + 1);


This is in the Documentation/ directory.  It's sample userspace
code.  Userspace code doesn't have strscpy() so this won't
compile.

regards,
dan carpenter

