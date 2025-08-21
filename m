Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093223451BB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 18:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755802238; cv=none; b=l7AvixO0kzQmqhtcaGlzV6FyTK4R9rH5KD3qq87yVQw6xHJxNolCw1FRh5iHvwODrdfhZfteiSUToUXWpWYPUFGnmFLYqaKVg8qPqwXnIyXLPdsGm2is9VxT7RP1fWIb0OEoZWtPQThtJW9AsF4ZyhxgGGTtrW/11BSevExFmoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755802238; c=relaxed/simple;
	bh=MCotrZmNT7RLq9JXnxjTqoY/y3Qcia8Pef8k45/qlxk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RTjbwqFQGfykxyQSIKQRU++Jxa5HJq6WVcpBZwr7oG/SYMHNPYy7UJtLGHFe9oGV120ClXwuXzWoQUGtoxcyqisHeTblo7sk8AJd1D4dZxMSZArabRVaMA8oj44pebk6BdFFW4V/O1vrkTFTddIsG5UcZwxqIxasLVfsNZ61FVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=PbLQdufb; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="PbLQdufb"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3E9F40D21
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 18:50:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YMCNKquPhNZD for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Aug 2025 18:50:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c01:e000:3a1::42; helo=ms.lwn.net; envelope-from=corbet@lwn.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B125D40CDB
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B125D40CDB
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=PbLQdufb
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B125D40CDB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 18:50:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 71C5240AD5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1755802230; bh=wR+ymNRSdxLoxdfwbiG8L4tIz2EGNW+ebvxDR/PAd7o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=PbLQdufb4JYWtd0/ScdfGma9Fmb+G9nq8KE7Wq1vmRHzdTiOayaCe/HK1Alr8qj5Y
	 TO+ms1z4PkD82hzBtTxml6n08S8CzgI4wz61JPr/MhTe2QYE6Gm7K0a5HokUaoKC/t
	 s936+FSWZHwv0JALXRixKcyixHilakGJg3FVtXfsjUhwmhawOlYmWduM92ym8c4H1J
	 94ab/BHHRC8jX0Pb1C9dCgemYYwvzgZRONu/vQsfJnJaaqzMfV761kXQHZXjjN6NnC
	 lG/+8VS3UikPGSRdnqGmpBHtQtE+ZpsAi4MfsEjU4GNZGABA0LQrbsxCwhQq1/IkDZ
	 1XKV2rnFeuF7w==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 71C5240AD5;
	Thu, 21 Aug 2025 18:50:30 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Raphael Pinsonneault-Thibeault <rpthibeault@gmail.com>,
 viro@zeniv.linux.org.uk, brauner@kernel.org, skhan@linuxfoundation.org
Cc: Raphael Pinsonneault-Thibeault <rpthibeault@gmail.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] docs: fix trailing whitespace error and remove repeated
 words in propagate_umount.txt
In-Reply-To: <20250818181934.55491-2-rpthibeault@gmail.com>
References: <20250818181934.55491-2-rpthibeault@gmail.com>
Date: Thu, 21 Aug 2025 12:50:29 -0600
Message-ID: <875xeg7bm2.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Raphael Pinsonneault-Thibeault <rpthibeault@gmail.com> writes:

> in Documentation/filesystems/propagate_umount.txt:
> line 289: remove whitespace on blank line
> line 315: remove duplicate "that"
> line 364: remove duplicate "in"
>
> Signed-off-by: Raphael Pinsonneault-Thibeault <rpthibeault@gmail.com>
> ---
>  Documentation/filesystems/propagate_umount.txt | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

jon
