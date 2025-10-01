Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BEB2C11C5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  1 Oct 2025 16:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759337633; cv=none; b=ceL9x38Kd/XIrQ2Ip6CoruwNoKAEXy0jRz8MTr5KJXq5aCjY3ugfgbE7Wkix/FfgXQlZoGlayT1W/iB4CouhSgwllbQkfKPFkFmG8Ty4TMROsi35uLWOcl3/Ad3UbN/vbzT1gnYPqAEvK+JELgBARNoInUMOmP6Jq+4n7IsoCNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759337633; c=relaxed/simple;
	bh=P32gxchqra0nGyRnN6ybBTNOyNQvXQZ4xfdZWywRGCA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R1JifF0UuawzldVWuwryfGEE822ymoPbcl7g0E+1cX/weODOGhdhJuCJQQVSc0Rpz6xNhpDJg81h2ervpjQUFCkGEgB3nMOO4FEwcRd/EjKa7IhuHSbJCTaDQO//hMb5YGhCV7mSY5RYFLO/dYR1G7mgrMT76jRZqsSOHLnYoAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=e1gkShnm; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="e1gkShnm"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE9DD41043
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  1 Oct 2025 16:53:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.798
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VZmy3Weezsg9 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Oct 2025 16:53:50 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E30AC41040
Authentication-Results: smtp4.osuosl.org; dmarc=none (p=none dis=none) header.from=infradead.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E30AC41040
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e1gkShnm
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E30AC41040
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  1 Oct 2025 16:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=ibzNKx/gRXGnc4tiiG6OxYzIZRUZZP1ZY3ujHEfJkWU=; b=e1gkShnmJaB0Supwo7SgLY7Eqd
	Zvgl2nXKG4JUnkaZJc//qyDKXaWuJoCn05Aezxnvig+xiDZ+kfYoBw6DrShItI4vAskZJxu3/4Bne
	5GiDJzqBotIt9VSbsMZ0MtLDzCqWyjxAh8Pu3L1sbUrXBPbeE091wMJzDGT80NWOhpls0BhJHb1Ot
	px5/Pphug1qdZU7BZikFatZc/WXlq3ySBl4TiYGDvsTdTsnhAgauS92IcIz+drWFQqN4hv7i4C/nv
	xGfDTAUtzLnhIHxN27C2zNDAASIM9dPcLwk4bfLbX8wbZgkr3u58oreBHdvuSNFdVziyV8IN0jWO4
	ZFeetP0g==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v405F-00000008aUQ-1ba1;
	Wed, 01 Oct 2025 16:53:41 +0000
Message-ID: <81c03cb3-5c97-4a6d-bf20-53c5afde2b42@infradead.org>
Date: Wed, 1 Oct 2025 09:53:40 -0700
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs: doc: Fix typos
To: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>,
 Kent Overstreet <kent.overstreet@linux.dev>, Jonathan Corbet
 <corbet@lwn.net>, Carlos Maiolino <cem@kernel.org>,
 David Howells <dhowells@redhat.com>, Paulo Alcantara <pc@manguebit.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 linux-bcachefs@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
 netfs@lists.linux.dev, linux-fsdevel@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com
References: <20251001083931.44528-1-bhanuseshukumar@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251001083931.44528-1-bhanuseshukumar@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/1/25 1:39 AM, Bhanu Seshu Kumar Valluri wrote:
> Fix typos in doc comments
> 
> Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>


Thanks.

> ---
>  Note: No change in functionality intended.
> 
>  Documentation/filesystems/bcachefs/future/idle_work.rst  | 6 +++---
>  Documentation/filesystems/xfs/xfs-online-fsck-design.rst | 2 +-
>  fs/netfs/buffered_read.c                                 | 2 +-
>  fs/xfs/xfs_linux.h                                       | 2 +-
>  include/linux/fs.h                                       | 4 ++--
>  5 files changed, 8 insertions(+), 8 deletions(-)

-- 
~Randy

