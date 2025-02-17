Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853BE1AB52D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 17 Feb 2025 22:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739831543; cv=none; b=V8mg37++9CaAfdMcLOLx7FfjvKixH0juh4tDmch0GZ2XCDju1CBg19CrW/g3c0tzoVRv3D2+1rvFhE/dh8YvC9t78ZAcDSzfviJnO1tPCWz/BypTg8AOCjkyDUgq72Agy+VSvYi8DMsE/79sQepkeKKXqdnIR46W1sCh2T99O8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739831543; c=relaxed/simple;
	bh=qFKTkNpONgMg3NBCN3xgNv0kFxCr4BNqkB66XUagtOY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=c9Co4UV0W4bj7Nt4lbX3Wb1aP+eHgCqkB+IckdFnUbDPerCDViUacgLInF89zuvCT44llZPiUSkUkMGpEX+kpRpr6JVZjRv74Adpk9foJ6xX7skam+jXQlLFUUIzD4R+OozsTZqYLfjWVnPh0CIkXlyVAhF6P9Sec4Ss0woim7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j9nLc2mv; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j9nLc2mv"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 111F840419
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 17 Feb 2025 22:32:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -8.092
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZMvtJtVGHBxt for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Feb 2025 22:32:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=sj@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3DE844011D
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DE844011D
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=j9nLc2mv
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 3DE844011D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 17 Feb 2025 22:32:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 84DCCA41ACC;
	Mon, 17 Feb 2025 22:30:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED494C4CED1;
	Mon, 17 Feb 2025 22:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739831539;
	bh=qFKTkNpONgMg3NBCN3xgNv0kFxCr4BNqkB66XUagtOY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j9nLc2mvL4bhKycMPuEB8L5O7B9VRy48+8XxJdGCVbGE1ebPUKKJbwWdZMLEIw176
	 Ar8ntIbx9QHcCdlwff9SXKalnWXHOqNpY+FdwHSeal83r+t0GvwCczyxMPI0DAe1GG
	 TFY0JqI5YK3O9m3K32ahSHDx5DcjKamwXZFLeTJQ+xId4Qep9kIkHf83n9VCatAanA
	 6D4eZzKK2mxhdimM07IXk4RsHJnHsZONkKv7ngzuLQXIQZ3cxtMU2IUH04ks72/IVU
	 yIK1LsaXe4v7p/Sx/cL9LBkMJJ2w3eurxg3jpwaW+g1sfv/d84Pv7vZUaVjlakHyIC
	 mmAJ1nmEAIMlw==
From: SeongJae Park <sj@kernel.org>
To: Marcelo Moreira <marcelomoreira1905@gmail.com>
Cc: SeongJae Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	damon@lists.linux.dev,
	skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: Re: [PATCH] Docs/mm/damon: Fix spelling and grammar in monitoring_intervals_tuning_example.rst
Date: Mon, 17 Feb 2025 14:32:15 -0800
Message-Id: <20250217223215.36040-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250217215512.12833-1-marcelomoreira1905@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 17 Feb 2025 18:54:31 -0300 Marcelo Moreira <marcelomoreira1905@gmail.com> wrote:

> This patch fixes some spelling and grammar mistakes in the documentation,
> improving the readability.
> 
> - multipled  -> multiplied
> - idential   -> identical
> - minuts     -> minutes
> - efficieny  -> efficiency

Nice catch!  Thank you for fixing these!

> 
> Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>

Reviewed-by: SeongJae Park <sj@kernel.org>


Thanks,
SJ

[...]
