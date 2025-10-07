Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178BA2DCBEB
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  7 Oct 2025 16:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759855240; cv=none; b=fmURgulrLiVPsw5mz9xsKoCNXlBsDFYq4BBZlpiUhM49M3ZoXyWrBjUKKN2q+Nirrqh0juAQgF1R2ARTHprX8e5Y0jOxzK1FCblNBWPYiLh+AHYbPoBTv3q++gV+8rIhyBzv5IssIs0pB9WDrueft1fLbOxb/HMVRcNIWBgeZl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759855240; c=relaxed/simple;
	bh=hFXYR4fcmLBIVGVw+InBgwA3ZnSYHsqcnzS4vlOpQQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N4x8KVZlTcq59KUq3/NhEK730PmlSpFIJWkAaXZR6OcZ4lmwgIPaVCLdSLlJwlNHw1yIL8wO5bhHG4/Gq3KosdY17gynWnoNLSnmXzWuYw+r5tpgRDYRljFud9U5lkpQJzekdptKPv0nUPBUhbbdx0ExZywra+uzo7oClO2itEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Cj0yW73W; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cj0yW73W"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-46b303f755aso50426445e9.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 07 Oct 2025 09:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759855237; x=1760460037; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4T6AAskuAQMA+z0rbuJKIDBvXK6M4cVmAuCtckIwoTw=;
        b=Cj0yW73W0MvtRqCYA/bZuKVKCVMHZUChNlq3EFPcnQir5kxRb9rlsyuv/UCPIVvZex
         GYFE443rGM/oDprIn9qOC1t0ArNJtNixs2R212YzP+YSRjrW0YiuUn5p6F3sLUO4hnBw
         Q6jHIaDWKFDvD+AeaJBJVAfEAQcob+9AhEMHfC9dozAMelTIZcIDpeikXTDrGuD/9xFr
         +JCM9drNYCJBrOdSkjf9mszCDxx7d3mYSkWijLl4ky4fLwYmL/kFPqSPcFrWiAUP4uVO
         w+gkOQmSoHy4Nh7wIWmZeZSYaKILCMVj8ZvBMDizouJLOtIKVDi+VmXNPxlU9DVwMhvt
         ZSPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759855237; x=1760460037;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4T6AAskuAQMA+z0rbuJKIDBvXK6M4cVmAuCtckIwoTw=;
        b=p+U4o3efg3zIl+0s4UbgRqb+I8l3nqBA1uB9DsU0R1VKcjCWPRDrjAraq/Q4r2kJpz
         Ejmla3wflkDwJ7eqCwx9XgYY9Rpr/xptYwWVHJmy6jA9zansA+2qvL85MPESL7Zbzl8u
         O1EpMO+rT7/KbR1DsLHgnVCAgcF5ur72hLzBwC6ozakArTayqQrTm1jVK3JHHopq7vXE
         DFDDs4qySHGY1w9vSnpMtz5ViGzhOk+e0bbqCVndiVxsnZjQylLn3DoL2TJGfPD20l/j
         c+7PyZq0UdIwh2gsjbRTdBS/qj4d19ghI+DmV2oNbIOqivT1EKB5OroooIcvE5Ru0vLU
         LZEw==
X-Forwarded-Encrypted: i=1; AJvYcCXcfixVBJGNjxMq50U4J3p9uUeye8Gml9an9rnfsTc6VWYLND8uV/1J3oN11EbE0pcox8k39qaVU76YHAf8FddpSk1z7g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxtmkJ+A2fai3uBNQlpQGV++1Qpebu/UXLh1GFhFnoHYDeMlD+K
	qvM+OFF3LSN1tVDYyJzogL6AGom40f9WZXuJsbN9fjmrUSrmZTtQW4TdsOcZjpAbuAs=
X-Gm-Gg: ASbGncsk0a13sVHkWF9Ia6ol3vGqXhNwTu1TxepMdb8tHPDBMkFN7h94YTVLK1s9V/x
	yhNm+InqyxNJ7Nj2OtByDlRKej2uE4+QQ7WhQu9SJCoN2bNkOCu2YBSc1N3ve+UGTkRnaaYTFBs
	T3xsqba3ur6xZ5HKqlgqd+c9FhUmMvta3QflY3sUCcxLcsNClHml+xFYbJNstdnD/DK8NV633uQ
	ND3AbFf6hMhkB6EhIdcDPFMOmWaBhsY6zw4vaZHrbivoC/OF/MCbB7y9Tk9/dN//rAc5QNHffOd
	gJfQYgD5Cfi2kVYK/qd9RwkizUxusLalw5k0AX19neRGXVz6N5IieTqapz8P4Vwtd/2RSMqtWrI
	J9LAC744v6QPKWmXZaCfn4nlXRJD+Jzw/2SJfcAq+lPYjAOJYnEwEhY/q
X-Google-Smtp-Source: AGHT+IGlCEBhLy99r0MwbwBabTf5K5u09aQHi1qXsVdU6U8kDvKm7mhQZ0t1bgVq0uYvoequQknBLg==
X-Received: by 2002:a05:600c:528b:b0:46e:5cb5:8ca5 with SMTP id 5b1f17b1804b1-46fa9b164edmr2084845e9.35.1759855237338;
        Tue, 07 Oct 2025 09:40:37 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4255d8f0170sm26956211f8f.49.2025.10.07.09.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 09:40:37 -0700 (PDT)
Date: Tue, 7 Oct 2025 19:40:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rakuram Eswaran <rakuram.e96@gmail.com>
Cc: ulf.hansson@linaro.org, zhoubinbin@loongson.cn,
	u.kleine-koenig@baylibre.com, chenhuacai@kernel.org,
	david.hunter.linux@gmail.com, skhan@linuxfoundation.org,
	khalid@kernel.org, linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] mmc: pxamci: Fix passing NULL to PTR_ERR() in
 pxamci_probe()
Message-ID: <aOVCgXnHDnErCLnu@stanley.mountain>
References: <20251007161948.12442-1-rakuram.e96@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251007161948.12442-1-rakuram.e96@gmail.com>

On Tue, Oct 07, 2025 at 09:47:44PM +0530, Rakuram Eswaran wrote:
> Smatch reported:
> drivers/mmc/host/pxamci.c:709 pxamci_probe() warn: passing zero to 'PTR_ERR'
> 
> Case 1:
> When dma_request_chan() fails, host->dma_chan_rx is an ERR_PTR(),
> but it is reset to NULL before using PTR_ERR(), resulting in PTR_ERR(0).
> This mistakenly returns 0 instead of the real error code.
> 
> Case 2:
> When devm_clk_get() fails, host->clk is an ERR_PTR() resulting in the similar
> issue like case 1. 
> 
> Store the error code before nullifying the pointers in both the cases.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/r/202510041841.pRlunIfl-lkp@intel.com/
> Fixes: 58c40f3faf742c ("mmc: pxamci: Use devm_mmc_alloc_host() helper")
> Signed-off-by: Rakuram Eswaran <rakuram.e96@gmail.com>
> ---

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

