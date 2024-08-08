Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70968C2F2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  8 Aug 2024 02:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723084146; cv=none; b=BsuIMRj3AUB3btjpiRQZ3vM+lXIIKKQrFAT+jXXRJ7NMkwAa7IhpGFZnyf6SkjUslpZHLAw7yvZuINgtGNrdNTUywMUJ8ifSrTtCv+bQWnzLmmoWqthZaACsCQn7UgOjNiMExOgeIqaOvJZ3K0zbkJia7rjj6Im2cVG71vofecU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723084146; c=relaxed/simple;
	bh=M5odKgRdiYB4QiClc+4B0qhQc9NLJddk0d001KyKyEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kegjtS4uchctR+g1RLvAkG7IGDzJBqTIcGFjyKW/6ieb7oXiD9YlvTQPWpEGf/GM60cjdTzWzpCDJqIsJu+3qD7mV/v/64c/GLX8NhLRIpaXxvI+K0ydy7sIzOeDX20YpYD3LxDK8AAy0J/5mrkGo9ktg8mAltgvFvp2vvy7wGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SILd1YNe; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SILd1YNe"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03C0760751
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  8 Aug 2024 02:29:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id It5lml-ck64b for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Aug 2024 02:29:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=abhishektamboli9@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3382060604
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3382060604
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SILd1YNe
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 3382060604
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  8 Aug 2024 02:29:03 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7107b16be12so442036b3a.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 07 Aug 2024 19:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723084143; x=1723688943; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ONR16OLsmnYFIi37edT6X8si5tDO2pD3UYRS4yUxjjA=;
        b=SILd1YNeWTPEjqyLzZLs9jgAlWHgWfX+JOblVW0J5XycjBAyutgw35qn1pmgBQiS7Y
         cLGP/uev6wfFxjxGcJ2doJySg354l+R5L6TrVb/SjpalyGovW+lE6XdfFy+pVf395obj
         DQ7AS5VdC6SuWBPoP6MjBCC0+Vu4kXAS2Pd/hUvI6MysdTZWJ8pQ5+Q3osIgHr3iSfLm
         53xq3Ydz4JRHN3D5W3bXrEPKTQrNTqabHGhTI5z48VsgkacDNWkIX0lmkpchzIckm+rV
         vIoGuObSO3PcY/y7KbMtnY8poJQOjAeWEbqQPWm5AliFHk4PxFuRvlyq5qN+kp0VL9zr
         /lhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723084143; x=1723688943;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ONR16OLsmnYFIi37edT6X8si5tDO2pD3UYRS4yUxjjA=;
        b=vMcwgJWbzVeGNLAW7tTNLH8Nf/Fl220FmbFypiP2Uj9vYx43ZdqX8qOUwFYFeCHr+U
         a457cH0l1+ae3W0/pN1I41wu/TRqvdw5tPtVeHdiTU2zl0kTAV/xHJ7j01vzBvpvt0GC
         AFIF0QKgNfKkifZG9KkGkiVlVZcGOHsXYrzKgW7hifrs0FocQqYn4kkdr88nnSuXioOW
         7wVkfvwdNP5PdydMGZjKTQ4ZhGB+KkDAZY8J9jQZsM/Oj4y+gO5xOW1dkqWkYZkjZKBW
         FADcMafFLXpS6IwBCQC5D2kCsyeOcU4hnp1d86EsYMkh+DL6gRVkR6HKkOzebWmsTr6S
         Dxbw==
X-Forwarded-Encrypted: i=1; AJvYcCWrrmVV61I31M4wqeZeR09051SCnbLHgfF53oqGpTtyoxAls0ASaCTI/wat3zI5JCsr16mpDAxfJcGDnQSuR8Q4sKJcGA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyVzrAN57epZkyP2Y2CpOgxWSnSBw1xfFjynP8Nq8lXFNMn2n6i
	0Zs+0dQkISZA73D/leip37YEPfNa304m14o0ocMz1pNsSkpZ7EmW
X-Google-Smtp-Source: AGHT+IGMm3IMUSPrMpyI6bchgrNHCd66zaz2jzidMWRtIQWMFwDhn+AfcBMRBpyOLC/xs9rCK1G1jg==
X-Received: by 2002:a05:6a00:1249:b0:705:a13b:e740 with SMTP id d2e1a72fcca58-710cae20b3bmr734926b3a.19.1723084143114;
        Wed, 07 Aug 2024 19:29:03 -0700 (PDT)
