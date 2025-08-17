Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF452417D1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 17 Aug 2025 17:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755453337; cv=none; b=sCbjY2jv9TacRdujnbNcdA++tNWMbgp3cAun8XzmIPsvvu7Wmfrgrz3Lx6RhDK9xTU3mwy9OJTH14Q7gQGJLTglRDMQ5CXGfbLXAED+E5pb+/amHn2MuWTIDv9cBQ46i3oNP3TE3xlp1oKr/+eek7MC2XZdnqnN4tF4+9kbt/j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755453337; c=relaxed/simple;
	bh=ZX65Osj3KZd+3VMcWnHgTciqbWcOdnJj8eq+6yip750=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CcLqHRwHMKU2D6H0D6Gfb+cLaOpDlWVbEY0O0QTREPsI7fjqK3omFpuhQkk+Pw3wBNL0yuumP8qggU5rVvwT4R+uM/7Imcznvm2r6lG32nFXgLT7YhHyKjMH4d5oWBVWFyQ4rfAtXGn7KCn4wFElv507DDjBE87kB4uRmeBcyzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=A/ono4sk; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="A/ono4sk"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0AA8740B29
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 17 Aug 2025 17:55:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s3hTBN5gNpT3 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 17 Aug 2025 17:55:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::836; helo=mail-qt1-x836.google.com; envelope-from=gourry@gourry.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2B70740182
Authentication-Results: smtp2.osuosl.org; dmarc=none (p=none dis=none) header.from=gourry.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B70740182
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=A/ono4sk
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 2B70740182
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 17 Aug 2025 17:55:34 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-4b134a5b217so7904071cf.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 17 Aug 2025 10:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1755453334; x=1756058134; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7ef15y+hBWoFQAF/OeWDYMRMusZ2qkkd9+CBv2gOjP8=;
        b=A/ono4skqIdAAhS7zWQAKmmHikaIm2DqEDjsGYCiMibJ4yU7THps8krXsE39RYfR1/
         idk1Xyq0lo8XVKZHN9XgjWNXv0JZ3NNi4OrZN3Lyht+yzswoX8EwX63hTdTfT32tcrsA
         0M0pTi+ZqPDFMpmXmR2vrMmQhTiTDtBUsgXYZLm9vDeEknaqUuKb+Q6AsqReTsC99OVA
         21jz8KhZ0m6aodQ1h+PPRA3LyjJelqr8cZModTiaeqmWitN0zVLJx4jonyjxWNaNgbKC
         B6EXEm5Oy5puU6H9QMenzOfNA6o/DL0zTferv/0nPiiLnbIc+kZV7BdBtvQezNvIUXpp
         gICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755453334; x=1756058134;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ef15y+hBWoFQAF/OeWDYMRMusZ2qkkd9+CBv2gOjP8=;
        b=ggKdgWN8Vx5ZFV2PPZGFjpjLt5SRsVBvZzD6oGnOvtveVqjNU53N1IWAcxFdzlf9mm
         WVbXe7FeteJLFFu9438DKInM2KYTiMAfByPTx7wtIFzIDeD4YyLR6e7G3bJ053eWmw+c
         nlMzcyEjE+D/9R6jtt+q6y5+ChjaVWluU9tb5MdYb5ouF4pdaJLx1XaVHbglDtfzTVjq
         3MmtNnQxp+Wql9vYu13YNZ1H7wd3Et9c4aBT0pcamiL1ztn3NMVWtWmHsSm00Jch/soA
         CyOWHgWtAkLbiSRAi39G7dlQwIuTTMR3P9uJoXTV7/1wmvICPhONLbFvUj4UBZfDRC/N
         VwKw==
X-Forwarded-Encrypted: i=1; AJvYcCWpjAGEeSiKb1HaUClfwDBvVfd/u5CtwKnZSmkxkfsdF96gRNIKsERDS20kDsT9RS+UxpUjdTbaw6aYD0gCvWTfryQmqg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yz2bvhb8fej6x/4Wl37Sp/y1V6y7hkcgU0M6UNWDLclrQGRqT9i
	JIn1np4pvA2MiCcozu5A0YDfT6qIv76j/ULs5hAsajkZOl7ZrA0Z9Om0Iy34b8gltyU=
