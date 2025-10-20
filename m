Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35DB26B2DC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 15:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760974193; cv=none; b=XsDkInqOOWuhPOZB+48F8e4bfBeA2og9ZWXZftj3a3WLuYw38hoQzqEbXMZ+M3KkOHyoISd8aG9kynUuhsFYfu/hM1nGnhCJz6XXo999Hl5mDp8vrNhXZn9J8vFj29nUJxAcqcosiOuAczAaX1YhXOTO8qC2Bg0CwBh/shYW8AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760974193; c=relaxed/simple;
	bh=O1orugBr2pvTT4K3ZaPXwEVdYUClnxbj+YqzNevsSfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GSVVttPSyw/ZoB4gcwr0Ec9ZoGwTgzKAYPN+TWwrb34S5wQYUy5dhiUhuoRA52+YUB+fShYiMBid9yytH3vD5NX8rYoWViYnWEgtMn6Nkihcq2DR/hYo70jnvrb77rrZ0rTIke1hfP8raSEmXVUW7SM7xA0PjRrTLZlGhSBnHDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uXiJrIJ6; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uXiJrIJ6"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C92F84249
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 15:29:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PZZF8N3yj8Ny for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Oct 2025 15:29:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=khalid@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C143482215
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C143482215
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uXiJrIJ6
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	by smtp1.osuosl.org (Postfix) with ESMTPS id C143482215
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 15:29:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 060E348CEE;
	Mon, 20 Oct 2025 15:29:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1D2BC4CEF9;
	Mon, 20 Oct 2025 15:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760974189;
	bh=O1orugBr2pvTT4K3ZaPXwEVdYUClnxbj+YqzNevsSfs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uXiJrIJ687SJ+ZX5Q9oD4LYK5sQUkdBCyvr+bs6NtwlmsufLYur10NjjA0u5WTGnm
	 JRmI2YhfP4weHJj8V5eSziLaUAUrt7B5YAVrqZyN+PdEDso6q/fNmLpcA3aux5cj8Y
	 Yk9PpxF/uV91kzuWgAU2Tir+58s4qs+jJtHrYpYULtU5lGBaWp2fNWq4wkUH0fkZ1J
	 c8i/yjnj8QJ5tGDRgXbs4gd1hcUg3sL2NJLjzdbgbW1UJ3Dj616krygQMks7XZFvaD
	 +pSHufqszj8KlVb4M+mdQ5Q0yYyA4R8RSGEhsuAZt3bAtITJC8UhwAtrw4LJtxwzRD
	 v+BiJRk4g+3Ig==
Message-ID: <33f2a0f7-3e15-4256-a631-70e68fdec15d@kernel.org>
Date: Mon, 20 Oct 2025 09:29:49 -0600
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/vmalloc: Use kmalloc_array() instead of kmalloc()
To: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>,
 akpm@linux-foundation.org, urezki@gmail.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20251018201207.27441-1-mehdi.benhadjkhelifa@gmail.com>
Content-Language: en-US
From: Khalid Aziz <khalid@kernel.org>
In-Reply-To: <20251018201207.27441-1-mehdi.benhadjkhelifa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/18/25 2:11 PM, Mehdi Ben Hadj Khelifa wrote:
> The number of NUMA nodes (nr_node_ids) is bounded, so overflow is not a
> practical concern here. However, using kmalloc_array() better reflects the
> intent to allocate an array of unsigned ints, and improves consistency with
> other NUMA-related allocations.
> 
> No functional change intended.
> 
> Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
> ---
>   mm/vmalloc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 798b2ed21e46..697bc171b013 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -5055,7 +5055,7 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
>   	unsigned int *counters;
>   
>   	if (IS_ENABLED(CONFIG_NUMA))
> -		counters = kmalloc(nr_node_ids * sizeof(unsigned int), GFP_KERNEL);
> +		counters = kmalloc_array(nr_node_ids, sizeof(unsigned int), GFP_KERNEL);
>   
>   	for_each_vmap_node(vn) {
>   		spin_lock(&vn->busy.lock);

This looks like reasonable change for clarity.

Reviewed-by: Khalid Aziz <khalid@kernel.org>

--
Khalid
