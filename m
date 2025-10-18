Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95BF22A4E9
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 18 Oct 2025 12:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760791866; cv=none; b=elPsak3q5jnMm/oJlBBcPb9bDwXT2InMIDZ41dhE8lpCW5ayFHm7NGFdzqo6/vpvS8fDML/3l7H5iNkncKtO16nnrC06hZAhWGznQas9wCHgQtKmmeSf5XBuvmmDzQECAoNNzObbZ9j2ncf8nWusWCFwDcCQg/pn9HHy3EJ66AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760791866; c=relaxed/simple;
	bh=V0ieA2RnANTRzHxRShpkIoitBOjKt+gysoH7B0foc4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IbeqyvNHDaz5466HpiE1Fp5bqMn2oW4pHfOu/AKyPAgb1R77Z+YJpcLGvB2jPWeP/MqQL+NXG+fTpU8W/1PiFBtHbWhfsaYNxRFfRjB65rMT7Fc0Zm4jQRwKlCQtT9cpMt3AtFEUlx9FxvvkhPxtILX5NwJ+6QFHvOlwhwad6ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bXedDu5S; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bXedDu5S"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b62ed9c3e79so1950581a12.0
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 18 Oct 2025 05:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760791864; x=1761396664; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vexsKddPKfSOzGf6IKpuorb0FSpK13m//qSzSr6o0Qo=;
        b=bXedDu5S5wAIsiFUXsj1QdX+8fcO40wg6YYfGC42lBlVjdrVa4YDVFNctdi4b2lRuY
         pRRXuKe0yUx1f7I4/Mrx2SGkpIiY778prn5HOQ59p5sQ0yxvCc9gh3iuZMgdjwkfvuR6
         yCVG/du2ps3ApMd2u1Eq1I7c0eyIYtfe0pm2OiQcrJZckzJBKtxN0m1IIAlekb5e+pZF
         mcxeOcTbXHb9E5dbLFu6hHd9dJfUrcO/+Q/u6pI1g6Kw3wDYqtKkkPgKeAv3y5IjDrq4
         /Etyv9jUnF9/my4U0qHI3fPEr1DtDj8v/u93zNMlQHwC83x5P+QlcNvYHVq0GSoOTldC
         9e8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760791864; x=1761396664;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vexsKddPKfSOzGf6IKpuorb0FSpK13m//qSzSr6o0Qo=;
        b=Z9ikkp46jybkwS7sgoI+hxwB7fKCCvzHobU3XxOkULkbvDVIz063klcs2o5eAwnfJH
         at2wlRCkxbWG6U7o2VQnlg5hWBK6Ia7fMzNa20kNANlD3aWJ6uucFnrfFdjDH8/OQLZu
         54wjndVYgcsSSG11HuorlL9xvTMdKKqv+6RlPI/exMVRek0LNhEs18lm8CEdd8Kln9tI
         npF/n3SgfjiAvDfVebEVVMUGO4ZmFpj9j0GrzFMGvpAogaYh63sxYhau8iobgcNZip94
         ez59rijmHyHEHGADtjDqbm/JP80ibEW/hy+90lkg8zYWMDX7PD0LuOAveiQtHSG1Wz4B
         oreQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2xNhLi9mNtI5B6UbH/2qhMtOBF29hmOLcSpjfBMeCebkdJzUfQKrP1FUgPANW7YVy8L2cBgor+MyK2NK5OgT9fxfYnQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyhMa904Vfb4uQksHdVAPFg89ADsGp+ToQumT2uL/WkFESKgOD6
	2O3DbziD+CMHqq2eDz+KL4Ul9ClSmcEHvDfjCQCAkeQ8o9aeeahp9Yio
X-Gm-Gg: ASbGncvPQmcdvpg7UqWMFvzSDfeuKM1XDmDsd5stgOSk62dP6HY5ferbShhtTC/LM8N
	AEDsg9Pkj2fXEUCMTgtY/ZDhZOVex4ty6efaYBEnK9Rcm4pIQZx77Y4T5eeZ89ftdm23hBpGwff
	WJYP7Y00vKTVlU0UPHY4Q0RoBOrkT86tOQ8LvAXUcTy4sRLfPze0FsoQ7UfgxqHyqQtpHX8ngX5
	93Wvlrwqwb1fcWBawbWTvzMcjIo3SVvEiRNgXZhFtUvncD5C96PnHCwTnfPqt/MlnwhQ+LZ1CZN
	icq5Ow7r49M41aMJxl1UITf/2ekEJuipuVkOTmW1U+ZRsoP2LMkFiKs8G1DOTzY9llAv4pZTzJq
	tjpZqzBaM+KxrK6ZWmtudBM3egxBsbsJ3Ii81hr43DkpnAW1kwHejqxKWH5r0mWg5nmm7XaZwrP
	aaTI988vZwSBfjZM5VHzhXgb4=
X-Google-Smtp-Source: AGHT+IGSMaPLmNa5+i+Ae8ZNz30JQlwuaKA6ceTbDUL3cL8yRFO4+dERw6BWu9+r+C/GQRQnRay3tw==
X-Received: by 2002:a17:902:f70b:b0:283:c950:a76f with SMTP id d9443c01a7336-290cc2f91d2mr93086815ad.43.1760791864324;
        Sat, 18 Oct 2025 05:51:04 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471fed21sm25570345ad.80.2025.10.18.05.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 05:51:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 18 Oct 2025 05:51:02 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ankan Biswas <spyjetfayed@gmail.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, khalid@kernel.org,
	david.hunter.linux@gmail.com, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v2 3/3] Update maxim-ic.com links to analog.com
Message-ID: <245e439a-7077-45b0-bd34-78ed0a573a07@roeck-us.net>
References: <20251017105740.17646-1-spyjetfayed@gmail.com>
 <20251017163501.11285-1-spyjetfayed@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017163501.11285-1-spyjetfayed@gmail.com>

On Fri, Oct 17, 2025 at 10:04:31PM +0530, Ankan Biswas wrote:
> In 2021, Maxim Integrated was acquired by Analog Devices.
> maxim-ic.com & maximintegrated.com links redirect to analog.com.
> 
> Update maxim-ic.com & maximintegrated.com links to analog.com links.
> 
> Signed-off-by: Ankan Biswas <spyjetfayed@gmail.com>

Applied.

Thanks,
Guenter
