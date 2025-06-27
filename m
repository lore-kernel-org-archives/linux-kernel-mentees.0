Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD222E92C4
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 27 Jun 2025 15:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751039052; cv=none; b=f6OEKRB5euw9bTQ/4QzcNBmXeUYMJrCqgkYuQqt0wayXuFcwjjBjdbSMlGa9Ub3KUDnPCa1114IRkhCZX8a3xTx8DllH4Yt7SNfl3o5rwb8OZHsHiwsqKT+ptR9b3fNjQUIs5yNiil8cg4eqRY9GxXs9mkHnHHRIU+iGLTS52pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751039052; c=relaxed/simple;
	bh=LcnRDVEnZy6QHKQQxsP/nvCacp9OQV2gpAzUNBJMFr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XbcCLee23veNilCHvUVAMJ7eI0P3tG06VyZLPJuGCv+mn0Yf7kXxSV2lBPJdSgkMrHTUTEEyIJct8glUdhgd+HSC+I/655ER4lEmaJY5o80NMeNlrzoNQDplKiLnjIMMSuJdQ6xJ5eFx6D1YqRciM19RSen9R/FIIpOSjKR3dQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A2tXb510; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A2tXb510"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-2ebb72384dbso704211fac.1
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 27 Jun 2025 08:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751039049; x=1751643849; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vNskI9ihVQwbRR9S2z7pyG2KNmQ2CECCpU1on9KtPmA=;
        b=A2tXb510DGJ5FXH4TII9ksJCZMcAA4BnrJyM/zYjAxnzHanmySrTDypXKmj5bz3Wh8
         AGCnyF6F3tAMytcvCv3f0oLoaBb/OIVfbaOwjIoSeTMfw58G6081j1K69TLWDpQMHTZH
         nEb89nrlFnim0Nc0X2x4BrrtN+cGpTZ3+jDSJUGS1nk1gaP0aUgUltE+n3PaBMnzJzaZ
         yuUGa1YUFafvsWMrH0ee31Sw+c690ECdJM1nTXvZzooefgN6LMtESurxsfN/6yRDH6vz
         HUL2lwQFsAliVKvl+9OP/Z0uALMy6LiMUBXWUF9YEoYs/Th/g0kFRIXUMf1RgH2SHPpO
         g19Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751039049; x=1751643849;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vNskI9ihVQwbRR9S2z7pyG2KNmQ2CECCpU1on9KtPmA=;
        b=uIkpc7RZnSXCbixdFuArPahwPtHapwHeymc7Awk1S2+88/6bWQWp1OI+Ki2cetQTMD
         cnJX1coXXneoOVLU9oEnIsBLYwz0SGB41xChz/OH2FEl89gwvOsmhDOjph1J0oDP8CcY
         knUSaZn6y654WFFL2LELbi4+c3SK4/OqhWYkElG7n3hggcQlBr5tdU3boTDE+F0oe2uB
         WPleIKBR9zbYGs3BebHMqz1fHiW0w9nvjdN5auEZfnIBcLR6G/Bmrsldz1KLRK6ZIDuM
         EMJydYjh+jU/q6t0AI34M11JER0BtT5NS1CMTm53Vqh5dJvVjO3EoJbU9Vo8udXqeFDd
         aJZA==
X-Forwarded-Encrypted: i=1; AJvYcCUtSIb8we5VVU3X1sW40QkgPOLb4EZamNQqTykIXJsc6SBRyijvkmLDeNtrX8PuxzbJLzHp6linwo0T2/+C3PfDVtLv4g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxmabYZeubBv+0dkUbdQeCrocv1exJamkf92kyVbDaICl7Hv70z
	aWQksdvcSxWVpjf9hlHbrQo7dHVj/i0LKKXF7ZTEp+R6kXzexRH494Dl2cXJsFT4dMw=
X-Gm-Gg: ASbGncsMgNcCVAxo70gTkFfKdkcgKP5JlrysSxgfIii3c5UJPCTCF86rTD8MkoxLx5F
	tNf+PyYC0klRSFTDyEBUkkmi5qyB+SC54+UcFSp3EnxNeLYWwz9OwKUQPM9ETmtihJ0Nvko9QAN
	zCjPvDxAC9Y9crfOYMJYhTn7Ch8OR3NMGclbpSsLxPDVNFeNCYl1exc+J8v+adQ08Awpj8wRB+m
	UU/EGYxntrouBpbcog+iiQH7zpAr2fW55N8sU54qZXK9E53JsUR6VKb/0KehE7Yi+q0Eb7hONLR
	+v9uwuJm8a0+p5x8ItMP1dBHKPURS8hy1ch7LXky3x5vLrL6Fferw3AttSTmRZQS6WnlaQ==
X-Google-Smtp-Source: AGHT+IHhU09H+nMf0lfOpqCHxF+Y0NTLulCnQbm0DdYiPRfdIF593CXffYxkSUXy1F9j48/+OHfs/A==
X-Received: by 2002:a05:6870:a10b:b0:29e:5897:e9d1 with SMTP id 586e51a60fabf-2efed7a51d7mr2326653fac.39.1751039049549;
        Fri, 27 Jun 2025 08:44:09 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:f3a4:7b11:3bf4:5d7b])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2efd4f0f7d4sm911929fac.18.2025.06.27.08.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 08:44:09 -0700 (PDT)
Date: Fri, 27 Jun 2025 18:44:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: andy@kernel.org, hdegoede@redhat.com, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	skhan@linuxfoundation.com, Hans de Goede <hansg@kernel.org>
Subject: Re: [PATCH v5] staging: media: atomisp: remove debug sysfs
 attributes active_bo and free_bo
Message-ID: <e7dfe490-abfc-49da-8beb-50ce02678c86@suswa.mountain>
References: <20250627100604.29061-1-abdelrahmanfekry375@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627100604.29061-1-abdelrahmanfekry375@gmail.com>

On Fri, Jun 27, 2025 at 01:06:04PM +0300, Abdelrahman Fekry wrote:
> The sysfs attributes active_bo and free_bo expose internal buffer
> state used only for debugging purposes. These are not part of
> any standard kernel ABI, and need to be removed before this
> driver may be moved out of drivers/staging.
> 
> - Remove active_bo and free_bo attributes
> - Remove group registration calls form hmm_init() and hmm_cleanup()
> 
> Suggested-by: Hans de Goede <hansg@kernel.org>
> Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
> ---

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter


