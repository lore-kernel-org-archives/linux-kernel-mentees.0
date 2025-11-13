Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF93F346A1F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 13 Nov 2025 11:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763033980; cv=none; b=FEwObx4PR6a/w+f3t1CREL5PBOoqy+O8kd+z/hBMGg81zx30zccZnG88l7LDn8ovN+15YUEJlRxfHB+sd/n9s6h8gdfILj1yHgdVY3gaEMlHfSwwsoMaF3cbSBYJcovUW+izh+5a1SsvMChJKCr6oMfMKUGYps7TUUAlotWHs14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763033980; c=relaxed/simple;
	bh=ENVhoOS7G7gCzCBUGCoR+ITgrpqX7seulif8UfTBp0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A37EpUJHdlEvr5V+pNC5c8eMBEJ1l8p5/REY/M/HllNJnN+Dlv3hnsH3N452TFUcskWyJcsfuieBIhVz8X0u9qqdXKXfXbDE3/sxam9djNM5/4npLqhH15aJzgQA3TPCh8hE/JX8krwjtPeuMREUipJvumcFR25FozVIO/pQ/1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VIr0rjst; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VIr0rjst"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 411C680840
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 13 Nov 2025 11:39:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gXe5sjm2cUvC for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Nov 2025 11:39:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=rppt@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 54DA480829
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54DA480829
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VIr0rjst
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 54DA480829
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 13 Nov 2025 11:39:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2862A4322B;
	Thu, 13 Nov 2025 11:39:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A995C4CEF5;
	Thu, 13 Nov 2025 11:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763033976;
	bh=ENVhoOS7G7gCzCBUGCoR+ITgrpqX7seulif8UfTBp0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VIr0rjstKJ3saWpOlCPEj9yrlsSRfWVdSQkR1q6I3ZgbEqEbjPhjAwZARfKCLBEHD
	 NGXFco0t56DpoMlRyxC4Dv7YU5Dj77k5L5LEk+YeLgg6BmGF3YD/hglGfiBsfuYSL3
	 WalSNO2wr0gm3B+obfSK4LBPcORjuDCqoqCbXgpv9hONWBGRCQH7Icr1ATqy0Pmb9r
	 ZMVa4ISTLJXD4HD0aPUFJ3/8+8HfJoZY1kBU/TJZKi4MwFDa1g7A0PisLusFC0HKNg
	 wdLEn1kFzdFK2Tk27NHIoXVG5ZbkwxsahhpJX0ykb16FldNGhAL4Y2Sxc+/7dRi/YV
	 dht9+6EHugDgQ==
Date: Thu, 13 Nov 2025 13:39:26 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
Cc: akpm@linux-foundation.org, peterx@redhat.com, david@redhat.com,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
	surenb@google.com, mhocko@suse.com, shuah@kernel.org,
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com, khalid@kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] selftests/mm/uffd: remove static address usage in
 shmem_allocate_area()
Message-ID: <aRXDbk9ajOhH7ReX@kernel.org>
References: <20251111205739.420009-1-mehdi.benhadjkhelifa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111205739.420009-1-mehdi.benhadjkhelifa@gmail.com>

On Tue, Nov 11, 2025 at 09:54:27PM +0100, Mehdi Ben Hadj Khelifa wrote:
> The current shmem_allocate_area() implementation uses a hardcoded virtual
> base address(BASE_PMD_ADDR) as a hint for mmap() when creating shmem-backed
> test areas. This approach is fragile and may fail on systems with ASLR or
> different virtual memory layouts, where the chosen address is unavailable.
> 
> Replace the static base address with a dynamically reserved address range
> obtained via mmap(NULL, ..., PROT_NONE). The memfd-backed areas and their
> alias are then mapped into that reserved region using MAP_FIXED, preserving
> the original layout and aliasing semantics while avoiding collisions with
> unrelated mappings.
> 
> This change improves robustness and portability of the test suite without
> altering its behavior or coverage.
> 
> Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
> ---
> Testing:
> A diff between running the mm selftests on 6.18-rc5 from before and after
> the change show no regression on x86_64 architecture with 32GB DDR5 RAM.
>  tools/testing/selftests/mm/uffd-common.c | 25 +++++++++++++++---------
>  1 file changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/uffd-common.c b/tools/testing/selftests/mm/uffd-common.c
> index 994fe8c03923..492b21c960bb 100644
> --- a/tools/testing/selftests/mm/uffd-common.c
> +++ b/tools/testing/selftests/mm/uffd-common.c
> @@ -6,11 +6,11 @@
>   */
>  
>  #include "uffd-common.h"
> +#include "asm-generic/mman-common.h"

Please drop this.
There's already include <sys/mman.h> via uffd-common.h/vm_util.h.

>  
>  uffd_test_ops_t *uffd_test_ops;
>  uffd_test_case_ops_t *uffd_test_case_ops;
>  
> -#define BASE_PMD_ADDR ((void *)(1UL << 30))
>  
>  /* pthread_mutex_t starts at page offset 0 */
>  pthread_mutex_t *area_mutex(char *area, unsigned long nr, uffd_global_test_opts_t *gopts)
> @@ -142,30 +142,37 @@ static int shmem_allocate_area(uffd_global_test_opts_t *gopts, void **alloc_area
>  	unsigned long offset = is_src ? 0 : bytes;
>  	char *p = NULL, *p_alias = NULL;
>  	int mem_fd = uffd_mem_fd_create(bytes * 2, false);
> +	size_t region_size = bytes * 2 + hpage_size;
>  
> -	/* TODO: clean this up.  Use a static addr is ugly */
> -	p = BASE_PMD_ADDR;
> -	if (!is_src)
> -		/* src map + alias + interleaved hpages */
> -		p += 2 * (bytes + hpage_size);
> +	void *reserve = mmap(NULL, region_size, PROT_NONE, MAP_PRIVATE | MAP_ANONYMOUS,
> +			-1, 0);
> +	if (reserve == MAP_FAILED) {
> +		close(mem_fd);
> +		return -errno;
> +	}
> +
> +	p = (char *)reserve;

No need for casting here.

>  	p_alias = p;
>  	p_alias += bytes;
>  	p_alias += hpage_size;  /* Prevent src/dst VMA merge */
>  
> -	*alloc_area = mmap(p, bytes, PROT_READ | PROT_WRITE, MAP_SHARED,
> +	*alloc_area = mmap(p, bytes, PROT_READ | PROT_WRITE, MAP_FIXED | MAP_SHARED,
>  			   mem_fd, offset);
>  	if (*alloc_area == MAP_FAILED) {
> +		munmap(reserve, region_size);

I think it'll be more readable to put munmap() after setting *alloc_area to
NULL.

>  		*alloc_area = NULL;
> +		close(mem_fd);
>  		return -errno;
>  	}
>  	if (*alloc_area != p)
>  		err("mmap of memfd failed at %p", p);
>  
> -	area_alias = mmap(p_alias, bytes, PROT_READ | PROT_WRITE, MAP_SHARED,
> +	area_alias = mmap(p_alias, bytes, PROT_READ | PROT_WRITE, MAP_FIXED | MAP_SHARED,
>  			  mem_fd, offset);
>  	if (area_alias == MAP_FAILED) {
> -		munmap(*alloc_area, bytes);
> +		munmap(reserve, region_size);

Here as well.

>  		*alloc_area = NULL;
> +		close(mem_fd);
>  		return -errno;
>  	}
>  	if (area_alias != p_alias)
> -- 
> 2.51.2
> 

-- 
Sincerely yours,
Mike.
