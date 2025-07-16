Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7290629AB00
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 16 Jul 2025 18:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752690110; cv=none; b=GBQE6ohgX24SZyNm5Wew/Ts2KBYQhedpVMwni3mJ+HHYiSymKpD+cZcNd/p9LyfoSvUhTmk7dCoYpbLpXOhlMOY+ARYjCbNIsqZcmJHb+wnpywX9ZpO+oizBi9SGmz7KRB21xUKrZfjD1zds/zumvxhqeBFlxMbB2jj4RL3257g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752690110; c=relaxed/simple;
	bh=bSE6/htDCjhVwR/NENeM4sfjDZISV5OmZWcaU5WSJWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k7449RnS/j48xHyQARNKw1zfSxZp8PdzuPDqwVsoEbbho0+YzWt2boDnGJ36SeJomYpAy5AgMDu6GNFBWWgyzdHMV1zEJrFToFLn9++p8cN16B48QiOcaFkSuHgNWr3iht65v4/EknwTOe4P206fZVnvBoo8zpN/2VzPpG2szeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jo3mIxaI; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jo3mIxaI"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-73ce7b40d7aso113548a34.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 16 Jul 2025 11:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752690107; x=1753294907; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+I5gJUMV6DaD5nZCZUo7tbib3WO9WKglwCazUnA13Q8=;
        b=Jo3mIxaIM9H3C8Wyt0Gz3JMoXjn8bsp1eTVSyj63sms1hyidCDSuqjB3KiktZRMpur
         lzvRBfcQ9+kXNCBR4Y5Fyriz+2Kja3DkVxBSy/CvzQZSg/Gni+VYyI4pQyReaU+3sNT5
         qUVYgcr045L1ybpyDqyirLb4t1AbqM3nWcGDnuemlF14g9izoYRLAtFPptj6fBYNwu3Q
         CrhGABCLXR1pQJT70cUqsw0fMDlOb/AeaUB0YFEUOCMJ0qtC+Da/GtWDwSbGbr0EPC9b
         5iFOKGXyFjULN2CX+a/MFZOU+wNHRlt3bcqSVq30GG1Bp3umDN4zirX0Ycl33wjh+zq2
         neAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752690107; x=1753294907;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+I5gJUMV6DaD5nZCZUo7tbib3WO9WKglwCazUnA13Q8=;
        b=oorP/9yVqWUwp+oBbELuHtmkqAu/fgHjvGFDeKP1BZYgcc4+29+4e/Bqki/KNm7tq5
         LqiCXyYql/Mwm0AIFArDqzfpSDb8BpNYwojqaFY+lo3N57QfGBpwV+f8215o1KmaXbjC
         /mJfbuASgCacH61SpGXl0UvWAhe82jdGtuyzUHcaLsTQFXr5OqVBc1FWwz1qI1kt9boS
         NIMvD7Rd9EBfXvwDAN8OdEpWtIuqp+1S8cOwRaea80uro9a6lc6m+1xezaigh6VA6hm/
         GdvpKeQWTLuY+cCbb8rHN/iLg+zGNjc43ds7AYWCQE3sdA14PeguKljlpkbTjkeVa4VB
         wCYw==
X-Forwarded-Encrypted: i=1; AJvYcCW9eG1cH5q767pn8ZnXwEMR4a1eG6ABm2prVm55t6upGHGqjEzC2x7q90CNm7FbZk3/243AdLBZJGzwf+XpzJ86V5upRA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwEYDcYvDGPj0BoF3V73cE13VK3OynlcRZLIjohAMVUdUAVMUxk
	WmR5o2q6AT6HkIbNs8KOaqC48spmxhV4p8aso1hA+Yyg3a5AHI+uP/IY+xzAaItRF0A=
X-Gm-Gg: ASbGncu76YhHqt12mGDtPvRPObA6QZs3vqeXZwaAQQlFtHkJxxBUZmG5xKqlYWDJqch
	iEkfkMQruZWKSWIl/qlO9EbeacDhv9YcbSwwtZAhYv0sQ6vcxon3pWeJWUNqit+xkk7grBO2HBA
	BCAGbc4BWIhgO/LBjMEd/05xTrVy8VVqJSC9pH1zn8OlNvusbntL9o3L+Rxik/sHRHO5ttM82Ce
	Lwg7bZYRKoRjjIPfroinSDSte7STWrm3D0NMRyJ+X3ifXGNkuGTABsH0d7M6ACa00LyvJHOyNIt
	fH4Emk5NEBdql1e1Egt/ek8Ab8MdDUAml2KAn7VoWe0tLffXdakuAlEHFLLrbkKOpsZ/hfmXsyM
	LQ40m7z5ZBnoYQ7d5Ch3y7+IsODRv
X-Google-Smtp-Source: AGHT+IEhlTR1gjdZzQg8e3cObaKUeHfTFTkWMXpRkjEp1uVPcyn+zwVpRrjFN9tYQgLGPfOIHTNFDA==
X-Received: by 2002:a05:6830:4511:b0:73a:d3f6:8b22 with SMTP id 46e09a7af769-73e73219eecmr304837a34.11.1752690107122;
        Wed, 16 Jul 2025 11:21:47 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:2564:68a3:7d6:cb7d])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73cf1064f39sm3187859a34.6.2025.07.16.11.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 11:21:46 -0700 (PDT)
Date: Wed, 16 Jul 2025 21:21:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org
Subject: Re: [PATCH 0/3] staging: media: atomisp: More Cleanup on driver
 AtomIsp
Message-ID: <eb7fd8f3-1d6e-421f-b5d9-f9e2d2992da5@suswa.mountain>
References: <20250712191325.132666-1-abdelrahmanfekry375@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250712191325.132666-1-abdelrahmanfekry375@gmail.com>

On Sat, Jul 12, 2025 at 10:13:22PM +0300, Abdelrahman Fekry wrote:
> Continuing the cleanup work that is being done on the AtomIsp driver,
> This series:
> 
> - Process the error inside hmm_init().
> - Unifies the HMM init tracking method.
> - move hmm related function to hmm.c.
> 
> Previously, These patches were sent individualy but they build on
> each other so i resent them as one patch series
> 
> Suggested-by: Hans de Goede <hansg@kernel.org>
> Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>

These seem reasonable enough to me.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

But it would be better if someone could test them as well.

regards,
dan carpenter

