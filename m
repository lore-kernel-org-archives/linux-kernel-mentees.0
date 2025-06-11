Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE6122F3A8
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 11 Jun 2025 11:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749641598; cv=none; b=Q/YyBw/v5F7PJk2ptvXjqURLJ5yTKZMDq4asPb2PXZQwY+Da2G9dvS1hoVMB1woNsiUi/UC2cEoXedx6+ikzGdXHPOJN8Hc0vKdxHuJm2KxmUCrMEQLYx6bIHt0GBkNPumStt3/1dQns7SJOrXxDrN/RYNQoLsYSS1wEzf6TyM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749641598; c=relaxed/simple;
	bh=AeoKYUfqPpxYTwa9dOPzz1NIZa4CwemYCpr69gr9Bbc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=juLRgbZ4FCX14ryOREPXDxjaktsYBPnpYdUxu171omA1NGvE6ZOLgmvq5kN1DMWVjxvghHsUr0FFiUEwSXd6n91mtNY8+Pd1YkciAsXA8xh2dnTOJ1y/mzGNx/3/X3Mf70+6bbJXj7ekBuNw7EhpRe8Hvc2t857dGR7qr0F+cwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RjgboLyP; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RjgboLyP"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-32a7a5ab797so50721441fa.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 11 Jun 2025 04:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749641594; x=1750246394; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IGE+TNgN8AiJDwpgQ02ln4zwsMtlaz7bMg5HLVNRnrA=;
        b=RjgboLyPQM1Q1u8P0ec6W2sjve/IYKAiBNMkOC7HgdUkOuAc/oEk73j5G610Toz/Ny
         2TtZG8pskJcJraiLA2ujyLF+DbBbqIamixPID33BWYXKkQcyigr68hMSmWd8Jssl0Wwd
         +gTIpE4iXTCIutjbXQgY9PmAWpoaR2HuWByuV0jJwbZYYaCX+FmPZV8PX3TO+leKpO1D
         5M6PfD7UdfQ0qQsLTURlngS2iqIaaczL5lJvuJMRRLU1Z8PbSTEpKBVW3THyPeSRe2AA
         Dhhxe1gN/GN7xDr6FyEMX1L2Yen/4WF324sWeosJjmK1GaI7MFyX/+JvPsmJV58p42RZ
         JtwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749641594; x=1750246394;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IGE+TNgN8AiJDwpgQ02ln4zwsMtlaz7bMg5HLVNRnrA=;
        b=fumJc7FZYk8r1TagE/ROo8MAgj2JI4T5Inw3WtRLed6T+OiJt7mCvKF0+80qJ+WAsR
         vwKPaEuNVxzS3kNq7Q2IinZtCIJD41X8ABnZvXQBCZitYfAvZiqvcPkeF4nLrIIOtmI8
         fIp6RlRIojQnIEIYPUys8zU2HIovQBa1tBTObkvH4KaHCz5OvmLcstDb+K06QP3QNqhH
         nvZg8C7qXWE2jzmXegW/4qpNmX1RjXkjRwtpqB/XJy/NIb5GeeCeeusyPsuGgouMx/dz
         0sGPBuauAcIie2oZDlVVWi0M7eJ+lbD/QeVgwN2UILpTHbxwmcvGXqZV1Jy5sX267VoE
         0sZA==
X-Forwarded-Encrypted: i=1; AJvYcCWDjHwy6Xp1QjyII0OI/s8Aqpfrql5x8VlcwetWaQlMkfSt9uFPL8QvCeqsvTntd33pDWjKRe2Vc7JYq/lHtnz+xU8oyA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzS/QQFgt7eBAPJew7selaLbTdHsUhQ/Twu+2+Vxv5JQSMEYaOI
	fJBuHlwj+Pw2fVvfPaPUUhHo87BfKT5RYkGfzxA4aklKsefEAgBpePK4
