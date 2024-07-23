Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0C815747F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Jul 2024 15:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721749635; cv=none; b=ZwdlseNYxctgDMGC2QYUKjTNd8Ur2LgAw4wKZudXSKmpt0Gf6Ff6h9OelSkvLvQfiUUyuy2JxIRnRY+5dPP2xKoj8JZfG44CA3HLYRAFgDGGI8rpiCATLJDxuEUTUTC1NYBNF7N/G1adTzOUmm1gCymLq1BPbv8A8AlK+9SMnQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721749635; c=relaxed/simple;
	bh=cc/Cwqg1Lefx3edwkMBrlhBCPFfGd2B9MSL/+igqzsI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UlByZiVBwapame1lC3deAIPGJH1i8SqGiSAmtfKmDwgNO4J7BF3f84qDjLXaF9/pJcoK2Mcgosd+V2j0ru5hQD+ajMO8d3egi6JYjt3OOPWWxwinc42ZNYo1ShoOgEnyd+IdbwzyIho3JEw1qZ0u3tZz2EgkHB1vXzpeqvR9K7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U+z8cxfY; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U+z8cxfY"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACD0F402BF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Jul 2024 15:47:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.401
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vi0J4hb2OS0N for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Jul 2024 15:47:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=will@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 99201401F2
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99201401F2
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=U+z8cxfY
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 99201401F2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Jul 2024 15:47:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C5CFB6136C;
	Tue, 23 Jul 2024 15:47:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8A89C4AF0F;
	Tue, 23 Jul 2024 15:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721749631;
	bh=cc/Cwqg1Lefx3edwkMBrlhBCPFfGd2B9MSL/+igqzsI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U+z8cxfYjbqHDJuwF3Ru86IFYYrZeHTX+DKUWSxWarR8OPdaBFxOy/0G+vNEiUWJY
	 r3XGznDR8ZJdDC6b+0HAsmQ7iUWMxSnqWHlFSa2KdOW1NWFQgirTcL9aVn0iGpOI6R
	 a38K7x8uTVU6lxCoaKjwfODGHumkLMd7L0MATfFrWoaBqkwEXX3MJjpbsf+yjyiguV
	 drRIcpCdA3AWJwXRIl6T75vMsxBf3+oLWV8+9h128G3wx6Hzz/HfB0ZsZWTNJqgSNq
	 608PFOYXg4wLiFfDNO44itvb+u0v9htXqvwUPtjOn4nRiCUxJZ1CRhusyp48btnYfi
	 MjhQFDA3xy9/g==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Remington Brasga <rbrasga@uci.edu>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] kselftest: missing arg in ptrace.c
Date: Tue, 23 Jul 2024 16:46:56 +0100
Message-Id: <172174483699.279607.15579753732481002106.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20240712231730.2794-1-rbrasga@uci.edu>
References: <20240712231730.2794-1-rbrasga@uci.edu>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 12 Jul 2024 23:17:30 +0000, Remington Brasga wrote:
> The string passed to ksft_test_result_skip is missing the `type_name`
> 
> 

Applied to arm64 (for-next/core), thanks!

[1/1] kselftest: missing arg in ptrace.c
      https://git.kernel.org/arm64/c/0c35e3bd412a

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
