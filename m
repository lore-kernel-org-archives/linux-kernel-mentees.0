Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9842202C43
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 22 Apr 2025 10:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745316591; cv=none; b=YrTvp1elpjnEmMFNaO8dcbRADAvMjl+Wiz4cZfYjERP2arx+YC2QCdx9ksvSNDqWExZRP3SMehojDSH8BEneKeVRNppAtnvjuNqqn6aLvKZ3gQRONI7ihqR7KiDTvNMun6LAOzhJeOMv9dZP6NpdqG555FXHr0nfAomXZtMqEE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745316591; c=relaxed/simple;
	bh=gJ51U3OqINc8COkxIxukVEYOMtp81jpnzGm7X1OCfvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lDom+iWlETcn6XgU2ZO5z2H+5COh+XZmygGwHWE/WC7AXpgxes9MJY1IUxNeFROXj+Fm1vaCqmbNnvVmQfxvk9xNeNfiW/x1p/FL6/sGPD57Y6gTi0G26Wt5QdCJ+ZidecVQcNgwX8PGIXwDliHFjyVX8yWr6I29aAGsxjL+fr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kIpTovwr; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kIpTovwr"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39c0dfba946so3299671f8f.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 22 Apr 2025 03:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745316588; x=1745921388; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Dp1ZZcaQjMA4BnCcS6OmQTLRZmI/Eud1+9lMtliZJGM=;
        b=kIpTovwrv1tmy9xhQkZJ1ywVetwcJGl9DdxY8t7V98ToycConu5p+0TH9GGSutL0oj
         lvkAhHON4ChgcLFrVc+Q5XlCcLeoSrnsqe0Qz3ziuMx9FmVFngQkEviqpwWX69tU7Wyc
         qpUm6go742Dxdhd12KHqihb853ZiCnIyHNOzOTf4DOU6rxnW+4Jvgmk66aipDlp4nmU1
         geDtDBI9QKcjqOA8ubJha2+M/CbCnEgPfu4LXh4T4H2pmLIwtQ2NvlBol4S5vL7KGiFD
         nCDzkgPEr2m+PWK/9MNNazu/UqtXYGT94sZnPwTQ7vhL76EyE4LWk5p96Ycv1LXmR509
         Az3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745316588; x=1745921388;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dp1ZZcaQjMA4BnCcS6OmQTLRZmI/Eud1+9lMtliZJGM=;
        b=ImUIrVk7CNIrERbcFHNlOGXATiG6sMFgGBg3PbmFLjtWP5lo32ck7m/w9yTVxPjrEg
         zlonDrDP6XRxHqQzO1v/1InoKSXuLUXw6sA/I677ibEURW7lWAuRp1QTChLb34AD4q/v
         GBy/d3ItRSpNwNTzGPgM8HrJD+42shKvlmbwQ4NG5tj3L7rHFwPN/4KSSlpXXDWlJe5h
         mRAzqJiadejtKY80jfw7AgMLVUCax1v9ItzCtBwDHylgRAuwGduuvnbdbAGDDPLKVmcu
         YXnRtVJBTUnqxfk3uK3sNjRCI8wyVVAUzQvt3ESamUBQp9Kr2KzAxWH1GOmzNxDeam/2
         PtSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrdH8Ku0EYPB7P66EFdX1Ms+S1AEbVxwJRSHLoGX3P5cg2Rcp0AmxVoLrE3hqSrLbkD0KnXXnUpR2bCwJRa52ymQcwmg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzHwExhDC5FylqGwBeWqjkymxbXJK/g1VbUg+IbCnVfVjRX8zpZ
	0dMbmX09xpteXHkB1rFC7StfXIDEPYN/XwJs3QNsNsH2V/j6S19Xk9NQTeMTQfY=
X-Gm-Gg: ASbGnctHT60dt56LosJ4x2obPOxecjkhWHr30gRnke5CUZ9RnMsAHyre3ELsofP1jkt
	aQ3DNbUhGOBa0eYXpTSN0vC1/KZ9tHqq8FD/H7UFy2llP6DXxHoybcE95eUT5PevWzT7oMbUQJ7
	Y+2UfniVEliQ74Oqx+RdYZBHzG19YUC1RevtRzKlDCWqGbD2h2dqfOJJw+20sdXSwIflMkX7wZx
	LlhO4VkUCYSr8YNppakk9ji/T2Qad5QPWb86F4QhWr24ls4pMyKpqnF66bLx7GVn9bbpfLh9TN1
	ogwIzRKNMmh6bSuNbsztlEWbjhDnfrLhXKqQipenQme9Siz5oqKrVOub
X-Google-Smtp-Source: AGHT+IEmHLJOQlOcSRcmVdEtr0KqjHjjJr7duO4pcXYqbZwwqR76CD1k4A3+rfbNuIehIKutY/tmZA==
X-Received: by 2002:a5d:59ac:0:b0:39c:1404:312f with SMTP id ffacd0b85a97d-39efba2cb94mr11712313f8f.1.1745316587993;
        Tue, 22 Apr 2025 03:09:47 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39efa43ce2esm14951548f8f.57.2025.04.22.03.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 03:09:47 -0700 (PDT)
Date: Tue, 22 Apr 2025 13:09:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Cc: gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, Michael.Hennerich@analog.com,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v3 0/3] Fix and refactor output disable logic
Message-ID: <72fd8919-8413-45f4-94fe-277719192536@stanley.mountain>
References: <20250420175419.889544-1-gshahrouzi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250420175419.889544-1-gshahrouzi@gmail.com>

On Sun, Apr 20, 2025 at 01:54:16PM -0400, Gabriel Shahrouzi wrote:
> Patch 1 includes the initial fix.
> 
> Patch 2 refactors the code to use the out_altvoltage_powerdown ABI.
> 
> Patch 3 adds small improvements by minimizing the size of types and
> doing a redundancy check.
> 
> Not sure whether to include a read function for powerdown as well since
> all the other attributes only had write permissions. I can also do this
> for the other attributes to help modernize the driver.
> 
> Changes in v3:
> 	- Include version log in cover letter.

Please don't resend patches the same day.  Give us a chance to review
it otherwise it gets split across multiple threads.

regards,
dan carpenter

