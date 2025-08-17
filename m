Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7788227453
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 17 Aug 2025 17:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755451096; cv=none; b=f2j7i/PqElkt9PxGDDcjPi7Vp9JaxLZuWnWS/BLBHD6Hpk6QwjNzMOUPwWrRj8nnTnmlGnBRpMSjMH8X9ebeUsCisQg/sAOMaAc8sjKmNemlWr4PjOK5CHWA43r7xSCpOXuK6xTrA7UF11M8NIPhP3CpPoqorDRbEDxU/Zg00cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755451096; c=relaxed/simple;
	bh=89sV1jzeprLmGxNDBkAotelhMhTESljCwnX/Hoc3VkE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XhRg5ovhxmrClcR5SquUI7VFJCPhhZc2eEjymYOSzlGXAHENI6+6GiYjzDYJO3AzQ9FiqMS4cIrJ3IoIvbrpyeTLCgBoFn1rp1teikEeO4CGI7bK9F3H/GzMkUgMQzIRUjVdqmWVBG8YJ5uT5Dg4ydJM/18vSnf6P6SMG8BnHQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=1mSKhWYT; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="1mSKhWYT"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC0F361435
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 17 Aug 2025 17:18:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.398
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BGIzMGUVqBMZ for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 17 Aug 2025 17:18:12 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7F218614AA
Authentication-Results: smtp3.osuosl.org; dmarc=none (p=none dis=none) header.from=infradead.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F218614AA
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1mSKhWYT
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 7F218614AA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 17 Aug 2025 17:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=LzA6whP271CAz6gyFpypYO9CFIkSQa215dKzmIjRrHM=; b=1mSKhWYTQbWuiIr9pdIK5gtNTv
	o3hjD9FWmW0KSacbkHO/0S9O+coP0TmHtwJUjWUZzJf+qzA8xtHzW0jyDcD96Yb1z7hd61LHV4MJp
	TQh0oFxNtVOKxz8WW4SGVbWI1dO932KGeNdKv2JuK/yrEifYn7aGlMMelkHUwTzoUW8GFWB2BLrg1
	9Q+07vO4BLv3VabUKyzKA0SRwwK+YkuDgsrIHaafUi5z/VIW/gFM+u8v+t6X6ta/HwiRu28QmaUxz
	086JVTajHj4KzliQHZ/WHPgYz5dtDKrGAQhOUzc/SNHwCSkHozs3fVCVU3NGyN68tSu62aIVpJ68W
	5Ry7L9iQ==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unh1A-00000005u0Z-3INF;
	Sun, 17 Aug 2025 17:18:04 +0000
Message-ID: <a863e29c-11df-4afa-82f5-bdbe987220c2@infradead.org>
Date: Sun, 17 Aug 2025 10:18:04 -0700
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kernel-parameters.rst: fix document warnings
To: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>, corbet@lwn.net
Cc: skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20250817122244.26590-1-kubik.bartlomiej@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250817122244.26590-1-kubik.bartlomiej@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 8/17/25 5:22 AM, Bartlomiej Kubik wrote:
> found/fix two warnings in kernel-parameters.rst.
> 
> -> WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
> -> WARNING: Possible repeated word: 'that'
> 
> command: 
> ./scripts/checkpatch.pl --strict -f Documentation/admin-guide/kernel-parameters.rst
> 
> 
> Signed-off-by: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
> ---
>  Documentation/admin-guide/kernel-parameters.rst | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.rst b/Documentation/admin-guide/kernel-parameters.rst
> index 39d0e7ff0965..445248787e77 100644
> --- a/Documentation/admin-guide/kernel-parameters.rst
> +++ b/Documentation/admin-guide/kernel-parameters.rst
> @@ -1,3 +1,5 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
>  .. _kernelparameters:
>  
>  The kernel's command-line parameters
> @@ -213,7 +215,7 @@ need or coordination with <Documentation/arch/x86/boot.rst>.
>  There are also arch-specific kernel-parameters not documented here.
>  
>  Note that ALL kernel parameters listed below are CASE SENSITIVE, and that
> -a trailing = on the name of any parameter states that that parameter will

While that may be a little confusing, and it reported as a "Possible repeated
word," I can read it and not see any problem with it.

A satisfactory change IMO would be to say "states that the parameter".

> +a trailing = on the name of any parameter states that parameter will
>  be entered as an environment variable, whereas its absence indicates that
>  it will appear as a kernel argument readable via /proc/cmdline by programs
>  running once the system is up.

-- 
~Randy

