Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1136C2F7441
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 09:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760954182; cv=none; b=CCInUUzL3uSUZZdSPugDumJAyQghJQzvxrDB9Fwdp5GTGZhGPey0UUrv9zPGR6gLsOWKjpqwGizY+DeLcKaGpk0Mzw3OeRKt0JI67jqd2/MKaXEXrifixKifx2ZK69damMpkL3DepS/Yc8mgszkYVufFykDN6yUgi1cpzLLmSGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760954182; c=relaxed/simple;
	bh=j2NvydwBbIPuJbatOdw2TojuRwj0GPACk41ubNT0QfU=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aAhE2znKPQ1hZarkVExNwkpHDgsAdDx+b/UW+2mceH29kq0oThPrItY5Mvwmuf3RFOnJb/pdZagS0Md0sovBquPir6iUSwKS0s9BxpnhKZfKJM1e3CfexWqkwei4GKPH/++rxUvGc6jFE7RA6rC23uZ26Z+X7pvlsBolo3uFPjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S3jHNtba; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S3jHNtba"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEEF14191E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 09:56:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TNRihMNEJkb5 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Oct 2025 09:56:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com; envelope-from=urezki@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CBC254190F
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBC254190F
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=S3jHNtba
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	by smtp4.osuosl.org (Postfix) with ESMTPS id CBC254190F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 09:56:19 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-59054fc6a45so4678641e87.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 02:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760954177; x=1761558977; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X82yHa6WgvMKlTJcR19kPIZKafNa3VhhrDxBxVYdfcM=;
        b=S3jHNtbag4an4xCcJwXpQATZlwZKQMnWdC6yMvk9VSbI12BP82vl4sJQgndk87YjyC
         oL/prc8d1xeZmKO9upJsG90MvJMsi4/1F0EAkepizqwZHO3VMHaNzOU7iQT4yJbhrlxz
         3DnCOmBNX4U7GBBn0stU/7x43/q2LpzgCFlnSFk+V0a7B7hAHBtnjJNcSdLZd9oaZKgi
         kJSgdTGrm6ibs2Skq+XAxLIiLDZwmkVPOxSI5t5o5lKL0bbMPQCzjsuaK8ANqCU8VkmB
         fPaYKnhtpP2PNokv/e66oh3/dtLNjEbtL3o7tPNTnGJh9Ymyy0ltnYYCz30PC6LlLyiT
         l72g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760954177; x=1761558977;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X82yHa6WgvMKlTJcR19kPIZKafNa3VhhrDxBxVYdfcM=;
        b=stoxSP430IN+MH25bXsm/Ei2DNqBFTHl+BbWWUQRoGS5F8RxdqjGXsNLTAP76d6XrF
         gTVzwrf9OWQWHIXy1elgSGGuEh2ZrhQOwJ/ybBmubYHZqTc3cY2g4yxkih93/9EG57sk
         LYIMsS8Gy39E+V5eDnEIQvnwiXWjt2Fl1NJlwrNCcA2C9wvHNiXwJANdMilrLsLX8Wrg
         ifhljXaQKpv3CWt1FKIQ312je3Y3MbJBQXNTgb8ChxNA8rrlCy7UrSj7gYjHUPbflNH7
         dagsg32DuxPxd23owsJAcj65TR5WDVzauD7fPXpNR7AxroKBF6fQmb5RjUrGEm2oYdXj
         ma0A==
X-Forwarded-Encrypted: i=1; AJvYcCVNm8UMJaFNFPHeMllunAztsydQFtWEvSvdw2omC/MMEdzmVGqrIGRq6q2EA+n1GwAIT7KuiVS7vGtMPsiCjLgKBeKxEw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yx7jVrfXJei4i7bYd/cB+kaAS55c1TwHkDFb0wAOQ43Fh+qGuQr
	BgaiIipgildceZ20GeNU5ksOrCFnZeu3qoiKy//dMi5t5o6IFBgXnBCF
X-Gm-Gg: ASbGnctwSGikA1/1FEgJL5XM4bzVJNBJU3y+CuR9iviqAMHia8Wzh4EFqzfiPVyyQBR
	0Lq7UdXAQs1aWfmA6bASgs3w5IUEFDGJjYzxZG/XMPuyVLHnBCfGU8GyE9bkQn3mfMGqLONO0Oz
	BbI3TncZ4UMAm2zIdum8bMEkPw9rG4GSOSp/tULarjRjzASxP+BZ+rq3kPj5TTiDaKL0OTKurz7
	ABs7dXdSjA8J4FjPvHSrNHXf6zX6uphLxFs2sAuMJDkKB3MDQr4HqSUFpbNIn4iKIZE/jyPWXV3
	wLYBSu9bELHHIg9nAnHx6Pb+XXQ4gZap3YCTqGH9vZmi7Zpz2U6xG+MDooL5y8p7Mz/aMrG34Jb
	PLiUnfWgn1Sc98QSGFw+gblXu781VHw55+NuDgX05TtLA6XqOlIuxsQ==
X-Google-Smtp-Source: AGHT+IHuU+9CvQ9Gt1nfQHn51C/T6e1754T+yjliALLtrmrWjcnHKqMnxprnyBu97fHYVVzHprz3fA==
X-Received: by 2002:a05:6512:31c2:b0:57a:33ff:c7fc with SMTP id 2adb3069b0e04-591d859ea86mr3876727e87.48.1760954177014;
        Mon, 20 Oct 2025 02:56:17 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591def168f2sm2346847e87.54.2025.10.20.02.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 02:56:16 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Mon, 20 Oct 2025 11:56:14 +0200
To: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
Cc: akpm@linux-foundation.org, urezki@gmail.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org, khalid@kernel.org
Subject: Re: [PATCH] mm/vmalloc: Use kmalloc_array() instead of kmalloc()
Message-ID: <aPYHPmebIcGxeywe@milan>
References: <20251018201207.27441-1-mehdi.benhadjkhelifa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018201207.27441-1-mehdi.benhadjkhelifa@gmail.com>

On Sat, Oct 18, 2025 at 09:11:48PM +0100, Mehdi Ben Hadj Khelifa wrote:
> The number of NUMA nodes (nr_node_ids) is bounded, so overflow is not a
> practical concern here. However, using kmalloc_array() better reflects the
> intent to allocate an array of unsigned ints, and improves consistency with
> other NUMA-related allocations.
> 
> No functional change intended.
> 
> Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
> ---
>  mm/vmalloc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 798b2ed21e46..697bc171b013 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -5055,7 +5055,7 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
>  	unsigned int *counters;
>  
>  	if (IS_ENABLED(CONFIG_NUMA))
> -		counters = kmalloc(nr_node_ids * sizeof(unsigned int), GFP_KERNEL);
> +		counters = kmalloc_array(nr_node_ids, sizeof(unsigned int), GFP_KERNEL);
>  
>  	for_each_vmap_node(vn) {
>  		spin_lock(&vn->busy.lock);
> -- 
> 2.51.1.dirty
> 
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>

Thank you!

--
Uladzislau Rezki
