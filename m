Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BD412C544
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 24 Aug 2025 02:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756003391; cv=none; b=meogmzy5tozYnvvYmCLihfb8OwpNZOMkEV04Ba78tFZcwISjjCGL/maJ5LLkFu565M9/AOYiGhoF2cdiHBQ/MqkNDXW3QUYJcsKChYDunVs6XX3BxDbmYffp433Ovi95PJKRrL5FcZyL6nBkuTwEW6VCROUMVU5o48vhtntBH8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756003391; c=relaxed/simple;
	bh=Ee7IK4jW8L9Rr7h9gFwUO7lmCezFG8TwbC+ekvHphIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aJQ86txmS4Pd4/LxNDFW7AzKh8woZv5fUDlFlsjd/A6zWJjRCv5P0gdUj449s1WvUdTEIXqJerZOtU+nOS4s3+4oPNcCXWQ8GVxoKraI6ZcYypF/WMFdV0Vm+kN5y54q4YNiVmd0k39L4YpY3GtQEvsAB4uOFjaxtg9EtHrxQfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oT8agj29; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oT8agj29"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A96CC82143
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 24 Aug 2025 02:43:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -0.202
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vSr8gkkAAFht for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Aug 2025 02:43:09 +0000 (UTC)
X-Greylist: delayed 400 seconds by postgrey-1.37 at util1.osuosl.org; Sun, 24 Aug 2025 02:43:08 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EE57D80F4E
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE57D80F4E
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oT8agj29
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=<UNKNOWN> 
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	by smtp1.osuosl.org (Postfix) with ESMTPS id EE57D80F4E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 24 Aug 2025 02:43:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1A603A581F5;
	Sun, 24 Aug 2025 02:36:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39A08C4CEE7;
	Sun, 24 Aug 2025 02:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756002985;
	bh=Ee7IK4jW8L9Rr7h9gFwUO7lmCezFG8TwbC+ekvHphIs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oT8agj295bcFUDXmOLhDaFoNQOaClYtjl7QgKtrH2ric3ltGN6QFg8QQaTySeeK8k
	 DsIWMANVET8qQeKgoq8uR94bs4W/0NqVq7XtdpbeCfShVQZ6YnZ17fC8OY0LlZir1e
	 Pg8DFqy/du2E/T6A46w/wZKQfcw88+gcoxBNZBfHCFj7+6imH3lpnUK0QzRrJ8C9CP
	 PRo3SayjrzVWPYUHi+GbwYm8ns+ERuq8zdkbYxWmqIDf8wCo73vya98KvfNYu97yDD
	 f2z4BiZCfmXTAZg/KVoBcyuYZeZ+PsM62c6JNe1d+aSrbUjDcGpuyQCMTDpBTafPEQ
	 +GTePIwcN4Org==
Date: Sat, 23 Aug 2025 22:36:23 -0400
From: Eric Biggers <ebiggers@kernel.org>
To: Rakuram Eswaran <rakuram.e96@gmail.com>
Cc: ardb@kernel.org, corbet@lwn.net, linux-crypto@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org
Subject: Re: [PATCH] Documentation/staging: Fix typo and incorrect citation
 in crc32.rst
Message-ID: <20250824023623.GB12644@quark>
References: <20250821035913.GG185832@quark>
 <20250823091837.5037-1-rakuram.e96@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250823091837.5037-1-rakuram.e96@gmail.com>

Hi Rakuram,

On Sat, Aug 23, 2025 at 02:48:32PM +0530, Rakuram Eswaran wrote:
> Thanks for applying my patch!
> 
> I noticed your comment about the file being dated. 
> I’d be interested in helping to update it to cover the more modern 
> CRC implementations — things like carryless multiplication and 
> hardware CRC instructions on x86, ARM, etc.
> 
> Since I’m not very familiar yet with these optimized approaches. 
> Could you suggest a good starting point for exploring this in the kernel 
> (or any references you recommend)? 
> 
> I was planning to look at lib/crc32.c and the arch-specific 
> implementations, but would appreciate your guidance.
> 
> Best Regards,
> Rakuram 

https://www.corsix.org/content/alternative-exposition-crc32_4k_pclmulqdq
has a fairly good explanation.

In the kernel, x86 uses crc32 instructions for crc32c(), and arm64 uses
crc32 instructions for crc32c(), crc32_le(), and crc32_be().

x86, arm, arm64, powerpc, s390, and riscv all have CRC implementations
using carryless multiplication instructions.  The riscv one might be the
easiest to read since it is mostly written in C, rather than assembly.
See: lib/crc/riscv/crc-clmul-template.h

- Eric
