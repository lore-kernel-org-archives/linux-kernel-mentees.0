Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D2639AD3B
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 11 Aug 2026 15:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786463395; cv=none; b=UwwVEfslebN1eyoqtqpAJwt7XnYefdo5BelXIYt2H/2YoowMCW+nA69hIhufASMW+u2rjbfgC38ptJXGoaVFn3kMX4+Vcmg83hInVV83TRc+OuvgOFe7dvjtAJXyTjGovtxrZvn5iJfuq/QWfIpdOV0rkcibtaCEj154npqNb2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786463395; c=relaxed/simple;
	bh=xLcu+naJATLSrp6oD632lLb1BBJ8uP4Nn1rRK3v6cUs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QX7tgoT6CwxjlZi0qqFbdt+6dTpmuPlFz9cZ5JIYe+zgBODw5fW8Xdp0LOa20H6W+0a4zRqfLEyA2jc4FsS+mnd8HdToCnS2WNJc2KbGCzyiFov0dFMBnJUa5nXAPALgqya2s44gKvakCZOu5ZiL0gSn06Y9VcnVuMmVyRhYwVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=FuyVIQ5i; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="FuyVIQ5i"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7ee50eb2db4so35911a34.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 11 Aug 2026 08:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786463392; x=1787068192; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tHd7fMf6OyG9czVkocgnx+h3OKQk2OgvfP9nJAII4k0=;
        b=FuyVIQ5iJTVWx4ZBbOf+C40py9dJJ7jh2k0V/Nlx0sqQG0oUkkFMzwBnzFkA6mUTt7
         cGyKgiLX6O+qfv4BnUH52vDff5mn4NFLqkN+x4RQp6mx6O1uFfNkYTJG0liA5eTWYf4b
         CEBA9Mx0woR6gv9MsEXJkucnXUNs1ddKMoDFNgE1e6ETqyP5fSuOJrYmhag3BKDiqvaS
         29sKh5cOPphQGeJh1U6Sshr/6cfbdbmFUaYKtx57GyAqIhKwcAVblr2ByWj4YN0Qe9rZ
         4Obu+y4haqrfTdz9InlbuhTV40CVEdB5NQNRe1D4sLfnZ6EvHUCVC+LMovjhPrhZixdb
         JBfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786463392; x=1787068192;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tHd7fMf6OyG9czVkocgnx+h3OKQk2OgvfP9nJAII4k0=;
        b=LKr6RbGBVnrz6px2EGDztU3Wd0yygrbQlo+a7Ef+z7SDulUksvQMdcEZ8XxTuGQsDi
         SGaF3pS8Ne6a8a5z17uaESpafwFZjOIggMq6x0VcS6UBjueOYgvT12KqtUd/NVHVfGgA
         6QCyBdIKa+atMO02ikN8SzfCbHeWtzfNd/pS5w+P7y45IsZReq8LuRmTiEcO1Io4mo2z
         7tkHI5d2D0Z8a8S6nevi0BsHBl/umvQlgRx1/MJfjHR5HS7r24pr2XHBKWPooaNIghbX
         /aCQTUy/cvW4I5Dv7amQdqOwEv+mc9c+axGcpqm/HfjLTGCPF0RbupiW9BGxaEWZEQhG
         6dNA==
X-Forwarded-Encrypted: i=1; AHgh+RpvspmSBt5BDkJkJahU1RID2jE0Rf/cZFzQqMZYqpiqJlojkGu4y+LKd9/1Ae8o8XaJ7AhEg1tCIKE01JcElVC0H/HoIg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzYjsBJiiyfyeS6zb56Qg5qTUAXh1yt1s3Xi6jEep6gHVTRpa8S
	t6tdJNf8+sYUgZiLOP+qkbVY8Qrp74COZTg9f1hfeX62pz0r51XAl4RxJp8EDdJ3abTmav6hlMA
	dcfVqgd8=
X-Gm-Gg: AR+sD13l1m6XvUsS1mnhuCQn9Y6AnS5w3MZKynLwF9a9EqZ1GTpTO1KTBv1vuHpoXj2
	utpYuPCB2FZIt5gzSEm0h5W/t5Y2z0nvGN99kiVT7D4e2oeIihjrKdU5FI55FJ4qTsV+8MD38e4
	+wPZpFbWw4JOYw9vG/fWdEigs6ew0D21M+MnVO0mzRxFrQEimJYR8qPnWTPJHeYMwfEyX82Jkps
	YUosivU7vI0WcfThqtvQlsimsC2GLgQ2MtAn4cHkQBEvu5QaNE/lpzG9uCu7v331sUd7x5lScio
	Kt/GumuPaOLEPKIfNAaFGJ2IP+5jSFqkkJdWYkKOgdL4rk6JLo0Z4NtsFNckIi4GJkdxex5LAOj
	aY1ZnMK+IshCOrWfZiojhKtwuqAirf3k4LpKqXYZZHNcZBvoneakOFFlnv3HQpMvphWGIZ30e5g
	MfwWzo9W3kSNsmUTl3gB+jSF+cBZnRrceoXokvSXrcEAY4a99l3dqFuOdd4q/QP/88d32vk+OvX
	cy839+uWt8NM1Qg5o0+J2v3gK3M0olXN4hS
X-Received: by 2002:a05:6830:621c:b0:7dc:db3c:1d82 with SMTP id 46e09a7af769-7f3a829eb35mr2930682a34.10.1786463391711;
        Tue, 11 Aug 2026 08:49:51 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:7060:91df:60e9:76b? ([2600:8803:e7e4:500:7060:91df:60e9:76b])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f3b3209115sm147808a34.8.2026.08.11.08.49.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 08:49:51 -0700 (PDT)
Message-ID: <2d7dcced-47f9-4fcf-9668-30acb9e8c9b1@baylibre.com>
Date: Tue, 11 Aug 2026 10:49:49 -0500
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] iio: humidity: am2315: add am2320 to i2c_device_id
 table
To: =?UTF-8?Q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Marcelo Schmitt <marcelo.schmitt1@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko <andy@kernel.org>,
 Brigham Campbell <me@brighamcampbell.com>,
 Jori Koolstra <jkoolstra@xs4all.nl>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev
References: <20260810183337.451812-1-nico.antinori.7@gmail.com>
 <anqKwJOkl_cxzCT6@debian-BULLSEYE-live-builder-AMD64>
 <anrRkty6ugdJUGmE@ashevche-desk.local> <DKM7MV8J10HS.2OIM1TDHB9VHQ@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <DKM7MV8J10HS.2OIM1TDHB9VHQ@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/11/26 10:12 AM, Nicolás Antinori wrote:
> On Mon Aug 10, 2026 at 4:28 PM -03, David Lechner wrote:
>> On 8/10/26 1:32 PM, Nicolás Antinori wrote:
>>> The AM2320 is fully compatible with the AM2315 sensor in terms of I2C
>>> communication protocol and measurement conversions.
>>>
>>> Add the "am2320" entry to the i2c_device_id table.
>>
>> Interesting. No devicetree bindings for this one? What kind of
>> system is it on?
>>
> 
> I am testing this on a Raspberry Pi 3b mounted on a protoboard.

How do you tell the RPi to bind the driver?

Since Raspberry Pi is ARM-based, usually we would use devicetree
overlay to do this, which would mean that we should write a
dt-bindings .yaml file for these chips.



