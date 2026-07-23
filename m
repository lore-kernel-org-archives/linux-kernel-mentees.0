Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CD13E2752
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 23 Jul 2026 21:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784843504; cv=none; b=LEoMjfSKMCBptm0yX1OGt8Z1N3rgE2tAmaVam0CPBUaNB4iO9M7Z+LbRUjUTEhDCxEvpDpSc5c5F/QZH3wdLlBhJCLgEmpqXTPjNFzgCu4H/OWdW48rPyhtGgpofCZyr3yNHYhSPS2TGCoB+BkRjaGwshLgu2/YQuUQLA+YfWR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784843504; c=relaxed/simple;
	bh=DqI51H520L+JlPaYmdlanDZ+YsNhQgc+JF8C1PvcNWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mVrGBhcLreTCi2VufnvDMoDPKdfsINESKDtU2v+S2Dgp+lMbhO5y9T7D50bwNWfFiJ0ZY1HA1Rs6FJUntZ8CFdxGH73wvWKOfJLrrwnH1JjXp3S6zHowHT9xJaFzjFKO56Rl0hkFnHWyM4M/XLgOCTDQjShOgQ6+6cxGzeVJ+CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DqSMwUiE; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DqSMwUiE"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-495757ccbc1so8917995e9.2
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 23 Jul 2026 14:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784843501; x=1785448301; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kF0vVxev9fayaAXZA6hzrmNTUssyABm/Zi8r94t4pJQ=;
        b=DqSMwUiEkEXvgONb+eqNs3eViltzt0et/mUJmdF1STHA2QZZZd0vIQzJ4+2fI9brok
         bzl4FobaNLeIJhUMO7A6MgtAaONic88vVfVl4gCWBJJ8fpphgYNLRLp9Pi4ObEhkQXIh
         qT3GWbUQLAWKxcsEZO/g2YdYeiQj6d7cxTjaGGYJ9D+q3AelVrMY097Zxa+W6mPe/mEn
         7NPo4NW5Vds39pyOYcCdZ9tGpAw9qL85RhBcmI115nncBciaqRZ5iVQcEeOJoEXH0zsC
         2yYJmzsw2iFRErb4yOCv626sMCxfNwv90vFlo6/HJPIzAYZS+y+LqIWY3RyilVB//of6
         LVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784843501; x=1785448301;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kF0vVxev9fayaAXZA6hzrmNTUssyABm/Zi8r94t4pJQ=;
        b=lz+SetNyQmgbG5WD83oq1fujVedyxkjj+rdfYS0uFzaB17o8e7Pfzfh/S7GWJOBlux
         n+Eug23HBWpE99Fzu7Si8hd+XRh2bD6Ts5pN2LTP3sFqCZgFYwL844rq1cdLqcfRuURw
         RNFRpCd60W89+Rij2FnGexFUMNn46r/rybWoZ4IN4By5q9xB3JytlC55kXWACEnJdouP
         AuePMR6V8Hh9Evmn8iUTyv3WF8s1PoD8wB9De+5KP44HszwmyDrFyhGo629LjXVenb4g
         AGS1csKPfev1n/L3dEHcHp6d+Q2s2DWM7j4f1isb7A+y+/jAXRcSzH3WVmnUKbZyS+s/
         02FQ==
X-Forwarded-Encrypted: i=1; AHgh+RrRVtLwLEk8sa5VhOA34HZdYoqnuYCJKltcL7N/6Udlaq8cuJUqL1q3N0Ezzm2Wb0rRwU+MSgjO4+oZfWuNn/npwMnCEQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywj1mOum3qY0c7D0iYdmROZqRehk22droJ3lniLEYsbCokcSObg
	ZNCv8pGup2QAYzSYArEuKqgkCPqhpUP4DEGR9nH+UkiJiE6eDIYeFHim
