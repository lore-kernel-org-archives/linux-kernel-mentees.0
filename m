Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666E52EDD71
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 12 Oct 2025 17:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760291972; cv=none; b=tEWBHBQpr+jOSwG5Qb/4dPxFKH+5cFMNcqaukWCb2JJUNOlECRluzhaPreV2QVUxJQKSNV0W49HXHZLDjEKvO6jC5LPJPmOFz6ju6GzmKfPkIrZw1sop4brdV8UqgDRlGNMZAM6earzjYWU2v8/VgqmNkgV6a+0luMj23Ms0kpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760291972; c=relaxed/simple;
	bh=qWt8KlsS667/DWj7CEknkJJNlszKHGEwCFpf/nti7Ak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X0Af+4bEiSSLYcSDU0bhC/IafwbVYjWNKJtYie4q50zUapxn5gKB/YdAeTRA1nYn8SB51Mvs+TgePcUBNFwJGpQcc2gia14o/XZWCeiTdv8Xo5CXdyazVrsfqXyEKUOL7O3Mx6BtLEMgAYea2iOV2Lu6jHeQEXPKB7q/jZZ6lb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZUbGA/mb; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZUbGA/mb"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 04A424007F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 12 Oct 2025 17:59:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.25
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pgoZnKigL-nQ for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 12 Oct 2025 17:59:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EFA9940068
Authentication-Results: smtp2.osuosl.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFA9940068
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZUbGA/mb
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	by smtp2.osuosl.org (Postfix) with ESMTPS id EFA9940068
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 12 Oct 2025 17:59:29 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-27ee41e0798so57190295ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 12 Oct 2025 10:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760291969; x=1760896769; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pvLTpqWhUMNwfKi2DUzR3zUOBPTWtPFJRGCtsVkQ/g0=;
        b=ZUbGA/mbQmyAqOTu2XZsZ7GCSwq2kSfjw6++mDosJeI7BGuIGO3x8gwsDamBPp1VEs
         B6B1QNYsvxCvn5T5BX6569U67kvp7TOFTh7UhYmJK+6a1htbMZ8qIRH8oHzG+0Y6gz6E
         OYjyi+IdVd+wNg9LY0d8ivLtQWOOOdKdY0YnTzB7sVZlp/okHU0p35Pusa6sdrOB10Vf
         CJoU7WOg8Dw1z8eHYr17ehbwpfdyXK7p0jlyHPGkBuUICBMMeU9TOsUOyMyjLFpBwhJI
         YMIUGSb1FtdrYPSDhppzKvYZchlOt24tnFyiarBk5Pl+m6Y/dTCWQ0o5ekqAVQl5/IA7
         JyMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760291969; x=1760896769;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pvLTpqWhUMNwfKi2DUzR3zUOBPTWtPFJRGCtsVkQ/g0=;
        b=GyzUt5+kX8DO1cncaYAEa9Ay3YTI0FBncjaQlleD2A/Wdko95BnXKN50Y2ez/pjv1r
         RUUx/+Rv3mSkyvDyW0Vmqmm8OgRkkv08DoXYLItCprGEVJ1IACiBG8XwkggJGWFqfFFI
         VAngqDsIqlcXk9zxs4NZOIgNbhZIQjD3KqOcLC8fXeLPTZgGJQJKNAoHuqqVpkRYek22
         6zxPRxegQkz7APvt1KU2ijUpF63icj5Xo0CGRBlHpc6xSCV+xy4pm/lon0kUGdJYkx+6
         RqK23Hf1YSJxadLvGqzQ7Qj2se9Fktl8H0bvAMN1gA3wIvZKmfNp7QpkgJ+4LqI6oROo
         vUhg==
X-Forwarded-Encrypted: i=1; AJvYcCXAKs7Abu7AIjTegz4PlU4P8HJdls+7mZVBnmJvObYji91QuhlehSpFMgXLb1gaIVYy7O32MwzrLl4rEt6jHM80uLaIeA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwZFNHjGJrtwm9mQGKgS4TPytykZEClTvHGXvAmEHXwe8Ae5wJq
	K3fmA8+JJaWF5BYyd78eT7B/Dv96gglYzmFhzUwWnclwRUwoA6Aj7Xha