X-Gm-Gg: ASbGnctn31ie7jBISkv7nVZcgqmg/8MF70dOZvQXxRBXWDq1KxpdYUK86lG35qnr7Kh
	5Wj9NWifrPxCARv7FLrF/TUDZMGNxznzW82UGEChf3Vz61vi3OaL4+wA8C8POPEoiJ7ks+tBIl1
	yojvMW/jge7OtKu4E2IwlZFatN5qcVdNdb12xcCN+zxF5ojAdsdRF2RJY26cAdx9iCfbU9LiT9u
	qSEa6tZPgrtr0VtT5CrZop0nprbBkmQBtje+Tbg97yjQjvd7hQmm0RIeoc2vxbxQHoSEYYRRJZL
	MbyQr4tAtnYOskkL6KxnaEmMNcOu041WuraSaGEXUj0628JMjbPoefM6spSeayr/6EJp+DSGs1d
	EjAtHfUONgSfksUkVhxiT/0Z8MvkwJCmzJ98gCQxJocJY9J9OmClyspKO
X-Google-Smtp-Source: AGHT+IGGPniltbwWGADuC89Da2QodO4Z1fNUe08TbR56jJKviW2gzde0TZQ0UAs5hoxjQJhD9PIKdw==
X-Received: by 2002:a05:622a:1f0b:b0:4b0:b36e:b151 with SMTP id d75a77b69052e-4b11e0bb988mr130888341cf.16.1755453333798;
        Sun, 17 Aug 2025 10:55:33 -0700 (PDT)
Received: from fedora (pool-96-255-20-42.washdc.ftas.verizon.net. [96.255.20.42])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b11dc1aa56sm39748811cf.7.2025.08.17.10.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 10:55:33 -0700 (PDT)
Date: Sun, 17 Aug 2025 13:55:31 -0400
From: Gregory Price <gourry@gourry.net>
To: rakuram <rakuram.e96@gmail.com>
Cc: linux-doc@vger.kernel.org, dan.j.williams@intel.com, dave@stgolabs.net,
	dave.jiang@intel.com, jonathan.cameron@huawei.com,
	vishal.l.verma@intel.com, ira.weiny@intel.com,
	linux-cxl@vger.kernel.org, alison.schofield@intel.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org, corbet@lwn.net
Subject: Re: [PATCH v2] Documentation/driver-api: Fix typo error in cxl
Message-ID: <aKIXk8SKIMKSuGDv@fedora>
References: <20250817173355.6615-2-rakuram.e96@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250817173355.6615-2-rakuram.e96@gmail.com>

On Sun, Aug 17, 2025 at 11:03:56PM +0530, rakuram wrote:
> Fixed the following typo errors
> 
> intersparsed ==> interspersed
> in Documentation/driver-api/cxl/platform/bios-and-efi.rst
> 
> ---
> Changelog:
> 
> Changes since v1:
> Dropped fix for page-allocator.rst as requested by Gregory
> 
> Suggested-by: Gregory Price <gourry@gourry.net> 
> Signed-off-by: rakuram <rakuram.e96@gmail.com>

Reviewed-by: Gregory Price <gourry@gourry.net>

> ---
>  Documentation/driver-api/cxl/platform/bios-and-efi.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/driver-api/cxl/platform/bios-and-efi.rst b/Documentation/driver-api/cxl/platform/bios-and-efi.rst
> index 645322632cc9..a9aa0ccd92af 100644
> --- a/Documentation/driver-api/cxl/platform/bios-and-efi.rst
> +++ b/Documentation/driver-api/cxl/platform/bios-and-efi.rst
> @@ -202,7 +202,7 @@ future and such a configuration should be avoided.
>  
>  Memory Holes
>  ------------
> -If your platform includes memory holes intersparsed between your CXL memory, it
> +If your platform includes memory holes interspersed between your CXL memory, it
>  is recommended to utilize multiple decoders to cover these regions of memory,
>  rather than try to program the decoders to accept the entire range and expect
>  Linux to manage the overlap.
> -- 
> 2.43.0
> 
