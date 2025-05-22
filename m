Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0955B29A9E0
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 22 May 2025 22:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747954273; cv=none; b=bktbUv6UvzI85QKAL/IEhPvTNSyxNGXsFMdr630wErrLU5Z5ex5yHU23zIn+Jxv9L017PgmWuXU9RFPXmwa92SXAknzDhjaH1An20w5AchoI9loVbr8ASB8fv8tk0CHzcCBc3O5HyoJ+p0gr0lxxG41zLYh5NpINFYmi2bOFzhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747954273; c=relaxed/simple;
	bh=XJ27/xwWLz/W8KH2VMTPmg1fVqnXe1xQPj7iei/d3S4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ACpQv3u2zYYfQ8X1hHr7NaGf9k2wiGyQa9rDQ1ZYubR7DeLIZQCX226MzavnQdajpTz81Z2N5MKJqAEJS2dsv2lxPcf8RKqI+g+TTRHDFK6Pc5DOjVNCE9zVs381I54bPaiDII7fvmy29gTT37TJe6mdAJw6zSQM9dnwKX3eosc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JOENFe3K; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JOENFe3K"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-72ec58e45baso6060261a34.2
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 22 May 2025 15:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747954271; x=1748559071; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zqOqsD9enrwocZN2XCXrFciGa3ZPBF1bqsvBC9V48ds=;
        b=JOENFe3K4CH4DprmamMkQUnevMfeGsuOd0knlr/8KCUI1U/aau6kulwNFn5Xk3HuKQ
         4VmL5f2DZGkmU/Dt8MBRXHcJRMeVKECQEkn9WGfDh4br5Im2fUnIclhagYCQGsYjw/s+
         ylElQrK9gk4Wjtx8rF1jwglXgddTGlpXbCKeg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747954271; x=1748559071;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zqOqsD9enrwocZN2XCXrFciGa3ZPBF1bqsvBC9V48ds=;
        b=D8KcuexzeelBG4T3CYbtQHHOtPSrA33YwP9cSgp1q8HAujPvKJC511/4GsjYTy3Ao6
         MBM2yMo1lAMYoVsPEBsiNBj2eJtZylEN406yWG4wNKQAuGwPovOJoUwhrfnE2D39Be/J
         NRwT4EdbPbsAyI0yDNgpJNk8G4ui/8sipkQa8ZFXbZ0dHHC3ALe/cRl4zgZmJ1eaHPBd
         JvWxdx4dvvrCg8U+9isBLi2fzXlQZPlLfU805OlF4xC6dbQGH532gwVUcIW1b3yl2qQy
         btnGhTsmtzXDIUwSvrY2qju5paH0/wr4FKk1Iavm2SxtlpCrzgz+jSVm6Wud7FVl1e+f
         ptxw==
X-Forwarded-Encrypted: i=1; AJvYcCVUebqLLeuJnQmHu8HM8raP1KSUy/mEzwnLt7AAyekfEC1kFO1xgGlfa0x6QXTkvBnn/DCZw4jb+NHUH6Flfhl4k5RzGQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwYNd9nHjP1HUsxYjLTj/51AHvdonch7Fqf/HFDNP8FlxN0pFJy
	jRMULgZ+UNKly2PYM11kl2ecNQU/wglsvb9iVPCmQypC7aTrtqq7N3f8X88De3y33OL1/bohnjl
	j5pW+
X-Gm-Gg: ASbGnctTD5UyTWL8R1bKj3D5sYQBtmW8yI7T53Dul0IsTukMVwMezs5fSYpznFUl8cJ
	AvFqwE7Jrb6GJ/LsAMvaXvZKFu2FRFlHSVhytlc2Y6KpooNy/N58JEdvz4SfIH12uh3V1cHF+Wj
	qVew8JTAdHj5MKp4mHzSxo6pld4UZihTxDtPvDgD8Dlu/YnJPRKvQckPoOHfz8ocRF8TSv9/iy/
	CPF5M2E6jU1O0eQXf/vRRVTaL/60OOcq2AuNEX1hhCBVo1vQz5kGx7dsV4pm9EmWvu7psdJl4aP
	K38vsEa7dFjbae78np9DzGLG8JOk0QBRxiu2tvOvFY2ouHL2GX0lbxi3idx+Ew==
X-Google-Smtp-Source: AGHT+IFzOV554lWXzcF1YV5aYeLFpUIO3UBsBYGo8BFzCMTUpdmhgcxpCdf+r6HZsu3QdP1/3Sm1pg==
X-Received: by 2002:a05:6e02:2164:b0:3db:6fb2:4b95 with SMTP id e9e14a558f8ab-3db857a6f7fmr318356595ab.18.1747954260746;
        Thu, 22 May 2025 15:51:00 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3db843f72e0sm36708835ab.35.2025.05.22.15.50.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 15:51:00 -0700 (PDT)
Message-ID: <4f0d5c19-8358-4e5b-a8f0-3adcee34ffd4@linuxfoundation.org>
Date: Thu, 22 May 2025 16:50:59 -0600
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: net: fix spelling and grammar mistakes
To: Praveen Balakrishnan <praveen.balakrishnan@magd.ox.ac.uk>,
 shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev
References: <20250517015912.131187-1-praveen.balakrishnan@magd.ox.ac.uk>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250517015912.131187-1-praveen.balakrishnan@magd.ox.ac.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/16/25 19:59, Praveen Balakrishnan wrote:
> Fix several spelling and grammatical mistakes in output messages from
> the net selftests to improve readability.
> 
> Only the message strings for the test output have been modified. No
> changes to the functional logic of the tests have been made.
> 
> Signed-off-by: Praveen Balakrishnan <praveen.balakrishnan@magd.ox.ac.uk>

This patch is missing net maintainers. RUn get_maintainers.pl for
complete list recipients for this patch.

thanks,
-- Shuah
