Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE622EBB9B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Oct 2025 09:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761039432; cv=none; b=StxVtQNCRekQz2K/4gvAAc5OqYRV+yqeXrjB71hxBiHCf97vwkHU7wKFF9Y50fZjStFqELJ29S5Unb5n234l9hrlhW3+jc/edYKaDvJH3osTKPA1yl3XwJkVwNmJhzyzkshh6Da5OGYod3ut4b9SOlqLLTQMwn54hWKLFXMrtZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761039432; c=relaxed/simple;
	bh=vROLQ/huaW8/CmioOws1Snjr2nLyqHBL1ATXlL1hhH8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QLwVp6b7LcWGwDPvQ0q1VqVOImjSKnZYXYJDc2QIwUw7OkquXDu55/TSsYyJyTzbL9eZ52uw5+gZlPYkNvKvlVww/uEwjWVezColttIy5yaYPbX5O/CaiNx2ciQ3M2U8ys1g8LCOugWIIk8SrNQhqZmwTR6KSzOaDBgibPuBFKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GRGFgEvG; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GRGFgEvG"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E24D54060D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Oct 2025 09:37:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xVLkU43kRRl8 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Oct 2025 09:37:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=hawk@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CF2FF4044C
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF2FF4044C
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GRGFgEvG
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by smtp2.osuosl.org (Postfix) with ESMTPS id CF2FF4044C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Oct 2025 09:37:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2C867603BD;
	Tue, 21 Oct 2025 09:37:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2211C4CEF1;
	Tue, 21 Oct 2025 09:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761039427;
	bh=vROLQ/huaW8/CmioOws1Snjr2nLyqHBL1ATXlL1hhH8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GRGFgEvG7nDjyoNfr+98OUc31cYs1vcfeJ1lZ19J39hKo6KNETy4lLfe8i1yrFd2z
	 AEWh7m8gQ3Q0A0brHYhNsr966m+eGOBlduSiyN9Qf+I4zLSYE+dSz9SSC8fuMMS2Bo
	 oAq7+wMNBvMpwh9p9bqypFSReeSKxBwk+l95Ea2CasiTlpqOPT1GYOQiHxaTxXoVy6
	 3PajPbL4ITGPJ1ixgTR6dz8UDX7wKWfJ0qAxIqgbFW6RHjFGPEt9Lx3a0la+alcc5o
	 UwwmcsDehn+kIvOFLk/h/tiGAZnY6BN0qVow27leRxghJGOBkuOSzGBC1UUJcOfZ/n
	 hulvUWugCRQ4Q==
Message-ID: <e0901356-ef48-4652-9ad4-ff85ae07d83a@kernel.org>
Date: Tue, 21 Oct 2025 11:37:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v2] bpf/cpumap.c: Remove unnecessary TODO comment
To: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>, ast@kernel.org,
 daniel@iogearbox.net, davem@davemloft.net, kuba@kernel.org,
 john.fastabend@gmail.com, sdf@fomichev.me, andrii@kernel.org,
 martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org,
 yonghong.song@linux.dev, kpsingh@kernel.org, haoluo@google.com,
 jolsa@kernel.org
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com, khalid@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20251020170254.14622-1-mehdi.benhadjkhelifa@gmail.com>
Content-Language: en-US
From: Jesper Dangaard Brouer <hawk@kernel.org>
In-Reply-To: <20251020170254.14622-1-mehdi.benhadjkhelifa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 20/10/2025 19.02, Mehdi Ben Hadj Khelifa wrote:
> After discussion with bpf maintainers[1], queue_index could
> be propagated to the remote XDP program by the xdp_md struct[2]
> which makes this todo a misguide for future effort.
> 
> [1]:https://lore.kernel.org/all/87y0q23j2w.fsf@cloudflare.com/
> [2]:https://docs.ebpf.io/linux/helper-function/bpf_xdp_adjust_meta/
> 
> Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
> ---
> Changelog:
> 
> Changes from v1:
> 
> -Added a comment to clarify that RX queue_index is lost after the frame
> redirection.
> 
> Link:https://lore.kernel.org/bpf/d9819687-5b0d-4bfa-9aec-aef71b847383@gmail.com/T/#mcb6a0315f174d02db3c9bc4fa556cc939c87a706
>   kernel/bpf/cpumap.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/bpf/cpumap.c b/kernel/bpf/cpumap.c
> index 703e5df1f4ef..6856a4a67840 100644
> --- a/kernel/bpf/cpumap.c
> +++ b/kernel/bpf/cpumap.c
> @@ -195,7 +195,10 @@ static int cpu_map_bpf_prog_run_xdp(struct bpf_cpu_map_entry *rcpu,
>   
>   		rxq.dev = xdpf->dev_rx;
>   		rxq.mem.type = xdpf->mem_type;
> -		/* TODO: report queue_index to xdp_rxq_info */
> +		/* The NIC RX queue_index is lost after the frame redirection
> +		 * but in case of need, it can be passed as a custom XDP
> +		 * metadata via xdp_md struct to the remote XDP program

Argh, saying XDP metadata is accessed via the xdp_md struct is just wrong.

Nacked-by: Jesper Dangaard Brouer <hawk@kernel.org>

> +		 */
>   
>   		xdp_convert_frame_to_buff(xdpf, &xdp);
>   