X-Gm-Gg: ASbGncv/IaKCkZfHJO/+FmFyov4pa+Kfuo8iFquurCEBa7PWxrDeySW5Og7T9kjRznb
	rXphXbr4qXfpT0lQYbWKEtd9HVsxfG7X4I9Qw88aQZbp8tFXgoAVIhZ13r4PlPnDm2O6FOJR1Is
	ecZBUMzK6qzIlPgkBIXk3wT0TDWuGrpO5H0mrx3lJTEJtp1TidZ/T4HIpS74eRW4W3DQOycnD7z
	TVWpBPvTR2SpL7/L6mCyS15WBH+6kANOdjL8RU1rz4HjR3ptYQIs1plegPH2iDHoQoxlihR6PmV
	hkdSNKBXnVEWt2CvNlOL9BGRYGd6jrWpBckaXd10Ke4IUWOXelCRBKM7WR0iNhwxw485M9jOatJ
	hm2/LNfS5N44MYRwFpQT1Nb6XoNmbrMSiI77UoDgK6OAyo9lbjIS5f9sz6aNaDbCePwy3Lf15+X
	QkjdJcIHr5cLGqg5eetEgOfBwO
X-Google-Smtp-Source: AGHT+IE2kzQKVgzgwd3yt80d6uhyHJ6VDdhEtsKW+aItli5kCRdPijQS2jEZ4uFGLbUyM9wZHtc6gw==
X-Received: by 2002:a2e:b887:0:b0:32a:888e:b30f with SMTP id 38308e7fff4ca-32b2227dce0mr7598041fa.6.1749641594023;
        Wed, 11 Jun 2025 04:33:14 -0700 (PDT)
Received: from ?IPV6:2001:14ba:6e:3100:d134:143d:95b6:6d13? (2001-14ba-6e-3100-d134-143d-95b6-6d13.rev.dnainternet.fi. [2001:14ba:6e:3100:d134:143d:95b6:6d13])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32ae1b0cf7fsm17713801fa.12.2025.06.11.04.33.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 04:33:13 -0700 (PDT)
Message-ID: <5dad612b-495b-4f1c-82ff-e8ed4ef34c07@gmail.com>
Date: Wed, 11 Jun 2025 14:33:12 +0300
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] docs: Improve grammar in Userspace API/DVB API
To: Bagas Sanjaya <bagasdotme@gmail.com>, mchehab@kernel.org,
 ribalda@chromium.org, hverkuil@xs4all.nl, hljunggr@cisco.com,
 dave.jiang@intel.com, jgg@ziepe.ca, saeedm@nvidia.com,
 Jonathan.Cameron@huawei.com, corbet@lwn.net, ilpo.jarvinen@linux.intel.com,
 mario.limonciello@amd.com, W_Armin@gmx.de, mpearson-lenovo@squebb.ca,
 skhan@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev
References: <20250522115255.137450-1-hannelotta@gmail.com>
 <aDAOhl7gKhkcTEjk@archie.me>
Content-Language: en-US
From: =?UTF-8?B?SGFubmUtTG90dGEgTcOkZW5ww6TDpA==?= <hannelotta@gmail.com>
In-Reply-To: <aDAOhl7gKhkcTEjk@archie.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/23/25 08:58, Bagas Sanjaya wrote:
> On Thu, May 22, 2025 at 02:52:52PM +0300, Hanne-Lotta Mäenpää wrote:
>>     #. On Satellite and Cable delivery systems, the bandwidth depends on
>> -     the symbol rate. So, the Kernel will silently ignore any setting
>> -     :ref:`DTV-BANDWIDTH-HZ`. I will however fill it back with a
>> -     bandwidth estimation.
>> +     the symbol rate. The kernel will silently ignore any setting
>> +     :ref:`DTV-BANDWIDTH-HZ` and overwrites it with bandwidth estimation.
> "The kernel will silently ignore any :ref:`DTV-BANDWIDTH-HZ` setting ..."
>>   
>>        Such bandwidth estimation takes into account the symbol rate set with
>>        :ref:`DTV-SYMBOL-RATE`, and the rolloff factor, with is fixed for
> 
> Thanks.
> 

Hello,

What is the best way to send an update on this patch, now that patches 
3/4 and 4/4 have been applied, but 1/4 and 2/4 have not been applied?

Do I send v3 for the first two only?

Any guidance is greatly appreciated, since I am new to kernel development.

Best regards,

Hanne-Lotta Mäenpää
