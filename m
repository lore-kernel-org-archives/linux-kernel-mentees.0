Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8012F2D7D47
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Oct 2025 05:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761544558; cv=none; b=mY/CYDYZ8lrTnHT0Sntadd8UevLXAkTOWEFMiX2Jb0UrOFhiHI+0KKtV4J0HPhxK0VDt3ootgvKIrsKGAZIEPFxBacbORU9zYpuibungl2kiV4P9isiN7Q3J2Nnaco9/chno10uQyKcgH2FHdBJtVgeeoXyZ3aBKx2Cpm7tagVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761544558; c=relaxed/simple;
	bh=ybYmKh8/39nPxjAAy3oM4Wv0m5D7zdqQ/h0WxF4fTI4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e4eFEMDAUVHjlfrWt8olwT8psIEz0GD/+ixbwm8rJJHGPIyuLHRNiG9ejMpXWkQN/lL9oUzWo43vpylYb8G1bblYswHiLUNva21lK21iWefSLbfiQWTLtXm9OotxspttnOvoqOawSFQCcyoU/TeGiy3EiQNRJtvhkEDEmFlvTcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=zNqDoACA; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="zNqDoACA"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EE7B8401B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Oct 2025 05:55:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.098
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WdPbEs1BEwNS for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Oct 2025 05:55:56 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 05D3884018
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=infradead.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05D3884018
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zNqDoACA
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 05D3884018
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Oct 2025 05:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=2PSjt9WH+pBseVt0UIOQSGXPv18u2Yu6JU4vrx0TYeU=; b=zNqDoACAEhpf9GVKEy365h9/91
	K9bcBF3iL/OTLZjAWzZHocKS9YTocNfXJLJEAOd5vGTUc1YlnvjraZCeA7bs1kAF2X60YgDwbKYtc
	Bqf9F90iYEpLUvXaTV2uAWajYyxWOSi3imkHYd+uFQkVCf4Xa7vVjTAX590y1Nwp9yvganhAUTIAL
	SrwZpcTKy2glw1a4Hv/m5uL7ieLatNzVswCm691WIMdtQWgYRCKBpMlKNHyr2yC1SRrBl5USnWpj5
	MxBzNTNe+Rkr63YgalmMfiY3ctTTVpZqvZTWlTHa7pq1UHsutDJZ3tpEaiAswLIDbVWNcHa+TzlIm
	RSWaRwsQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDGCu-0000000D9sQ-3p3F;
	Mon, 27 Oct 2025 05:55:52 +0000
Message-ID: <766767b3-946a-4ff1-ace6-b7889ba296ae@infradead.org>
Date: Sun, 26 Oct 2025 22:55:52 -0700
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: Makefile: Sort Documentation targets
 case-insensitively in make help
To: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 khalid@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com
References: <20251015012922.19467-1-bhanuseshukumar@gmail.com>
 <47844424-302b-4a99-9cce-82924c7b7ebb@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <47844424-302b-4a99-9cce-82924c7b7ebb@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/26/25 10:27 PM, Bhanu Seshu Kumar Valluri wrote:
> On 15/10/25 06:59, Bhanu Seshu Kumar Valluri wrote:
>> Avoid case-sensitive sorting when listing Documentation targets in make help.
>> Previously, targets like PCI and RCU appeared ahead of others due to uppercase
>> names.
>>
>> Normalize casing during _SPHINXDIRS generation to ensure consistent and
>> intuitive ordering.
>>
>> Fixes: 965fc39f7393 ("Documentation: sort _SPHINXDIRS for 'make help'")
>> Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
>> ---
>>  Notes
>>  - Patch is tested with make help command.
>>  - Verified case-insensitive sorting.
>>
>>  Documentation/Makefile | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/Makefile b/Documentation/Makefile
>> index 3609cb86137b..00c81e7947a9 100644
>> --- a/Documentation/Makefile
>> +++ b/Documentation/Makefile
>> @@ -23,7 +23,7 @@ SPHINXOPTS    =
>>  SPHINXDIRS    = .
>>  DOCS_THEME    =
>>  DOCS_CSS      =
>> -_SPHINXDIRS   = $(sort $(patsubst $(srctree)/Documentation/%/index.rst,%,$(wildcard $(srctree)/Documentation/*/index.rst)))
>> +_SPHINXDIRS   = $(shell printf "%s\n" $(patsubst $(srctree)/Documentation/%/index.rst,%,$(wildcard $(srctree)/Documentation/*/index.rst)) | sort -f)
>>  SPHINX_CONF   = conf.py
>>  PAPER         =
>>  BUILDDIR      = $(obj)/output
> Hi,
> 
> I just wanted to check if you had a chance to review the patch or if any changes are needed from my side.

It's OK with me and it works.

Tested-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>

-- 
~Randy
