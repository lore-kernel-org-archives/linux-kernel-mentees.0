Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7097E1DB92C
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 11 Aug 2026 02:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786415777; cv=none; b=XTeyreBuT68FW5XBikpXTFQlsjtF7aUDz44pmSP0f7Nwad/8tavlV8JORoq+P0UDsUqBy/RdZWQQ1XyicT6Gj3WUzqPpwN097Z6AjVxk1Yllo5DhihX4z+zaWGDqE1C6uz769Zw/pStdhgm3JCHRRvK2idPXLX8Wk7OtiFy1ayo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786415777; c=relaxed/simple;
	bh=OwadaKmvAZfvAcDlcxt3do8qvSPnGOxzuLy54LNDrH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AKnSeSqIHWcgWQEB3/zuA1OS1pUFRs09WLOaYEBWNjp6sfediWnVao8elVth4G7fBtnryyHsOa2fRXPBxuqQ2e8eYjVmi+LJkOhKvPS44A9RLrPVlwTud5xlbadjKvtIzWxbmptRWiJagjIfpGwBV0dcc9kIUrWTi/uGATNyjfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MpOUfBxB; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MpOUfBxB"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-80e2cfe6918so28716637b3.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 10 Aug 2026 19:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786415775; x=1787020575; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h4b2OZ2aRrsF4ECqruG3+CkREyKbFfFDK+SPOWLJqx0=;
        b=MpOUfBxBWUcR3HHGz3gPO7oR25okm+POmp0oTEAVoXWbZ7y64pfbyWB6zrrZKbK5IT
         7V6Kv0IL+oW0cMKH0BMdWU+iKqxz4RkB45WbNxio3vL8Q6oqjtTMPX26CHEAtFhBQ344
         1dEv6Qd+GUQqafUzWM4blTlu/i3okArzAF61utBqHxM01hkxmC59pqKddqXJpK0LW1zD
         aSJoweMijTlKBbx4n0T1YnqXbP1f+jkjw/jhKlWJYZnxmJk3zxVFfmfC6HXvHU/FET2z
         ZlS+7eIierZmfipCA51WKzk4m4KC1HmnEpSPrt/J/Au7UxUKIHfmGDndkuLGMvBVK2tI
         ZWNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786415775; x=1787020575;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=h4b2OZ2aRrsF4ECqruG3+CkREyKbFfFDK+SPOWLJqx0=;
        b=bzIB4tYCLt9bEPrPWmdENwNZWnCluVhaaDwNwgqdDN6n3Wklt/Fm2OYhQXl1zRS1lE
         y0ROMhCffAzfML/XPB6h4TkcEugG399xCQYASKATarADlEZaeHSrIoLPKMZK0BmRUgiZ
         U8VPiF8HoQNldLdEwoyCjXabFkNmEmbtgT3c51EkPgYaJpia4EXO6pG8ODoS8eR91Nca
         h52tVxicgcOE6dx2O0IOmkFYnUMt6tEvBz+xDDYfQ3EvrEkAPskrpI25C8Cr/fQ5FKI+
         z05ysmUgGHpVkFNKegPzS3DQumVti2SHWvwOyz0aHiPEhdZpSzloVLrpAUf5ncDzoQCF
         JGdg==
X-Forwarded-Encrypted: i=1; AHgh+Rp0knyAsntIM6E3Hq4uR9N+kuozpQlGBzEtf4HUo6qmmOLMA9/ApWOip9s/0jvg6RVf3L9kxx0RcpjVX5Vt/+PmliEERQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyNpS0izID+Zs97tK9tDvNCIShUDpYNtJ1miaUVJnIHSUgm91hU
	8x66GSO7orU8Y4MQWpqn8dVFsSN4AIISMGV4Od1AOmXx1sxg4PXNbrCm
X-Gm-Gg: AR+sD10usRVvdKGePLuiHUEIjYNNOUJxFcy722wPj/QtoPEzk5KvWy1KWO/YBEGDC76
	zGTBnn7jvNcCYkzki8kLlvVeaTWLfBoi6mu9mrDHwADaBWMHRnyCFCY73JSN+tF0vBthvfQKBdk
	LKWftyaDDPahZANnq7mGBVYpy2iB6M9lxfo2GxJVWXnZRfNdowmXyaMP/RsbuUvonfNeWhs4+tg
	bZr+flUgS+Tu8mr8Zjhmfl9HwcdMSj4/AZ09kjmfpWkawIDKWOCo6j6iJSltui7OyGdF61yXo/4
	oeSitwZl22mjpGB1paD1nqMoCkjne0p+6A8385Wd3Stdm6a/QMipY4zVAr7avH4/F8+qfOHYLYv
	vWB5+TiqFsglVxQWFM8NADe7Ac8rAASSq3zEXg4fx/0Nj6E6gWx1Q8gcdE9WSPEvjzMN59V4gC9
	AH5ufSds1UIvB9hlULAjwgdVUlPCR/uiPy+qJ6lIfukUdpuP5DKJ+9qjQPq+PNwLBkyGUSdQ==
X-Received: by 2002:a05:690c:31e:b0:81e:fe1c:2de8 with SMTP id 00721157ae682-825728d1041mr174909857b3.3.1786415775409;
        Mon, 10 Aug 2026 19:36:15 -0700 (PDT)
Received: from localhost ([2804:30c:4018:dc00:8be4:f5b8:4af1:4728])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-82ebeb0da41sm1984107b3.22.2026.08.10.19.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 19:36:14 -0700 (PDT)
Date: Mon, 10 Aug 2026 23:36:48 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: =?iso-8859-1?Q?Nicol=E1s?= Antinori <nico.antinori.7@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	David Lechner <dlechner@baylibre.com>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v2] iio: humidity: am2315: add am2320 to i2c_device_id
 table
Message-ID: <anqKwJOkl_cxzCT6@debian-BULLSEYE-live-builder-AMD64>
References: <20260810183337.451812-1-nico.antinori.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260810183337.451812-1-nico.antinori.7@gmail.com>

On 08/10, Nicolás Antinori wrote:
> The AM2320 is fully compatible with the AM2315 sensor in terms of I2C
> communication protocol and measurement conversions.
> 
> Add the "am2320" entry to the i2c_device_id table.
> 
> Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
> ---
David's comment about the IIO device name sounds appropriate.
The am2315 driver might use a chip_info struct to hold the name of each specific design.
There are many drivers in IIO that already have such things.
drivers/iio/accel/adxl372_i2c.c is one example.

An alternative might be to use the device id.

	const struct i2c_device_id *id = i2c_client_get_device_id(client);
	...

	indio_dev->name = id->name;

Not sure if the second option works well for both i2c and dt (probably not), so
I'd suggest the chip_info approach if you intend to add a device tree id table.

> v2:
> - Adapted KConfig text using the suggestions from v1 by Nuno Sá and Andy
>   Shevchenko
> 
> v1: https://lore.kernel.org/all/20260805183733.1000550-1-nico.antinori.7@gmail.com/T/#u
