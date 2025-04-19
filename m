Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA12213C3F2
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 19 Apr 2025 18:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745086396; cv=none; b=cLx5COkXCcCfOEZJCDDAwR6KGscXcWbiCdJqwoBVR0ha7vsBG7L7sOJiLvoL3eL5lsJr6JtPp0tJ6bHrkE6ri30hae/oSOry83KoSX8j8PjpwhhnsZPM6PP9N+/PvNRENMXXZQrBApfBkQlmC7bfT9i5/Fxpx6cSYYesIum086I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745086396; c=relaxed/simple;
	bh=GdnvWDBNR2gOB+LenT8RHWopVk2MCmbNJTEOMWfKmjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IkzdAk7qFcmCKkZPKcC5tDCL4exr8qneOC+ZcDe5OcgeUXcAwxbA8st5i8/S5/cHj6XUWNy8C2O3ndRoYXz6xqd3Ozc5a+YTbadgifhRJjBHT1b5PtJ6qE6bQh0IEviUJtuxMWbjrCa65k8SquUf/H4GFiqAkHE+cTRPNnn9wts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jOzySH+B; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jOzySH+B"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2254e0b4b79so41326085ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 19 Apr 2025 11:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745086394; x=1745691194; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TNRnOiyXacyKehrBjfG/SIyIph4B3poZy/96JlS18Fw=;
        b=jOzySH+B7g4FGn53H8yyHVyt7RItlTxDu3IImx3OxW+UKp7Ciiy1IOWpZ0Dh29jOrY
         WvrumhD/wroJ9Wr1asSte4qdq733rkRK8jhBSYl8694UhCvy8fJ13qnzWzyRvqn71+8y
         uhEw45vaIvHlYfrx7LGcy6ygAvGzloI64qfkVfbXpug37mQNoTW+gFIGCLO/ZlJkDHxp
         cxsqHRTMv+vgiJw2ZS/6aeueP897QyVATeoZ1ilQd97rU/2otDyMTAHrIfEhXDoq61Yu
         fbaJAEPmCKcGHNMbtgGkJphuuuVNo2UUuqIVnQ18fkrsclsrkGJ2kIskv72EPKqNEXfX
         AZXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745086394; x=1745691194;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TNRnOiyXacyKehrBjfG/SIyIph4B3poZy/96JlS18Fw=;
        b=pUd+x/NQuAIpW3WV1EyUs5zMOwR1uzOsWJccv0TBLO7yyaecbBizVpjnXKuHxoyr1R
         itmJxJmYWqJ6ELoZb6DfguYLyukSW+XvbHItwft++f5Gx9wLiMrRkY4TOj5+61GHNMcJ
         f3qNq6T9wWv5c9Unpi2xuOQ3E2kkPq3f/XCMPgGHx+XNHI2e9tBOgk6cCXYn9BggZowP
         mi5uU4R2GNQ4ZTJjfwqqtqk740pescQs4abayOOVZj4HtbKBq0DLfZE6elBu+SFb+47C
         bbigyN1RbP4g8IksE9g+6RN4SINlnkcQPdFwpf+8tmzDMLt3yY1sZ8zGIMM0K+Fj8aCV
         02Jg==
X-Forwarded-Encrypted: i=1; AJvYcCWwyp+IS6SyTkAzYlca6VBPvwGrRyk+/DtT2X0lQ/xl8q4HQgN9eoRIgPVEGO2DvLOv3weYqq9t/MoSKWHy7WYNUQHu3Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy30dE6V7rqHRJ3BHsprI+TtIBPKouhm3VlvDQVD86pHkbfFMMp
	DKLQq4TF2Kle+KBV0q1KMsxfa/hQ8sZH1YtV7/0zt9fX2RrBo/iH
X-Gm-Gg: ASbGnctVNtv2xx5fq52l9T6bjSR7mViea6O2PuP4GvWIiolsLCzFV8V2kVYwxr6lA94
	X/u+RMiRtMkL2DLlgRWzanoZU0Qb+raU+iECbsOKNyQtar4UZhDQG6uQF6K5HfMkkAtUbFeeU3k
	OtOnXidQUTHI4Sp57ioFIXq2DjsTvauH0bcUR5U/kiI50FcMnIIWMDlOD0fDqID3TJ5mVhN1ZAO
	a1mrkjFmNJu7HUzTulRb+PZvThEAm44/uR7nwh+3Ack1gYXJLvb+bsmXmqUmL3ny0C5Cp8yRtul
	1ZXYlPaHHCRytsSiKgN3Gub0QXEuDLcdbv/XU1IhJV954/Q=
X-Google-Smtp-Source: AGHT+IF0skBMQ1kT+xLk+++XTW5TiYx+jOnZJc1EJcM6tPtPprZSLzpSuU4H8FPoV2YJAsHrhEPaxA==
X-Received: by 2002:a17:902:d58c:b0:220:c813:dfcc with SMTP id d9443c01a7336-22c536075cdmr122327445ad.40.1745086393993;
        Sat, 19 Apr 2025 11:13:13 -0700 (PDT)
Received: from localhost ([2804:30c:90e:1e00:5265:5254:2e32:7e5])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-22c50ed0ee3sm36362525ad.206.2025.04.19.11.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 11:13:13 -0700 (PDT)
Date: Sat, 19 Apr 2025 15:14:24 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Cc: himanshujha199640@gmail.com, jic23@kernel.org, lars@metafoo.de,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Michael.Hennerich@analog.com, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] iio: adis16201: Correct accelerometer scale factor
Message-ID: <aAPoAESnjjyNsHI2@debian-BULLSEYE-live-builder-AMD64>
References: <20250419125413.679290-1-gshahrouzi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250419125413.679290-1-gshahrouzi@gmail.com>

LGTM. Minor comments inline.

On 04/19, Gabriel Shahrouzi wrote:
> The IIO_CHAN_INFO_SCALE previously reported for accelerometer channels
> used 0.4624 mg/LSB. This value matches the datasheet specification for
> the offset calibration registers (X/YACCL_OFFS_REG, pg 18).
> 
> However, the scale should reflect the sensor output data registers
> (X/YACCL_OUT, pg 15, Tables 7 & 8), which use 0.4625 mg/LSB. This is
> also consistent with the typical sensitivity in Table 1 (1 / 2.162 ≈
> 0.4625).
> 
> Fixes: 57f9386405a2 ("Staging: iio: accel: adis16201: Add comments about units in read_raw()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> ---

>  drivers/iio/accel/adis16201.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/accel/adis16201.c b/drivers/iio/accel/adis16201.c
> index 8601b9a8b8e75..982b33f6eccac 100644
> --- a/drivers/iio/accel/adis16201.c
> +++ b/drivers/iio/accel/adis16201.c
> @@ -133,7 +133,7 @@ static int adis16201_read_raw(struct iio_dev *indio_dev,
>  			 * 1 LSB represents 0.244 mg.
Maybe also update the comment?

>  			 */
>  			*val = 0;
> -			*val2 = IIO_G_TO_M_S_2(462400);
> +			*val2 = IIO_G_TO_M_S_2(462500);
If we do the math with more decimal digitis we have 1 / 2.162 == 0.46253469010176
Would it make sense to do 
			*val2 = IIO_G_TO_M_S_2(462535);
?

>  			return IIO_VAL_INT_PLUS_NANO;
>  		case IIO_INCLI:
>  			*val = 0;