X-Gm-Gg: AR+sD13WEpTTvmtQGh3o108LGu6/S3lhr0nLyeW+/kpVZeFO5abrSlGmJ7ofKuMur6b
	GsdJWzvTIsvYrT0EDW/hGy0Gjuak3D9M0pC89wPgkEVGDaY+BjqHoyimucks4U7ABDFZgKc1Mn4
	/WM7HWUM0YoWk6PN1WQo7YiQ03lc0hdR/nT3kz8nlTw+2r4goVyNJuvNIx7G1xjQnniJOdBRvNE
	YxXw552CjSjR3eOawvxggmamRiAY9hzcexx5eSy0tbzaVVXSDDxRoatGXppwqdtmGY8V01i/PY/
	ujEFPu7y1MVaxPJ75vAhv8cs96/60lrDTii5U/RxT+5l0QyaebGxIBk91DzSylbz6tX2QtJS+xc
	HpF+CPQUY7GZUWrlIA0xS8V9uwgvx3ReYcp5oVmFnCyawZWKL95EbXeMXEJQbX+7fZwOfs2YUPW
	+rhJ6XUY7MTWQrv8gOXY+EiA8B+UHYTRF0yNdQYFeV4XuAOy15a3ha5m1qU+Z2Rd8rc1ArcCWRf
	g++yOkem3BsFvtAqxkJKYdZuFzdaR+SKMocEP0ABDagWuN0r3vLoxX7O7Lr6NZ8gpBapfj2LxWM
	UX4UStQs5452vs3jk5818njFWwCggXE2QvCV89Sh9gvKzP52AXlNJjcAjyTPCJwAWEk020RqUA+
	57H5LtE4j+g5fADM80Jz1uA==
X-Received: by 2002:a05:600c:3506:b0:495:699:5c8b with SMTP id 5b1f17b1804b1-49573cb97admr53579015e9.7.1784843501158;
        Thu, 23 Jul 2026 14:51:41 -0700 (PDT)
Received: from systembl0wer (ip-86-49-244-181.bb.vodafone.cz. [86.49.244.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957af5d4d7sm23284635e9.2.2026.07.23.14.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 14:51:40 -0700 (PDT)
Date: Thu, 23 Jul 2026 23:51:39 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Adi Nata <adinata.softwareengineer@gmail.com>
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org, mazziesaccount@gmail.com, email@sirat.me,
 u.kleine-koenig@baylibre.com, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] iio: chemical: cleanup codestyle warning
Message-ID: <20260723235139.02fdab3f@systembl0wer>
In-Reply-To: <20260723161040.20318-1-adinata.softwareengineer@gmail.com>
References: <20260723161040.20318-1-adinata.softwareengineer@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 24 Jul 2026 00:10:38 +0800
Adi Nata <adinata.softwareengineer@gmail.com> wrote:

> Reported by checkpatch:
> FILE: drivers/iio/chemical/ccs811.c
> 
> WARNING: Prefer __packed over __attribute__((__packed__))
> +} __attribute__((__packed__));

Perhaps a nit, but I'd change the commit title to "prefer __packed"
and the commit message to something like:

"Change instance of __attribute__((__packed__)) to __packed per
checkpatch.pl warning.

Other than that:

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>
> 
> Signed-off-by: Adi Nata <adinata.softwareengineer@gmail.com>
> ---
>  drivers/iio/chemical/ccs811.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/chemical/ccs811.c b/drivers/iio/chemical/ccs811.c
> index ce7187ccd706..0e5c79b775a2 100644
> --- a/drivers/iio/chemical/ccs811.c
> +++ b/drivers/iio/chemical/ccs811.c
> @@ -70,7 +70,7 @@ struct ccs811_reading {
>  	u8 status;
>  	u8 error;
>  	__be16 raw_data;
> -} __attribute__((__packed__));
> +} __packed;
>  
>  struct ccs811_data {
>  	struct i2c_client *client;

-- 
Kind regards,
Joshua Crofts
