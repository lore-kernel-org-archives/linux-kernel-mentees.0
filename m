Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DE41C9EAF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 11 Oct 2024 18:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728671533; cv=none; b=PgZG2nM6qBXGIihWovSkNbGLuudifu4wQsL98GQpjZo9SFP7GPPH1MvO2PJ9nTRQFwmKfM/wV+fzPTx6L9g20C5rLUWmH2+w58gkRB1gBgXi4lO5AQ7q3xlLNzCTir288eYCPfyc0+tSRMze2YwtpegxcmVKXh0qk8nFwdncGBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728671533; c=relaxed/simple;
	bh=6ABpjJ5c9laXV1Mofwkc8XFAV1AdWBcZM3Tp255Plkw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gPQmZlngLjxIfP+xD1K0ij79uc/f3uLYuHt/iLtpuUmpjNiV9WWEBoZGy7sMtDEfsgyw1i7eDhoJr1fgKaiTXZ0hwFRYn5PryW6UCoModDP7zXrTpWf+X9HeAoT5qTIuiW1F9T55iNciKNW9uV4VNW2648+5dR+eevQ76rERjvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J7ZBLCqK; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J7ZBLCqK"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B135B8439E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 11 Oct 2024 18:32:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GLQ-eji3yrw4 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Oct 2024 18:32:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com; envelope-from=vassilisamir@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D87E58437F
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D87E58437F
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=J7ZBLCqK
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D87E58437F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 11 Oct 2024 18:32:09 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-37d447de11dso1521982f8f.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 11 Oct 2024 11:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728671528; x=1729276328; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hzGJQXEa8Jg8mFbIKKFv9fTv+IGcsaWIojSt7WKuh+A=;
        b=J7ZBLCqK8R1Q2YHUA0VNalCRxIkli00g52V3FlbkKDaBsuW1GrrjB+r0L3SOswyVQU
         r7pN9ggWtj+Ai0XoB7yUsBnMkExb9X4qbt/aeKWmxTY9BvuoagtKvUl/ZlzjslrVtY0i
         qXGqRWauRXyYah8Z8GidDjCRmSuf9iCJ85sgDiHGFM1VwaRwJRAPwOxfVAjXWE1sXDsC
         BLHYVq9PcCSb1KDLdQv50pUgPqhEloU11n3hkX19IeSNflqKAbq3jxgipzRID4NfBVFe
         jBx0GwQihAzPmzZ4+o9cnY4cwqbxI/6Mhmu6JZEW0SFA+UOwb9r1zBYemlIroONoj62J
         ZqZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728671528; x=1729276328;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hzGJQXEa8Jg8mFbIKKFv9fTv+IGcsaWIojSt7WKuh+A=;
        b=tD7FZlGeUspOQYoWeo0jOGL3A1Lcaauzb+V4/h6A1CoA8ocbQkUK/q+bkUpLLcSSmE
         XD771puK2ZMjbr0CnMSxLFxHDDi9itSRJcy7iMaNfrqOImwypIE+29nOUwAyC/reJHu/
         Vxh1x2jiZmQUKrgR1H6E5XsG1PAKZHWJY1/xp/lLfGUvzVu3x01WKgvmXVC3XSWPoZ2U
         w/4ajhz49kgMpQe0ukWthE5iBujPIv43Hsln4JHpvoZiQEstsYec35mRgSR2fR9mJ7dx
         fPLjslC+ynmSMkOFCol+YdhhVz31e5Bq6pbqV0D9VV9XSfT2TNG9msIR76gArnt014D2
         KceA==
X-Forwarded-Encrypted: i=1; AJvYcCWUz799SOnVW3puY6dKH51wMGPvQ+fOTVcsPo+vV8l4Qi7P817gRTQYdpxloeAFSHTcO0EH5QS/9huRBMVi7y0ZYMIrJg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yz1ToX/O6tZaE6wQp+pW1hDb7HzQtPVE4hALknNoflJEnTZV9Vf
	cRVa3r6WP9GXPxF9zzpYuV2I1Yf28NysLqJtFnxWs0Yb3ap0uMfR
