Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C3C2F99A0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 13 Aug 2025 19:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755112928; cv=none; b=A1As3E6OvdNkAfk+MsviFt/pi3AxtSa0BPJPpd12+mg7c/dNEoWhf0E6dl6WKmjQx5UeL2FgVz7vVlKwxHOd2hxh79bF0XfoG6Rf3XRQI7kAee3K4QEnYSjPQ44gneswrFzuf5jU1Tqk4SKWgABo1nl8IzhJm6OjQn64CRMcwjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755112928; c=relaxed/simple;
	bh=w0ouKptykXmNigxZC5kHw1IEzuv4psf7+p8nEWC69Mg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QwW+KZRwcoLxAefCBvWP3F8ISpHhUPZrcEl7SW2vz7Mg9s1TzEJz6AiAv44snT2WMLDJhhQSI5U0GiN+n6weJ0AdXn0+RYq1p1eVcQ51mEyxyWWGA2Auo1CRXznMsOzgopG1c8Ia8NAFwCA+HfsObUkBY8oTnCCGVius/zgq9nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=rZigzKGS; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="rZigzKGS"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E95A681467
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 13 Aug 2025 19:22:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.398
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IHICLpq1acI0 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Aug 2025 19:22:06 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 26DE68149E
Authentication-Results: smtp1.osuosl.org; dmarc=none (p=none dis=none) header.from=infradead.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26DE68149E
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rZigzKGS
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 26DE68149E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 13 Aug 2025 19:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=pggfmbdpGZOyYC0NJM+dTAZP6m/p4pfU1MFCzI4Ifm4=; b=rZigzKGSGt5jG9U+tuFXQYEeMR
	qMyvmJERodOJVtVDOF6KBXn97KcF8LExaHhrOu2dbYX6FTv2gB/Xi6bR885OSRiO3pQmJEKSc+Il9
	Je3eGlX9kq+suX+PvrGFJusPbwiKre5900IiSwMyJ49K8a5YrQKC9yX003phV30eTrhEH4aZ/tv8b
	LVMcwhnX6MQmV1KLXTQXvYmGpc6rsdFuScyqx9WO+DnmN9uZNBaM0/3psR6OcztyfTNGP9QY5Tgta
	/Iz+R54C/j1Jhd5+6JqgEtxAEFTt88e2ZvqPQQdTrPFZeCH0ofcYK0ArKJqLArYA9CXf8Uq7+n8oS
	/qWtDSuA==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umH2y-0000000EmmM-0rdm;
	Wed, 13 Aug 2025 19:22:04 +0000
Message-ID: <7daf2e6e-cd33-40d9-8ae5-d4cd08ff0162@infradead.org>
Date: Wed, 13 Aug 2025 12:22:03 -0700
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation/kernel_hacking: Fix minor typo in
 hacking.rst
To: rakuram <rakuram.e96@gmail.com>
Cc: corbet@lwn.net, linux-doc@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org,
 ukleinek@kernel.org
References: <970be4df-e010-4ba2-b2e9-c2c24b8742ef@infradead.org>
 <20250813182434.7189-1-rakuram.e96@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250813182434.7189-1-rakuram.e96@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/13/25 11:24 AM, rakuram wrote:
> Thanks for the clarification, and I apologise for the oversight in my submission.
> Could you please suggest the best way to check whether a similar patch has already been attempted before sending one?

Well, I remembered seeing one recently so I searched the archives of the linux-doc
mailing list (https://lore.kernel.org/linux-doc/). In the search box I entered:

b:"compatibility"

but that's not going to work for a general case. For other patches to the
same file, I would change the search argument to

b:"Documentation/kernel-hacking/hacking.rst"

HTH.
-- 
~Randy

