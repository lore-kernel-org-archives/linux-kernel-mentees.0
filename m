Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036522F2E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 10 Feb 2025 05:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739166570; cv=none; b=Yfnwfthi8Ie3C0c8BdtgavL5QuEIWAfIOZfRBIeLD6pidjIMdiDyX5vQRPw7JfHg+dG/NSgDI8NDnr85MFbXFXbjIsmeNH6hITYTtb2pvI3G7mn+HLgvg0eHVgGY1womE24z0zGq31q5jqWKpdnA7TyiIYFPJLQkIS78I05xPf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739166570; c=relaxed/simple;
	bh=okp4iGCbBaVIw09q0bTKVUF37D2rZF5xu5HsDQnnPSI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OuaWsBGdla32nr/oR6lNZr+okpwXO8+jidPr3vD+xk/zrYQyOOKSoDF5rfN4EJSTKbk2wDNIAUCYgUGDjfLeU/8FhyE+YIkkhSjvtvjuMaS6RuI4gpbe2H7edDwLlRh9rt32GboZUF96rjJleeun4QlHZ6zU24/3XEsqnzEta2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=snSZHDct; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="snSZHDct"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81D3B410AF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 10 Feb 2025 05:49:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.398
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KSAlicGPkbnT for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Feb 2025 05:49:27 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E7819410B2
Authentication-Results: smtp4.osuosl.org; dmarc=none (p=none dis=none) header.from=infradead.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7819410B2
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=snSZHDct
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E7819410B2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 10 Feb 2025 05:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=LKNWyhqjvF4B9c8YkHcwLtXN2IA4PlgurEoAGQi8oh4=; b=snSZHDcthjD7MOyCeUkM+cqV5M
	Ahe9cd/kfvxqM1HVbAeM8K0V6jHQb91Fno4sLNwql4NxoAKPQNlZCYHQop6BtLpCLIxE7NXb6TzRR
	2Ly7jlkNctNtdark/ef3ebv6VFBJOKCFFlh3lWjz1WmHqMi99CagYYcKr4/vRMwGTnAIIBbNt8Kpv
	HC/7scfLq3CPKyeDWj/mMpi4kSXGMAtl8TbXlJ7qM096ElzQiiyxVNcoZIWZ047BMUdQ13gmvUXCL
	Ao2XRvIElociyB7d0IvShWMMzTms52BhefMVtQkoGv+UnG0sRj47/4Ijts5Le90NFhq4lRpNCfiQg
	60yQa4eA==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1thMfa-0000000EkuA-02Ht;
	Mon, 10 Feb 2025 05:49:22 +0000
Message-ID: <d85760e3-433e-429d-a6e0-458bee382d84@infradead.org>
Date: Sun, 9 Feb 2025 21:49:14 -0800
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] documentation/filesystems: fix spelling mistakes
To: ritvikfoss@gmail.com, corbet@lwn.net
Cc: linux-doc@vger.kernel.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20250210043937.30952-1-ritvikfoss@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250210043937.30952-1-ritvikfoss@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/9/25 8:39 PM, ritvikfoss@gmail.com wrote:
> From: Ritvik Gupta <ritvikfoss@gmail.com>
> 
> Corrected the following spelling mistakes,
> based on the suggestions by codespell:
> 
> 1. Optionaly   -> Optionally
> 2. prefereable -> preferable
> 3. peformance  -> performance
> 4. ontext      -> context
> 5. failuer     -> failure
> 6. poiners     -> pointers
> 7. realtively  -> relatively
> 8. uptream     -> upstream
> 
> Thanks for your time!
> Regards Ritvik

The 2 lines above should not be part of the commit description.
You can put them below the "---" line just below your Signed-off-by:
if you want to include them.

> 
> Signed-off-by: Ritvik Gupta <ritvikfoss@gmail.com>
> ---
>  Documentation/filesystems/9p.rst                              | 2 +-
>  Documentation/filesystems/bcachefs/SubmittingPatches.rst      | 4 ++--
>  Documentation/filesystems/coda.rst                            | 2 +-
>  Documentation/filesystems/debugfs.rst                         | 2 +-
>  Documentation/filesystems/netfs_library.rst                   | 2 +-
>  Documentation/filesystems/xfs/xfs-delayed-logging-design.rst  | 2 +-
>  .../filesystems/xfs/xfs-maintainer-entry-profile.rst          | 2 +-
>  7 files changed, 8 insertions(+), 8 deletions(-)

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

-- 
~Randy
