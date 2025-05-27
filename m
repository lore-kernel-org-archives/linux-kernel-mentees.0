Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A34B1F2C45
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 27 May 2025 08:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748335934; cv=none; b=EAWqPAxO+AszxqvxJXhFESZ/gY5jy3tok9s2PI3pVBdirlqhNEeiH74nDhr7XrJhNwYqt+EF+Z1ue8H4Sh/J/q9AXhf4h4BxoXwSI87kNUGcyCw3WSGPLiCxpZNm/BOPxMFLNADCQ3l27UywSmHPbe9YCz439zkLV+YFWaWe+lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748335934; c=relaxed/simple;
	bh=4mSKtba4yH/6S4y+/PV83qun/HcTtQ/B2r4C5DqnP1o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LUGTARwvYGPJ+a4SgJe2ZdRMUk/kzBypcRTYHEA5s+xw6KZccR9JaSED9FJgCDvfqv6UlT1Ouas3s6l1Elyk8v/YXn0fDCLrD0BzRxCxl6c5M5nOqpQPACnKBGN2JD165V+yBT1FSsw8QEBTqCAImM/7UviAMiXjk3qBZ68b148=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=X2A/Zlfs; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="X2A/Zlfs"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a375e72473so1943277f8f.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 27 May 2025 01:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1748335929; x=1748940729; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4mSKtba4yH/6S4y+/PV83qun/HcTtQ/B2r4C5DqnP1o=;
        b=X2A/Zlfs+brPN42yf94+3Pu5FG1S4TVnR0El76SHSlkJ2cvDjE66GGYA35vb4FTFlB
         vF7u43FGFkRocJPGKW3ktmw+agY3vWhm/F6vMnSi9LN5H5OG4X7ZzK43RG2AQRDFNHdO
         p1WzgpcHlPmqj07ibB2laA4jlyz5H4F9Kew/Q0cscCdUYgCnG9taPfvb4WepkniMsbmr
         VbtXfDdEAF5fLCoVpx/1q6YFHpOrwFhKRFpcGmVxa0jrkP59jf3qz8gWiA4lGQrlmUri
         qz+/enOvXBoO/EwSt/9T/VbcKEa5LWT14CkfOTxKEaCedzSssUHRdIBKHI4dwm8N2i//
         o/cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748335929; x=1748940729;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4mSKtba4yH/6S4y+/PV83qun/HcTtQ/B2r4C5DqnP1o=;
        b=sz9krZWUBqaBOOtZABHgm0b/Ccym8xN5mrLLt94PuJJ8j1PJC3qy13L8m1mpuzqDWY
         y0Jg9IptdxfarVz8ETRi6PouRqdYrMSEfSJSL5JKUYrLl/8b2ZsE89+7quKq6/GxpwdN
         VTzlrIe2+lEyyf58i6SRBjsTxXwGPVQREKxHg9iO1xkfd/RfFjn9Q2EZX6MqWz2ysVca
         TVk3F3CfplNoDMMRyjSHVZ96AITNPHYj2RoqcYrmnL4mKglDA7fTDYUyZ4D+z67Esu72
         Ms1JhMZQ4Lj+qXSNKWPPmUFmdVpZYPgyAjIER9T64ABC8wN5fHlP0o60T7Y8rXtU1c7n
         ji2g==
X-Gm-Message-State: AOJu0YyWX3cPb/SBE6YeiRQzKwLyF98ZlK5RaqJi8hqOaNtniQhSuzFa
	yL19zg7opzIQ3pteGyrXJWOEgv5oXBTQmen0EZaxHY25qRiR7frwvSnUdgPm9LaTgCA=
X-Gm-Gg: ASbGnctIsVdzuRP1tw7xNnvFZVNhc1lK1nVe+GOyrvjBbf5QxuwVZZVUY6K3Ol07BXa
	+KjL6jA8qR5nbdDUjE2VR8dMWcSSAeyJs7MMby3/YR2BlXakH3o//M+pJtsmlrwx837Vo7vVBPm
	BFijEc8l6uBmKO7qjO6sy1VquY+S768oMiNHQdb6Vuv6h9G15+TuWUGOA2qCmBZBXzY19t8rvUL
	nUXcV2dVN8vRp/qG4n9SBzTKU7y6lNUbOyvjtG97eeGIXSVFg9nF4hUEiJ5l9nUeVKRT5Gqd+En
	s017lVRv5dslOpgjpbe35LvD/Fk43151as5iGJRaTeA0Q1HJi6wStOCmK2Bkdxtre4fZK2yuUh2
	fbTkrgZGNKNCUzE1UV7yVZ37ChxY=
X-Google-Smtp-Source: AGHT+IFfujMszzRhLDZ4PQR9OlTYbQFnFLu3AYpbNNyivRDUe3CYGLHt0XR6JINggLt7Mrt+OkN0Mg==
X-Received: by 2002:a5d:64ea:0:b0:3a3:7753:20ff with SMTP id ffacd0b85a97d-3a4cb45f1f4mr10543773f8f.35.1748335928526;
        Tue, 27 May 2025 01:52:08 -0700 (PDT)
Received: from [192.168.3.93] (178-116-3-140.access.telenet.be. [178.116.3.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4dc7e69c8sm4196245f8f.95.2025.05.27.01.52.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 01:52:08 -0700 (PDT)
Message-ID: <db649de3-f070-414a-8201-3a5406a4eaf7@hammernet.be>
Date: Tue, 27 May 2025 10:52:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: fix "memebers" typo in
 filesystems/mount-notify
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kernel-mentees@lists.linux.dev, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250513144816.72566-1-hendrik.hamerlinck@hammernet.be>
 <7e386efb-8f7b-4bc0-9ccf-784ddbdcce78@linuxfoundation.org>
Content-Language: en-US
From: Hendrik Hammernet <hendrik.hamerlinck@hammernet.be>
In-Reply-To: <7e386efb-8f7b-4bc0-9ccf-784ddbdcce78@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 5/22/25 23:34, Shuah Khan wrote:
> Change the shortlog to indicate test clearly. Check a few logs
> for this file for examples. Here is how the correct format looks
> like:
>
> selftests: filesystems: fix "memebers" typo in mount-notify
>
> SZend v2 with this correction.
>
> thanks,
> -- Shuah

Thank you for the feedback. I have sent a v2 version of the patch a couple of days ago titled:
`[PATCH v2] selftests: filesystems: fix "memebers" typo in mount-notify`.

I did send it as a separate mail thread, which was probably a mistake.
In the mailing list history I've noticed new versions being sent both as new threads and in the same thread.
I also could not find a clear answer in the documentation. What is the correct way to do it?

Kind regards,
Hendrik

