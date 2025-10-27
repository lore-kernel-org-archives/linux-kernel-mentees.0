Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F6133033E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Oct 2025 23:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761607531; cv=none; b=hijZ5niKpzhcSn7pf+VyU7QSouWG+Y7EXoslLibFo1JG3Mg0XXBlo1G5DW17ukAAHKQSMhVlL920u8Dv9g75mvywaR07h0odBg2zTxX/5OTMTJ2yMm2tHVaYg+ywHgsKRiuNPclS/vPPX3eEChJ5MXPMnycJPQpxKxf4fEq7z0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761607531; c=relaxed/simple;
	bh=1ZAtv1k7qLg8MgQOvSbxTtTfacA9rWU661BgI+pDVq4=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=XN6+yFYnjL+TJ/NeLBaqg3qUAAq8IZj9PfQjl0QlcwHd9wBBh7W9O9rJ7WxHgkLqr8A3SQhGdNFGomIxA22yTaHWmsQgYI6OdnhgEIrZvc7M2PDJgsNvWc8AXXI1gO7eLK+dyN6XdwpQMNFinb1iOaWs1zUQI95+xSfyAe2d4SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=p8Wf8c+3; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="p8Wf8c+3"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A28FC40DD4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Oct 2025 23:25:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6hzglB2QwDgl for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Oct 2025 23:25:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0857D40B4C
Authentication-Results: smtp2.osuosl.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0857D40B4C
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=p8Wf8c+3
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 0857D40B4C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Oct 2025 23:25:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F148E48813;
	Mon, 27 Oct 2025 23:25:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C715C4CEF1;
	Mon, 27 Oct 2025 23:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1761607522;
	bh=1ZAtv1k7qLg8MgQOvSbxTtTfacA9rWU661BgI+pDVq4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=p8Wf8c+3emDUEx/LKVNdgfy7OmdSHq8XWZ6wFAuaK1FwwE4aWRE5ucLMWzj4UouZG
	 /34e/TnVpdrTlsD1PWMyzRg0VDxDMkVEYHyPNBW+lsL+tamb4jIR2A3LTpLCB/5Y6O
	 n3lwF4kGPjgZRHinYZasxHvUwi1icLTF2VMUFhgc=
Date: Mon, 27 Oct 2025 16:25:21 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Ankit Khushwaha <ankitkhushwaha.linux@gmail.com>
Cc: linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>, Wei Yang
 <richard.weiyang@gmail.com>, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, Steven Rostedt
 <rostedt@goodmis.org>
Subject: Re: [PATCH] selftests/user_events: Avoid taking address of packed
 member in perf_test
Message-Id: <20251027162521.c56c7f89f6ad4e3d639c408c@linux-foundation.org>
In-Reply-To: <20251027113439.36059-1-ankitkhushwaha.linux@gmail.com>
References: <20251027113439.36059-1-ankitkhushwaha.linux@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 27 Oct 2025 17:04:39 +0530 Ankit Khushwaha <ankitkhushwaha.linux@gmail.com> wrote:

> Accessing 'reg.write_index' directly triggers a -Waddress-of-packed-member
> warning due to potential unaligned pointer access:
> 
> perf_test.c:239:38: warning: taking address of packed member 'write_index'
> of class or structure 'user_reg' may result in an unaligned pointer value 
> [-Waddress-of-packed-member]
>   239 |         ASSERT_NE(-1, write(self->data_fd, &reg.write_index,
>       |                                             ^~~~~~~~~~~~~~~ 
> 
> Use memcpy() instead to safely copy the value and avoid unaligned pointer
> access across architectures.
> 
> ...
>
> --- a/tools/testing/selftests/user_events/perf_test.c
> +++ b/tools/testing/selftests/user_events/perf_test.c
> @@ -201,6 +201,7 @@ TEST_F(user, perf_empty_events) {
>  	struct perf_event_mmap_page *perf_page;
>  	int page_size = sysconf(_SC_PAGESIZE);
>  	int id, fd;
> +	__u32 write_index;
>  	__u32 *val;
>  
>  	reg.size = sizeof(reg);
> @@ -236,7 +237,8 @@ TEST_F(user, perf_empty_events) {
>  	ASSERT_EQ(1 << reg.enable_bit, self->check);
>  
>  	/* Ensure write shows up at correct offset */
> -	ASSERT_NE(-1, write(self->data_fd, &reg.write_index,
> +	memcpy(&write_index, &reg.write_index, sizeof(reg.write_index));
> +	ASSERT_NE(-1, write(self->data_fd, &write_index,
>  	                    sizeof(reg.write_index)));

Simply casting &write_index to void* would fix this?

>  	val = (void *)(((char *)perf_page) + perf_page->data_offset);
>  	ASSERT_EQ(PERF_RECORD_SAMPLE, *val);