Received: from embed-PC.myguest.virtualbox.org ([110.225.178.109])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-710cb2d3544sm177193b3a.115.2024.08.07.19.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 19:29:02 -0700 (PDT)
Date: Thu, 8 Aug 2024 07:46:36 +0530
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: jdelvare@suse.com, skhan@linuxfoundation.org, rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (lm93) Return error values on read failure
Message-ID: <ZrQqhOvt3zCHNh38@embed-PC.myguest.virtualbox.org>
References: <20240807181746.508972-1-abhishektamboli9@gmail.com>
 <bdca4f35-ec3e-4fac-bbcf-ed5326feb6f4@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bdca4f35-ec3e-4fac-bbcf-ed5326feb6f4@roeck-us.net>

On Wed, Aug 07, 2024 at 11:38:34AM -0700, Guenter Roeck wrote:
Hi Guenter,
Thank you for your feedback.
> On 8/7/24 11:17, Abhishek Tamboli wrote:
> > Fix the issue of lm93_read_byte() and lm93_read_word() return 0 on
> > read failure after retries, which could be confused with valid data.
> > 
> > Address the TODO: what to return in case of error?
> > 
> > Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> > ---
> >   drivers/hwmon/lm93.c | 10 ++++++----
> >   1 file changed, 6 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/hwmon/lm93.c b/drivers/hwmon/lm93.c
> > index be4853fad80f..b76f3c1c6297 100644
> > --- a/drivers/hwmon/lm93.c
> > +++ b/drivers/hwmon/lm93.c
> > @@ -798,6 +798,7 @@ static unsigned LM93_ALARMS_FROM_REG(struct block1_t b1)
> >   static u8 lm93_read_byte(struct i2c_client *client, u8 reg)
> 
> This is still returning an u8.
My interpretation of the TODO was to address the error condition while keeping the 
existing logic of the driver intact. I understand that this driver is 
old and that changes should be approached with caution.
> >   {
> >   	int value, i;
> > +	int ret;
> >   	/* retry in case of read errors */
> >   	for (i = 1; i <= MAX_RETRIES; i++) {
> > @@ -808,14 +809,14 @@ static u8 lm93_read_byte(struct i2c_client *client, u8 reg)
> >   			dev_warn(&client->dev,
> >   				 "lm93: read byte data failed, address 0x%02x.\n",
> >   				 reg);
> > +			ret = value;
> >   			mdelay(i + 3);
> >   		}
> >   	}
> > -	/* <TODO> what to return in case of error? */
> >   	dev_err(&client->dev, "lm93: All read byte retries failed!!\n");
> 
> Those messages only make sense if there is no error return.
> 
> > -	return 0;
> > +	return ret;
> 
> This is pointless and actually dangerous unless the calling code actually checks
> the return value and aborts on error.
> 
> 
> 
> >   }
> >   static int lm93_write_byte(struct i2c_client *client, u8 reg, u8 value)
> > @@ -836,6 +837,7 @@ static int lm93_write_byte(struct i2c_client *client, u8 reg, u8 value)
> >   static u16 lm93_read_word(struct i2c_client *client, u8 reg)
> >   {
> >   	int value, i;
> > +	int ret;
> >   	/* retry in case of read errors */
> >   	for (i = 1; i <= MAX_RETRIES; i++) {
> > @@ -846,14 +848,14 @@ static u16 lm93_read_word(struct i2c_client *client, u8 reg)
> >   			dev_warn(&client->dev,
> >   				 "lm93: read word data failed, address 0x%02x.\n",
> >   				 reg);
> > +			ret = value;
> >   			mdelay(i + 3);
> >   		}
> >   	}
> > -	/* <TODO> what to return in case of error? */
> >   	dev_err(&client->dev, "lm93: All read word retries failed!!\n");
> > -	return 0;
> > +	return ret;
> 
> Same as above.
> 
> Actually, your patch makes the problem worse because the errors are still ignored
> and at the same time report more or less random values to the user (the error code
> truncated to an unsigned 8 or 16 bit value).
> 
> Is this just a blind patch, submitted as kind of an exercise, or do you have an
> actual use case for this driver ? 
This was not intended as a blind exercise. I aimed to make a meaningful improvement.
>The driver is in such bad shape that it should
> be left alone unless someone actually needs it and is able to test any changes.
> Otherwise changes like this just increase risk (or, rather, make it even worse)
> without real benefit.
I’m relatively new to kernel development, and I appreciate your insights on how this 
patch may have introduced additional issues rather than resolving the problem. 

I'll take your comments into account and Thank you for pointing out the mistakes.

Regards,
Abhishek
