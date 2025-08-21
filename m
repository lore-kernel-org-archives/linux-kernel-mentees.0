Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9F9217F24
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 03:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755748760; cv=none; b=SdZfMcFxu3496qDV/faEJd2Oflc54g2iD3jqBYKWYIXH41AReHHuSW/rIbu5BsqsBW3YSwD7Ge55Zw8HGTyedNGFGwd+UQ8i8g/cqe0pgkZbOEd3Gjl0Utiry/YuVge7+ymdhRbbS8WZU4Yg8152rCOxX1s0bGE8VRpO3pFpGS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755748760; c=relaxed/simple;
	bh=wlPvbixKsFivuJ/uCAGwERK9ERg3cDoDU73Rw68oQZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HhcwxcQNrzlT2cEAaSwlpJlIlHDDLh6tio10gtBlbUWs5IaQ4qYbJ77lG/RR7xqEABnUy510FY7EFmGk5tTdFKF977N6qmUZNhv5SsAbWlFeiMXFM0IOrTp34xi33h/jXN9Ia45sw3kbeNqNmzvaE5BxYQjrj3aXVCmdGwj7An4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vMwcQWRM; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vMwcQWRM"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABD4E416A9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 03:59:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kXOzfN4vKk0r for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Aug 2025 03:59:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 152F8416AB
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 152F8416AB
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vMwcQWRM
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 152F8416AB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 03:59:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3A73045C56;
	Thu, 21 Aug 2025 03:59:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88F8EC4CEF4;
	Thu, 21 Aug 2025 03:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755748756;
	bh=wlPvbixKsFivuJ/uCAGwERK9ERg3cDoDU73Rw68oQZg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vMwcQWRMwZTBZxKoKPwiy8DIy8hOQNxeZ2k2NxO1AG86P1Izv9gAzrHwhl8dcZ9X3
	 sMYxrShEmUIpA4u+rUuhQpbeMN8vmse3mSoyFzwA2iymU2nAeWWTFPVHBMM7XMWCPx
	 akJFOAq6Mi6dt9PDtSo19qm09sRvt6iQeBr0A3k1dqtpn7EmRygmeoIW6/2hxLzzUN
	 4l2heOzrxJzrodyTdy4Fi3atNFi2OaKtR12KD0oaIE3YTf6KFjhTRtIquPdz0mqphG
	 A7IA5bKphrVvN/sGVds1Ij1lI+oSqPCzg2Hew58Aw7ADkyZFvIjL+Bh+tT2u68KJld
	 VWp1RaM1ivriQ==
Date: Wed, 20 Aug 2025 23:59:13 -0400
From: Eric Biggers <ebiggers@kernel.org>
To: Rakuram Eswaran <rakuram.e96@gmail.com>
Cc: linux-crypto@vger.kernel.org, linux-doc@vger.kernel.org,
	ardb@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] Documentation/staging: Fix typo and incorrect citation
 in crc32.rst
Message-ID: <20250821035913.GG185832@quark>
References: <20250820162615.6942-1-rakuram.e96@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820162615.6942-1-rakuram.e96@gmail.com>

On Wed, Aug 20, 2025 at 09:56:13PM +0530, Rakuram Eswaran wrote:
> In Documentation/staging/crc32.rst, below errors have been corrected:
> 
> 1. Line 37: from "to being" to "to bring"
> 
> 2. Line 119:  Incorrect citation date:
>    It must be August 1988 instead of August 1998
> 
> Signed-off-by: Rakuram Eswaran <rakuram.e96@gmail.com>
> ---
>  Documentation/staging/crc32.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Sure, why not.  Applied to
https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=crc-next

Note that this file is somewhat dated and is due for a rewrite.  It
doesn't describe how most of the optimized CRC code actually works these
days, using carryless multiplication or dedicated instructions.

- Eric
