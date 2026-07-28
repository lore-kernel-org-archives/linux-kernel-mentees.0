Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152F5456E01;
	Tue, 28 Jul 2026 14:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785250680; cv=none; b=Azl/DhWLSPPww9dMGD6QWI3du/C5rBZpH7oJH1lY4ctEW8AUI8Jr9q10WT+CGwGonaQ6jfvNC/5KZIJMlY69KjJNmHQ8fDxhKhQqgB9DfLACThSdM5SsrCp+dz11/YOVPnFsUABy4u+iiHg4w50+1unEbALeizwEpR7MybhtUSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785250680; c=relaxed/simple;
	bh=hJJa1DQ+D5eUiUBr2TQU7P6kLLj7B4gkE2EjWVWR4CM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rf4RPyN0EJ/IBeAzO46Bvk5T9KQrcpNh8eBCXuYj5n7u/rYR4dBTxiQBbI1qqSffz9vc20CTSykkK+Wzj2fPBtosIPcmwW6yN1G9zXZR+4SvEtqJ96fgojf9ud6TpQ0Nf4/t4pIfKrmd9Y/8iaEaIE0iTFSF3uzKJVIbZWfpM9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I5Zl3o/K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I5Zl3o/K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 933441F000E9;
	Tue, 28 Jul 2026 14:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785250678;
	bh=XavTPYhZ1V6grCtqsli6GAmQEIr10veG6My10S97eVs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=I5Zl3o/KJt/SGX5J5Z5phrw8JlXv+eibePTs2ZJb2OlniGjrxZ2aLybRIZH3u2DF8
	 RlxQLhdRoZCJjorNirlbXq8823hufnnYDGZz2u5d2AEGy4iEAZQQC+/4e2Ndx73WSV
	 LbExnPGA0r2PxPagADbQI2Jf5khFxHpxri0JA16SFX+TDjaSZ/I3ItepmsAhCMoyJa
	 eC40WOyQzHxoCW9cjDVyY8Sy/qxGM6TC+b9IxE9RWcVOdWkcydcIcu5aVRdRe/Uvdc
	 YLVSfMar3dBLmIiOfJG1Rx/0zjzmvrRTLnWtisxhkn1QmaSZZP31waSxoHFoEeJkJR
	 iVDmjXRq16VyA==
Date: Tue, 28 Jul 2026 15:57:41 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Jakov Novak <jakovnovak30@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "\\  Liam R . Howlett \\ " <liam@infradead.org>, 
	Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, linux-kernel-mentees@lists.linux.dev, 
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH] mm/khugepaged: replace mutex_lock/mutex_unlock usage
 with guard macro
Message-ID: <amjCQJUDNYseR6y-@lucifer>
References: <20260727181136.2542-1-jakovnovak30@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727181136.2542-1-jakovnovak30@gmail.com>

On Mon, Jul 27, 2026 at 08:11:36PM +0200, Jakov Novak wrote:
> Currently, khugepaged locks the khugepaged_mutex in two functions:
> start_stop_khugepaged and khugepaged_min_free_kbytes_update. Remove
> mutex_lock/mutex_unlock usage in these functions and replace it with the
> guard macro. This makes the code more readable (removing a goto statement)
> and makes it harder to introduce bugs in the future.
> No functional changes introduced.
>
> Signed-off-by: Jakov Novak <jakovnovak30@gmail.com>

Various nits below, with them addressed feel free to add:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

To the respin.

> ---
>  mm/khugepaged.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index 617bca76db49..c583867f2e7a 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -3113,7 +3113,7 @@ int start_stop_khugepaged(void)
>  {

Please add

#include <linux/cleanup.h>

To the #include's up top.

You might get away with not doing it locally because of recursive header
includes but be better to be explicit.

>  	int err = 0;
>
> -	mutex_lock(&khugepaged_mutex);
> +	guard(mutex)(&khugepaged_mutex);
>  	if (hugepage_enabled()) {
>  		if (!khugepaged_thread)
>  			khugepaged_thread = kthread_run(khugepaged, NULL,
> @@ -3122,7 +3122,7 @@ int start_stop_khugepaged(void)

		if (IS_ERR(khugepaged_thread)) {

Can we move the 'int err' declaration to here then? And not initialise it as it
gets assigned below.

>  			pr_err("khugepaged: kthread_run(khugepaged) failed\n");
>  			err = PTR_ERR(khugepaged_thread);
>  			khugepaged_thread = NULL;
> -			goto fail;
> +			return err;
>  		}
>
>  		if (!list_empty(&khugepaged_scan.mm_head))
> @@ -3132,17 +3132,14 @@ int start_stop_khugepaged(void)
>  		khugepaged_thread = NULL;
>  	}
>  	set_recommended_min_free_kbytes();
> -fail:
> -	mutex_unlock(&khugepaged_mutex);
>  	return err;

Let's make this return 0 now.

>  }
>
>  void khugepaged_min_free_kbytes_update(void)
>  {
> -	mutex_lock(&khugepaged_mutex);
> +	guard(mutex)(&khugepaged_mutex);
>  	if (hugepage_enabled() && khugepaged_thread)
>  		set_recommended_min_free_kbytes();
> -	mutex_unlock(&khugepaged_mutex);

Nice and simple!

>  }
>
>  bool current_is_khugepaged(void)
> --
> 2.55.0
>

Cheers, Lorenzo
