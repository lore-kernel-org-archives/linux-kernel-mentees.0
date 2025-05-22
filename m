Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39CE286899
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 22 May 2025 22:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747953823; cv=none; b=hQgdUxj5dDt3gb8eWLrChjEjuoXdMmyJ+Hf32+tQEoJo7J3G9mOPIChRQceOFf1YfwUcTq7J/Ze0fxWGeXuS66T7HVV6DmV8sTGqauiPPE1CQaFQsSXFPFJOEOgn9w/bIKccNPluhqKlDWe446CaPwAGV4rkRXS8wkAF5xITp9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747953823; c=relaxed/simple;
	bh=d8ElNV1KxKf1PTMc9BiSriOci7moGD7yluHGQynQVf4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CkBNBlHJRQmee+d35k+5aqLJKYb1gTlUL7HWr43q7DMvVFYC4G720TryDlU8lYeRO1h7KEpTgWgKpeeEFjKMrAOVAMvblpLx/lx1IxYkLSkXb4ylKISqJRzT4YZ+9GTFuEvHumnISqyKQq5Q5NY7kpWQyydkQzoURvaQbG2AIH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UCGUx+fh; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UCGUx+fh"
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3dc8265b9b5so17860495ab.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 22 May 2025 15:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747953819; x=1748558619; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SgAx9FRjAiSPVmD+10IVtHJnBsxw+8aMplanI2nZMN4=;
        b=UCGUx+fhySfm5ub/yvXG6GcHb3807xJnzgtQeXWsPMKTQaCBokAsxaB3ODNyZxpFO7
         v52e3HXknb/AZyqgLILR+GzAjglz07f9AF9F6MzkFPMLWakLdqi+6GPcWe0EzMT8mbzz
         FePOtO8ETQDgZE5RXJ+DWoiZkBSqu6o3Hwp9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747953819; x=1748558619;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SgAx9FRjAiSPVmD+10IVtHJnBsxw+8aMplanI2nZMN4=;
        b=rl7qiFRX+/nps76Y4iOxVI4lezWXeaAprKmsjpZwEhLGVQdlKxM2SPPkrvblZAmxpo
         kT3BU+2oKdj0uR5HssX7c0SmQbxQJdVinUN1batBICGNW5yCqcgqrTgexr2yHdF7PphK
         hZjTOTk1WuU4Qu2JvR5nf6yyXtbS6CjjUZ0kf5x7BZxxpQ0sRXeqdzTKIgOyS5+Kk0Ar
         KlKdrrIQeTu5ZmaPmMUBlD9i76eHEjjWUsZlV//PmNtiT9E3qU8lzudSIa/ecDgqJqIF
         GDb3mTb5JziPWwwYpyZ6H0OTNneyIUsw9dJEbUKNTUt6E4aOeG3oA46rNogD9r4QYLXS
         lc7w==
X-Forwarded-Encrypted: i=1; AJvYcCWjpqhwFMoMr6hKj+EmUPIWsXSWi99yjs3TRROzFDMLk6EF79vpmoeguuMOc68fkUHNpFGi2Nl17ZuUcJCdjQt5k3ybeg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9yKzUuIDfguKv0nZAmyoRsYSB6cq4O3vSI54spbmdmf/TDM/f
	tc7fCykpzONm9YsqdDs0FHTLrlhiHyRtW+PsvdOY6jrHoGf53JGhBkeoc2mntaYm0/Q=
X-Gm-Gg: ASbGncsDolpBDmSc4zCASQZuyjIN5f8zdbemrr4JnbiuvkDej5gjcmXBykNfnO6HzSe
	1gu9kUbMdSgPrK6HgO2Kz7kWkGA6eKrwc0XVwv2X5DHwf8zJjJTgWlQX0WNYQmlYFfy/ThF17dN
	R0CwbDYIY6cAmD5f0WxslSOjHDx/HRlf8pU/x9ymuyQT3pdUC62ler0bTYF8iJnFcM1C0nMhu26
	VFg7CcoxVPLI5vDOxGB06A+0AM8uiLNW4t70b8FUYhhaH8uCFLxApSgLMiZyWdATjJRnm+uIOWw
	/C1cvr+eDOc3n7G01EBNhVvHWcHRwDn6AwLHPlYPf+cNv8NHolehumSQmJ7biw==
X-Google-Smtp-Source: AGHT+IGgZrub3EqyIIKtPGhYUaoxCm8eFkqbXkOsp+d+6Y4GjpSAtke5qsqtY8wSwjMno4kibcNjng==
X-Received: by 2002:a05:6e02:3c02:b0:3d8:1dc7:ca7a with SMTP id e9e14a558f8ab-3db84296d9amr301540885ab.5.1747953818933;
        Thu, 22 May 2025 15:43:38 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3db843cf8fbsm37711915ab.1.2025.05.22.15.43.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 15:43:38 -0700 (PDT)
Message-ID: <a2980c99-6a6e-42ac-8978-8e0ab5319a9c@linuxfoundation.org>
Date: Thu, 22 May 2025 16:43:37 -0600
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] Fix typo in cpu-on-off-test selftest script:
To: Jihed Chaibi <jihed.chaibi.dev@gmail.com>, shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev
References: <20250517011928.673585-1-jihed.chaibi.dev@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250517011928.673585-1-jihed.chaibi.dev@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/16/25 19:19, Jihed Chaibi wrote:
> Fix typo in hotplaggable_offline_cpus function name:
> 
> "hotplaggable" is replaced by "hotpluggable"
> 
> Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
> ---

Change looks good to me. Change log should specify the
subsusystem. Check submitting patches document and refer
to a few change logs for this file using git log.

Send v2 with a proper change log.

>   tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh b/tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh
> index d5dc7e0dc..6232a46ca 100755
> --- a/tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh
> +++ b/tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh
> @@ -67,7 +67,7 @@ hotpluggable_cpus()
>   	done
>   }
>   
> -hotplaggable_offline_cpus()
> +hotpluggable_offline_cpus()
>   {
>   	hotpluggable_cpus 0
>   }
> @@ -151,7 +151,7 @@ offline_cpu_expect_fail()
>   
>   online_all_hot_pluggable_cpus()
>   {
> -	for cpu in `hotplaggable_offline_cpus`; do
> +	for cpu in `hotpluggable_offline_cpus`; do
>   		online_cpu_expect_success $cpu
>   	done
>   }

thanks,
-- Shuah

