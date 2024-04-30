Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655FE13D277
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Apr 2024 12:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714479646; cv=none; b=qbprWxpNIk5UzhaiOmPHGf+al+LZ9twBE0Rzg3pLp8KSskYq68tIG95h1qNAZLLQT8c1hpVOmBcPAWntL9Dli28l2UBb/9/LbvMoekHQe7yKKUpIGSPeipfSlyWpj2svX+3EckEgPVwdurvPBw97FDAFvVXTyITxBR0yVH7G6a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714479646; c=relaxed/simple;
	bh=gkvysAfCfPH18qay0BvNJ5BN+KvihLOCCXlEpo/dq9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gj3pwbpIvJ3NA3MBvhPALAu98nJJT+rd+I2WbK72DnRIh91xRw9PJYZYDyv8AO/3B3636UcFEnG4uAZomnV5wkTVwgnPA7vESs88AStzUNCnTY8704SZ6gEGUGq2fwGjOlghlIuumXCcDKkACO17lzqh0ffoNdlMZo/yEMvm7aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UIjnRN8X; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UIjnRN8X"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EADD341467
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Apr 2024 12:20:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.401
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j34xHk1nDFsa for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Apr 2024 12:20:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=will@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 303B14027F
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 303B14027F
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UIjnRN8X
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 303B14027F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Apr 2024 12:20:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CF4A1CE0FF0;
	Tue, 30 Apr 2024 12:20:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AB43C2BBFC;
	Tue, 30 Apr 2024 12:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714479638;
	bh=gkvysAfCfPH18qay0BvNJ5BN+KvihLOCCXlEpo/dq9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UIjnRN8X/xe5vUtE6o2nd9rsg8KZM0T7FDvMnFtAonzS0TY00JyKKnGNFshCo3C1w
	 IagPyl82EAAOALf3ij4DeeZZ0HQRz72aU4Aa9QVniiLIpCrb53M+BqwtDm6rnN/65C
	 bQdfGt9LoG++A3UPBurT5vANHdeFJoWmZqmFX8VfwVmnQKFUKV6cfyjXIXq7P9LpZX
	 cTqb6IVIQFaZN/XW1eyJZtRBsrOQoogB0xTcMA7n3cCpekptuNt/4PuSsfCsiT6rN4
	 3V6JLhQ8b+VAt+YYSgTnrZCdXrEV6aMGjVDjHGSwB4SctVOg5ghXFuK84QXsAtFtQD
	 oM1LwzViIFj8w==
Date: Tue, 30 Apr 2024 13:20:32 +0100
From: Will Deacon <will@kernel.org>
To: Dorine Tipo <dorine.a.tipo@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: Re: [PATCH] selftests:arm64: Test PR_SVE_VL_INHERIT after a double
 fork
Message-ID: <20240430122032.GA13690@willie-the-truck>
References: <20240429044012.5018-1-dorine.a.tipo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240429044012.5018-1-dorine.a.tipo@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Mon, Apr 29, 2024 at 04:40:12AM +0000, Dorine Tipo wrote:
> Add a new test, double_fork_test() to check the inheritance of the SVE
> vector length after a double fork.
> The `EXPECTED_TESTS` macro has been updated to account for this additional
> test.
> This patch addresses task 7 on the TODO list.
> 
> Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
> ---
>  tools/testing/selftests/arm64/fp/za-fork.c | 95 +++++++++++++++++++++-
>  1 file changed, 94 insertions(+), 1 deletion(-)

I haven't tried compiling this, but some of the code looks a little off:

> diff --git a/tools/testing/selftests/arm64/fp/za-fork.c b/tools/testing/selftests/arm64/fp/za-fork.c
> index 587b94648222..35229e570dcf 100644
> --- a/tools/testing/selftests/arm64/fp/za-fork.c
> +++ b/tools/testing/selftests/arm64/fp/za-fork.c
> @@ -11,7 +11,7 @@
> 
>  #include "kselftest.h"
> 
> -#define EXPECTED_TESTS 1
> +#define EXPECTED_TESTS 2
> 
>  int fork_test(void);
>  int verify_fork(void);
> @@ -69,6 +69,97 @@ int fork_test_c(void)
> 	}
>  }
> 
> +int double_fork_test(void)
> +{
> +	pid_t newpid, grandchild_pid, waiting;
> +	int ret, child_status, parent_result;
> +
> +	ret = prctl(PR_SVE_SET_VL, vl | PR_SVE_VL_INHERIT);
> +	if (ret < 0)
> +		ksft_exit_fail_msg("Failed to set SVE VL %d\n", vl);
> +
> +	newpid = fork();
> +	if (newpid == 0) {
> +		/* In child */
> +		if (!verify_fork()) {
> +			ksft_print_msg("ZA state invalid in child\n");
> +			exit(0);
> +		}
> +
> +		grandchild_pid = fork();
> +		if (grandchild_pid == 0) {
> +			/* in grandchild */
> +			if (!verfy_fork()) {
> +				ksft_print_msg("ZA state invalid in grandchild\n");
> +				exit(0);
> +			}
> +
> +			ret = prctl(PR_SVE_GET_VL);
> +			if (ret & PR_SVE_VL_INHERIT) {
> +				ksft_print_msg("prctl() reports _INHERIT\n");
> +				return;

Missing return value?

> +			}
> +			 ksft_print_msg("prctl() does not report _INHERIT\n");

Indentation.

> +
> +		} else if (grandchild_pid < 0) {
> +			ksft_print_msg("fork() failed in first child: %d\n", grandchild_pid);
> +			return 0;
> +		}
> +
> +		/*  Wait for the grandchild process to exit */
> +		waiting = waitpid(grandchild_pid, &child_status, 0);
> +		if (waiting < 0) {
> +			if (errno == EINTR)
> +				continue;

'continue' outside of a loop?

> +			ksft_print_msg("waitpid() failed: %d\n", errno);
> +			return 0;
> +		}
> +		if (waiting != grandchild_pid) {
> +			ksft_print_msg("waitpid() returned wrong PID\n");
> +			return 0;
> +		}
> +
> +		if (!WIFEXITED(child_status)) {
> +			ksft_print_msg("grandchild did not exit\n");
> +			return 0;
> +		}
> +
> +		exit(1);
> +		}

Stray '}' ?

Will
