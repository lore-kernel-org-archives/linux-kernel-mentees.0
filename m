Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2475C3A6B6D
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 28 Jul 2026 04:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785213052; cv=pass; b=tspiLS+z7XJtjMtduhisSjYjAbWeqsD6yGAZ+H0LU+MJo7garOpzXbRDfTpYO8dOhn/3EyWPkv5u6fTgfNGG3GsWpRNhnpSA9HvrqLpp6HSCdmEMfkjsGjeOacb+RtNB4gieYJ96uz+mF1gHkh4jtDyTHBnxsO0Ll5JqiBP4NeQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785213052; c=relaxed/simple;
	bh=qjV2pUy3rvtNaBFX/a++TmN/dzOWLUnk9bmSeQU6miw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V1QtyuAZp1WeJ3NY/4t/4aV5fFAxAF9ite4z7AsyeKLx6SsOU4Ly4b7tCdkgSzI/yuXX25VrIOdDDSk4kNEzuNY1E/vWsJd5hXdyPCK1ygVUBULJre7APWkwqqAfpzA8Zav+NH5e5SkY0oMnDLwK3ER13UFWcAuu8Bmhs66NqRQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B+UDyZUv; arc=pass smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B+UDyZUv"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-92e54f8c051so189263485a.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 27 Jul 2026 21:30:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785213050; cv=none;
        d=google.com; s=arc-20260327;
        b=DTPkugfn4jZ1mkQywnF7//ewgXoR1IJF1QwLmVhLc6qLXGE7jPIG535xgmcGdP40QP
         w+Dh+aFlG7TxX2yYeFzkksSsO9l6Jk1kcj+P+G8okHRTJzqsOJt/NTRKJpBaipmtAO2T
         ICY3m76a+mzI+H3I6OR5YuIPK2vNJhFeZAZvqQNdRBRMd+dnlECmepStHY3l0PBMSDGj
         nyl27d6nOzWRmj1FSb7TGWchy569XJFnX18iszXs79iu/7uVRltZN7i/AYZ/pTmN1kpy
         3r06d6r7ncGxoj02mgrwmB430JWuyqt9BAGBXh0GxW7SpuZawG5J1KSYzBSYC6CK6IhU
         4vWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qjV2pUy3rvtNaBFX/a++TmN/dzOWLUnk9bmSeQU6miw=;
        fh=0EufvIric9fe4S8Xw37k88GKD7OX721gDt9TI6//czo=;
        b=ELMoUmMvVfqdwos6FgXJumEvTyfLMGh7/QBpkdHSDoy5YuBu0V/4L46n3/ExE+EEJb
         WdLpjKmq3DnyKPRcdrBvX9Hn3Bn4h0z+POFygZMGku09eGfUzweQiTkNWvVFAbM5wFmi
         fkNVpCjnA5uycUJYo8MzyWPVMBLwJbV4XDH+aKE4TC/RqkUZaZ9L98843nam2UbNpnr7
         sW3GaKKxKya2dY2Aug0iz9mr4qcdXr/9kG1MZOLKbZk2HEV1SfoDKtN4qPV1OZufW1SB
         mZsh3dyeJBXnWHlAFHKhZVUFynfEISXqHZ5fQmIqO4NmVH5C+wrGLTAQiPCdQ3pkfOYa
         3Pzw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785213050; x=1785817850; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qjV2pUy3rvtNaBFX/a++TmN/dzOWLUnk9bmSeQU6miw=;
        b=B+UDyZUvIi2xBB9WITU1m5h3IBp8dNHIrMTBlXTWTlBjSMVeJFAAlT6WRpauitWwfa
         DuqAArxPzLfJIyoyaSPipwyl54mHCSRD0YZN+alY7T+yaKgXcijJiXUt/w1L9FU7WG+a
         RfnmxW812o9/KUjXKrHyMaxiiXL9ET8h1CWGnsRZADl1BicPX1UtMab7MjG3NzN9IhzL
         sGOvXzSx3qY1B7UVfan/jJX821NFuea9M3QSyQnyksawMvzUktgnJyn/k0S1LEVW6wmK
         43vIsHYfRK6/5+HLSy1ucfswkyAfHQMARa+5OF9Md2lsRREdntCbkXItIqpxsD1KLOlS
         49Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785213050; x=1785817850;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qjV2pUy3rvtNaBFX/a++TmN/dzOWLUnk9bmSeQU6miw=;
        b=ik0gL0J9FfIVWPzd2YedGhb4ve2EFHz0meYT5GiwrrYQGUlFF9SMEHOoECwYY+Z1np
         +V05lTITEH1AlzTASsoQLwGEZXBcv6jLSgD79H7vxjiizZ7B22kMFmsLgi8dHT/r4kiS
         x9Ftowfa3yptxmRPbk0UJssyUL4akf80MPco07QzgEg6+JVjpDf+s8Z7drnalGg31fxy
         KWLZLGpqx5Ch7ajbKHqyMwNoodJavNYHgJLt7YFDlc00dP7JLSl0QgV2Ppjsv5crw/2Y
         QUf+7khhPhIMElYcL6NjDqOGBohwdAvwnckimcbwl/s2O5EaJn2P0Nmj3+/4zyvUMPFz
         77oA==
