Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C4D7E1
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 30 Jul 2025 00:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753833768; cv=none; b=pGA6JxrJqraEAt+sAHv0nfGsqKb6NYPYvQyswbZeZUi+pDhkOyg5ixbCSTew43c3mL3iDOOJwnD6tO/PN9+crmCS6QpPVptzM4RY1w1vhLN/2QAq1t/UufAs1fBzNXc5iM4G29qAfxntdrlAAen0x6Koxrp6uDb4Wh70Jq+Fm5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753833768; c=relaxed/simple;
	bh=Y/M5/sPM670c0P9olu2X4VtHM3mcoU/sU4qAieG2bB0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=nLxCCuaNs5XYcYPuY84+Wa9bzi97JQArBcR61uKLdix1CEGuLUxvj5IPUwLKjyK4BJpa8bX/nZvqgNDCxbcvg67Rzwhgk545hlFC0jDnYYKfz2oiaTHr/q9S7MULkj0fmO64UoA2h1EE0bLPfsYPjF4v03eXsWCaM3Tu4anlNBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=HWeDdfbt; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="HWeDdfbt"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-748f5a4a423so4315901b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Jul 2025 17:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1753833766; x=1754438566; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y/M5/sPM670c0P9olu2X4VtHM3mcoU/sU4qAieG2bB0=;
        b=HWeDdfbtkk/7nT4SLLQcH/KkdhxiecU2M+Id2F4sAy4w2iw+kDHg/u+taFg1cnMww/
         PQAW+WkS6JiQjXvPag34xTvLYIe66hpUAv/kC1RDDcLOkFV3TOYNbCHEWk/4EKqQZ/Gs
         9noM0kPaudKBl/8rIlZqmDwC9wGQsXWFQOBYgLYgLuuqMTqQe5yg/D9MxtGcgKZB+JNQ
         dqbXpDBg8uq+QhTJgM853A7rPV6xE4OY/2VeHT7XFgKdMP+d2L7wK/RGcsSaEogKnepk
         hlEWtwGoZNxU4lQ62qzEVYShcoOy2dwwgz87g+JTTnHI7vQRZJpvW4Fpa2ZT8PkR6toh
         W7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753833766; x=1754438566;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y/M5/sPM670c0P9olu2X4VtHM3mcoU/sU4qAieG2bB0=;
        b=nduzPxmDw5r9+BArk9YE9FoM0LvqLF4Qso4amqpVLz2yNVQnanbyQu7lMujmrTuZ0w
         uv5EhPsOGFHfXV+78cnSb0Yx1Kd2janMtfJRsmp5H4bB7QsSVQI629+fXc5o2FNJu1qz
         ukeoggzG3vqKaU/55N9Eyqy9R57spO2KSe1pE1o0aN7RhBVOwIvW5//HRrPXZR4KC1sY
         qdQ/K91HPbS/yD9/3fk99/qYXRjcduVu+KobjXpU6vvqH3IPnDucJxxnI4m5zkFLc5n4
         PSv94qaz3XxBznSIEfBqkW1JBfinlxgeKtnt3+o5qbxVupo9dU5kbHalmxlHbLf5gHNU
         02Mg==
X-Forwarded-Encrypted: i=1; AJvYcCVQhaYaa2mPTLOxZmdEIpPyMSc310eebzaC/cFcRb2h4xVOL7NajmOQi2V+ytmq6vRsRJkT4u/EHHAgJc/9pEFmJ6FnBg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwmRkawE7AwfBINlftooPna3wQzbJSH4ErXolKjFfFn/yA9FDtV
	arNvnLeDnb45LVIczG6XxD55kue+z4B/ctG3AfMH/tdUN0iGDYc98cLYRzsjaQmha40=
X-Gm-Gg: ASbGncvHXau9maoMTHMMMYb4Cw9N8OnCiXeYaY4Tjsx19SPRCGpa4OZ1GMAifvic4OZ
	geGWdEE4ymaea9UY+riLT5zPv5wi7SS4NdhmtsrAU9WyBaO4rOFs4gWrlDTzGh1gcGgEOQfwXqS
	6GmbqGkT5mDS7iI8n8KlPw7c+3Ylv9h1MRVf4QStUFSxVgE4bjVGPAxcp/hbtn87A5cPErzWAaT
	NPFz9ti7W6VWdCDDn3avE7OoFIlsHoccExxCioPbJel4YsobeGbm12d1hPTosVxUCTXpTpduF16
	H0s1jP5oMiAcg16vvDOoFkK3TUPfr8lIvX0wj8Q9cfWQeTT2cyGjkU/YejtwCAvpXqFZ3F+bcTu
	EbdmJ/2UZBClR1xHmjhZHXCp1pNo2tA==
X-Google-Smtp-Source: AGHT+IHVlZ6q95uroEIypdpjQbCuABwWzb7jPvXq7QWXyjT6+dlzAgyJCRMwTznOfewVnzIM/Cjhyw==
X-Received: by 2002:a05:6a00:2450:b0:74c:f1d8:c402 with SMTP id d2e1a72fcca58-76ab101929fmr2149656b3a.8.1753833766071;
        Tue, 29 Jul 2025 17:02:46 -0700 (PDT)
Received: from localhost ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7640b4c8516sm8967780b3a.106.2025.07.29.17.02.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 17:02:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Jul 2025 18:02:43 -0600
Message-Id: <DBOY6KA7U0VE.1QR5VMO09T27H@brighamcampbell.com>
Cc: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <linus.walleij@linaro.org>, <neil.armstrong@linaro.org>,
 <jessica.zhang@oss.qualcomm.com>, <sam@ravnborg.org>,
 <skhan@linuxfoundation.org>, <linux-kernel-mentees@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] drm/panel: novatek-nt35560: Fix invalid return
 value
From: "Brigham Campbell" <me@brighamcampbell.com>
To: "Doug Anderson" <dianders@chromium.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250729054435.1209156-1-me@brighamcampbell.com>
 <20250729054435.1209156-2-me@brighamcampbell.com>
 <CAD=FV=VUdfTT4AJk77BFXWy7q_je0EbRKWc=nUVevbgitkn0gw@mail.gmail.com>
In-Reply-To: <CAD=FV=VUdfTT4AJk77BFXWy7q_je0EbRKWc=nUVevbgitkn0gw@mail.gmail.com>

On Tue Jul 29, 2025 at 3:33 PM MDT, Doug Anderson wrote:
>>
>> Fixes: 7835ed6a9e86 ("drm/panel-sony-acx424akp: Modernize backlight hand=
ling")
>
> I think your Fixes tag is wrong, actually. I think it needs to be:
>
> Fixes: 8152c2bfd780 ("drm/panel: Add driver for Sony ACX424AKP panel")

Oh, good catch! I thought that 7835ed6a9e86 introduced that code instead
of just reorganizing it. I'll remember to take a closer look at the git
tree next time I add a Fixes tag to a commit and I'll address this in
v3.

Thanks,
Brigham
