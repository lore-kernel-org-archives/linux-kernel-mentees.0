Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C5B34C992
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Oct 2025 17:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761672201; cv=none; b=jBqxYlIcbypdMGXJvjMLfOha88QnWQNG5720139QJbr55QJWjDgbcrQ/rAFZ8dHY1NKhtbzFgSSq4g/u7hlzT9fTVUJHGt6gCilPCvNxPcqiDJjJO8IaHT8GDMFi3lOBJLgV9dtLTOTfS0QT8l009CmwQKVv2bLNF4/A71cEDX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761672201; c=relaxed/simple;
	bh=oq3KFS5X77ckLv/fJl0ngTNLD/Vl72fwrFWYVkUHMkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pD+0Yvqs9PPL60gbMzMfjgt/tbOYh9wqc7hkXfz2Sf7rROrvAjtv4SJFG9rvEenil2ADoA31JcRFVApudzTE2yUPwzmoRpNEghmsfLoYbqO7wngudwWl4EWKtL4kdBhYn7FKNMuCWd+n47HD5yS9LTOOInZjQoeLoSMhydCfUUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZqfXOpiD; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZqfXOpiD"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F8CA80DBE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Oct 2025 17:23:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dlm6rtV3cBzD for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Oct 2025 17:23:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=horms@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 72D4580DBC
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72D4580DBC
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZqfXOpiD
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 72D4580DBC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Oct 2025 17:23:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D3585406B2;
	Tue, 28 Oct 2025 17:23:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50AAEC4CEE7;
	Tue, 28 Oct 2025 17:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761672198;
	bh=oq3KFS5X77ckLv/fJl0ngTNLD/Vl72fwrFWYVkUHMkc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZqfXOpiDY4STCngagg2sv2k2rnFpK+UWPbUHIK+dt8P6MzgS4DRgV25YaNKgOCvve
	 Su0UFGLsd+uEPyE+EMVYtj3KRlBQ3746NCyOKBlHZA5VOHo+FB9MDNBVPyOsJcdH7Y
	 dmeMlaTfoCur0kM4I/jj3GKPVeJjJD1sKIoBbAXe9UQKijP1UQEMkXuDv5+2oDzb6P
	 jo9MMAPBmcRcehVNk5L78uU/j94UjeZyHVCwR/oZiXkcNtYrPYQg48MBB6Ea7aw+ku
	 zLaTNLHz/KJscNIjbGcBxHkv6MFdywDsloOJ8QOBqfrqZ1a8U/lSLMNqyl3SMrnscg
	 ybFljRk2p5xmQ==
Date: Tue, 28 Oct 2025 17:23:12 +0000
From: Simon Horman <horms@kernel.org>
To: Ankit Khushwaha <ankitkhushwaha.linux@gmail.com>
Cc: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Xing <kernelxing@tencent.com>, netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] selftest: net: fix variable sized type not at the end of
 struct warnings
Message-ID: <aQD8AOZduY4Fit3k@horms.kernel.org>
References: <20251027050856.30270-1-ankitkhushwaha.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027050856.30270-1-ankitkhushwaha.linux@gmail.com>

On Mon, Oct 27, 2025 at 10:38:56AM +0530, Ankit Khushwaha wrote:
> Some network selftests defined variable-sized types defined at the end of
> struct causing -Wgnu-variable-sized-type-not-at-end warning.
> 
> warning:
> timestamping.c:285:18: warning: field 'cm' with variable sized type 
> 'struct cmsghdr' not at the end of a struct or class is a GNU 
> extension [-Wgnu-variable-sized-type-not-at-end]
>   285 |                 struct cmsghdr cm;
>       |                                ^
> 
> ipsec.c:835:5: warning: field 'u' with variable sized type 'union 
> (unnamed union at ipsec.c:831:3)' not at the end of a struct or class 
> is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
>   835 |                 } u;
>       |                   ^
> 
> This patch move these field at the end of struct to fix these warnings.
> 
> Signed-off-by: Ankit Khushwaha <ankitkhushwaha.linux@gmail.com>

Hi Ankit,

I don't believe this change is correct.

I think that the intention of the code is the char arrays (buf and control)
provide the buffer space for the variable-length trailing field
of the preceding structure. Where we basically have a header followed
by data. But your patch would place the before the header.

-- 
pw-bot: cr
