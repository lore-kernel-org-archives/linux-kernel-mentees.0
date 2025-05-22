Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EADA2C0339
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 22 May 2025 23:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747955101; cv=none; b=iP8sMcXl74bsL6nvWgvBw2JleRgEucHSuF7/fqq+kSCRfSNJdmBaxDSNxp0rCpb3IAqUDu2PT2Uz1x28ebrMvfU4PcuevhqffV465FwD13uF58+sY9KrlIIOsKDmCRnPahlCjLxnREjk716beYcnJ0kCpZn58fJqJ9narcxTSJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747955101; c=relaxed/simple;
	bh=lScQnSCkvuRBtECCWLHIYCv8vmN77MwE39G4+WsfwoI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ClGVs1NnKoPggSeEvgPjMNFq/ESoGVeFW2pjXgUOMrUlSIOtYm0wGXKXGZEVC4yQIpfaA5CCeBpZFcAKdnteBoNXZ/VlnJMBoSPcgMkyCAFGJ5lnLjNJ34s8uWg+QuNt+BgcXldwb/qEfSQwWJISHigwtr8hmzv3L3YXjsX+5LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DrHdtWac; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DrHdtWac"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3d940c7ea71so34443675ab.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 22 May 2025 16:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747955098; x=1748559898; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NyQ/Gx89Cr5NXHdPsJF5IueYH71HqlFunPxqtl/qLjg=;
        b=DrHdtWacJfEfsFdn7+ixaA6EloCFaeDJjcwnwxBa5BfFD6vwJoRUUFqJ2oxg6XBgeW
         PwLjMHC+jm9fucHNaNBez7e53r3XkB4lZgmJmlQ0V000Oc+duMHVqy6hnigI5Wtrt4Fc
         rquCCQed26/6rpgsEAIemKLxitD9bYdNsIz4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747955098; x=1748559898;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NyQ/Gx89Cr5NXHdPsJF5IueYH71HqlFunPxqtl/qLjg=;
        b=u9BnhD+GLpI9dkxKgEv/RAgOHttQ1Z3wvPC4M1evNlrrXzbssnp9CYNdIrMYDLvGFD
         W05cGlHdw5fDapgNTJDdYHnUBWwc926ygoxPtrv9XjcMkVJ/wr5i7vE8MKD8uW2RgKYG
         qmfijVuxU5f1+z3NwDna6wUKyoXL2nf3u7IUlz+dmBdCKPL+S5tCs1JCjy3eY0/dSZKJ
         Ryo6IFh60kH827kkSCgTG8cHwNUD9asMgqeORomf56L3+ibsVslD3xL8hkgxpKehCVrS
         j52t+mifjFaJT+tjCEP+HUzstPo9HUd3B4skZekjeINRXSs/s5Q0Y2IX2SJRopSKgjX6
         2Hfg==
X-Gm-Message-State: AOJu0YxGdHAlwHcbjPcTowQUrcIfzYreQJJWFNCue551vnfOgLI55vNy
	hhvrgapEB2VAgcK120A+ga4rJex/uxMSPvJsx388TyuoYnpVM1ScMRFj/A54z7JFTlw=
X-Gm-Gg: ASbGncutQ5+9hsR/MOPa5YjWrqfxGUq+qNUnPUIswEOyid5sB/ojVpIr5PQHnilxZN1
	KniDBtHeHJ+uChO49ycW3SgxPp9+vuUT4e9adSHw2sbWr4BKoKQajOyisMm9Dyu+6MK5T3ULQfZ
	vaC7SGrhqPtKaYXQl6MJ5s6GQouhidwdY5LgY23nh8k9lY9+DXFlM1+GmGROf3yvQ5wF5AVOANU
	MR9GFBE9VEaZKCNqKkLxW0HMWtJVI4eyAY+VlSWnOC63gaz3I4w1FakA08llG2UGhhKiIpUuQ5+
	UNGmZTy+aWTpEOxNjbTznA17nlL9nKhVJGVomOsDOy9l4rObnpNi2Wy1Z0T+x2C4Ijp9wUfV
X-Google-Smtp-Source: AGHT+IHl0m/OZ2YTgjx9CaKgNardws6NVkvU4kTAEKOuts391ldEwKbiR8NDEIfzEyuXJto1DxeWHg==
X-Received: by 2002:a05:6e02:1748:b0:3dc:7df8:c82c with SMTP id e9e14a558f8ab-3dc7df8d014mr126479675ab.7.1747955098357;
        Thu, 22 May 2025 16:04:58 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3dc8b75d09dsm6447005ab.54.2025.05.22.16.04.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 16:04:58 -0700 (PDT)
Message-ID: <e1f8156c-e9f5-493e-b780-1f1e63f22cc7@linuxfoundation.org>
Date: Thu, 22 May 2025 17:04:57 -0600
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] cpupower: Implement powercap_set_enabled()
To: Suchit Karunakaran <suchitkarunakaran@gmail.com>, trenn@suse.com,
 shuah@kernel.org, jwyatt@redhat.com, jkacur@redhat.com,
 linux-pm@vger.kernel.org
Cc: linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250520094345.97200-1-suchitkarunakaran@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250520094345.97200-1-suchitkarunakaran@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/20/25 03:43, Suchit Karunakaran wrote:
> The powercap_set_enabled() function previously returned a dummy value
> and was marked with a TODO comment to implement it. This patch implements the
> function by writing the desired mode (0 or 1) to /sys/class/powercap/intel-rapl/enabled
> 
> Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>

How did you test this patch? Please include the information in
the change log and send v3.

thanks,
-- Shuah
