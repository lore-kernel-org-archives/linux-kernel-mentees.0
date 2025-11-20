Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6789D2F5498
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 20 Nov 2025 19:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763667373; cv=none; b=TqfomfVCkGoGAxEJnOBO9BQh/LU9VXgqwTUtd5X8V7KdmidZrinkDBHDlO6qamPcbIux+/+2e6N6Qh3FVwXFGHbMucLdLjSyLDeELPSNbeZoxnzCcV/XqEg/uERIm8HS7JQRNQDbWQPqAeF77Xbs1dJhpLrJZABfkJriMRunlGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763667373; c=relaxed/simple;
	bh=oM603E+wuKGu9pYxgD7rLddYDdi0n6wHX5jyyHoVNL8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EV/Z9gnnsBTuujXfd4IZGEjPSaZ7NO76JZ4Y1G5Lm7jXydvNRcENbg1GNa/G2cHGaswbSsCsxJrXvaEJlxTna0qZlNey6UXE2bIRT5XXWeVf9Jiqih0aO2B1BLht8Cq7Hx7hK8RUXy2tJtuG0s48CPEOitag53M+JHCGc+IEOBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=UKJ8GQiS; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="UKJ8GQiS"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D47724052D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 20 Nov 2025 19:36:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.102
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C7Lj9E3hUUXS for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 Nov 2025 19:36:08 +0000 (UTC)
X-Greylist: delayed 393 seconds by postgrey-1.37 at util1.osuosl.org; Thu, 20 Nov 2025 19:36:03 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 02219404F6
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=linux.dev
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02219404F6
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UKJ8GQiS
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:41d0:1004:224b::b6; helo=out-182.mta0.migadu.com; envelope-from=martin.lau@linux.dev; receiver=<UNKNOWN> 
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [IPv6:2001:41d0:1004:224b::b6])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 02219404F6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 20 Nov 2025 19:36:03 +0000 (UTC)
Message-ID: <f87d1365-a3b6-4307-9d72-91d5f5b2c585@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763666964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P5YrGuf+QlTIpQCCFUPLoKxIvO0gBV/wlRIQxdJZXtg=;
	b=UKJ8GQiSYhkOg4OfvvZuhjYK18S7U0AwN36WczcL9QNKIZDExOy6zQPwdaS8HoI2xWl5q3
	MV9Fgv6JBYSWlhsSdBy5wldDMdvPbL3w1h/BXjh7cEpU9UaSvJTxxDvJqwzauxhbxsZ6zJ
	4sFD9I5+wDibX1EmyLGSLSVCbzwWppc=
Date: Thu, 20 Nov 2025 11:29:17 -0800
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH] bpf: Document cfi_stubs and owner fields in struct
 bpf_struct_ops
To: Nirbhay Sharma <nirbhay.lkd@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251119062430.997648-2-nirbhay.lkd@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Martin KaFai Lau <martin.lau@linux.dev>
In-Reply-To: <20251119062430.997648-2-nirbhay.lkd@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 11/18/25 10:24 PM, Nirbhay Sharma wrote:
> Add missing kernel-doc documentation for the cfi_stubs and owner
> fields in struct bpf_struct_ops to fix the following warnings:
> 
>    Warning: include/linux/bpf.h:1931 struct member 'cfi_stubs' not
>    described in 'bpf_struct_ops'
>    Warning: include/linux/bpf.h:1931 struct member 'owner' not
>    described in 'bpf_struct_ops'
> 
> The cfi_stubs field was added in commit 2cd3e3772e41 ("x86/cfi,bpf:
> Fix bpf_struct_ops CFI") to provide CFI stub functions for trampolines,
> and the owner field is used for module reference counting.
> 
> Signed-off-by: Nirbhay Sharma <nirbhay.lkd@gmail.com>
> ---
>   include/linux/bpf.h | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/bpf.h b/include/linux/bpf.h
> index d808253f2e94..d39b4b2c8f35 100644
> --- a/include/linux/bpf.h
> +++ b/include/linux/bpf.h
> @@ -1905,10 +1905,16 @@ struct btf_member;
>    *	      reason, if this callback is not defined, the check is skipped as
>    *	      the struct_ops map will have final verification performed in
>    *	      @reg.
> - * @type: BTF type.
> - * @value_type: Value type.
> + * @cfi_stubs: Pointer to a structure of stub functions for CFI. These stubs
> + *	       provide the correct Control Flow Integrity hashes for the
> + *	       trampolines generated by BPF struct_ops.
> + * @owner: The module that owns this struct_ops. Used for module reference
> + *	   counting to ensure the module providing the struct_ops cannot be
> + *	   unloaded while in use.
>    * @name: The name of the struct bpf_struct_ops object.
>    * @func_models: Func models
> + * @type: BTF type.
> + * @value_type: Value type.
>    * @type_id: BTF type id.
>    * @value_id: BTF value id.

Please take this chance to remove all doc after func_models. Meaning 
remove type, value_type, type_id, and value_id. They were removed in 
commit 4c5763ed996a.

pw-bot: cr

