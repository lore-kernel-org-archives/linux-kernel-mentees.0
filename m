Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EF046EC81
	for <linux-kernel-mentees@lists.linux.dev>; Fri,  7 Aug 2026 12:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786106388; cv=none; b=fA7dSuESnBoDXZvezxpybx/4rsRCyi4YJhdfpkD6r2kaRpJNiTZ2z/xeE98q7PwaYzejSqZ13PY3EcRthxXI6wlGJPOGAqsacCFI+FJvfAtjcJ5rE2KUCK49MYj1Pkghi6Edo++Edjgf2Xy+Cv9Zn9kTyLrIrLilWMxUT/vgZC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786106388; c=relaxed/simple;
	bh=BnR/V70D1klGicVGiC0AYnn1EcOqw+kFeyar+iKh14Q=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=f43jx7SwuFnDMH2qaBt1PUuq/WAXEMKXzPjGlzIMY7ZPKxlvVl4XyjwR8IjId6E7AqoKiD9NBaE4NvhE0iso5r0SntxWgkxFQrcbdv36ZHPCSLhZsJ1XCNgSyHEKJ2H7SHDsHyFBlvA1dWxA1vF4p7FmpHKyAjoDr88f9R6Dgkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WobWZXA/; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WobWZXA/"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8487b7b3fc8so3934673b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 07 Aug 2026 05:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786106380; x=1786711180; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=V/QKpsFF+J0UfrrRtGkrOmdWFW2gWZ8ToHnQMm/dBIQ=;
        b=WobWZXA/SxTfjMfW34lG7VvWXVNMAPi2bC0T3DB67K7BNSaD1ejvzOYVO+ADmRYj6v
         jDq91KgLyulUCwlObdjjnZl3hGdkDJGfgGMVB6sLR3H0+o21QuQQ5pf+MWyAbEJJHYMf
         ZgECdPKMmTwsN6BeIarkGKmZG33Fmf1HRDK7VdV7Ev10q43OEvjs3t3vqMmdjQrDuVNM
         N0sZAE0y8lQ9F/LJKG3v+JrfxHGaMP2gGWOeXUKpPWpRVbpgtVf0zKSWYiOSFV+DD+22
         7sIOdK7PrZ/GBmLLYxzXvptfiKSgY886xawsloHrzIA0c+9yb+rSCAiwQ0bjgPtAK5jH
         xgfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786106380; x=1786711180;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V/QKpsFF+J0UfrrRtGkrOmdWFW2gWZ8ToHnQMm/dBIQ=;
        b=agUGTCunpl7JOQ/RreVvCsSdGOH8zyCpIIjsAj9GLj0k6iMFOonkxgyIaVcY852s44
         M7Tlt3BWTTq5xshEMNmiGc58GflbZqA8okV7wJ32vf9aZnP5Sh9/YuAjhQ+Z5xHSTCqZ
         O0mDfvSPreulPA6qSAQSpk9nzAATTyufsLVsdnSU2MLHoqYAqQqXTz8NGGn9ZsJwK8Fk
         5akbnOpSWBtvWfFv2lYDygTFlPJHuSugyTFlgowVpXosNvWIZqfgA7Yg929dBS1TLoDd
         ei+SZ5HgcnaBOh1wNrQLpZJqTaufpwoijFPZEL/BGiCiYyum8+qfE08EHI+LDO/5LZ5G
         jYdw==
X-Forwarded-Encrypted: i=1; AHgh+Ro52JJRaIToEnOVtjajI553+bRrIzS1BLUuxLPrsr4y4d8SobUcc3PljzyhsNTnf78sAGRnN2XclFVtLWLKucbwbTtU2w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzL8wmpIcyJGm0Fx7xOhDMJG2ZPuTzmVmpYSKVYGHkKpIG0yjee
	04a0ZYvdRiwV7mbr4faT8YwoeIjNPRhU2Q6YNuv984h4WBh4ACwwk3I=
