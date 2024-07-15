Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3531879C4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 15 Jul 2024 02:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721011812; cv=none; b=er+K0RNSz01t1J77bbfqxbK232eQ3+rpV58cPTpMkM7rpPCIsL2XVdikSfSl/5v5CPDS8klXrn9km0EFNR1EWHO6Lt0Y9EFHtoVP8D4VPOTQWFp4LlUqTLTxlEHgISI13LQaZCsXOA8XABrkoV2Nw1EZ0bVAu63OOLyz0BeY4UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721011812; c=relaxed/simple;
	bh=YNBNPKTKiDGdFNzPXR/m2MDjlIsS9ABD1GqgCq/Y6v4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fncAb/a92u215DzsUQ4DjkXAkLuDDyEzPq9ilR9cPkDsQNK4ggD3r8c7bP7fn9H6AfNFEpT3uA9giClhz/6OK4s8WcBjoCm76eMybC8f/CzYZ/sDWNMXgB3ndt6DIsddNHvApFjKEt3q6IsvGgJYt4bHNu7qnimvZaN7QXNOan0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C103F60605
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 15 Jul 2024 02:50:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.2
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tc9PuZ7pAsSy for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Jul 2024 02:50:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ADEE2605D8
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=arm.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADEE2605D8
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADEE2605D8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 15 Jul 2024 02:50:09 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C590DFEC;
	Sun, 14 Jul 2024 19:50:33 -0700 (PDT)
Received: from [10.162.16.42] (unknown [10.162.16.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E9493F762;
	Sun, 14 Jul 2024 19:50:05 -0700 (PDT)
Message-ID: <321d4481-256c-41d9-9f64-f7e04e8d21be@arm.com>
Date: Mon, 15 Jul 2024 08:20:02 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kselftest: missing arg in ptrace.c
To: Remington Brasga <rbrasga@uci.edu>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
References: <20240712231730.2794-1-rbrasga@uci.edu>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20240712231730.2794-1-rbrasga@uci.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/13/24 04:47, Remington Brasga wrote:
> The string passed to ksft_test_result_skip is missing the `type_name`
> 
> Signed-off-by: Remington Brasga <rbrasga@uci.edu>
> ---
> clang-tidy reported clang-diagnostic-format-insufficient-args warning
> on this line, so I am fixing it.
> 
>  tools/testing/selftests/arm64/abi/ptrace.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/arm64/abi/ptrace.c b/tools/testing/selftests/arm64/abi/ptrace.c
> index abe4d58d731d..6144f83f8ab4 100644
> --- a/tools/testing/selftests/arm64/abi/ptrace.c
> +++ b/tools/testing/selftests/arm64/abi/ptrace.c
> @@ -156,7 +156,7 @@ static void test_hw_debug(pid_t child, int type, const char *type_name)
>  		/* Zero is not currently architecturally valid */
>  		ksft_test_result(arch, "%s_arch_set\n", type_name);
>  	} else {
> -		ksft_test_result_skip("%s_arch_set\n");
> +		ksft_test_result_skip("%s_arch_set\n", type_name);
>  	}
>  }
>  

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
