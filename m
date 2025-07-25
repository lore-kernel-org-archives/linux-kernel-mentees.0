Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5E9915E90
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 25 Jul 2025 02:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753409776; cv=none; b=B6vNXJnq7zK8lUlXhaOtU+4fd4ZbFDUjcJgRGzRBIzbibqQlRkOzXkfqhd6cCx09yREh9NP9PNWDSVRZUAtMCv4v444Ixc5viHziE/Kc/lNF6ZTpZ/4Vec0OUZAFJjVfOPdICY3thSVTqr0llLD0b4iJisiNnvaEqkg05C7Tg/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753409776; c=relaxed/simple;
	bh=0vmeIDkaiq1z2hAicDXYFW3N5Ep3oCj9Tm8KCVC9LFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ciIKEwZhmDzKGwtr+hRwJEgWFTiMACMaiBBg/5vBpezwgCdskEzvidwUqPerdnzuK/dWG8JB28a8LWls6bzL23d1gy2Y1FSagIX9evrUvTGRW/oVmolIGieFzUEsQ02Fkd90MCloDCE59b3owaTAMguTRO00FHEiFQeUcHTm2Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 548881A00;
	Thu, 24 Jul 2025 19:16:07 -0700 (PDT)
Received: from [10.164.146.15] (unknown [10.164.146.15])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A3693F5A1;
	Thu, 24 Jul 2025 19:16:11 -0700 (PDT)
Message-ID: <90864bf5-2edb-4901-9566-c89431c6d717@arm.com>
Date: Fri, 25 Jul 2025 07:46:08 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: allow NR_CPUS=1 for non-SMP and adjust default
 accordingly
To: Suchit Karunakaran <suchitkarunakaran@gmail.com>,
 catalin.marinas@arm.com, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250724165639.13926-1-suchitkarunakaran@gmail.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250724165639.13926-1-suchitkarunakaran@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/07/25 10:26 PM, Suchit Karunakaran wrote:
> The arm64 Kconfig for NR_CPUS previously required a minimum of 2 CPUs.
> This patch changes the minimum allowed CPUs to 1, enabling single-core
> non-SMP configurations.
> 
> Additionally, the default value for NR_CPUS is now conditional:
> - Defaults to 1 if SMP is not selected (non-SMP systems)
> - Defaults to 512 if SMP is enabled

Just curious - what actually prompted this change ?

> 
> Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
> ---
>  arch/arm64/Kconfig | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 393d71124f5d..9b2970f7c5ec 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -1528,9 +1528,10 @@ config SCHED_SMT
>  	  places. If unsure say N here.
>  
>  config NR_CPUS
> -	int "Maximum number of CPUs (2-4096)"
> -	range 2 4096
> -	default "512"
> +	int "Maximum number of CPUs (1-4096)"
> +	range 1 4096
> +	default "1" if !SMP
> +	default "512" if SMP
>  
>  config HOTPLUG_CPU
>  	bool "Support for hot-pluggable CPUs"


