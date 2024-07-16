Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965431BF47
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 16 Jul 2024 04:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721103572; cv=none; b=Qav2qrEF/HK4F1yNV7666NZNpzmwRyCh8113l9YJbmu9t0T/gsZb2AfsP2wTY4ofdYLEY3Jus0xGPqBF5az8uU0xcQXx0mQUedWSvOyrbCQDsQyp5yAVwpKa0hBL46T6TDp/0QS07ux+TQoiKn/dKsfik2QVNoHU94KSwIGNogg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721103572; c=relaxed/simple;
	bh=4I3XhDSgPabyxHA758Oiv0TD2YqWE0BjcaQb+oxczCE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FL/QcY4zwE8kZKepnb52cuEoxiVHor5s7EkMQJI9XVA5WPAhyXdWjSY6a+y3oIQ2F5fB3+yD2GSzPOlse0quYj1zUJjDS4YFfXEfe0v4rGfJYYwZ9XSdiub/WW3TnkLoPVGGIcXm63rAWhTuVTpGKSKF13pCnoKQC7LNu+Bmxm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 171BD40432
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 16 Jul 2024 04:19:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.2
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sbKFlQ6fK9YV for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 16 Jul 2024 04:19:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dev.jain@arm.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B307840278
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=arm.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B307840278
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp2.osuosl.org (Postfix) with ESMTP id B307840278
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 16 Jul 2024 04:19:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0309C1063;
	Mon, 15 Jul 2024 21:19:53 -0700 (PDT)
Received: from [10.162.43.23] (e116581.arm.com [10.162.43.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 057113F762;
	Mon, 15 Jul 2024 21:19:23 -0700 (PDT)
Message-ID: <f7383c8c-83f3-45da-a8c4-2cfcfa497936@arm.com>
Date: Tue, 16 Jul 2024 09:49:12 +0530
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
 linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, Anshuman.Khandual@arm.com,
 Mark Brown <broonie@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>
References: <20240712231730.2794-1-rbrasga@uci.edu>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20240712231730.2794-1-rbrasga@uci.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/13/24 04:47, Remington Brasga wrote:
> The string passed to ksft_test_result_skip is missing the `type_name`
>
> Signed-off-by: Remington Brasga <rbrasga@uci.edu>
> ---
> clang-tidy reported clang-diagnostic-format-insufficient-args warning
> on this line, so I am fixing it.
>
>   tools/testing/selftests/arm64/abi/ptrace.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/arm64/abi/ptrace.c b/tools/testing/selftests/arm64/abi/ptrace.c
> index abe4d58d731d..6144f83f8ab4 100644
> --- a/tools/testing/selftests/arm64/abi/ptrace.c
> +++ b/tools/testing/selftests/arm64/abi/ptrace.c
> @@ -156,7 +156,7 @@ static void test_hw_debug(pid_t child, int type, const char *type_name)
>   		/* Zero is not currently architecturally valid */
>   		ksft_test_result(arch, "%s_arch_set\n", type_name);
>   	} else {
> -		ksft_test_result_skip("%s_arch_set\n");
> +		ksft_test_result_skip("%s_arch_set\n", type_name);
>   	}
>   }

Okay, I almost forgot that I had a patch fixing this as part of another series:
https://lore.kernel.org/all/20240625122408.1439097-6-dev.jain@arm.com/
If that is OK, Will, can you please pull that? Or should I send that as a
separate patch?

