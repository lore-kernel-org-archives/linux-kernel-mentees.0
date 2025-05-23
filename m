Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B3622155B
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 23 May 2025 18:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748025988; cv=none; b=TIB6ud4UEjVjFZio/Je4mB5rL40YPUhd96j8V8KrjMnBB9N7ERKcXtbQ4cmWwlrZeZkleJC3KH2Eje9ZHJy3f09mzzK62gY0M0BiSH1cJjLX/m9gMfBeQCINP3fbYTruUB93BzltujLbD+eDFq1NzyxI+EyzTXqJ9mmTFbJ/2KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748025988; c=relaxed/simple;
	bh=dZpgjJTi0MJt9iTrmqEP3ZYL1GmqOyNKh5PQfgkUMis=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=dga3mD3Gd8DFBN8HaLV5XDRsfz1Wee27PzzjuY8DfL/I3WE57P3056uLzeMu/YKCWCFIsAEOCvCgMK/TmQ9lx96080q/fzsVM6Xtr68SjwSzmbkGVAJ1qM7P+UbZbvvdagJG6UWvXHN1QIgGa6Xt8w2gaVtrFPWcR8B/fYPH07A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XHdjsjOL; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XHdjsjOL"
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-85e46f5c50fso12823939f.3
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 23 May 2025 11:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748025985; x=1748630785; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Sx1YiNkbzCH8yAAqTlThmCo4ScduhJ4fEOgmS9RLqNE=;
        b=XHdjsjOLbP7pdbL9wF4P4ERL7Z4lo6e+qk1b136oeyU2Bgl422EiBPuiZre5K9bgPl
         aybA05fhHpjgQt7gdncNPSL4GmpwxnelQ7i0mRRL2RCKeO7jLgtoKeEzhCLtoSLiaG1y
         s3HUFVl3WtDaNLtiO85m/evrRCS0cI1B1It8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748025985; x=1748630785;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sx1YiNkbzCH8yAAqTlThmCo4ScduhJ4fEOgmS9RLqNE=;
        b=KC78cpMcQtXeB5wIVpvUO8hpEzjzVI+ir2UnmTSraGaarj8Z/XlIofmZTTHMfxu3Id
         ZIb36C+f073mvLNH+b5D5WHhcMT8cXTukFLiHSyZxrNLs/ZmJ6S69QL08KhE/PhdZfMV
         tHCSd3vZpxLRF9rr7YAlTCl19LMITIeNcmRjHGWQx1OgpnA+rsrwoEYCooHf+tUZCbRk
         39Os4KqL3z8cKOild65790QpTE/UcBUq+w6xMYl1ZRo64w16aPWmFBqe12IkQ+wu+EMK
         1/s6ycLsAR1xVME5yDxlPNQCLh0MqKnTPK/dXw4EqnvjEfscFdaNdXqdjUG1THqcfdz5
         MzVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmEo/DfeyCqb2o8zZySyObnqI2W/XlxYzD0vjWJCdE2Q735o3TX2Mxb77e9AJqKa4AIsvKkOf1XQf0/hvXmswLdY8btw==@lists.linux.dev
X-Gm-Message-State: AOJu0YypoLkXcpmQu/PyoutY6NFq120/CmWgtFnCXLB4Hc3fXwOyLlZx
	KW6M/AxL2W6c631jrE58Ko8z2ExuK/WUMVrcas/fOkJbGrO259sSlbnCN7KlLM20Z05E3WWvKsE
	z+QDS
X-Gm-Gg: ASbGncu3YZAcixr8kh+4h3ketNnylZ4EnROJCeL9IfXE2/6jqvigeVjkI6iyuOE06Hm
	pBB8EDmoTpvxqptHWUc89A6cFGHHfiNvom52Xm9G5qAc1KS24i2tH+TmTDa88fey3F5gUbPmM/I
	EZtT53lLW+PKInrWIC7t7d4b8izf11YH9nNkkR4Dri0vYICBNRuRO7XV8zNI6+j0oXdObbjAS5c
	fxBGpSxDnbYpSmQE9A2N8LP2EAhsrzYdZojPtnq01Q5qu7nwVQBypmOvXVUuwfUnmcXTmDuRzxj
	MfYzw2Omhn9elIr03eXmeEvlwCKMX16y1E5kspwz980uVP2wGaGwYejRS1EbiQ==
X-Google-Smtp-Source: AGHT+IGDOo5oijcYfP+wjUEk9FHyzN59Q1kmzheuHARtrPQ6h1ULMxF03dEGfdM26oxYajyQMiejvQ==
X-Received: by 2002:a05:6602:4896:b0:864:657e:caec with SMTP id ca18e2360f4ac-86cbb88d3f7mr47292839f.10.1748025985178;
        Fri, 23 May 2025 11:46:25 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fbcc38a5besm3684310173.13.2025.05.23.11.46.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 11:46:24 -0700 (PDT)
Message-ID: <bd22525a-dd4c-47b0-8cd0-52c0e8c64ca6@linuxfoundation.org>
Date: Fri, 23 May 2025 12:46:24 -0600
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] kselftest: x86: Improve MOV SS test result message
To: Brigham Campbell <me@brighamcampbell.com>,
 linux-kernel-mentees@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>,
 "open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)"
 <linux-kernel@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250523073220.112238-2-me@brighamcampbell.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250523073220.112238-2-me@brighamcampbell.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/23/25 01:32, Brigham Campbell wrote:
> Apparently, this test completes successfully when it completes execution
> without either causing a kernel panic or being killed by the kernel.
> This new test result message is more descriptive and grammatically
> correct.
> 

The change log description usually is in imperative - e.g:

"Change test result message to be more descriptive and grammatically
correct.."


> There are no changes in v2. I'm resending this patch because I addressed
> it to the wrong email for Shuah.

Version change information goes under the --- after the Signed-off-by

> 
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
> ---
>   tools/testing/selftests/x86/mov_ss_trap.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/x86/mov_ss_trap.c b/tools/testing/selftests/x86/mov_ss_trap.c
> index f22cb6b382f9..d80033c0d7eb 100644
> --- a/tools/testing/selftests/x86/mov_ss_trap.c
> +++ b/tools/testing/selftests/x86/mov_ss_trap.c
> @@ -269,6 +269,6 @@ int main()
>   			);
>   	}
>   
> -	printf("[OK]\tI aten't dead\n");
> +	printf("[OK]\tkernel handled MOV SS without crashing test\n");
>   	return 0;
>   }

thanks,
-- Shuah