X-Google-Smtp-Source: AGHT+IHZfchisX4gDQW0KTvSURH8Cyp5fZ6XTR97BtsqZNdAAQv/sME0MaU1UtwkGoz/6W+YdQerPg==
X-Received: by 2002:a5d:574e:0:b0:37d:518f:995d with SMTP id ffacd0b85a97d-37d552d92c7mr2193936f8f.56.1728671527597;
        Fri, 11 Oct 2024 11:32:07 -0700 (PDT)
Received: from vamoirid-laptop ([2a04:ee41:82:7577:73c8:39ee:29b7:ae8c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b79faa8sm4504907f8f.66.2024.10.11.11.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 11:32:07 -0700 (PDT)
Date: Fri, 11 Oct 2024 20:32:04 +0200
From: Vasileios Aoiridis <vassilisamir@gmail.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: "Yo-Jung (Leo) Lin" <0xff07@gmail.com>,
	linux-kernel-mentees@lists.linuxfoundation.org,
	ricardo@marliere.net, skhan@linuxfoundation.org,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Angel Iglesias <ang.iglesiasg@gmail.com>,
	Adam Rizkalla <ajarizzo@gmail.com>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2] iio: Fix uninitialized variable
Message-ID: <ZwlvJCxdiRqRWu6Z@vamoirid-laptop>
References: <20241011093752.30685-1-0xff07@gmail.com>
 <20241011115334.367736-1-0xff07@gmail.com>
 <26f2e35e-0a07-4b24-91a2-a48d4bc5dadc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26f2e35e-0a07-4b24-91a2-a48d4bc5dadc@gmail.com>

On Fri, Oct 11, 2024 at 02:31:00PM +0200, Javier Carrasco wrote:
> On 11/10/2024 13:52, Yo-Jung (Leo) Lin wrote:
> > clang found that the "offset" in bmp580_trigger_handler doesn't get
> > initialized before access. Add proper initialization to this variable.
> > 
> > Signed-off-by: Yo-Jung (Leo) Lin <0xff07@gmail.com>
> > ---
> > Change in v2:
> > - Make value initialization immediate before its first use.
> > - Link to v1: https://lore.kernel.org/all/20241011093752.30685-1-0xff07@gmail.com/
> > 
> > ---
> >  drivers/iio/pressure/bmp280-core.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/iio/pressure/bmp280-core.c b/drivers/iio/pressure/bmp280-core.c
> > index f4df222ed0c3..682329f81886 100644
> > --- a/drivers/iio/pressure/bmp280-core.c
> > +++ b/drivers/iio/pressure/bmp280-core.c
> > @@ -2222,6 +2222,8 @@ static irqreturn_t bmp580_trigger_handler(int irq, void *p)
> >  		goto out;
> >  	}
> >  
> > +	offset = 0;
> > +
> >  	/* Pressure calculations */
> >  	memcpy(&data->sensor_data[offset], &data->buf[3], 3);
> >  
> 
> That was a quick reply. I would recommend you to wait a little bit while
> the first version is under discussion.
> 
> I still see the offset thing a bit weird. data->sensor_data uses an
> offset to avoid hard-coded numbers, but for data->buf we do exactly
> that, in the very same lines.
> 
> Setting offset to 0 to access the first element i.e. no offset required,
> and then adding the actual offset sizeof(s32), which could even be a
> const if the first access was to sensor_data[0], looks to verbose.
> 
> These things are of course not critical, and the proposed fix is
> definitely ok, but I am missing some consistency here.

Hi everyone!

So if you check also the conversations that we had here [1] and in the
previous versions, indeed the idea behind the offset is to use it as an
self-explanatory index to a char buffer that holds in fact s32 variables.

The data->buf here holds the values that have just been read from the
sensor. If you check on the channel specification of this sensor,
you will see ".realbits = 24" in both values that the sensor returns so
hence the value 3.

I am not sure if it makes sense to use a macro here for each one of the
3's that are going to be used only one time each and in order to be more
"consistent". But I might have a wrong view on this one so feel free to
correct me!

For the initialization of the offset indeed, it was already mentioned
here [2] this morning, but on a different patch!!! I couldn't get this
error though with gcc...

Cheers,
Vasilis

[1]: https://lore.kernel.org/all/20240930202353.38203-3-vassilisamir@gmail.com/
[2]: https://lore.kernel.org/linux-iio/202410111221.YIeXHxOv-lkp@intel.com/


