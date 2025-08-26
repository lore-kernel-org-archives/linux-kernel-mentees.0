Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835172F530E
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 26 Aug 2025 23:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756250875; cv=none; b=YXvYjfMX5/cx7fucLlJu5ijbLVM132FqNYEP3kaIRd9wuuaISDclHiGtzGjE7q9Rj+PiTfCDMIfusEy4WflovCZKVVi4xBLau72Hpjmx80CsJYoIbLw/IO5qIV4nEzoD41RyUNYLHpk9kZVSCCgvFh5aRQW55axPDenHzvpIhUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756250875; c=relaxed/simple;
	bh=wdIrdmDtaKWvwCJ/h5jxYxaIY80EUwKpqVrqQ89G3v0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nTmNuTNAxwxGmEXf6YZqfBAwvrDrQ1CaU5Ou0YI0P2ZMyyDT4YdfCXiVaZ7kbAPQfU9zGDzFWBHtSPiK71QLUzXlhoc11aPH+T3LSygy2Cww9J+OKAfIT42BEgLyWkz2Qb43d3h9csBycU2LAdawwFS0ayzJBPc+9Q9ImaNa+WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l7g3+0RX; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l7g3+0RX"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b4c21867cceso2224633a12.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 26 Aug 2025 16:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756250874; x=1756855674; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CD6yjiZ5YQJ32PGJlfbxDHcsoHAZgjFnPcceDJ4tFUI=;
        b=l7g3+0RXVeS0gekEvDYZ8gsdLgtDtSvLyeiqhboAdzjwn9bNslgLJJSRmZy5IXirVC
         Vvj8p0nsVnE/agCFYrl2V5IfgY8AguLD18Zetgt8CSAtxe18vU2F89iCdXgPm0xubr9G
         A+HKVC2zUsNqZ19hbiv0F96xRTb3ERVbRl3Y1eE1zmUtIHx8n67I0YPfLz+DrB5Oa1Jm
         N0eslt3Pshar0X/16Bu9+yqKKD+YWTVwPEpYxTQmu/O/4jSNpzJobCLVeV7cZ2DDuBYr
         IU0JYyDoEXrhSwRdq0Wp7QGeYehaoGdFlx0jf+f0hxJJ+kuvNeGjxTBaD0xs2/DdCoD+
         W5cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756250874; x=1756855674;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CD6yjiZ5YQJ32PGJlfbxDHcsoHAZgjFnPcceDJ4tFUI=;
        b=ocq+cQ5D6mfnRdtr/v9aQyoWsE9SUnd1xoWXDLeGROseMHB5E0guoyM24GjBe/+KJz
         NEIWytc9I+jtU2ZWA3UzYXfNiZYUYgNDYGLKKDGuzsWLKxjfFL+qbTwB5M99fYCWqYEH
         T9NSuLT5QW0k0/Wtdmo7YqSCb2YKSN7Q+ZfbFmgvKxYhzpByhFDJVorgsR+mXfOSwZNK
         OvnWG6mDIXied5r9VM0WzGvtrfxLhLVJPVDZ4zhMdW696MNwaWxTH9Qquq+J+PcTbIW/
         UsYGvaf12b8urdtdufzH5ZhYJMd3FsbZo+B9FwgNcsrjV2RnWdSpm/ODRYIVuIPunEk7
         uwVw==
X-Forwarded-Encrypted: i=1; AJvYcCWyWw86fzZzGN/PO3bg4a2Gcw18OixIviJgmyfx4cfjYUd+YEaUwG+DlCLLRDAAf29YNuGUm/loWyc9CzGsxKrsfwMSiw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxi0oxyoSdvqk0M0+psE5O+Mhw6SIeop0EuB3oJ7k7UAnPZ+mzM
	DPNPwo39P4NcE9W7PQZrh14JufLWHUYaqEEtAmR5vmK3KYaqZHfpCybZ
X-Gm-Gg: ASbGncv/dzjUY7hBD5P1foMI9sBLcWyi2cPVKEDsL2Y2adnfe/qWzpqmYXDGTOE/HDE
	jPWivjRSr9MYQUbn7tnJihOanKEtdcVFgBYQIv+I1JgvLA7lGWjfKfheuq7mYq3S9XafOdH1P5A
	cTXeOh7H5E2I1SyHDa7sliqnzskNai5l+fG2nWf7GJk31j0MKXt/rW68TjoGiS0GSxeWusgEyO2
	nWLj624dYjvgAB3kVsBiX2kfmWWP93hNg/dbikrZoGxfJMMJGN9M+Bd2eHh1khM6wmP5VUqLASC
	3XTfasDHTocjWodN1Rnb6GlEPlUq8Oo+nnrxAETPYxHaM3DNba1nJ22UfDljD0qhaCNOlTq2ERx
	Ez4J4wY9Blp2XICUOnUp6SchrIgseXxxHbGYBHwj1
X-Google-Smtp-Source: AGHT+IFz/KMAhS4Oimu584tu9uMR736OqQJnjQoNKaXTHKg/3q21BZIuq4aoQ7AMNj16dNs+Rbxpmg==
X-Received: by 2002:a17:903:4b03:b0:246:cfc4:9a27 with SMTP id d9443c01a7336-246cfc49fefmr102960175ad.13.1756250873707;
        Tue, 26 Aug 2025 16:27:53 -0700 (PDT)
Received: from [192.168.0.150] ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2466885efc8sm105526725ad.90.2025.08.26.16.27.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 16:27:53 -0700 (PDT)
Message-ID: <3b1a2ea1-4456-4f65-91f3-fcf070eeac98@gmail.com>
Date: Wed, 27 Aug 2025 06:27:47 +0700
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] selftests/arm64: Fix grammatical error in string
 literals
To: "Nikola Z. Ivanov" <zlatistiv@gmail.com>, Markus.Elfring@web.de,
 broonie@kernel.org
Cc: shuah@kernel.org, will@kernel.org, mark.rutland@arm.com,
 ebiggers@google.com, catalin.marinas@arm.com, martin.petersen@oracle.com,
 ardb@kernel.org, thiago.bauermann@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
References: <20250826214913.866695-1-zlatistiv@gmail.com>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <20250826214913.866695-1-zlatistiv@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/27/25 04:49, Nikola Z. Ivanov wrote:
> Fix grammatical error in <past tense verb> + <infinitive>
> construct related to memory allocation checks.
> In essence change "Failed to allocated" to "Failed to allocate".
> 

LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

-- 
An old man doll... just what I always wanted! - Clara
