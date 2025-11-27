Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F76E33890B
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 27 Nov 2025 16:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764262570; cv=none; b=Kn/V6r+QDhbGvImZ3uX8kXZVGwjIbnhMCvW6JImBT0Y7tNTYww7aoVbPocxoZS/twHN3HlNgkrXsalnKYLey0SJlwrpNAa8fRId4z0ETZ3kA9nlSVyv06teZ3qrT0q7mrBytSGfFz4tEv2y/tSJNmaXl+iEjSja0k27M+msKPlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764262570; c=relaxed/simple;
	bh=f/Hdib83yeaPmP2hEtEtoMIthnmHtUVstZueQCCgh1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kV9R+H8aXS1wgyldnvjxCJkG8UMuGqP1lVoUJfW2KPxE7qaZVMjRdZyQmhM05t1qWGZ7nzdIyjIuHGPhUXvtBrz1bXFaZd4KB//NQaH0NCMGqJ2piC+WpdmvvyjfyXG7e+RN8m6Nzb/XkM13QtXMb7TT7DhmcrMTd9LXPI/+r94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A1VSEcGo; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A1VSEcGo"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-63f9beb2730so819866d50.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 27 Nov 2025 08:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764262567; x=1764867367; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f/Hdib83yeaPmP2hEtEtoMIthnmHtUVstZueQCCgh1A=;
        b=A1VSEcGoO3WYmv+6G/Vl8fBta7Hr3HvRmdlZMOsdiIdlO1UGKoL2lz13fDiZW9LgzD
         67hr4CClSgeOa6ZeL85+ZCVWpwaaF5mIeYIQ41mF5usCF7ca2BzHuQ1u6eqnQsaLhkKe
         2deET0Cuz6sXqLT1MB/Q+nXcXaZ1KOlEhq/0VLIm2ZFd2LBdAU6JrAkMfAbyE00uDrbp
         FQPO8Zd/cm7TQHgA3Mco2rQ534b0yeCY07jyAzZHSFkP2esBFtryRwCiLojOC/5Xm56L
         OE2WQVkgNHSIavn9SceSpvhlIk8UN2g8WwyNXVPBLt49DC/27feeq5zNqqamE0ZYl4T+
         RbVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764262567; x=1764867367;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f/Hdib83yeaPmP2hEtEtoMIthnmHtUVstZueQCCgh1A=;
        b=qI2BlrE3Fi8eHAoNC6jCXjn8dCWZrFowIBASIL9xG1ot4xdnbkhIU3rvNf3iODEBR5
         A6ejJoFrcA+XHXcuqn7LwQVQq4Gd6nRsHCPQP21kdqWT7xwXNv4IaP65aETqw65Pc3yT
         mKHw6baZSoRsb68ge/2RyW2nXaE2Df9sCibuh7TLskOC8Vm4VF+vM8W1g8BiTHolsl/F
         fOGnJHfqqwyWMKKEj2H2gHKhdW2fZSIIiIzl/EGcMuEij9sVFftDW8Agc/2Itq8xnu2C
         Nro0eN8BzlsFSI/1JkJJ8Rqvnvgh3wczt2ICiaF2r7Fqh858JiUSEC5TEdWuKck0FXB6
         pLnA==
X-Forwarded-Encrypted: i=1; AJvYcCXzf3aZ4bQtTKZYAEpI+p1xbUobkKRX5qLK7KgPe5mK+eh/1qpQuW0LheV789f7HP/xF+JJk7S1TTrQNb6N3+o9hXsa8g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzMtq8SRgyN6wSe9ixvVZNGNZxJJPucMOYeMlLNxSxvW0c5+Ru9
	bw6s4GJOwhrJZ07Ofo9otBBXFk3dJctUPhuXkiL5XGxYOEsuSNshIdyg
X-Gm-Gg: ASbGncv403beHjwRaoTpoM0WSaWnacHfnAWw3ktiTBTDNZ2KMDwTWBawX/iA30eYovE
	epqICnLIWJSHbpVjugzn67pEnLNsjXYjwKwa5YAGg4JwkQChTpyPH+Zpj1rxaoJTEyjYj/VVc79
	+b5yHNdFYs4bNX0I5K/3Rlxuh/LHHJ0vRgo2puFZt+y/K3sA6rInYVF12Xrpo6rYVM9F+UjVntf
	8ZMKUcIKr6pqyGMpij4Y9ylbq8ArEaIr27z59Zia+44VrrBQgScYymGfMJ7uLI2nhsa5KNiHKgy
	h4jDPwqhifmrCnDwxtAjgdOQU/K6O1ggOOp2M6z02bwLfbCNkYraPEdkPA8SFqMpxuCLs+Bg7IT
	PZj7TlsO5y4+kkD95L/8YZMm2jE0Yhj9Dp/KIFMnMX81Q4E/KpjkNNeZBvVK1UamK3Vjmo/YDaC
	PL1yvbCNzKWuuoFs8pr7/BGvLuD18st00wFPumS1VVQLiT7pE46pYoX+exj6awKgJ6DIdMToUDW
	iDGIVU=
X-Google-Smtp-Source: AGHT+IHz7yB79BQo9D16bnIWc+s4vt4ZNQ1duPWFEcIJy4RKXkKvRt4EL4wtVRM+yawq0Eyk7lEwvw==
X-Received: by 2002:a05:690c:3809:b0:787:cad1:bdb2 with SMTP id 00721157ae682-78ab6fd7c48mr81647827b3.69.1764262567431;
        Thu, 27 Nov 2025 08:56:07 -0800 (PST)
Received: from ?IPV6:2600:381:6a1e:8e2d:1d4d:5b1d:d0a8:2d05? ([2600:381:6a1e:8e2d:1d4d:5b1d:d0a8:2d05])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78ad0d5fe26sm7318487b3.18.2025.11.27.08.56.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 08:56:06 -0800 (PST)
Message-ID: <566feed0-c398-4e86-95c1-619b029a3373@gmail.com>
Date: Thu, 27 Nov 2025 11:56:02 -0500
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: radio-keene: fix memory leak in error path
To: ssrane_b23@ee.vjti.ac.in, hverkuil@kernel.org
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, khalid@kernel.org,
 syzbot+a41b73dce23962a74c72@syzkaller.appspotmail.com
References: <20251126034105.236131-1-ssranevjti@gmail.com>
Content-Language: en-US
From: David Hunter <david.hunter.linux@gmail.com>
In-Reply-To: <20251126034105.236131-1-ssranevjti@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/25/25 22:41, ssrane_b23@ee.vjti.ac.in wrote:
> From: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>

Try not to put an empty line before you are done with the meta-data for
the patch. When you put an empty line, whatever is after the empty line
comes through in the message.

