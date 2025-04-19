Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630481DFE0A
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 19 Apr 2025 17:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745083808; cv=none; b=U2KGhRmKMn1zGpR1UtxrATJ5PiOV0XKT7uZyv+hTKZIsXTToEHx7mEsTXMV1Xc7YIwoGrxoD857HXTV+3OBX1GIgedhkSFApQV27Lqp25uzr+cXiULb2pnSXXXmR6h4f8hoCwCtwk81jJ93tlT8BUETfaoMSHMcfpx8OIyI/wHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745083808; c=relaxed/simple;
	bh=U6a1wXpun/HJSo+wW8DR+dOHz6jdl4cyLokR8MMuadk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L7rO4eTfiKCiqx4Rme3NSO7RdARmJqd9HOpeUHo5QKdeqqkaz0vcOrpyo+HcWjkuTrHMwUpx9STyrGwl/7w8eE0EF7o/QEDePzjdgOztBB9JBNeeFiO02JsWvFUhwoBEXCVJZh3AzUwlpwQVGqtdKZUV1o4qRLebWmMV+HJ5s0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EcXAlx2L; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EcXAlx2L"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b0db0b6a677so1843369a12.2
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 19 Apr 2025 10:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745083806; x=1745688606; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nUYxhkgZxR+3mLbUfk63itZQJ8nDNbnX+29tHtzt5qo=;
        b=EcXAlx2LCIzGCHkCoHE6JMIF0X4RK1QKzl5Vr9RU05Yt3nLOJE6+HiZpicegawT3U3
         AwOkHntoV3SJckvwCLPlCqjbtSE7VTiCn8MZDLP3DYtKgREPINe6rCYkrt71cpBgKL2I
         Ntr8jpQbboaC5+RfbtDiZj6JbqDpMvb8fPolb37678bXfX24Ur100N2SiH3ix8CjqgS4
         5Jll48Gp5ozMenIv2avXi73WHVnaSdf6vuPbfC8wbgUbRdUoUPWH97dSZhTHlnOQzBC8
         rNX1UoX0tkhyHxc9ytQuOuUXrjC7ka33OZiwU9f5xzLLV3ueLAvs9B6NYpEWBi7zeenQ
         cNwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745083806; x=1745688606;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nUYxhkgZxR+3mLbUfk63itZQJ8nDNbnX+29tHtzt5qo=;
        b=Z2C/806knTC552lE1hXzunBcLFW8JUw3HqU5ysMMJyQX2CA9K9zZ5s65aaidJcfblX
         M1/ZHV9iycHyzqGruatjB3NmUYd7chHH9GTgFLGQl1exkpeqC060nQ76BioBTAZRH+OU
         HZmABF/ANbaeXUjHKajp017E9P6/aAikKpXJCcq8MXLdU87kCnmliaU1u1ytrwGBy5dp
         OkqkDcxlUdOqDpPFidHWxvUwJdhPCEAP6bMmNsi6NdHtbI3FcozJ3zGL+vUTx8+op6n/
         Xvrlk8j5/HdSHj0zT/3JDJ6VbiB4l07zoMrG7guvmkIbfeFHF7eKKWInsWG+nRQsX0Ih
         oUfw==
X-Forwarded-Encrypted: i=1; AJvYcCVnIESe0q/1xUiVGSbVg4sDjHaJLyEQi9wdGK1eauXCqgBmU6E7HZjMc/7Ni3bGkJ7UrGLPdmfCp/dxpW3FmITAyk3s9A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0pmBDQjmUcC47aDgpBExZsHe0DGabzQDFcsvdCTTdwcw7pYZ8
	sl6yndbemR3HiHsNzycVQscoE77C88txjlE8N/81sMEyOxNOj5EW
X-Gm-Gg: ASbGncvgZRxhDdk6EwUvkXycZE4aCmSy50o9g3LeNeFO+50TdNC3uOLStucGsk4d3Ra
	dceSmiZehF3o/mZPOe68OlH9WojWZXT9Duzruon1V+8zQijnJl2JbyTjqIGhu/Dsl1cgpfVIDwE
	bxNYnptLAme5RSLD0DpXQGRdlugFBaXM9EIvQzV+AROapmvUn6zixC01c3C1/3Qva7LnXJ+S++Q
	wdHD8ozcrQlFjYnsDxfz/2k1J/D7C7tiumTtQYiFbUnlvxGqfTSMGk5x+f421zegUb+yWyOkVnT
	0mRBznq5q7BGcqdA23nlmOwSXj2zDpdBDqtrWPQ+4Ot8ly0=
X-Google-Smtp-Source: AGHT+IEYs0SsZrKjQ3EyxwmjfmzQx6Yk2n8zsra3Z/o5jNp9N6ENiepCtoZecYh2GvEgRlL1Y20k+Q==
X-Received: by 2002:a05:6a21:900e:b0:1f5:a577:dd10 with SMTP id adf61e73a8af0-203cbd24088mr10858917637.36.1745083806348;
        Sat, 19 Apr 2025 10:30:06 -0700 (PDT)
Received: from localhost ([2804:30c:90e:1e00:5265:5254:2e32:7e5])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-b0db107f513sm2447197a12.0.2025.04.19.10.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 10:30:05 -0700 (PDT)
Date: Sat, 19 Apr 2025 14:31:17 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Cc: jic23@kernel.org, lars@metafoo.de, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Michael.Hennerich@analog.com,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] iio: adis16201: Correct inclinometer channel resolution
Message-ID: <aAPd5XxfNEzaWdr2@debian-BULLSEYE-live-builder-AMD64>
References: <20250419144520.815198-1-gshahrouzi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250419144520.815198-1-gshahrouzi@gmail.com>

On 04/19, Gabriel Shahrouzi wrote:
> The inclinometer channels were previously defined with 14 realbits.
> However, the ADIS16201 datasheet states the resolution for these output
> channels is 12 bits (Page 14, text description; Page 15, table 7).
> 
> Correct the realbits value to 12 to accurately reflect the hardware.
> 
> Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>

Reviewed-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
