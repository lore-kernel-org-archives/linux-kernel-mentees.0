Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF12368D7F
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 13 May 2026 08:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778659685; cv=pass; b=Aq5G0Vq8/5G0bzzYYX1Pqg1SDbrkg/YYjRsaXASLs9Gv67umNorHP5LH6I6FkSCy9lGWXtH8OCLQehj2JdNoVz3QeAn02HQLI7n6o2eE/yhLKB01hM2a40kJEBm0B/FmCsktKr4Rd6oD458aLDpFT30hGjjn+5jNWmEXa/BmGT0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778659685; c=relaxed/simple;
	bh=o5OHLJcOxC7Fnsmq4GqMfsK7bdTelOza+cD1NXwktmM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oAqJxNNFkB+conPIAnHVjXst2iimavOwm4Mp6Jj0rv0KRgpyCNaYskG9+7GKF7vBbhH/2RixVX7hJQ+DfC3QqCWfcgy8U4jnPvGE3NHCkO04Txglx0h0h5cK+bxfgVAV95mlgSuNB9aMyAdKVD6oQUTZK7VrkzvlB4pSA45EcF0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dzp/j20X; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dzp/j20X"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48896199cbaso56842905e9.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 13 May 2026 01:08:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778659682; cv=none;
        d=google.com; s=arc-20240605;
        b=EZ67cj+CvYkFBTbrZqltFkblzTYqGEDZMh6r1l4JCjdmd63o7vXaC9URg5vGFM49Xk
         1mxeKKu2cQt2c/bbPB0rKudkSs4b1XJr+GKuY4O3WyBWltSIUchYQaA0ufxFwhW+JmzB
         vOEyu8PTO2fSIdVmwakGfUz3avwX/CTxJRK563Z2lii0l/kXMUgxKXf4s2THTRQp/2Hw
         GfXssDqqyf+FvtcXAD/lTXQp8Rg5IRHn48PsN1K/F6gKJym3e5smZwLNBDmrFrQl+rR8
         RYPF6xcJ9Nojde7vs1ClYBnSE9zdo5VKPnL35Xscij6qnJ2eJvnekc6JbYx4spF9gkga
         0Dng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HUj67/5/NXFLHIIXZ/GvpTp6xgEkKvOgSGVkKjkoapI=;
        fh=bC83JARMk/8/0lRxFF31AyrfdmlvlWHpmVWPrmfturc=;
        b=HBTw8salgZmGzIDuPuZkxWnNMyi3stMWnKXazRpPIYcqQCWpCersOySdphiEkeeXbF
         xY0Tvs7jhTt+3uV7YEQ5gNcSE0V4Nekkr6u8JX6L/nDfPtl9qgH8AnQMCBxNLMNoAkEb
         IWUM6wX2svjZ+uJaxgE9idveo/VW0tUfKE6JCpLMRhUN9Pb2YS40hAxqSEefjCGZpu8l
         /cJ7mfP9oYGh4/4JPl7gsRog6npH9sR3X5mpazJJjAPD/UFdbjCGWuJtHICFlX41MnUD
         upaMHKOezX2And4/Uof1EyY/E0VtcPOkupq86/snHnQ6aorusFODP58vnB5G0La51pcr
         6S0g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778659682; x=1779264482; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HUj67/5/NXFLHIIXZ/GvpTp6xgEkKvOgSGVkKjkoapI=;
        b=dzp/j20XRrzntKY8WJnOCvjLbsZTIaYjqttp76gOt1hMrw8rMCmyvpGH7/Lhvv4ACd
         vyI6drarfoUpryrQ38RJJk0KsNVcOPhNES+Oy1baLePUjnPLBpNDKZo9uJh5IPZZi+po
         FNyVINxqBqoVCEljn97oZrPosDLvDuOfH0mvnpMGVFbq4QO0HfGSdeg3BY5zItproD/W
         A15fcy1kDbJuQFprEu1uQI1UvD39YzUmeTgChRTxxcM4gu7c9Rg+FTbuj75oMawsXsG1
         vCo+ICy9KzfWepR3xpEb1PN/CBrjLJHwt2rjDi3ZjFrCGOcqZO5OKkxqzu1nNEPPWNqf
         9qoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778659682; x=1779264482;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HUj67/5/NXFLHIIXZ/GvpTp6xgEkKvOgSGVkKjkoapI=;
        b=ZiJZ0vEMQf3hyUk272+kxcIlAA96qeUMN081lGjRLVQf8+QDuv05Vx4kBQeKnPzVIL
         vZFkHsdCykNFf5h0yXvJb7f7LICoXJP6rWyp18em2iZ1zFH0/vgRW9UIW7B2AM1c+e49
         tjCHYpvtrzxWGgvVEp2Jb6gRckpNTRLthpPkwLT65K07kZWTiJZvKsfW80Peg6BH3Y10
         jwMS0SwPvxymOJRi3o7HxmNhkyS+uHw4b4ioMQKgZlWPpP3fMhH+kbdCAnYNYAEY7mpz
         ollw04FqEUVJ/1LoO198Fu7lUcxZo6BCQJilE2TO0C96DMDpUcqGkzqY5oWdN7z3tKch
         jf+A==
