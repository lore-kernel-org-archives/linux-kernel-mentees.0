Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223313AC0C6
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 23 Mar 2026 13:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774272165; cv=none; b=JbbnqAt7Daoc0d/6jI+AYnDsgkT2MAwKaoQVy0uVgOAiYyPoulvNh2T+wc+vqdunP6q/D+CVBZvtt3iGAZZWEmvQrVa8CV03hoLkvXbdRfY2Kx2RS7mWDP2P5WaqWISQBiZMqJqtyGEFjfLK6EHrOe1hqh6yGLpXB0nGc4JHEZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774272165; c=relaxed/simple;
	bh=j0JNoWs/5Ny/7nAmgdQ3ZChBWPg0kp9ZVPLuimhhf9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mcZnjuXDOjbmQeCqli5UiO30p9p68sutQy1BDoxXGsEupnt3NPCp6PiVRX4jQ7weGfNGEstYn30F1N2uvvMWKdzSyUm6pUZPJbd0Aih4gX9HLyE6Ts2CwP/7xNZu5lRCNpsoX7vs32pFQA4u2f+OIKV1ZiY1TnDsgOH+dcvj64w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a2AmkWKd; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a2AmkWKd"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-358e3cc5e7eso2381045a91.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 23 Mar 2026 06:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774272163; x=1774876963; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SaC/+aR7z+dJtwXk7cfJ7isoh47sVWIef3O22gIXyNw=;
        b=a2AmkWKd7+a6jxaNInswd8qdx6ybgsG7L8K56vT7MZ0HbUY8ScH8M/Cl8y+yklChAZ
         k5EfhAsu3zFYa/6OUlxr03jGrX/AoXK++wNEIywecV9VKWkNVNGVEzY4tDUe5T4LrY08
         /Tr1sOMsOi7ugKJFNwtcbtkx0rZtQ8SefEQWnKEeXKBavwD67OhkOfF8hRQgWfpSSufG
         YZVEEokh2SiRdzH8FzVA2TkhEfNUu0oeQw6ZCClLzy+BAAhERUv4oSUvqs8Au5xj+SYb
         vsPfjv2itlM049sReVkWRRGQAPXj2hqYYbvqc9n6TqhZ/6OjY5xg6lHigMI6m8B+S3NG
         ajOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774272163; x=1774876963;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SaC/+aR7z+dJtwXk7cfJ7isoh47sVWIef3O22gIXyNw=;
        b=mQP+uVJ+ppjEIhgV02bP4Gg/GM2o909QUReaM7xhNL7zj9FxAGxQQUxLmeLmzXkHq9
         TGtOVlOwlu7KERiHlxh9MxcKFjGMUjjJiCb0NzUZSXocA/57FaOzFEAiqR01dsDRXXu5
         6AbujaIa2AkLyJMl0G3aThtbU9it3GKTq3Cjw+dQcz50ULEi0v+0TO5Od8ydUTADY+MW
         VPKRgWG7BNHW0hW3lCqxRSOPWkOOAqUKoA95ONqaK9PljCzeRvEOSKmY6TSFBe/vsriP
         d+9o8CgDHV9DZjMNiTJ44aPryPcg6tA28N/eqE/vPwFU4nCfoxug3nHckHVCKjvsDoTM
         +Z2g==
X-Forwarded-Encrypted: i=1; AJvYcCVPAQO6VqffFyM3A7K/2cir4fn6VCwa7OQ7b+VfaHG5AzLFSZIvBRIswHZnWW7NbC5Mp/6LJ9DNjPSjWReXlVqDcvviPQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yws8o14FSACwPJKZAm/E9fwOo+WX3U+7HDafJIt14iyUUNMzA40
	Yfdhi7djEotVvwOOiMhBty4YypsoMgWefJamWz0fMEhBdQDEGanY0dCm
X-Gm-Gg: ATEYQzxweRZf9qFBqUNijmsNWZ4gy8yPGesQB3eRT1T2wZwi40aPiNPgZBY/YP5l7pt
	qpNlJL2ZzSNhyEkEH9s8cY23pYNp+PTsPQTdVCNuPoA7uoZQS2lQMYw4Pi2qX53XwAKDMtws0sk
	nkyYSy3I44zvoNmrncRbgfzEOsK12dGTb88FZBxhjpzob4WZjnipYtl8Hb6KWm8wsVuzc2jWb3C
	1d4UQzuYvoZc2Oar15aa7Fi5AXbC9zWc2jPG4pLxGpJl7UqcieufUEI/pZSSpmxMpgA183yuusK
	W/zNL4ykz1RKorHCbDzUZSfoB4beicB1hKV9855d/iR6MVSIzIbDZ1wFSV8g4cTUZFxiVjsplf6
	lXgzVsuw9pjgZ1UN+3hrRqEbOtEOnJyJESl28F/u+xxlfMWy5Y6l/LcOgNyV19pdo9oSdr+ZrCV
	vqoMGKcvbJmFN9SaMcs6lriMMek1rvpzCxAQ==
X-Received: by 2002:a17:90b:4b85:b0:355:35b0:8b78 with SMTP id 98e67ed59e1d1-35bd2d105efmr9682339a91.27.1774272163477;
        Mon, 23 Mar 2026 06:22:43 -0700 (PDT)
Received: from inspiron ([111.125.240.152])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bc5ff704bsm12905677a91.2.2026.03.23.06.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 06:22:42 -0700 (PDT)
Date: Mon, 23 Mar 2026 18:52:35 +0530
From: Prithvi <activprithvi@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: gregkh@linuxfoundation.org, straube.linux@gmail.com,
	ethantidmore06@gmail.com, dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com, khalid@kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: place constant on right side of
 equality operator
Message-ID: <20260323132235.sg6fw2azr724g7un@inspiron>
References: <20260321092536.138499-1-activprithvi@gmail.com>
 <acEFrIIYaS3ZW8j6@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acEFrIIYaS3ZW8j6@ashevche-desk.local>

On Mon, Mar 23, 2026 at 11:19:40AM +0200, Andy Shevchenko wrote:
> On Sat, Mar 21, 2026 at 02:55:36PM +0530, Prithvi Tambewagh wrote:
> > Place constant 0xFF on right side of equality operator when checking
> > value of hw_channel_plan to fix checkpatch.pl warning and conform with
> > the Linux Kernel coding style.
> 
> First of all, in the very same function there are more of a such.
> And hence the Q: have you checked the entire driver? Please do.
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

Hello Andy,

Thanks for the correction...While checking out other places requiring similar 
change, I observed the other place in the function where constant is on left 
side of equality operator:

	if (
		(false == pHalData->bDisableSWChannelPlan) &&
		rtw_is_channel_plan_valid(sw_channel_plan)
	)
		chnlPlan = sw_channel_plan;

Here, the formatting of if statement can be improved and we can also replace 
	(false == pHalData->bDisableSWChannelPlan) with :

	!pHalData->bDisableSWChannelPlan

Would it be alright to add these changes to v2 of this patch itself since they 
are related to the code having constant on left side of == operator?

Thanks,
Prithvi
