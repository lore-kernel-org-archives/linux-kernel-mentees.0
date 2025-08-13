Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E674726E6E1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 13 Aug 2025 03:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755055411; cv=none; b=TanZkeBg3r1SqB1co+kgDZ5jHz1darzgaFdzda/HLr9rmybPHpM9pP7W/M7QDcgrPLWT/4eXWmayQwDKTO2lzdAqAaje8heBFkwVhzcJwm1QWVZd4XfQcaCWGU88MaMV1i7ddioxPiA9Dpv1TZppNSrBbAHsuW1sDDDjfTC4ctg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755055411; c=relaxed/simple;
	bh=h50OZ3ElDR8hJ0Wia1FAt0RF8qiSst6JUSMAgjs5sPo=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=c+io23o1lUZz4NyeGdaf6OR8FPSvlCbmx3gSE6G4V72TST96z4P3hRTIRpjtzDHEQISOGsIo911w12kq9FrqiCM9Ao2P+aUAX60kAGO+8yBo8PHNV82OwMKo95ImyzxoXOKjMJ0gtZu42X8yCdlVF/Z8oyt1Etu6ZVf6td/C6go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F+D0p0Ow; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F+D0p0Ow"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E70C40BFF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 13 Aug 2025 03:23:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0WsdwOCLCmwn for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Aug 2025 03:23:29 +0000 (UTC)
X-Greylist: delayed 565 seconds by postgrey-1.37 at util1.osuosl.org; Wed, 13 Aug 2025 03:23:28 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ECF0F40ACD
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECF0F40ACD
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=F+D0p0Ow
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=chao@kernel.org; receiver=<UNKNOWN> 
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	by smtp4.osuosl.org (Postfix) with ESMTPS id ECF0F40ACD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 13 Aug 2025 03:23:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3C5EC5C6528;
	Wed, 13 Aug 2025 03:14:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EBDDC4CEF0;
	Wed, 13 Aug 2025 03:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755054840;
	bh=h50OZ3ElDR8hJ0Wia1FAt0RF8qiSst6JUSMAgjs5sPo=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=F+D0p0OwjAJOAupQz4nVnze+ZMc6ivvayRId2ZRnRkk7bahOvnliCdN88yXz8UTgC
	 GMI4kBKZBHZbkcUl8pOHuLcRCzjx+lrdNBOZu3C+KupMY8bZ4eM5EjztZfIyppDUy2
	 wttumQ/ePaooz4M2O51enfXasZGSE6ITOt0LxOjpbbBBgur9XdmrLs2klsbhkP5A/6
	 YLgJ3z9U5EG9yh9xTcmGjIuVfuuPEUKdiU1hi9zGLfCcQN3L3+HvDRQ2/JOOkGxO6S
	 w/BABzcA9eNdZG/rQ2hfSXtk8NvK8BmPkC9VBBfBklsmoSUOTYyVO3qcCM7E66PIT7
	 II37IRDqah/Nw==
Message-ID: <996b47f2-6c0f-4204-b994-d37ef43da5a6@kernel.org>
Date: Wed, 13 Aug 2025 11:13:57 +0800
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 skhan@linuxfoundation.org, Jaegeuk Kim <jaegeuk@kernel.org>
Subject: Re: [PATCH v2 1/9] docs: f2fs: fixed spelling mistakes in
 documentation
To: Soham Metha <sohammetha01@gmail.com>, linux-doc@vger.kernel.org
References: <20250812201523.69221-1-sohammetha01@gmail.com>
 <20250812201523.69221-2-sohammetha01@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250812201523.69221-2-sohammetha01@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/13/25 04:15, Soham Metha wrote:
> found/fixed the following typos
> 
> - deivces -> devices
> - substracting -> subtracting
> 
> in `Documentation/ABI/testing/sysfs-fs-f2fs`
> 
> Signed-off-by: Soham Metha <sohammetha01@gmail.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
