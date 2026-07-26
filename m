Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9A42BE65F
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 26 Jul 2026 11:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785066264; cv=none; b=dv27QGGi3xhOdwb6xAqixPz1rkamTUn6dViwzJ6/EeyZQjUkPAjKIB/cvj+Gsg5PC3nYKQafa0uG7Dr0/RJsV29JLv9pGZcIlqH7VepzupLCnuxewukyqX4h8aEN+yBuQrjsbhJsZO8odPPoBzr+qCrPm2tstgLa5r2Oh9xgNus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785066264; c=relaxed/simple;
	bh=aRAxuoFIpT5iiNuX1y0oJLKjAX7jWXl8mgVLbL0uStE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hIF0vht6oOGHmFGieEdggzBBPpk1yRRdh6q0R/uKD8aJAyNWvlUHq9iK1PhtHhm/7viHPkvD8DbgaXbjikuRhjWilmdoTCSWIJrCD4U05vcBj1bZbVmuiGUH6zJTdHxAmd9xTLHxgeLFMfy9tbCkW6lCyp1s8uoM3qNBSx7M8Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LpaaGnIo; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LpaaGnIo"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4955158f26aso11839015e9.3
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 26 Jul 2026 04:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785066261; x=1785671061; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LlEYYQFwJ049ecKkONrkZDcdDe6IgGEY4lTlwkRmH6g=;
        b=LpaaGnIofxyd06P8CIeE2pwTI8ka9dPx2rN3BNjYuSBCmSmtPLpgb3/BX2G4I+MFm6
         /kii2MeVAolaJIbBvVT1HD20rV+rvaxq1ok2fvElwABjm0T1VCYi31njoiponWsmY0Px
         skBmKBFKw3p/RW1J2yFYbLpPYZAZx35bITm63+8n5U0S0rQKrtAdIgV/FRHr2YqnjdJv
         y2c/92Fkz+lFhGN6t3zMrWjFzU0CEpJbeQAdeAYmKb5hQ1jE0baTRDXkCdbPmZSPNuw2
         aPCnCj+TxBANt3RTpQWNC3AEhPfcQcDLASKCGfNCM9BIBc6G21jNRtl7XAw3Lv9VnuA1
         Gqjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785066261; x=1785671061;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LlEYYQFwJ049ecKkONrkZDcdDe6IgGEY4lTlwkRmH6g=;
        b=Pw2Y1u3SleThxwv5W+txbiiJ9fpCe42qH8KIHRQUDD1uAKxf9pl1/gUb6uZeijndVl
         1Ny6Orlrs+51pejBV5FQtSAnE2HnCXKy0KCw9aHJ0G4gs43J5Yj5h/v2Ba7eIN60FVhX
         KZ5lb3qz+RQH2S+/M0A5E87lHxOB76C+vMIN7NcCP+7NGNi8nN7VV9Dd9hhlAvgl1rKX
         d2YBETYGZ828nsqoDZG7OvwVDUBbT0epKfMnV9cHr9X7ISpmCrhTWt7yc+iGqrZEov6k
         fECHlqagwrIC2qQ6loOyZUoMwTarE7/sXFmO4wjlW2vag92aYzWZM1oA1cg5NmRY9ozj
         Iddg==
X-Forwarded-Encrypted: i=1; AHgh+RpuCReJ3NTz5VqhqlYL3SJESe5wjin46yA+a+WOrAVXyp4ZBdSeNeWdfTaY9KlgsoVVVxGu/SdrEPh85QyOLVeFYOqRfw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyxD0/wSocr1UEGD+dKbHfPMbE/C55m68JJrOYwxat6aWJBKUrz
	h98eYzUvpeiiLWkHrEFF4DLC2Fu91vq6Ivj2r5V2cMEaYICctUnW7ZI2
