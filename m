Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AC72147E3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 19 Feb 2025 17:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739985191; cv=none; b=JqMXbEEdahZAqOur/nc0rRFogrFCAuXz//SOqWlCW/grIsyHDT8oD2V64nFZLZncL13EFdAt/ZGPxlPTsWIi+gkeRgjc9xV7QMW64mPYDJz9TyUZTgPfEe27hmY+HlScx/QudcmrG03WD0P+HY5m/vNMmPt0oMrG6VO6JrlHS8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739985191; c=relaxed/simple;
	bh=L/QYV+Qom79g9HuHBK43mFl7f5J5yQqARQ5i2sJ4WKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=foJv57H/MvVQ7MbXXdesb1fT4O/R0mDcjyYQd2m4W+qK/zLGR2ZUQQAtuV7hVnBzIte38MNWerR4tj/zg5B1OwdXRD6vC5zeFJo3ReibkGV9h0kzoUA19IVrqUAJQ54ybGX6WQhFGELag0t9thf+IdEsUasThpd+Gwvb/Mz/1Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EVJIOehH; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EVJIOehH"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB7AB80CC1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 19 Feb 2025 17:13:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.801
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id soE4CXl6eKMh for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Feb 2025 17:13:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=kees@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 163D680CCC
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 163D680CCC
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EVJIOehH
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 163D680CCC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 19 Feb 2025 17:13:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A6E195C5AF1;
	Wed, 19 Feb 2025 17:12:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8093CC4CED1;
	Wed, 19 Feb 2025 17:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739985187;
	bh=L/QYV+Qom79g9HuHBK43mFl7f5J5yQqARQ5i2sJ4WKY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EVJIOehHSqr8PKdEefVAoXdXxWoapJRSOxmVK3UoxthHWmfMSOMEMGCr7xaDzEF6o
	 Is5xIokYrUnXoeRayJe7O2SZ42wr51wSr6SxMOhXttVT0KxLJuIohuHF6dlwMMx5Qj
	 xCQdOVVGTq5rWzu0QYppjX1UM3PJxjjetCo6ozhsNGHe1QPbLp23NFx+9HCRMdTJH5
	 eWYIa9cAcoSxHY1nmbzrXdGRgvTwDZhD5EMXwqlXf2jIZrko1nqOY9ZH0RdrHOSPnS
	 eeFOFR2Ycd6Rz+cyS0qSWyak0G9/68xiw1Em0Fd7tWDFbbUnNjJ7gCq4PEZ+zOEOPQ
	 y6DiYo85VJqFg==
Date: Wed, 19 Feb 2025 09:13:04 -0800
From: Kees Cook <kees@kernel.org>
To: Sumya Hoque <sumyahoque2012@gmail.com>
Cc: skhan@linuxfoundation.org, linux-kernel@vger.kernel.org,
	shuah@kernel.org, linux-fsdevel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] selftests:sysctl:Fix minor grammers in sysctl test
Message-ID: <202502190912.CA03B56796@keescook>
References: <20250219030451.39782-1-sumyahoque2012@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219030451.39782-1-sumyahoque2012@gmail.com>

On Wed, Feb 19, 2025 at 03:04:51AM +0000, Sumya Hoque wrote:
> Hello everyone,
> Some minor grammer issues that I have fixed:
> 1. echo "If an error every occurs -->  echo "If an error occurs, every execution
> 2. Example uses --> Example Usage 
> 
> Signed-off-by: Sumya Hoque <sumyahoque2012@gmail.com>
> ---
>  tools/testing/selftests/sysctl/sysctl.sh | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/sysctl/sysctl.sh b/tools/testing/selftests/sysctl/sysctl.sh
> index 84472b436c07..a4d76147ed8a 100755
> --- a/tools/testing/selftests/sysctl/sysctl.sh
> +++ b/tools/testing/selftests/sysctl/sysctl.sh
> @@ -891,11 +891,11 @@ usage()
>  	echo "    -l      List all test ID list"
>  	echo " -h|--help  Help"
>  	echo
> -	echo "If an error every occurs execution will immediately terminate."
> +	echo "If an error occurs, every execution will immediately terminate."

I think the typo here is just "every" -> "ever"

>  	echo "If you are adding a new test try using -w <test-ID> first to"
>  	echo "make sure the test passes a series of tests."
>  	echo
> -	echo Example uses:
> +	echo Example usage:
>  	echo
>  	echo "$TEST_NAME.sh            -- executes all tests"
>  	echo "$TEST_NAME.sh -t 0002    -- Executes test ID 0002 number of times is recomended"
> -- 
> 2.34.1
> 

-- 
Kees Cook
