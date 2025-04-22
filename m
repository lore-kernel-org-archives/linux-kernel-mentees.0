Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2E41F098A
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 22 Apr 2025 10:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745316156; cv=none; b=bSygMRc7fsLOdVz2w9BtGscaEFLNVh9ZZuHCGnHDNbveLdbQmYjmE7soPS3Db8iM2u+m5z2b0jDKaGfByqFQ0uiFrKvr5Xm1xDH82FAmYlt/e2ca2FF97uuFrRVRGSWSFcHsBQCKYPIcweimi8TOdu2Bsmq1r3j0v1Deo37x1k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745316156; c=relaxed/simple;
	bh=r6si7KxlGkOoATAg7ilVznuwbtqgYzdFtBjWKcTszJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ATExfEQXOivOiaDohoxUIPisQtkemzZn3c4HBZuBNc/tdsZpuIHdkD98adkypEVdc1zVInRHtfIHtUivBLJB+HwKzVVy+mm8uwauah00PU8PN+96mv0EbXKkK+HCb54KwSzwE2dq5UCN+KVdbudP0DV4qCvxix5Tf2v4/WLwEjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GdAjKkPQ; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GdAjKkPQ"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39ee5ac4321so5263333f8f.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 22 Apr 2025 03:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745316152; x=1745920952; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2lwX66HK8eTxAxJezuea/KRjoMND3umFRpU7IdR4G0w=;
        b=GdAjKkPQgqupQvxaTjW81HW0jwj3H7jcQ1kc0AVgNGVOMksLTFHENcxXK/dRGG7SBm
         K+phE6sTyDXCUfm7eOyskc0Me6oWoDT7MwiWXiSFIXX7KD07E+Cz5O7NRCXM+wc91zdL
         I5Mu/0NX1OB/Y5W8OwRxp8TVa9841K4sYtbFzVFPMus7Bp5aNPLb3hBLiTKEg2xeIFZo
         TX7LMQmhgauqPaCQEtU4Bw6kDD+Ys5gIqP5JSRUIdudTj8N8AghA9aNFs9bh7w18hJKT
         50494Jhqle2jdBb18b+F00NN+U4D43Wf37hSs1d094wOeLyl30DptqDCuJM5Za7n4oVP
         k+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745316152; x=1745920952;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2lwX66HK8eTxAxJezuea/KRjoMND3umFRpU7IdR4G0w=;
        b=Cz5gIqAfbEsAVEzpzRMHLpp8ZiuPY+u3Zc6YPhXd5n8mDZlLHcxjyuT22mRnARucxM
         9LcbWsQFDupxYYTe//A6afaTeDo0NTijoNtcPaN0IDn9SlB0CHcS42WfkB6469IV7ieq
         sfItg9HL3NUSozOiFtqNfKHmAYHop6Ygh+TqhyrYtpQ8EYmslIrcOiIZuXNNTX/JAaGK
         4oq7BjqsOLPXYZam2hQJA7EvVYt/IiHzkju/AFyNKOowEZ7RqsYzGGOaI0w/nYRx0zO2
         n4ItcNW+6LTY3pOB0Zqtq1TXZCSShW8iAfltAM/VMtaYx7YcEiojCHgyAK3zC8SSGOi0
         NxOg==
X-Forwarded-Encrypted: i=1; AJvYcCWowHTiDVvqeO+mOnn3PGjOesHQmJybYpGCck4fMZMQDgBRtNH5In1sv3HemEVEcUWTjNo7nRJAb/sAEscoaFMWPb5NqA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxwEawf+CcvvI11NiQqqzp7wZdC/BErG6VLT4JjoRWNlpPAUz5p
	GND+U1VzwJ4EYJGpgxp5oCMyK+K6/LYQJIQ09zV/GM6kk/Njfs8/B0UP10ZGT+w=
X-Gm-Gg: ASbGncs2/l7bXNRQOjLWf+M0LraKM1axCN6OlKac0WvDkTG7Xvi5iY+U8Isb29l0CID
	j18WbTHBHY8nQNDOhkBQwcXATYePA5j4CnzB2+y995fBnXsvU3bKKjUwr66ZEg/JxzYrBhVl7uG
	2OLLtANv3aabpV8XOcKoCtd/i4kSrr8KFOWjgLval4nhlytjS4q5MPZGBqirqmLkFyXKEPWvUfQ
	l/DotEmSnlVPTSfn3pr9SPp4/8IbEpDYSwm5krKCi5AK4e1AEYG8Ews0oef5HX7hIeEZqeRiVQh
	pnTAvc5KClQQFlsDO/b79RFDME3KevGhy7mpSLnoiNSblA==
X-Google-Smtp-Source: AGHT+IF1ZkfPi2gJ652NKkarwIY/ypcd5ApofOa/AQ+PxbuhRTF4pbWiSN2ZlQ7ALpKKQfQcvtNEOA==
X-Received: by 2002:a5d:5f8a:0:b0:391:2bcc:11f2 with SMTP id ffacd0b85a97d-39efba2c924mr10978756f8f.1.1745316152148;
        Tue, 22 Apr 2025 03:02:32 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4406d5acec8sm165056665e9.16.2025.04.22.03.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 03:02:31 -0700 (PDT)
Date: Tue, 22 Apr 2025 13:02:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Cc: gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, Michael.Hennerich@analog.com,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] staging: iio: ad5933: Correct settling cycles
 encoding per datasheet
Message-ID: <ce0c0684-2f5e-4e23-824e-8bcad56e6b0c@stanley.mountain>
References: <20250420003000.842747-1-gshahrouzi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250420003000.842747-1-gshahrouzi@gmail.com>

On Sat, Apr 19, 2025 at 08:30:00PM -0400, Gabriel Shahrouzi wrote:
> Implement the settling cycles encoding as specified in the AD5933
> datasheet, Table 13 ("Number of Settling Times Cycles Register"). The
> previous logic did not correctly translate the user-requested effective
> cycle count into the required 9-bit base + 2-bit multiplier format
> (D10..D0) for values exceeding 511.
> 
> Clamp the user input for out_altvoltage0_settling_cycles to the
> maximum effective value of 2044 cycles (511 * 4x multiplier).
> 
> Fixes: f94aa354d676 ("iio: impedance-analyzer: New driver for AD5933/4 Impedance Converter, Network Analyzer")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> ---
> Changes in v3:
> 	- Only include fix (remove refactoring which will be its own
> 	  separate patch).
> Changes in v2:
>         - Fix spacing in comment around '+'.
>         - Define mask and values for settling cycle multipliers.
> ---
>  drivers/staging/iio/impedance-analyzer/ad5933.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/iio/impedance-analyzer/ad5933.c b/drivers/staging/iio/impedance-analyzer/ad5933.c
> index d5544fc2fe989..f8fcc10ea8150 100644
> --- a/drivers/staging/iio/impedance-analyzer/ad5933.c
> +++ b/drivers/staging/iio/impedance-analyzer/ad5933.c
> @@ -411,7 +411,7 @@ static ssize_t ad5933_store(struct device *dev,
>  		ret = ad5933_cmd(st, 0);
>  		break;
>  	case AD5933_OUT_SETTLING_CYCLES:
> -		val = clamp(val, (u16)0, (u16)0x7FF);
> +		val = clamp(val, (u16)0, (u16)0x7FC);

We have a fancy clamp() define now so the ugly casts are no longer
required.

regards,
dan carpenter

