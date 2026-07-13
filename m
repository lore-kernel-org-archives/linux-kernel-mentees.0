Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03813148B4
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 13 Jul 2026 12:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783945694; cv=none; b=krgJW3XPQuq/tfG5ckGdmP65i1ms4LGXvY/Fu17WELGxTjNELhpSSOtBmyE6PmvnPBNrbB7+aP/7mdH+lr/hJ4JU+lrsAs9UvyYM4z4ppb8/R955Ztu0Ph2IaeUdXKMthIpckJIhABG7ot+wbXGN26u74514DUkLn0F48Tpwki4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783945694; c=relaxed/simple;
	bh=fwqZN2vbqNseymtGxGIWgj1IWKR8basbYQ9EEL5R9rg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qm+jEPG92Mo4U5u5+FqglLZGMLmJeCAHw9/CfFerhoeBKUD8XxBmu8XDn00SJ+xKk98FI28i8AnOHhCBbpGYvOOflCsNSbPWavXNUrskbieLAQxCIDaPUU+LbdzXJHM0U6Y5+cJ+6r3yghYhrkbPSOykuFNcX5RiLex0YkvUWe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RmHZTgec; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RmHZTgec"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493bfe9f886so16159305e9.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 13 Jul 2026 05:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783945691; x=1784550491; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7skRcqd0vjDN4v5wBU1b+5yQxdtAYY55BU9Ndb/1BdQ=;
        b=RmHZTgecrkJswhVSBk1jI4PGIxdp4jj88wWC0/NLHeR8l4WdGcnFSJYx1RtXlXjQFG
         Fzainy/CtZdF6ZgvjGj2ouNFYjtvD0fHc4gc9KkyMmVTcEdbvj2Fl5Y2KWhSHSOzFaom
         rJPrfVEXFgJhlZv4Lf9fXrcoUAdl+/hLPjLMhYm4T9JKPIpbd2Sc90VcO5Yt40wF04Mx
         Qo4iodUmEFf/IIAVWMRJZwPPa6Oztufc5c+wGooLL3/9nAGSNqX/R0J0RD8E7KPXZRqx
         i5dvH0C6YehCUGf91ZFcVWeJ1MWhjAYcR+cHgnILYZuu7rcE/88dTC5r8fa3Vze4YkI9
         sXWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783945691; x=1784550491;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7skRcqd0vjDN4v5wBU1b+5yQxdtAYY55BU9Ndb/1BdQ=;
        b=UPeCqCLQX2BPwUbVUjnZZFgd4ya6l+kIqqyB+kpo/l/jLk8WUGcDyShrrUGPD/ubJU
         +1iDGO47siZcvd5jzYVF0+4lNcIZXoVyEMD3iqzBiVTdCjm58fad3kh1MIWHUTTk/xKk
         x0S3cp9bxskt8/3TLl/kiBjOumbqfmxMg5sQm0qouiLnOWOrErJnuqlPKb1qa4vnOOw+
         3bGSzvxNvwY0UcI14fbDp1yyJJ9B2olzjJ/3H+u50mar/39PHqYSJOyW1coqiJStx0ZH
         pESQE2LDfZQVJ+kMMJwIdmvGSdFXKeu/FZ/DJfCq/qEz7F4IQLWgQ1n6tLvyYVo+rxwx
         JS6A==
X-Forwarded-Encrypted: i=1; AHgh+RqbBvG26dXMAAhar1/sCo31P2nrjDlYJYnpsIEy1sqiFYmvh5GysS5giL+CskHmNH9kcb+9zpToiEC2spNaP/4lNhSOPg==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywi/yqVTgqOFt7rTAlvXEXhOjRcv39M4ero9YkADc+CdGoUKRdl
	GVz+5XqLgTmqjvmkk0mUax85zsqv14D9BARGzg2m5Wmkvpx1TuAKfzf5
X-Gm-Gg: AfdE7ckRyOh/yUv+G3Xksqupk8Ryp/w0RZgFKNRp5vxKDxHaHkLYpCCI+RKLLkwOEzb
	a2jxQjQFqOUGHNJmCR1BU6/iBYc35E4kNOf5lEcHvUAb8g/ib8dcQfLmc4ZwhCtuJokBVAMstDn
	knCZxKTw3QH/lDDrmTXGEgL/pv37s+P7JuupYW+llkkmv3nb4ltAUVQnKp4K0JjkUAftiSQ/O2b
	A+T11qzgM+yWHQLILxbEZJNPQqLsmhZzNcpM1hrbL28ABw6/UgH52U86UckrNIQAVGZvkEvT2xv
	eqawZ/+s3UP8Vq90S0PqYZIG10juuE3HX5wcwz4SkPMJAiGk04Yup2yiXEiXhOGPEYTqYrwq7Ak
	A516ZsYa6bmJHl9LGzgmwh+8rl/w2Dthc6yZFNflkUYSse1HY8ScNa8+jznRreI9h34OLUghquE
	yNS2V0FGl6jAcTJJCIx3IfTrGQcIkqd2pnjmXfdG1CGhvzjZsSUVoJEfBaz87bhUsOOEt/tN8Fy
	Kpx707BLgF/Tv/uahFKetr9gKSLf0ddBQqHjFvH5xJjTmL8sBGCNJ++himhMWbvASa5nNHFRLPf
	HoJ3TY3AKpmJCkoTOHjS8EAOeOk2bkcOFHa1gLkk+QfLPB/r7la10jNhgA47JS9FnYCDVDQ27Ev
	MlSRZIj3iIFvUJ8rfBPpswk3LHu/fcEnMtw==
X-Received: by 2002:a05:600c:a4a:b0:493:e9c2:ba60 with SMTP id 5b1f17b1804b1-493f8820ab3mr90094655e9.22.1783945690946;
        Mon, 13 Jul 2026 05:28:10 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f16cfsm363354705e9.12.2026.07.13.05.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:28:10 -0700 (PDT)
Date: Mon, 13 Jul 2026 14:28:09 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Vidhu Sarwal <vidhu.linux@gmail.com>
Cc: jic23@kernel.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, shreeya.patel@collabora.com,
 dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] iio: light: ltrf216a: fix runtime PM reference leak in
 error path
Message-ID: <20260713142809.000058ef@gmail.com>
In-Reply-To: <20260713022829.234370-1-vidhu.linux@gmail.com>
References: <20260713022829.234370-1-vidhu.linux@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 13 Jul 2026 07:58:29 +0530
Vidhu Sarwal <vidhu.linux@gmail.com> wrote:

> ltrf216a_get_lux() acquires a runtime PM reference by calling
> ltrf216a_set_power_state(data, true). However, if
> ltrf216a_read_data() fails, the function returns immediately without
> dropping the reference.
> 
> This leaves the runtime PM usage count unbalanced, preventing the device
> from autosuspending after a failed read.
> 
> Fix this by releasing the runtime PM reference before returning from the
> error path.
> 
> Fixes: 83f0bcd40d5c ("iio: light: Add support for ltrf216a sensor")
> Signed-off-by: Vidhu Sarwal <vidhu.linux@gmail.com>
> ---
>  drivers/iio/light/ltrf216a.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/light/ltrf216a.c b/drivers/iio/light/ltrf216a.c
> index 3f34ddc911b4..3ec239eb5831 100644
> --- a/drivers/iio/light/ltrf216a.c
> +++ b/drivers/iio/light/ltrf216a.c
> @@ -247,8 +247,10 @@ static int ltrf216a_get_lux(struct ltrf216a_data *data)
>  		return ret;
>  
>  	greendata = ltrf216a_read_data(data, LTRF216A_ALS_DATA_0);
> -	if (greendata < 0)
> +	if (greendata < 0) {
> +		ltrf216a_set_power_state(data, false);
>  		return greendata;
> +	}
>  
>  	ltrf216a_set_power_state(data, false);

LGTM, Sashiko had an issue with the fact that pm_runtime_mark_last_busy() isn't
called before autosuspending, however pm_runtime_put_autosuspend() already calls
this function in its body.

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards

CJD