X-Gm-Gg: AR+sD13O2RwPYP1thq9PQ+po+qX7tpYHpe6vo/zqv8IpdJpd599Rrw2LH/685YN7X6j
	7BG2KTT1kheJxX3IP7hVUoe9OCVC9M1MtoUfos334VCfAGrxEADU0JRmInB5SMJY+JvHvrcJ2Ar
	aEjSyKReYfPzm7nAlAovbq9CaKhJ7pszYk9W6hujj9+Dbb8rZAcZjN7vhlMJAsH0/6QuJ5jaXyq
	JodV08jTS3PaO3CjbaIUJvBevAPgMsTbgS0MfvRuUBXS2StOQhRWAuBOXHjXBzwPh0t/y8bDXX6
	dfsMK2Ydhk5G65Y/9wqN/rvwl8ht7C5mxoiVMNMSwuX2WGErRQZmmmBc9nX+2FtksGLYT3VRLp9
	fhwUhRdmVzDraq5vihC+F02BZFWVBQ6Kp6KeTGz/jnTMWnuC4YpDnRYSo9RL0aw0hkhernmnHYo
	uKprrU3PbPWnKGqVlMEspZi2r781Nnv4VPi8UB/b/zQLqmEVtoZtYG
X-Received: by 2002:a05:600c:5486:b0:493:e57e:7aa5 with SMTP id 5b1f17b1804b1-496b56f9c9cmr60868985e9.22.1785066260893;
        Sun, 26 Jul 2026 04:44:20 -0700 (PDT)
Received: from ?IPV6:2a01:e11:5402:d840:e7f1:1a60:4b66:808b? ([2a01:e11:5402:d840:e7f1:1a60:4b66:808b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4ed6b76sm142289215e9.2.2026.07.26.04.44.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 04:44:20 -0700 (PDT)
Message-ID: <39df42eb-433f-4cc5-b76a-8a7beeb3704b@gmail.com>
Date: Sun, 26 Jul 2026 13:44:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] iio: light: cm3323: fix reg_conf not being
 initialized correctly
To: Jonathan Cameron <jic23@kernel.org>
Cc: ktsai@capellamicro.com, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org, daniel.baluta@intel.com, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 me@brighamcampbell.com, linux-kernel-mentees@lists.linux.dev
References: <20260407151702.15208-1-aldocontelk@gmail.com>
 <20260407151702.15208-2-aldocontelk@gmail.com>
 <20260420185333.3bab224d@jic23-huawei>
Content-Language: en-US
From: Aldo Conte <aldocontelk@gmail.com>
In-Reply-To: <20260420185333.3bab224d@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/04/26 19:53, Jonathan Cameron wrote:
> On Tue,  7 Apr 2026 17:17:01 +0200
> Aldo Conte <aldocontelk@gmail.com> wrote:
> 
>> The code stores the return value of i2c_smbus_write_word_data()
>> in data->reg_conf; however, this value represents the result
>> of the write operation and not the value actually written to
>> the configuration register. This meant that the contents of
>> data->reg_conf did not truly reflect the contents
>> of the hardware register.
>>
>> Instead, save the value of the register before the write
>> and use this value in the I2C write.
>>
>> The bug was found by code inspection: i2c_smbus_write_word_data()
>> returns 0 on success, not the value written to the register.
>>
>> Tested using i2c-stub on a Raspberry Pi 3B running a custom 6.19.10
>> kernel. Before loading the driver, the configuration register 0x00
>> CM3323_CMD_CONF was populated with 0x0030 using
>> `i2cset -y 11 0x10 0x00 0x0030 w`, encoding an integration time of 320ms
>> in bits[6:4].
>>
>> Due to incorrect initialization of data->reg_conf in
>> cm3323_init(), the print of integration_time returns 0.040000
>> instead of the expected 0.320000. This happens because the read of the
>> integration_time depends on cm3323_get_it_bits() that is based on the
>> value of data->reg_conf, which is erroneously set to 0.
>>
>> With this fix applied, data->reg_conf correctly saves 0x0030 after init
>> and the successive integration_time reports 0.320000 as expected.
>>
>> Fixes: 8b0544263761 ("iio: light: Add support for Capella CM3323 color sensor")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Aldo Conte <aldocontelk@gmail.com>
> Applied this patch, but patch 2 will need to wait for this to make its way
> into upstream - probably middle of the next cycle before that is in place.
> 
> thanks,
> 
> Jonathan
> 

Hi Jonathan,

The fix this depended on (commit 1f4f0bcc5255 "iio: light: cm3323: fix
reg_conf not being initialized correctly") has since landed in mainline.

Is there anything still needed on my side for patch 2 (iio: light: cm3323: use 
dev_err_probe() in probe path) to proceed?

Thanks,
Aldo

