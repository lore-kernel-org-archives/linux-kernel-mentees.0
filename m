Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7772BE623
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 15 Aug 2025 20:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755288251; cv=none; b=RVmU3mLou/jBmWEd2d6tV7gA2zTzzH5RHkqgUl5e6Y1FMItvXHye+9+9Q/60Y5S+0bJLhCKWfGF5C/x+0JjMcd2xqoVb3IxaJ6J/9tUi+bakM9IanymilDvg8TaygdkuGaA5M+qZ+a+iNGELQC0y45nQrnHQbwpRrSZO+Q9I8AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755288251; c=relaxed/simple;
	bh=AYbiIeF6iptLsGoDj6CX8UYKKLMHp5WQuDxStj51bMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nlpMle7Aj+h4BDmaUMuYeF09WMkFOXcG3Da0r2PSK6ol/RZzWbLLRp4dINxeR0YYLY4maTIfZj3clmQNhSYvlPvgbwFhtrY9fBH+xdxZ+RXU+mCUNVgkZa84vM+DHg/Cxj6C6kHNtOt7/Ys4DT8gw+NHupYuTxiFliUHqqXH/7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sZGURZgY; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sZGURZgY"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3b9d41c1149so1710656f8f.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 15 Aug 2025 13:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755288248; x=1755893048; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/dVp3c/mL+kWmyAxnHEJ2Rjfw36Df5+7d/WFZD+6RK8=;
        b=sZGURZgYbyAQZct7MFmOb9USZnABZEsmVuDXi9u9Owsl6lzMXOIL+071DFcExVJZIn
         OPX4gyH7hDSk17mM5zQXvwZM9XixRbOmHG0Z2BdsubzazEGSCKGI7Cotdx7yABl0OAOb
         GUkmqwP5pAAI+JzG3IxVGjFhggB62apeuYi19aLR8o8ZkI5E6E2wovYt7TBKB43pbAni
         Q8+DyOoRCUYswNUy3mPtWl9UT0VC11VZ0yGTNEkHjig1wgaO/7uwbgSXLh8wy836U3QZ
         GdzlHRE7wgBNa65/G/mg9PVJLdzwSwi2hwCkiTqFjDLR6g516Ul7xo7DIYwfRJspNFUG
         rAfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755288248; x=1755893048;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/dVp3c/mL+kWmyAxnHEJ2Rjfw36Df5+7d/WFZD+6RK8=;
        b=LDTDEHindWpOAzwzcF/HVBV//F9b+sQvinkl3eJectQqUHiHpxxTcYMnvfHz2cYd1e
         Bv0wjMqTDIpg0oLSafffPFsqvRyR4mBtu+K9ETRLW7N3be+JXb4HdRJ7KDWkYpAxFTsl
         zom6HJv6sLMLOtCXDHv9fTnqIhowQnm5k9TZnKdBlaIDznhV1kMpO5M77aaTxvzlVbZ0
         mYhQedGddKqmv3xTQyLYe+UqLvH8RSkDHxVxVI2uIlrVzf+fO9EytC6vlhqjVmdm55fW
         ZsB7HenWxXDfdUnC3NNW0ivtNZeA7Reb0joiYNPh4CVkOQHQvkp9JytvxT46EOQMDoJV
         bUaA==
X-Forwarded-Encrypted: i=1; AJvYcCXESMcz/xaYFoSd/l2pvw0J3iMmTgmqCtrz99zHn1qgB4rP0QAX3OAzBFP1IOgLJWCoAhsLLCNoNxhTgIEG69rBo5Oflw==@lists.linux.dev
X-Gm-Message-State: AOJu0YygjM41VWH4HZJLZbStZKMq+/TlGw3fFYAh/aUSTDyhVQk01ZcV
	V+H17b1LRsKGR8k5Wfec4D7c9EZBkEfb5k3MeB/8efLmiyFpz+2aVIP1R6TqiR1Cuec=
X-Gm-Gg: ASbGncsMqfYn5L2ry9aeJoMNe/Qt3WeRllLvAJI8WZH37hMSYx2L/nVDrV2fOlt874I
	bz7Dp4prUv1xbrvOCWV/cvh4dwxAhyd3xGtrpcVVAFYGQBg72nQ6GEQLR04jjSgwAI55RSQ9yIZ
	3fQ7fU0BwaprelgI7mRRhbixlVua+pB9vfVBz7PzjVUlqXYK18gAgf6EuoevZr/SCgB5hrhaL+S
	D1cUBmqj3JIJz0AJ9xG8a5MS2qoKSmW9eAmMh8dKYCIeDrRcpgJ8aOKGUL2hej18OcLemzOyKm4
	bXms5B5Pv6IZ5ObTHRSiPHFMBRmL1p65ourVMqqxggnQFXaVCxNuCvEGT5Z88CremLcaXgKDGLb
	bzLbtcT73xaOszkhFiJl4e7TdZ34=
X-Google-Smtp-Source: AGHT+IFeT3WqPGdZuR7vMkj7YvcRJntIuG00A/c4v4eSx+o5nUwQFOtRCUjiC2QXYMDK3VHtd0TfNQ==
X-Received: by 2002:a5d:5f91:0:b0:3b7:8146:4642 with SMTP id ffacd0b85a97d-3bb670ffc24mr2519110f8f.20.1755288248212;
        Fri, 15 Aug 2025 13:04:08 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3bb680798dcsm3060951f8f.54.2025.08.15.13.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 13:04:07 -0700 (PDT)
Date: Fri, 15 Aug 2025 23:04:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2] media: atomisp: Add lock asserts for mutex protection
Message-ID: <aJ-StLSBnHmHHGUX@stanley.mountain>
References: <20250815182411.36092-1-abdelrahmanfekry375@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250815182411.36092-1-abdelrahmanfekry375@gmail.com>

On Fri, Aug 15, 2025 at 09:24:11PM +0300, Abdelrahman Fekry wrote:
> Add lockdep_assert_held(&isp->mutex) to critical functions accessing
> shared device state. This enforces proper locking and detects violations.
> 
> Suggested-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
> 
> ---
> v2:
> - Fix Typos
> - tested by building the driver
> 
> v1: https://lore.kernel.org/all/20250815170901.32105-1-abdelrahmanfekry375@gmail.com/

Same comments.  Best to wait a day between resends.

regards,
dan carpenter

