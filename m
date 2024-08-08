Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6CF1917ED
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  8 Aug 2024 17:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723138980; cv=none; b=Wcukztnttl0LahELIV/nxLUoePkBmxRBdlScxSANSE2AeJblnPJxl9RAwtOG9bG/afOSEoF+uQLulH1/MugjXK6MlV0zlYxY5bBSqREyJzxHxprhUJfA639khBnKqDqDBUMzWftifW61yu0OaunGn6Y/yIc7GctigaiT8vcdn+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723138980; c=relaxed/simple;
	bh=/x/GCpUGs1ftk2R59xqPZXhiosBrNlEUyHkv9BnhTVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ndGlfpjA5h78fGmsklkTCEvP46V/LZEJnnFS/53FGW7xiKF6xZMoECj/BF925CDBOVHiyM/EuEcYKV+JWGLdMlwxFwQbtPkZf74cqBbRtEqU1uJ/uca4c1xSsTqtDWmL14SF421lTv7MqkmaIhGgCxJc2qsBk4J507wc4Q903vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j2wSJZbt; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j2wSJZbt"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E90B40B5B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  8 Aug 2024 17:42:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OuUytYBlJnKt for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Aug 2024 17:42:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=abhishektamboli9@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 333AA40B7F
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 333AA40B7F
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=j2wSJZbt
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 333AA40B7F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  8 Aug 2024 17:42:57 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-75a6c290528so902600a12.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 08 Aug 2024 10:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723138976; x=1723743776; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wgUjbjxEgBMHqGe4yMa1OEWmwGmO34nRyalLE55xTRc=;
        b=j2wSJZbtZ7VdBOFNTCx5AkB6Ld3dGREDN3BxkaS7o9JD0nB38iKifCToeDLQiEt130
         wpvBN1l46DnHcTtdM/X57cVuu5ENOJnkCDSNPmfgGqxjWbYEL/USe3U0WWIXg79LvqBO
         k8wwwByPjau2e1AG5iAGexR0E2cHd/YT5wONv4JpaCo9CgKArq8yfO9OOwpzdmQ+ApSy
         kngNqyebkOw3W7BM2cCDk5PVtT101fylnFI0MCxJfRTBfjW9HCnyP4l/uNbwc0pCKBbY
         veM2btygEvb00MMKdqnWVHSn/31ZA4OvJdvbj2k8ITFXCdU4Bf+nt46sURars6Smh9mx
         eA5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723138976; x=1723743776;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wgUjbjxEgBMHqGe4yMa1OEWmwGmO34nRyalLE55xTRc=;
        b=ZgnuScVrttmUFKkhscGvcP+eh388aFJXmifRJllhBWfJuucX2htexV2dJQPKrxGX8V
         1poL+Z8KZZlX5n7S3TLoUBq24jSMQv7h8CbiydmF48lMpliSZjAbi8bTc2y/I0wpraZq
         pUFceJfME0XVH0vODpBfNlDrDiqebIorIuYWdujEtTZGya38hGCs7n1Z+3Mcz7V3Ml9y
         vUY3XCqKoa+s9IkgOvwomfY8cTXl3vmlSHzSXw4xgV6Gj6rTHQ4QR99dtYkkTN7rD+q0
         twNuJ8IuSszZf5cLxE8Y0GdIpEX8Bq9Wri4CFePEpE2x965f/nItAsnIDldrnP2a2fyR
         5jDA==
X-Forwarded-Encrypted: i=1; AJvYcCU5AN0Bh7YgnbcbEAVIimFubZuI2u8VtZcw0ycNUPjNE9m3usiChzXGcV+1YNYIaw1WRQGtAKcib6c7QV7qLTMs7uuw5vhw8RlZAyWvvTiTj9Z17G5IqHpkrqRqgKXd
X-Gm-Message-State: AOJu0YzxM1URIVZ3R8X4QZje/MyNLjXrEJ5MwIpYcEjuNfTEKMyVjvYi
	i3ZH8azKQ3X6xC+5EAbi4vOk4P31G4ccDXRE3J5g52h+PAJV8mJG
