Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9D434BA21
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  7 Oct 2025 01:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759799793; cv=none; b=ebB6DomAekqkuUHSDdxCywuZZjUn6xzNcwxFhQhNenaYIEHkg48IAlsbUo6HwBBF9jtAi1sB87VcGbFfIziY01Qon68twMmNHGvKw+EOFA6GU0BoZObNvF1r8TAjdHu2wVJjIxJbaK/ELjXf64h8TxaWG/nKIIMcJwyR4FnfOJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759799793; c=relaxed/simple;
	bh=6X3DsoXCXLXwSW6LHDG0N+geOJvq7dJh0/ciZA8oLKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gJPIwP1Pk2ebUEtH97MCuyNzVVAPpyWuWW02cPkWf1nvQqbc2smYO09GS+imGTq9f5ExjU/wFxsnZAekHqquX2nirYHGoBNPbuE+isR8iYYkMSiij92//QxMNpgmVQVLvOFNOA1anN/sheUGMMDTQyCRcHzfQmIalLmUjmZFIog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a/8FlRZQ; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a/8FlRZQ"
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5d40e0106b6so3227193137.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 06 Oct 2025 18:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759799790; x=1760404590; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ghdf9TZNa228GXUapeik3l8BFyhmMAug+7tiKuSEW3w=;
        b=a/8FlRZQPV3kyGSWMjSsY/W2ADuw9S+QID/b7ERdTNzTzke2o2nRIcQkYTKj7Lw5Ab
         oscrogZd6OltcncNXB0uZvCYUNTFXsbwIDIVwVKX+Vm2fzOszD0VxAteMBzJtUmWboVT
         qF7NRLCYoJJnU/OA/JI6+3M0MJV81udy8+8h200msXRpprJYQvUAQt9U7bYT/JEzdL3t
         /JTvxQCZMQ5gDVsCfSo0O4Vn4Yd9mkbMp8ypoE60IjGDAvN8VMB452lHSzRIb5IveSM5
         saUnTm1YuRhl2IB5RYEsiRQZNFJYF0zHBdPgsYKauV8RiHbKxTgIndzY9xPU/a2ollKd
         QtbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759799790; x=1760404590;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ghdf9TZNa228GXUapeik3l8BFyhmMAug+7tiKuSEW3w=;
        b=ODLKPLHlmm3iPZzK/gLhuRquQEw+Z+bWXn6XF1IDvEBMcmov199EU+88mCEGMv+RDL
         tEfGG26zjLwZagqOxt9ze4hYBIeWBrYaEExCQIHfwRgI0OLt3yWQHIXY1x3MMz7/c+re
         3AWfyeWemJP2y5wfAgTaqxUER1jhB95o/05zPW4cQvRDBLkZrLx9l4saoq4U+MEBRuxf
         FqEDI+JDNndvxjdTlor6JHOJ+36/CZdvGC/+T63zOy4itcZpoZ4DdiemZbLVlzQrxTwi
         wu71P4LZWb+Kv7A1ibQXNNjlzjGAX4Ha1lJY/q1yRE7+kjZbvHtDpEW89I135YojISET
         z2Bw==
X-Forwarded-Encrypted: i=1; AJvYcCWhHSIrLzP70m9SVFixSL+4FdwCtPyYWAfymD+uhrVcGgVdEK5IfBpVR5imD2B7DD+9MHgtJugeKTirdEGramAx1DyXKg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyHotFjBieF0VV1NYn+NUcA6bVLyeVR7V4lnp9EbLsLGPKVObKh
	7ckzjkHXPJqqb75o6X3HhVcvgRXJZOJXxklkD1Bn4yZikmoHpK0WD2F1
X-Gm-Gg: ASbGncss5gxEszzJIsjolofCqp6mT+q62ICVLFnkc9wXdMP78w/UglGW5ITKJH9eiSw
	4rlZmp7/s+V8KNJmDZa82Zaaqdvp2LtJqOkp5nKrYk740W5grgm4i6vDpcCa32NqCYKatLj9q2h
	bb8B1miwW4paIhprDVnw5QOyPKSJnpHHkkzd8bJP1X2VVmOU5NfMmj9lyEYImbnMYCk623T55Wh
	evqh92fh1k9C1/0pcaIH135nIfmmWkCKBRWEXSa1iRa8aHHHIy8GpVQXIGzsbMx+21qb5QzLdmj
	FYVpsUsLHWvmxbam+mgGKo23RgUw0Ez2ryZPj5kaZ6HQdl+WZqaRUTFIWfEXLJeJ5eFLaRsr4Cv
	y9VNCYEHLzum/kfglZ5RKGksZsNO1hNCGaJMpnLaKzbZvF9A7xolrKvHqJN6nmTE=
X-Google-Smtp-Source: AGHT+IFQImR3Vj1kzGx2R+BGfWd215YKxySg4FhZPdn723hBKbycZMLDWwE88sLjbEEJGhlPaL5osg==
X-Received: by 2002:a05:6102:1606:b0:523:712d:44a1 with SMTP id ada2fe7eead31-5d41d10db13mr4412399137.19.1759799790449;
        Mon, 06 Oct 2025 18:16:30 -0700 (PDT)
Received: from [192.168.1.145] ([104.203.11.126])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5d5d39f1a2dsm435417137.15.2025.10.06.18.16.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 18:16:29 -0700 (PDT)
Message-ID: <8fea55a9-54f8-405b-9844-ee67b5e43ba3@gmail.com>
Date: Mon, 6 Oct 2025 21:16:26 -0400
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: serial: fix: trainling statements `break` should be
 on next line
To: vivekyadav1207731111@gmail.com, johan@kernel.org,
 gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
References: <20251004080123.98285-1-vivekyadav1207731111@gmail.com>
Content-Language: en-US
From: David Hunter <david.hunter.linux@gmail.com>
In-Reply-To: <20251004080123.98285-1-vivekyadav1207731111@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/4/25 04:01, vivekyadav1207731111@gmail.com wrote:

> +		case 300:
> +		case 600:
> +		case 1200:
> +		case 2400:
> +		case 4800:
> +		case 9600:
> +		case 19200:
> +		case 38400:
> +		case 57600:
> +		case 115200:
> +			break;

It is generally considered best practice to use the breaks after each
case. Here is a good article on this:

https://lwn.net/Articles/794944/


Also, same here. no top-posting:

https://en.wikipedia.org/wiki/Posting_style#Interleaved_style