X-Forwarded-Encrypted: i=1; AFNElJ9C/x91nCKDF4BgBsfAc5+IEd7E5uqErKLVYkFa+IxOxq9O6U1FxWaThTzMeyUiLbtEuaO5RUgC0foi+Ve+BZeAa+2ekw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/+l9gHBbJTpXQqqwvzBPucppG0fT44jdaZrVJrziXi1mvScU4
	W87T4TONJu3je81g5K+htlCzmMf2d4qNUqhJXmEVIIP5tX8BoOj6rKo6M+/PKWGgf1518aWkCK0
	PPxU/RJdVw03KJmN2Plautca9poCtdHw=
X-Gm-Gg: Acq92OHGDjxr48hTB1NiHoVgZ8/fHZMO1r6i5895GpOI5wme4+RtLBdWFcoeHCIKVDS
	lv8c5mFcVwSi4bUjykO66qynRUEH9u3ibYaSllClDkiivC8GnlkpxWV3nwrx3bXmZv4xk9u5fB0
	XIu8sxfSD7xw+KAIUCXcC8LM4lT8qiy9M7e6lz8aAcnx6VzlWtbDVFbbKhcn5C9LzcttW99tJho
	y7Rp73pEczvSkyPOvsZjYRO6JDwt/DswkngCC4LHV/4aDGCDvlHkNuGtjduZw74/7w8QWg/mFat
	44d4kzhs/6nKBpkky9u6wz8BFSIA9ho2BN+mzcG3NZx9yt2lpk7oDp/cFhsxdPLogm92ohTOd3i
	KffTcf3+J9MVAdgSsei8Stu4dRuFaX6UyLJTNujSZ36WdwQDtbI4NYNEbdxyAjRJ+MaTH2qGKEL
	UQs2uwwA==
X-Received: by 2002:a05:600c:44c7:b0:48f:d2fc:d042 with SMTP id
 5b1f17b1804b1-48fd2fcd1fcmr1702915e9.13.1778659682565; Wed, 13 May 2026
 01:08:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260512223215.25596-1-aldocontelk@gmail.com> <20260512223215.25596-4-aldocontelk@gmail.com>
In-Reply-To: <20260512223215.25596-4-aldocontelk@gmail.com>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Wed, 13 May 2026 10:07:51 +0200
X-Gm-Features: AVHnY4JIZlyHMUEtu8JAG8Og1-Jhw8uH7BQkFJ-WmDJC-mCDgjabVWeU1G_IkCE
Message-ID: <CALoEA-xdQJPR35WAtsU+4Wd1O=a=1Yg0GSYDOHRLRKLY2XcS1A@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] iio: light: tcs3472: use devm for resource management
To: Aldo Conte <aldocontelk@gmail.com>
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, shuah@kernel.org, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 13 May 2026 at 00:40, Aldo Conte <aldocontelk@gmail.com> wrote:
>  static int tcs3472_probe(struct i2c_client *client)
>  {
> +       struct device *dev = &client->dev;
>         struct tcs3472_data *data;
>         struct iio_dev *indio_dev;
>         int ret;
>
> -       indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
> +       indio_dev = devm_iio_device_alloc(dev, sizeof(*data));
>         if (indio_dev == NULL)

Not introduced by this patch, but `if (!indio_dev)` is better if you're checking
for NULL (checkpatch.pl would probably mention it during a run).

Since you're moving the driver to use devm_* functions, might I suggest
moving mutex_init() to devm_mutex_init() in the probe() function? Something
along the lines of the following:

ret = devm_mutex_int(dev, &data->lock);
if (ret)
         return ret;

-- 
Kind regards

CJD
