Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25348633F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 15 Apr 2025 13:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744723495; cv=none; b=Ool+9DMves1Md03JuQt5/o/UeeSiIAqj83WJDsRbirO1fVKdxMqD4sHk4HbIy/u4KIl5IOSM0X4iUSdHILFH8NTGsOuEA4Z0AACJ28wOh+CFroDflXsnFVSQQ+Ni1mW6hUO2zVkKImJEitz8R7q6+DXCwx+KKrUaoJ2VdWnzYPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744723495; c=relaxed/simple;
	bh=dUTm412+K/VmHkyZw+CmlWzv4zckQvZAia5fbSEQNn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AeE0g3vl7Qw+7EhJ5VOk+Ry4B6GhCCs5pLm+JYKBF4U7f/WkOsows7jORgjRy32VqlbQ1rtYyIvPwyvBaY4dH4yqkklAy6ku7CV58+r+h9cVszVtLRvK1giRfxP3mQJOF1fDOLJ6mdGXJDBvDGCWSYCuraqdP8KUOcCf33NMTow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bsa+x95C; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bsa+x95C"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E0464125A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 15 Apr 2025 13:24:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5BEYgSLfMV75 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Apr 2025 13:24:52 +0000 (UTC)
X-Greylist: delayed 323 seconds by postgrey-1.37 at util1.osuosl.org; Tue, 15 Apr 2025 13:24:52 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 771CE41249
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 771CE41249
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=bsa+x95C
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN> 
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 771CE41249
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 15 Apr 2025 13:24:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E8E0643ACC;
	Tue, 15 Apr 2025 13:19:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B29EC4CEDD;
	Tue, 15 Apr 2025 13:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744723168;
	bh=dUTm412+K/VmHkyZw+CmlWzv4zckQvZAia5fbSEQNn4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bsa+x95CEBNUO6b4gx8SCg5V/g6rbLU/TUMfQaDLQ1SXJZlNiLTN85TIQw4vtBxyu
	 KqXMXtvGZ67Laj0y/0BHqw1DGEoVAGsGvMwAvXwnIDQYkoOTqX8TtVH4g9nSbV3iy7
	 lsA5r+Z56NYTEmNzQMCEOUs/mfIrK9MtKcQMWYbw=
Date: Tue, 15 Apr 2025 15:19:25 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Devaansh Kumar <devaanshk840@gmail.com>
Cc: sashal@kernel.org, stable@vger.kernel.org, ast@kernel.org,
	daniel@iogearbox.net, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>
Subject: Re: [PATCH] bpf: Remove tracing program restriction on map types
Message-ID: <2025041517-semicolon-aloft-9910@gregkh>
References: <20250415130910.2326537-1-devaanshk840@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415130910.2326537-1-devaanshk840@gmail.com>

On Tue, Apr 15, 2025 at 06:39:07PM +0530, Devaansh Kumar wrote:
> [ Upstream commit 96da3f7d489d11b43e7c1af90d876b9a2492cca8 ]
> 
> The hash map is now fully converted to bpf_mem_alloc. Its implementation is not
> allocating synchronously and not calling call_rcu() directly. It's now safe to
> use non-preallocated hash maps in all types of tracing programs including
> BPF_PROG_TYPE_PERF_EVENT that runs out of NMI context.
> 
> Signed-off-by: Alexei Starovoitov <ast@kernel.org>
> Signed-off-by: Daniel Borkmann <daniel@iogearbox.net>
> Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
> Acked-by: Andrii Nakryiko <andrii@kernel.org>
> Link: https://lore.kernel.org/bpf/20220902211058.60789-13-alexei.starovoitov@gmail.com
> Signed-off-by: Devaansh Kumar <devaanshk840@gmail.com>
> ---
>  kernel/bpf/verifier.c | 29 -----------------------------
>  1 file changed, 29 deletions(-)

what kernel tree(s) is this for?
