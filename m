Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C39A6BB46
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  8 Aug 2024 16:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723136085; cv=none; b=UdZ/0CmEBlWIkvApcqpDOLqTKC7Y5lW2iME1Xvb8COwbUhMAXWraJkX2KxY7e0WMp1OKZ727oSrXf5/28b4f4M9wKXRFWKvFWA5Mlo17SQ5oV0si4pUZPBqsQDqpmwtRmknhwUwfMOStEZWQ6Hadl0rBYiauxVCmlDHYSP9UxzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723136085; c=relaxed/simple;
	bh=F51NZMZKlIVOUokpqmJ++TqU6OeEn9SIj5K+CmrXoAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Upg3mhZFtl9lfCsAHx/32PTYMbG4eF1L+pF8EW+yh7UDtQjwL5tm3vQiFvC86/na11eJRGKpLMYrjEfHLO/FVlEQoBJEQAElgRJ64pyPKHx0JAYD6afw7B+VyTfaRVgVoLmMhSsvUjplRTg9Y6Bm7wa9xme2tPV1xQxBsCn+4Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ayvr9Gnq; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ayvr9Gnq"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4A3580B6E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  8 Aug 2024 16:54:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.25
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UudVSCLPA52M for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Aug 2024 16:54:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EB4CC80B3C
Authentication-Results: smtp1.osuosl.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB4CC80B3C
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ayvr9Gnq
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	by smtp1.osuosl.org (Postfix) with ESMTPS id EB4CC80B3C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  8 Aug 2024 16:54:42 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2cb5243766dso1007000a91.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 08 Aug 2024 09:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723136082; x=1723740882; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Aicxt+UzDt3qNgwZqQLVh/meDWsH0wnhB4ZpKgCLbeA=;
        b=Ayvr9Gnq6IEU+E2FUWC1lYK+O7dmUqO4h7JSwUl/FEuTkxv6zehaQCPICxhKVLl5lp
         7UADEHdBi/I4JQK3cX5yQKPAkZFTy/KlcZFlK5odQWrAwRvlBfEhYISxpP2D3cFz51zB
         C2La8MoPnFvbAwnG44OFCS/wwJZ/xdrdJ5/ZYPHT7VDTxyRk0cJFaXtHeb3Qpcd4OVAj
         9RgtjrUJm9v93majVCPbhJ0luRdcatlv335J2WNm7fVCvE3GCxLUKsMp+4r1NOM/IKGO
         ufLX/VpjFZ+FUGHUOUBS5MY6N3+6+i/w4PcH/mXeNYosG3Qq7nw9YlzQw4t6yTuw7EEx
         1mZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723136082; x=1723740882;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aicxt+UzDt3qNgwZqQLVh/meDWsH0wnhB4ZpKgCLbeA=;
        b=BSQH4/moSvr5OVhP7Uu4LX+SQYSiCA5nRmIPn2/b6l3fAixdgoYTuXKA0ashcSUaHR
         oYOsXJhyaVTmqOrvnS0hSWmTg9rx8mQPF9NVtGMP+XnBJDcblYd+PwOPEcdBEoJjGJQN
         PQZMWDx95J2CTdl3si4MZlMKhultME/Iw3evJhUIasmAbc1hxT7Vd9KlwdaGLMTNvSCd
         83IVqGKA8D6vRUI6bb6CzJJoFh3A86cWlMm0qnSmcalI3qY+jMnR8swOevKoxt8L3pEp
         H5JwIUTrSX2s5NZTZIEtWCKpDlNZLr0EBu95Hdg40BRqY5KLg8YDvcr7Mke72KeM5fJs
         OiMA==
X-Forwarded-Encrypted: i=1; AJvYcCWr2I2pYDa287WfiWU3Cphi91oeqQn9CgpGhnTfTTkI+rufWIMM2mkNSLz1ZD35zQRhk334qUAMVOtcce+Rek2Gk+7XkMEtYvoksRBIHsaAkWQ3pi3R6CZGAbbQeF9H
X-Gm-Message-State: AOJu0YwYEGhEJbCmZccTbSeFN0m7AuHWrDrf7ufRP96/w/wAvMKpyphu
	BUyUZ1AuWibFk4KkANm4/7EAHD3quapyBkMBQxbiahN9Qn+g7Nfg
X-Google-Smtp-Source: AGHT+IGRw2qYNrFvhEiozPxxhI7XfYAGB814LeAhXp+mawE9FFa/1kAyTkxl7kjoMIOgHIAGJaz/Ng==
X-Received: by 2002:a17:90a:898e:b0:2d0:680:48c9 with SMTP id 98e67ed59e1d1-2d1c339e70bmr3176521a91.13.1723136082069;
        Thu, 08 Aug 2024 09:54:42 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d1c9c5e48asm1387316a91.8.2024.08.08.09.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 09:54:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 8 Aug 2024 09:54:40 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Abhishek Tamboli <abhishektamboli9@gmail.com>
Cc: jdelvare@suse.com, skhan@linuxfoundation.org, rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (lm93) Return error values on read failure
Message-ID: <e03f91c4-c25a-4c9f-a0f4-2774f4019f54@roeck-us.net>
References: <20240807181746.508972-1-abhishektamboli9@gmail.com>
 <bdca4f35-ec3e-4fac-bbcf-ed5326feb6f4@roeck-us.net>
 <ZrQqhOvt3zCHNh38@embed-PC.myguest.virtualbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZrQqhOvt3zCHNh38@embed-PC.myguest.virtualbox.org>

On Thu, Aug 08, 2024 at 07:46:36AM +0530, Abhishek Tamboli wrote:
> On Wed, Aug 07, 2024 at 11:38:34AM -0700, Guenter Roeck wrote:
> Hi Guenter,
> Thank you for your feedback.
> > On 8/7/24 11:17, Abhishek Tamboli wrote:
> > > Fix the issue of lm93_read_byte() and lm93_read_word() return 0 on
> > > read failure after retries, which could be confused with valid data.
> > > 
> > > Address the TODO: what to return in case of error?
> > > 
> > > Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> > > ---
> > >   drivers/hwmon/lm93.c | 10 ++++++----
> > >   1 file changed, 6 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/hwmon/lm93.c b/drivers/hwmon/lm93.c
> > > index be4853fad80f..b76f3c1c6297 100644
> > > --- a/drivers/hwmon/lm93.c
> > > +++ b/drivers/hwmon/lm93.c
> > > @@ -798,6 +798,7 @@ static unsigned LM93_ALARMS_FROM_REG(struct block1_t b1)
> > >   static u8 lm93_read_byte(struct i2c_client *client, u8 reg)
> > 
> > This is still returning an u8.
> My interpretation of the TODO was to address the error condition while keeping the 
> existing logic of the driver intact. I understand that this driver is 
> old and that changes should be approached with caution.

Those TODOs are, at this point, pretty much pointless. If you want to help
with improving kernel code, it might be better to pick something from the
drivers/staging/ directory and help improve it.

The only thing that would really help for the lm93 driver would be a
complete overhaul, and that would only make sense if someone has real
hardware to test the resulting code; the driver is too complex to just
rely on unit tests. For example, the excessive retries might be because
the chip is really bad with its communication, or it may have been
observed on a system with a bad i2c controller, making it completely
unnecesssary today. Either case, if those retries are really necessary
due to chip issues, they should be hiddden behind regmap (which should
also be used to replace in-driver caching). And so on.

Really, if you want to get into kenrel development, it would be much
better to help improving code which is actually being used, as mentioned
above.

Thanks,
Guenter
