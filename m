Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6912609FC
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 10 Jun 2025 08:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749543953; cv=none; b=Es9vjSMy2qE5N8WSMYy8XECrxJh6jIMDKteOfN7f+w2aQ5EXExuzv9h1sMWuRWC4UEgpM635OUIp5UaXNk/eSPFwsI1YwAaPF0k5rNmr3VNptPvuRFL5VjleQ1wrpP7guz66rxz6HVde+/vmCG5sQQVLzFY8dZZZDGruSStSbkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749543953; c=relaxed/simple;
	bh=pGvauvieYwYiolCBSn4Lw2JXhkhZQIEF4zRiGV68/AA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z5obgkf8jSNch8dzf9P0mcY6Hh0qynpSOj8/63IaE421e+s9bKkOJC7jkB196l8od32Q1a0+us21Sfnh3RNuE8CAUiTTOCLtiVdmY37+Rb4NVPYo6S1nQEkQRthJ3CmSPIwz7tpJT6LLLQMvPBEwVmKBjiz4RL2JD2q7CRmFjig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VfBXihWA; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VfBXihWA"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54d98aa5981so6232036e87.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 10 Jun 2025 01:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749543950; x=1750148750; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pmu5xlM5q+wbKmkDcTikYWeNSMGX5E7OEibClfmyPzg=;
        b=VfBXihWAhPPNSCmJdcfXamm16b2ktCEwwTKQT13BTZlypfhnn36FeJgITRXDHgtezI
         ojJaVfaAUsa2QFkBWC2l+NCSzsmuOt3uMQHN4Lrw61Y7XMBgODl22OhJOiHXZ1EQNJb8
         +8zHmGWabtpKOBU4Iju0PBTR6b9UxYOOGnRIrzj3YRY0jMwRLgJtlWFQcry+Fa2M2cSV
         y7nAA+EDyzeu/zcATbhQ/d/XJaR5bjfF0HUf44LwLNEYLqW1GeZOXEzaoIxzH1Az3g0d
         oLFUJF4o7y/rWjbCvEyGpgX05bvxFRpRMTP5bcZkSU0ZPMb/zdeyy1rrjzdfEPSImT2W
         C8Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749543950; x=1750148750;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pmu5xlM5q+wbKmkDcTikYWeNSMGX5E7OEibClfmyPzg=;
        b=YqfcTC6NicknsDKrnHAbu0tiBbavVmO15iStw7zI6J25AqQxSCbJEQrVG71Q8VZDZS
         4Z5YOKAQwtzA05C/JrR4ECqraGIYOE55aXsUh/MCJxcVp4oIv4FLb7yNg1mJSArAAJMz
         2jSSjiD6SBgX4oQtGw3l8yMaV0PcvWlGSxNeZZol7PBcnxdmKOwmrLX8I+yUlUBnuNg8
         uolCKpYrrVYPvCDj/crfGmiC2USt26JKhP+3W4u0woD1MAqAdUmcJYYgSZU6TelnGlKl
         d7ApoEKdTueysGsvR+3OL7mSAcoYcgTihem4fBbxX8kPe9JOWpM3RLKpnMKb8k8Td5I8
         rS2w==
X-Forwarded-Encrypted: i=1; AJvYcCVhBfwq0VolTLi9l/dNtyG1U3BFYLbBteYAIHgxb/AqtFickj4G2RFoCkMRpKnPlpeOYtaf7swPrOSGcaDH4ZKMnUMJZg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxEI7BNn71KGpawR5CKhaQuRRHU7NuvCiAKBWfXKnYOWoenNu1d
	b/GpH/YkiKO7lOONyfdWriLn5shnprtzwCI+2ejxybrlFqZSy2pnH4kPHz8InlAZ0bo=
X-Gm-Gg: ASbGncvKv5ctfGmy5LTw5zDg3qIIatareRT7emgmgOHrciSdZnF4WoMsu6TEhwN5Hmy
	dBYFRG4d7XwfEjG2DDZUshzjRlXmKIejOdtdhEy/dNdl9MeJZmWtf4nq9V40znG1pd3ffj4Y2j8
	0CakGmTfmUkr6foKfroE/ryb28jqIW4jjcq906r68lM/E4lIXHwTXz2ofTtm5HXHga2diAmMA86
	nBuQPRbPOE1yzsIEPQL7XuKIXOxYDHoMbE+5kGXufNcG9HWDN1zx7IXFCj2ZhQLUYiSoCj9SFmq
	RXnT5Ovj0d7f3Y96lGvleVjQLI8h9+T37YFxZlVRnS21gHQmQ8BD7IdvsCTkyKO6zLg16qV/vOZ
	u4k8WXVG4kVIH2nAUjTyqpeN8CqIhzZDoWlpV1zDd8pWj6NLv0Xkj4HArM4Bx4yHPZodzsKw7pk
	sKWdnL7uBoiEQKOAq8y3K2nZQ=
X-Google-Smtp-Source: AGHT+IF76hHPrwjSwokvPotgutwwpbFV0e+QYImvflw14pJttizj1RcDHECCl4rbU/F3XGf2N30kew==
X-Received: by 2002:a05:6512:3c91:b0:553:6526:82cd with SMTP id 2adb3069b0e04-55366bdf94emr4141810e87.13.1749543949307;
        Tue, 10 Jun 2025 01:25:49 -0700 (PDT)
Received: from ?IPV6:2001:14ba:6e:3100:dbdf:2d4a:ad23:d037? (2001-14ba-6e-3100-dbdf-2d4a-ad23-d037.rev.dnainternet.fi. [2001:14ba:6e:3100:dbdf:2d4a:ad23:d037])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553676d7651sm1453465e87.72.2025.06.10.01.25.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 01:25:48 -0700 (PDT)
Message-ID: <4d92cc22-3fc5-4ae5-a7d3-490bcbfbd93a@gmail.com>
Date: Tue, 10 Jun 2025 11:25:47 +0300
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] docs: Fix typos, improve grammar in Userspace API
To: Jonathan Corbet <corbet@lwn.net>, mchehab@kernel.org,
 ribalda@chromium.org, hverkuil@xs4all.nl, sebastian.fricke@collabora.com,
 hljunggr@cisco.com, dave.jiang@intel.com, jgg@ziepe.ca, saeedm@nvidia.com,
 Jonathan.Cameron@huawei.com, ilpo.jarvinen@linux.intel.com,
 mario.limonciello@amd.com, W_Armin@gmx.de, mpearson-lenovo@squebb.ca,
 skhan@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev
References: <20250522115255.137450-1-hannelotta@gmail.com>
 <20250522115255.137450-4-hannelotta@gmail.com>
 <874iwoaa94.fsf@trenco.lwn.net>
Content-Language: en-US
From: =?UTF-8?B?SGFubmUtTG90dGEgTcOkZW5ww6TDpA==?= <hannelotta@gmail.com>
In-Reply-To: <874iwoaa94.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/10/25 00:13, Jonathan Corbet wrote:
> Hanne-Lotta Mäenpää <hannelotta@gmail.com> writes:
> 
>> Fix a typo and improve wording and punctuation in
>> the documentation for Userspace API.
>>
>> Signed-off-by: Hanne-Lotta Mäenpää <hannelotta@gmail.com>
>> ---
>>
>> Notes:
>>      v1 -> v2: No changes
>>
>>   Documentation/userspace-api/sysfs-platform_profile.rst | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> Applied, thanks.
> 
> jon

Thank you!

Best regards,

Hanne-Lotta Mäenpää