X-Forwarded-Encrypted: i=1; AHgh+RqH5zyAQ4Sa9OgUMOhYUCXVizNNRI6kBS9RWLHsFiwt1dBpAHt+X874EMX7ODFG0o3REMnhiNSPTY+p66Bn8wqxNYBrog==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9qmX415LKQpLoaMTThjbAw/lVYwp4XwvpT3Iy+SuJGOs3gDWm
	eu61La4MyXjKQgaJL67V4cNtUqNwRBZm/8AIPsjyKmzLSATtAmU3VuDjX+k/QBIfb6sAmr35gmx
	E7yFhm61wiRTkvBw+TqzagaW65ATkJT8=
X-Gm-Gg: AR+sD11lZNzeiNASwZHNEwrwtOMhbctkPUNYre/Ok42tHQIkmlcHGy8nNbOXlplpBK3
	qNx8HhJsPtpEkkT9l22y4rTpEEqq3e+ire1lpVknfk3ASG+BkHfRcTNO8BcbZOhPinK+r4u6zA/
	KkLlUbsaNZ5fec7/+GjdafBzEa5+c47mxUpSoKleyTqp2G4PJRU5bLks+VuHJGP4d1xdxlO07k+
	TbKwxq6KQ9V7j+IFPk2lR/bJO3960lsDudmq+E6Tt0cg8qlTUQUEbWQZf5oMbeD2m/AWDKj64X+
	trNcfmihPKyFML9q1CVy7J3lm9GfoH1H5V4s0zgRpauJt6HfRwdh
X-Received: by 2002:a05:620a:7081:b0:930:f67a:a9a0 with SMTP id
 af79cd13be357-9330267b509mr62851685a.79.1785213049961; Mon, 27 Jul 2026
 21:30:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260724131208.2315-1-tharitt97@gmail.com> <20260726024243.730-1-tharitt97@gmail.com>
 <amd2xoJdT5VffcoO@SMW015318>
In-Reply-To: <amd2xoJdT5VffcoO@SMW015318>
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
Date: Tue, 28 Jul 2026 11:30:38 +0700
X-Gm-Features: AUfX_mwiJC81_PI52kr7e7Fch4bHRZdipUBx0d855GSYbLOwLY7daHHv7kdwAcw
Message-ID: <CACak8wPnkMz4xgx-BLc4sAeMi01tw3XEBXoZn0B6numhRbFw4Q@mail.gmail.com>
Subject: Re: [PATCH v3] media: hantro: release runtime resources when
 device_run fails
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, 
	me@brighamcampbell.com, jkoolstra@xs4all.nl
Content-Type: text/plain; charset="UTF-8"

> You need convert to model RUMTIME_PM_OPS and SYSTEM_SLEEP_PM_OPS
>
> pm_ptr(hantro_pm_ops) at below hantro_driver
>
> and remove CONFIG_PM first,
>
> then add move clock manage into runtime pm management
>
> If you remove "CONFIG_PM" here, cause build error at some special config.
>
> Or keep CONFIG_PM at this patch, then convert to RUMTIME_PM_OPS() in
> following patch.
>
> Frank

I see, the compiler may flag resume/suspend callback unused if
CONFIG_PM=n and cause build error. Thanks for pointing this out.
I will keep CONFIG_PM and send a conversion in a subsequent patch.

Best,
Tharit
