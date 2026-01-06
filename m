Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F287732692D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  6 Jan 2026 01:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767662172; cv=none; b=QU4gZVM1X+Z3Z3Olinr9tSaUxFekAJ8iOXX4wE2vtGURX1s+Ege10KeWlPg5DWdcWVgSIijvQ/0EU6DhD9/DLpSzHuefBuE3caI9gigQyroTORuhj31se+ATZgqsiHvyZCUKvNLYSE2S6clSdrt7UUCj628SyzRTEVf6mnzzB1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767662172; c=relaxed/simple;
	bh=OzJHFsfEHzvgI2kXNEToJUDBn4I1m/TX38QGMIfzvg0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=aMI+yXIQPIB8rhqXOUjkjr2v14Zcb9uc2kaPsEeA+UAnQylKRRtceS5obFpBSnkUrBSW59zwr5yA0kmMEdmULqI1U1YQsg4G5/jFHpJX/UE8nrcQtyh7Ho1cTd+2SXxnBHxLj41DSd8a3QXNNkqa3xK8W/Iz7dClAcCS5Ek9da4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hRdbaEml; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hRdbaEml"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7150D809B8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  6 Jan 2026 01:16:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P22OLG89u28F for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Jan 2026 01:16:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=pjw@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DBD1D80974
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBD1D80974
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hRdbaEml
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	by smtp1.osuosl.org (Postfix) with ESMTPS id DBD1D80974
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  6 Jan 2026 01:16:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C561A436BD;
	Tue,  6 Jan 2026 01:16:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3B94C116D0;
	Tue,  6 Jan 2026 01:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767662168;
	bh=OzJHFsfEHzvgI2kXNEToJUDBn4I1m/TX38QGMIfzvg0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hRdbaEml+S9GmYO5A6Ks+1HyDRv07YQSj4dv6i2mxKPU9BvL8Yyf2Qvh1SVeOTLLo
	 NpT1ux2dV1gQYVrLVx3xBBEPqmgCw/vIH3bWVjyn5lIamyxHkMIEJUuNmL2RmoNP4t
	 lrUlrpfX/pOFwIf97hu7zXJb/9BvAQPcQk0v2fgns3pjOX8H7vV75cbn2r8e1sbqO6
	 DoW3KVbcPMbjRQglhdeU/093wI3TLUQNvowTHX21gawVxdAVYN60rW+Ur2WJ8IMDM4
	 cfphxA0EOpNGxHWd5SHPYwnvZeit9prItWKD5jSg1cvvwwOe7ML3K0fQE3ZjZjGDoV
	 t+x+1E/KRgOaw==
Date: Mon, 5 Jan 2026 18:16:05 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Soham Metha <sohammetha01@gmail.com>
cc: linux-kernel-mentees@lists.linuxfoundation.org, shuah@kernel.org, 
    skhan@linuxfoundation.org, linux-kernel@vger.kernel.org, 
    Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Breno Leitao <leitao@debian.org>, Song Shuai <songshuaishuai@tinylab.org>, 
    Andrew Morton <akpm@linux-foundation.org>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] riscv: kexec_image: Fix dead link to
 boot-image-header.rst
In-Reply-To: <20251203194355.63265-1-sohammetha01@gmail.com>
Message-ID: <1bb1f1bd-72a0-42f4-4183-75d44dd21634@kernel.org>
References: <20251203194355.63265-1-sohammetha01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 4 Dec 2025, Soham Metha wrote:

> Fix the reference to 'boot-image-header.rst', which was moved to
> 'Documentation/arch/riscv/' in commit 'ed843ae947f8' 
> ("docs: move riscv under arch").
> 
> Signed-off-by: Soham Metha <sohammetha01@gmail.com>

Thanks, queued for v6.19-rc.


- Paul
