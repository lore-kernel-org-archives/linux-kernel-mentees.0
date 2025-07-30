Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EE3199BC
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 30 Jul 2025 06:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753857279; cv=none; b=Wh37Y/4pbwJDx5sN/CxSMcx8LE+jyQVYubHSjcJdUdz7nHVlMXpBoGUrlsmjFdANRozYKgmBA+U0hd8KK53D0tOpA3bp+r88aSiKoDLLHVTdrDs84ypCw4KKb7x9lMxAB97TsuXukpy1T4GL11ZcY2dTmBDmXIa/yePOMKdl0bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753857279; c=relaxed/simple;
	bh=udDMTRYIggPwGeIA+LUlMIHt/bJZWV06DQRlFmoLf9M=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=UOETZglA5rnWyTZXr6cS/Kabwz8V0eM6bJhz+JRYwYvQhJXxRJC5YmgygQXGRI2QKXYocYZh+MxLARtpVbA1Fjv50VyIpDXVUenogafsHHHg9Hkuml6CJhELS01845ttIOV/FaqBMvMzVJbWVcT7HJ5idy8wRStF0ulebl039DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=D1x9L/Bf; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="D1x9L/Bf"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-74b52bf417cso4342117b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Jul 2025 23:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1753857276; x=1754462076; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=udDMTRYIggPwGeIA+LUlMIHt/bJZWV06DQRlFmoLf9M=;
        b=D1x9L/BfIAFLxfiztTlOztq7Kj4cayAKo/dn8jUR+895Ptkz+N1MPZfvIXNuqR3UKH
         n+oLlqV0mxXqL5AGkLjEC2vhLfXFAAolYOMqMTciVONuDizCHf720/kI6dBJlZtUkz7P
         nfzNu5x2OKXQkWz1i1+ChJB44+wQB+6bNAWi6AkEGXn1uvuG5+2s+hBL1IZLVYxK6O8t
         gIu5mwzEVaFaRW/pDRT+1tDjFoHXaIsoZekFcvN21rFCjX6JGC2T2ttgroWFnxSNxHnv
         xRS/S0ibVXBGWhv58rXfDfm+XYId/WIjTwPE1aBExyguZHK0mMilZkc4J0CfxTeNijzV
         6heQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753857276; x=1754462076;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=udDMTRYIggPwGeIA+LUlMIHt/bJZWV06DQRlFmoLf9M=;
        b=nsVFNKbXNfKTNDB1b5YaNfdDRsgkFlwfqNy/x9uO1jWmmk3vm/Ju0JbMUOiC9cdW5M
         eFU5qJOjgPkOyOQL8nRE6bNAjRbaNZOvKmSHgk5Y+MrsxzCnSJW3+I766kc8ZFcUR6VU
         7cZOnWZl91l89ExMnzeCcCA5HqHzbDJnZM1vy+SNzuqp9sW4qvXmC6IFUpcEjDJLaQIv
         7Mvi5gZ9/38EK/XzSxIk8GD3w3jXSfDlgN74jJuhFvZ287oIpR29Xj0AEguDRWXQ+Dr5
         VbHZajvvsXLckjJtdy3xwIf6Owte2H1nB0t0c2uyvLiYIn5ON/g5I07QgL7V7bd2BCHy
         Tj8g==
X-Forwarded-Encrypted: i=1; AJvYcCU8JU5FkXNik3yIHt2Ouy3+bTs7i2qVZNEJKThMNGBBbdHUNMeUmsGpun08BHrtxt+DwlEiA33J5b3/Ge55R/1a0hQ26A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxBqxdAPgdzJ2YYhX7AtQIW8m5R7nmW0PzFs0yVn3no1CgwFWeb
	vvAyc3WH8ARwv2giDqDag6I3yWHAqKFmzexJDKpDpphGeC+PjcWGEc/Bgc+09uIAtMM=
X-Gm-Gg: ASbGncsGAcyJdyczXFG3XCoyVW8/mJUW5bsc1oODqwaiUeOzrfRA/ldo+jXbYlRNLM0
	UUcqwCZQsBJhOI0c6Vt2vzKa2wBrCRi8Z649SAAb7xdpb1gNY64XQHeXIHLVAGdwSajuxaNtjN/
	FRJG3KR3n3dkn0uqsLxGDY3gO+RPoJQ9CEzaOB3XkfbkXKTZEQOc3CbCY4J+yhVCG0NQ7i3+dNl
	szTmeLvS4JBg+lE6RYMq9NR/nD+KAoujCpTt7mjXnpizbSMxiZBaQfBrQjVSroNx2/MsbXP5dZh
	vQI1RLriZ7/kyZzPU4Zi9Sn6fWGg45xdNFVOZpRNkAruTjO6x0EknBU73RlqpHt72Fct1sGKkLd
	I8YoYssWbeaKZB7yvAAQ=
X-Google-Smtp-Source: AGHT+IETsqxzUXTlCsT9TRZOH+m4kcpjwIJ0/QtBth5Bg9XywiWkOesBgvcwCST7Kbx/O2N2BQAUNA==
X-Received: by 2002:a05:6a00:1252:b0:73c:b86:b47f with SMTP id d2e1a72fcca58-76ab0924214mr3499344b3a.4.1753857276527;
        Tue, 29 Jul 2025 23:34:36 -0700 (PDT)
Received: from localhost ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7640b8adf44sm9782808b3a.120.2025.07.29.23.34.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 23:34:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 30 Jul 2025 00:34:34 -0600
Message-Id: <DBP6IL1T12P9.2U9PEDG69P0ZF@brighamcampbell.com>
Subject: Re: [PATCH] fixed typo in the DRM UAPI documentation.
From: "Brigham Campbell" <me@brighamcampbell.com>
To: "Ayash-Bera" <ayashbera@gmail.com>, <skhan@linuxfoundation.org>,
 <linux-kernel-mentees@lists.linux.dev>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250729202123.116565-1-ayashbera@gmail.com>
In-Reply-To: <20250729202123.116565-1-ayashbera@gmail.com>

Hi, Ayash-Bera.

On Tue Jul 29, 2025 at 2:20 PM MDT, Ayash-Bera wrote:
> fixed a minor typo for the drm-uapi documentation=20

By common convention, this should be written in an imperative tone and
should be punctuated correctly. For example:

"Fix a minor typo for the drm-uapi documentation."

The subject of this email should also be imperative, but unlike the body
of your patch, should not end in a period. See
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#the-=
canonical-patch-format
for more information.

This patch should have also been sent to drm subsystem maintainers. Did
you run get_maintainer.pl to get a list of recipients?

Reviewed-by: Brigham Campbell <me@brighamcampbell.com>