X-Google-Smtp-Source: AGHT+IE2Whix2iRuRVCvGmEQbKjesFBkdadz1VWz5QmdV/xueZHYDCKRwPjKk1N5gUmnCly+nVWONQ==
X-Received: by 2002:a05:6a20:a107:b0:1c6:a65f:299 with SMTP id adf61e73a8af0-1c6fcedf133mr3313532637.21.1723138976056;
        Thu, 08 Aug 2024 10:42:56 -0700 (PDT)
Received: from embed-PC.myguest.virtualbox.org ([110.225.178.109])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-710cb2e7405sm1366964b3a.169.2024.08.08.10.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 10:42:55 -0700 (PDT)
Date: Thu, 8 Aug 2024 23:11:01 +0530
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: jdelvare@suse.com, skhan@linuxfoundation.org, rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (lm93) Return error values on read failure
Message-ID: <ZrUDLVhjH8uKflCN@embed-PC.myguest.virtualbox.org>
References: <20240807181746.508972-1-abhishektamboli9@gmail.com>
 <bdca4f35-ec3e-4fac-bbcf-ed5326feb6f4@roeck-us.net>
 <ZrQqhOvt3zCHNh38@embed-PC.myguest.virtualbox.org>
 <e03f91c4-c25a-4c9f-a0f4-2774f4019f54@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e03f91c4-c25a-4c9f-a0f4-2774f4019f54@roeck-us.net>

On Thu, Aug 08, 2024 at 09:54:40AM -0700, Guenter Roeck wrote:
> On Thu, Aug 08, 2024 at 07:46:36AM +0530, Abhishek Tamboli wrote:
> > On Wed, Aug 07, 2024 at 11:38:34AM -0700, Guenter Roeck wrote:
> > Hi Guenter,
> > Thank you for your feedback.
> > > On 8/7/24 11:17, Abhishek Tamboli wrote:
> > > > Fix the issue of lm93_read_byte() and lm93_read_word() return 0 on
> > > > read failure after retries, which could be confused with valid data.
> > > > 
> > > > Address the TODO: what to return in case of error?
> > > > 
> > > > Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> > > > ---
> > > >   drivers/hwmon/lm93.c | 10 ++++++----
> > > >   1 file changed, 6 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/drivers/hwmon/lm93.c b/drivers/hwmon/lm93.c
> > > > index be4853fad80f..b76f3c1c6297 100644
> > > > --- a/drivers/hwmon/lm93.c
> > > > +++ b/drivers/hwmon/lm93.c
> > > > @@ -798,6 +798,7 @@ static unsigned LM93_ALARMS_FROM_REG(struct block1_t b1)
> > > >   static u8 lm93_read_byte(struct i2c_client *client, u8 reg)
> > > 
> > > This is still returning an u8.
> > My interpretation of the TODO was to address the error condition while keeping the 
> > existing logic of the driver intact. I understand that this driver is 
> > old and that changes should be approached with caution.
> 
> Those TODOs are, at this point, pretty much pointless. If you want to help
> with improving kernel code, it might be better to pick something from the
> drivers/staging/ directory and help improve it.
> 
> The only thing that would really help for the lm93 driver would be a
> complete overhaul, and that would only make sense if someone has real
> hardware to test the resulting code; the driver is too complex to just
> rely on unit tests. For example, the excessive retries might be because
> the chip is really bad with its communication, or it may have been
> observed on a system with a bad i2c controller, making it completely
> unnecesssary today. Either case, if those retries are really necessary
> due to chip issues, they should be hiddden behind regmap (which should
> also be used to replace in-driver caching). And so on.
> 
> Really, if you want to get into kenrel development, it would be much
> better to help improving code which is actually being used, as mentioned
> above.

Hi Guenter,
Thank you for the feedback. I'll look into the drivers/staging directory
and see where I might be able to contribute effectively.

Regards,
Abhishek
