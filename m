Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B3D27CB04
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 25 Aug 2025 18:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756148190; cv=none; b=WeXCUDWc3l8OAYMeaGCVmXHI/T2ssGhPIwX30J1/bKYz11fEqkZ1ngBwvwh9CVGy6+LmOPoXAEAgNiIrEVnmg0umuBa+osgVVHCOct3kJ4wZ9mIDnm1hdi0/JPTwIm5XxSUM67Cn8y2Lmn9fglokavuHtdb7OCkVEn7Zp5bUrms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756148190; c=relaxed/simple;
	bh=qgfuK9T6WO6oYvtAnz3WL3d2abHReRj3j9jMW3ZuF4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DPbKuKscmD82r2ET3m6UtHDETnKvvgU0ViA5FwZ9LvD5H35yETu+1kh2cmJ87AzHJ0LaGKAo52om0abxAMPp56WSUTJWZCpPckSRAUXlcIMheJ2K9+EMzlOn23/Jv2tOnoTcR6KNIjIloYofkibaaMT/mMjnLfafEMg3v9a6etE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CpeeNEm6; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CpeeNEm6"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-77057c4d88bso1291341b3a.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 25 Aug 2025 11:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756148188; x=1756752988; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SzWvzuyxc8U4uvXldf0h89Ad3AGqK7qQxNBiVSgzwvI=;
        b=CpeeNEm6Ao0qWUld82vb3MnEajLxxfDNaSbIfn1AaLyFDn51nfrI0/2cZPOp+hbMdJ
         UZUo4rmsgoFkxU12fzALWYEU/GQB/QkKUCn1P7bbelDTx1eB3fZ9Vk2jwC7QNRY52YnY
         Uf0B3HIfio++HMM78hGHfknp9rkf8nEC9rve16cGfSiL2a69S+hsZ6tHm4RgcOtAfuw9
         CGZwokWm404CgjBaSLgB23x0V/rYlCJKriJx3AoVkHg+BkfGu7loHw4l+rbufHMRZZZs
         g7Rvwr2qmbJEca7vnu3k3bTdMh0lwLjuDaJFW9REbgaWWMpx/BmLsWJz476eInn8xtZt
         c8Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756148188; x=1756752988;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SzWvzuyxc8U4uvXldf0h89Ad3AGqK7qQxNBiVSgzwvI=;
        b=rCtL2gwZXRATSrETGUdE22rZGEk5YnYoDD16cALIBDUksq8PXV2wgejKQZt+0w1t0N
         QtMQ6fH0H2lLfjW2TE8LY1//rANGXF2w9jUnBCdPDojg5lxDyjs+8uYuKpEkHrRkJAtD
         emTH6gDBMS6W547NjRUx+mN7NNWFCQ0jzXNYxrH+DqWEfa4kXwDGcTBcD6JDq+PVXGDM
         sY+IZdEs5YbQ3QObQrudndsCwF1eDIho94vcgglnFFEp03BqqvevVb7yeWwY1azZuK4h
         FhyCdy/SWZrQeUQrrLBlaFyeZHnlKDancIOCjOk/L3O//xqe6ukLIFYVZ/MkDpTyI3va
         PkFQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5GqYblZkI1Tn8TBcM/ZxESnO/QpLwhWeiZM+7tYtwSnce5y3rpEob81zmwndrUVuONb5OBG5AgGAZL0EhtEVO9G1xAw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7z+sR7ORUMOciwesnWJmABm0zKY50aGX8yVPqau+6n9BybENk
	4HFkNi/Hv0TprACXID3wKuTOJpfX4k6VI0GLtgbAkZAeowpFt3e/es4G
X-Gm-Gg: ASbGncshELu/YKtVVdUorz+iXQft7CeR2yoC7sVL35vAj4PSP+rfpXf583dHVohhCf+
	6AebN6EM1DvqmfmZVfYqFhAc69A8rdraLH0ScnBInbyP5b7xp5DB0JkdETS8pQrBrH/zXuC2KKD
	A+lVedyifnMCOSvJ2pOOxbjIC6wVa7QdJ6unur7ShNNRFFgsEnXsaD/hcXErO0/eZzhN7von40V
	htWkxFWVQ9MULLUT3qff9tlLfSaB1CR+MJeeUSe07+UGUxU8qVb9B2rSIRkSCpqFv23SXdUJ5OX
	kHGbuRvle3PQy7e8gLKwWWX4pjx8LWuivU62ubBSKkHvHDPPLG4vDwUrmYTrC4QiEu6eNrubX56
	uaVt6YDfubzpGk1/LjP/ZZlQy5HZI4e4hgcR5oLWp7n9rp7BR2e4Fxw==
X-Google-Smtp-Source: AGHT+IEG4OBcUIgVaGYScnERea4gd27KbGi+YUxvReSc5dl9I62mBwZkPUyvO27QZ1ezponnV7Zs7g==
X-Received: by 2002:a17:902:ef0f:b0:244:214f:13b7 with SMTP id d9443c01a7336-2462efb04c7mr176883845ad.53.1756148188033;
        Mon, 25 Aug 2025 11:56:28 -0700 (PDT)
Received: from fedora (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2466877a01fsm75637175ad.16.2025.08.25.11.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 11:56:27 -0700 (PDT)
Date: Mon, 25 Aug 2025 11:56:24 -0700
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: I Viswanath <viswanathiyyappan@gmail.com>
Cc: shuah@kernel.org, akpm@linux-foundation.org, david@redhat.com,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
	rppt@kernel.org, surenb@google.com, mhocko@suse.com,
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] selftests/mm: use calloc instead of malloc in
 pagemap_ioctl.c
Message-ID: <aKyx2IKTLpaxjZnV@fedora>
References: <20250825170643.63174-1-viswanathiyyappan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825170643.63174-1-viswanathiyyappan@gmail.com>

On Mon, Aug 25, 2025 at 10:36:43PM +0530, I Viswanath wrote:
> As per Documentation/process/deprecated.rst, dynamic size calculations
> should not be performed in memory allocator arguments due to possible
> overflows.
> 
> Replaced malloc with calloc to avoid open-ended arithmetic
> and prevent possible overflows.
> 
> Signed-off-by: I Viswanath <viswanathiyyappan@gmail.com>
> ---

LGTM.

Reviewed-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
