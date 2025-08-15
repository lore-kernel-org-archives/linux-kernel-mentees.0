Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD64F239E9D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 15 Aug 2025 20:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755290653; cv=none; b=qMlcNMmp5nJkS5uqZ9gx91AwUcOHQ/S2v1wHGL7EPQYYjSNbHXhRHxR3zoOQkFBSYvginPyxfrBNhYNGDqSDiuytmcgayOW3xXrrTnoPyYNEO4gSjzAAgcDArouNH6lRlGclcc5vIeNCjDCTuFrxAYA1uFb9etaOojCFagdnS6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755290653; c=relaxed/simple;
	bh=81295dDm/Nq5IaGxrf4exqjWaiFe6tACBP0OaSIv1dM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JmqCnD5iYm7zqGvja7fNjAak0/ynDUqs7HYWhvMzWckvp/u24gNpZoqFZYmQjkpKm2TYp2CZ3RfPyxbFNR/dzMdEMCnLnz7tDhJcZ+D+4MO4s8xQFvjJooqpNmQ5WMZ03OnYYRVcB9F0UizjeBerKDCyObgq4K9olSjpf4yDKQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BkRVt4/m; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BkRVt4/m"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8173A41322
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 15 Aug 2025 20:44:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vv1FF69VASZX for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Aug 2025 20:44:11 +0000 (UTC)
X-Greylist: delayed 324 seconds by postgrey-1.37 at util1.osuosl.org; Fri, 15 Aug 2025 20:44:10 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E6D384142A
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6D384142A
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BkRVt4/m
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=<UNKNOWN> 
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E6D384142A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 15 Aug 2025 20:44:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F3A12A582EF;
	Fri, 15 Aug 2025 20:38:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53E0EC4CEEB;
	Fri, 15 Aug 2025 20:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755290324;
	bh=81295dDm/Nq5IaGxrf4exqjWaiFe6tACBP0OaSIv1dM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BkRVt4/m0WkCQdw3EYZtzbE3IjAnI8xQa8r3yyAwAlAaxsUomaOqNj+4g8h8+6D9j
	 sQTqJqnWANoJNDd6/6sT8WrCRthvjy/G2YN5Xab4rbpWHrEAcp6cQ6HCmWsgLgGz0I
	 +JzDuqSj7QnF/StUTh4Mooykm6ZVn0Cm7+XXs6ChGyXqkDx/vIkdVl4381J5FX4fNT
	 Dprzk9iAlkHlEKi7GiHLGyvWQAMs3plaM5X42MRHrZjAhvq7u12YMvU+SokAnJtCXN
	 NxwYYwfkrw8jXYVVuJk13xvqNCP4A3cfhesJOieI+NKsxvdEbd+jsJLHNrdwZtyBZA
	 mVaonpHYSyJQg==
Date: Fri, 15 Aug 2025 13:38:42 -0700
From: Namhyung Kim <namhyung@kernel.org>
To: Devaansh Kumar <devaanshk840@gmail.com>
Cc: linux-perf-users@vger.kernel.org, peterz@infradead.org,
	mingo@redhat.com, acme@kernel.org, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] perf test: Added .gitignore to shell base_report
Message-ID: <aJ-a0of7IdpssEuI@google.com>
References: <20250804174157.319224-1-devaanshk840@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250804174157.319224-1-devaanshk840@gmail.com>

Hello,

On Mon, Aug 04, 2025 at 11:11:55PM +0530, Devaansh Kumar wrote:
> Created .gitignore to include base_report files so
> git status doesn't gripe about untracked files.
> 
> Signed-off-by: Devaansh Kumar <devaanshk840@gmail.com>
> ---
>  tools/perf/tests/shell/base_report/.gitignore | 2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 tools/perf/tests/shell/base_report/.gitignore
> 
> diff --git a/tools/perf/tests/shell/base_report/.gitignore b/tools/perf/tests/shell/base_report/.gitignore
> new file mode 100644
> index 000000000000..8d3ce1278d83
> --- /dev/null
> +++ b/tools/perf/tests/shell/base_report/.gitignore

Probably better to put this in tools/perf/tests.

Thanks
Namhyung


> @@ -0,0 +1,2 @@
> +*.log
> +*.err
> -- 
> 2.49.0
> 