X-Gm-Gg: AR+sD12/qnQ1gkezfSuifhoESFD8ct+KelQ4kQLLSOtgFX+woYyeSXtPFIm3hCYczh6
	6cibGt17kv48kBvzFh/WxaaRqj05vtuKYY+kRs4Ya9aUrPJkdIK3SdSX7B0HTLpXtUhjKz5yi60
	rYDUBhDq4qn7Jzh2cs5/awhCaiLHNQVZSjb/SIJyDIo0pqZdkpsuymj81yWwX3xSs2Uwa5hmxGu
	fHNV0Xo5RLdZ19aqsY9tIHkZY9kZu1jjCJ3EVGm2XQGZaJtR708jvbzeCCgiQc2ZRt8NT5e4trF
	JvpWNhlX+mxdVGQilJMgNnsXB12u2j74jdPU0f/KFBYU/pcry+nRvYsTnVZV/v1fqTBCbMEvoaf
	GPtkWXHZew4BtxH4t/WorhEmcq/5lyMOl73nMJZXjjPUuO54tUfFhNjo7Qd+P1JhRMy5RfHc8js
	bEI7p0VkTn/pOYzV+SxPkGalkOIhMYJr2Ib8Mk3FlDh8cfVliGzxQK7HDk5gxLIBcG9POBg5Tv9
	Fsu1K9qc6KfL+ylQ3DuEI+U
X-Received: by 2002:a05:6a00:230a:b0:848:2e7e:353a with SMTP id d2e1a72fcca58-84f2dea7014mr24055825b3a.0.1786106380246;
        Fri, 07 Aug 2026 05:39:40 -0700 (PDT)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe8f38c703sm674579a12.30.2026.08.07.05.39.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 05:39:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Aug 2026 09:39:34 -0300
Message-Id: <DKIPV92KXQQ4.3RDOLTYMBQ1SR@gmail.com>
Cc: "Jonathan Cameron" <jic23@kernel.org>, "Andy Shevchenko"
 <andy@kernel.org>, "Brigham Campbell" <me@brighamcampbell.com>, "David
 Lechner" <dlechner@baylibre.com>, "Jori Koolstra" <jkoolstra@xs4all.nl>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Shuah Khan"
 <skhan@linuxfoundation.org>, <linux-iio@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kernel-mentees@lists.linux.dev>
Subject: Re: [PATCH] iio: humidity: am2315: add am2320 to i2c_device_id
 table
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
To: "Andy Shevchenko" <andriy.shevchenko@intel.com>,
 =?utf-8?q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>
X-Mailer: aerc 0.20.0
References: <20260805183733.1000550-1-nico.antinori.7@gmail.com>
 <anRXbXxTLUfUgEPd@nsa> <anT9y_izVXiwPKrS@ashevche-desk.local>
In-Reply-To: <anT9y_izVXiwPKrS@ashevche-desk.local>

On Thu Aug 6, 2026 at 6:34 PM -03, Andy Shevchenko wrote:
> On Thu, Aug 06, 2026 at 10:46:13AM +0100, Nuno S=C3=A1 wrote:
>> On Wed, Aug 05, 2026 at 03:37:26PM -0300, Nicol=C3=A1s Antinori wrote:
>
> ...
>
>> >  config AM2315
>> > -	tristate "Aosong AM2315 relative humidity and temperature sensor"
>> > +	tristate "Aosong AM2315/AM2320 relative humidity and temperature sen=
sor"
>> >  	depends on I2C
>> >  	select IIO_BUFFER
>> >  	select IIO_TRIGGERED_BUFFER
>> >  	help
>> >  	  If you say yes here you get support for the Aosong AM2315
>> > -	  relative humidity and ambient temperature sensor.
>> > +	  and AM2320 relative humidity and ambient temperature sensors.
>>=20
>> The above (same on the tristate title) does not really scale nicely and
>> we've seen too often already. So I use something like "... and similar
>> devices"
>
> Right, and here something to be a list of the supported devices (in case =
more
> will come):
>
> 	  If you say yes here you get support for the Aosong
> 	  relative humidity and ambient temperature sensors:
> 	  - AM2315
> 	  - AM2320

Excellent! Will send a v2 with these two suggestion combined.

Thank you