X-Gm-Gg: ASbGncvo89AYAZfDSyxOlQVotpaeXjx8cMwRSS4xZfIRZvT9ozG2/93rKYW4RlsuSfz
	o6XpyhQpLxApFipp2l/RVNY5Kg+99/+euaknubvvbWqN6inc+6VSYHU7cmqxPLRKqjZHMbih12Y
	Mv/DqsR6iBrZHKX3tqO6HfjOKdZVc192C8jVIa8NmpFp/fDLxPiKiihX7ReG7luJChm5Y6EcsCd
	teITYXbvGviQYpwMPR/WRA5c0jn+1TWFHtXwbI/qomiwBNtMeCLsADEdQCxnGjSjSx/vERPxmPf
	A1dgD3eBAyGjBQn+Bpzn60vyZ17fH1JaNybhaQFvsb9L1njtFSjJyYbShVQuYpnRhF9PQMn/nyv
	qRmuzrlVY8Hm2cs7mkkxKdCCwNQSvAYyPEfL9AbYaPDkhbyYP+1wguw==
X-Google-Smtp-Source: AGHT+IH66mjgwju+uytBphIGoHpFDHA0VnVMlPqCCqqHrYPKBigQsM48Pjhjh2izDM7DkBtwCGDObA==
X-Received: by 2002:a17:902:f642:b0:270:4964:ad7c with SMTP id d9443c01a7336-29027356555mr258463735ad.2.1760291969153;
        Sun, 12 Oct 2025 10:59:29 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2905571d68asm45135485ad.2.2025.10.12.10.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 10:59:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 12 Oct 2025 10:59:28 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ranganath V N <vnranganath.20@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com, khalid@kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] hwmon: sht3x: initialize variable 'ret' in
 update_interval_write().
Message-ID: <7fc29d1b-4c5b-4a0a-b591-dd260eb6acfe@roeck-us.net>
References: <20251012-my_driver_work-v1-1-9e5fe6de51f4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251012-my_driver_work-v1-1-9e5fe6de51f4@gmail.com>

On Sun, Oct 12, 2025 at 05:13:27PM +0530, Ranganath V N wrote:
> fix for the smatch errors:
> drivers/hwmon/sht3x.c:606 update_interval_write() error: uninitialized symbol 'ret'.
> 
> The warning can occur when both the data->mode and mode which is
> derived from get_mode_from_update_interval() are zero.
> In this case, no i2c command is sent and ret remains undefined
> before reaching the coman return path.
> 
> When both data->mode and mode are zero, the device remains in
> single shot mode and no configuration change is required.
> In such cases, it is correct to treat the operation as successful
> without issuing any i2c transfer.
> 
> To address this, initialize 'ret' to 'SHT3X_CMD_LENGTH'. this makes
> the no-operation path return success while keeping the existing error
> to all other paths.
> 
> This change removes the smatch errors. Tested by compiling.
> 
> Signed-off-by: Ranganath V N <vnranganath.20@gmail.com>

Applied.

Guenter

> ---
>  drivers/hwmon/sht3x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> 
> ---
> base-commit: e5f0a698b34ed76002dc5cff3804a61c80233a7a
> change-id: 20251012-my_driver_work-77b22c239e99
> 
> Best regards,
> 
> diff --git a/drivers/hwmon/sht3x.c b/drivers/hwmon/sht3x.c
> index 557ad3e7752a..4b52d57eaad8 100644
> --- a/drivers/hwmon/sht3x.c
> +++ b/drivers/hwmon/sht3x.c
> @@ -553,7 +553,7 @@ static int update_interval_read(struct device *dev)
>  static int update_interval_write(struct device *dev, int val)
>  {
>  	u8 mode;
> -	int ret;
> +	int ret = SHT3X_CMD_LENGTH;
>  	const char *command;
>  	struct sht3x_data *data = dev_get_drvdata(dev);
>  	struct i2c_client *client = data->client;
