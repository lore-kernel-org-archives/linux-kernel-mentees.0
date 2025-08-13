Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358382877F1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 13 Aug 2025 17:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755107301; cv=none; b=jON+I61oLHtTk55ffZr/GYxGQLHLxohdUdIdgkSDhy/lDUZ30sb9eER78VTxoposGYxeIlWqixB1YrOegX7vUpakgusxv+XX5ucoZg2bNLth8qtoKGFpGEs+uJP9Q5Y3EXVntohKalx8c1jqwWarGmloVrCkO5eM9DxGd3HlQs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755107301; c=relaxed/simple;
	bh=t5lSA6nKiMR3E1kI5QFkQD2u7ryrd49eosyt53kLnio=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u9Tl1K3SAR2IB7tN0x2yiBcL4VP0pP0g/pBzRtp2/vk5JRThWlu/OZVKuN7316lggUv8kWtojIjbLox2t7n/kPL1ddqgIoHgqOwqeXwlUJhAdTFAxjnL5qx9lOWSi6w7w1yL7wN9udnGEPCkpDy8jHeLvLRckJk+h0JS1d9fXr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=uXeCFrUC; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="uXeCFrUC"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE30B8305A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 13 Aug 2025 17:48:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.398
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bXjMwPA9RcuG for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Aug 2025 17:48:19 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8518B83046
Authentication-Results: smtp1.osuosl.org; dmarc=none (p=none dis=none) header.from=infradead.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8518B83046
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uXeCFrUC
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 8518B83046
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 13 Aug 2025 17:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=DRAQ0C1Hyq1GkALVW/K/qHwTuWG3xsoWi585SpljGp0=; b=uXeCFrUCiF7yXXamFrQWANEvff
	6I0FAbOh+dMHxYX9n+Pf9Vy+mZvFqn39PB6M+YySawLfxVmizkQJP6lNe/FmqmrJ4HafkgsUMIS2V
	QZhpp2t7gCAzK2kilhWC457PmGJnuOcysv4wPoRqoqYyHicjA5FBupjEJf1IMVJSTTvuWBMyVBZlG
	xM9SebJ/tP/NpVgDkLoWMzeCuyM4RR4sfQfwaeoRurcmuwXz5czn/x7Qqv3bsVIz+di2aIv0Dh4tk
	wGyi2uUhk+L2hsEe0bO4CgIwHFMNplUCKyJlkZvk+4z7f8xgZNopn9FgVoYMLmbkgZgKlTc1E7hrn
	sfUfYVCg==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umFa9-0000000Ec7U-3Ekw;
	Wed, 13 Aug 2025 17:48:13 +0000
Message-ID: <970be4df-e010-4ba2-b2e9-c2c24b8742ef@infradead.org>
Date: Wed, 13 Aug 2025 10:48:13 -0700
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [PATCH] Documentation/kernel_hacking: Fix minor typo in
 hacking.rst
To: rakuram <rakuram.e96@gmail.com>, linux-doc@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 skhan@linuxfoundation.org, corbet@lwn.net, ukleinek@kernel.org
References: <20250813174326.6544-1-rakuram.e96@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250813174326.6544-1-rakuram.e96@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/13/25 10:43 AM, rakuram wrote:
> fixed the following typo in 'Documentation/kernel-hacking/hacking.rst'
> compatability --> compatibility
> 
> Signed-off-by: rakuram <rakuram.e96@gmail.com>

Hi,
Please see the previous such patch attempt here:
  https://lore.kernel.org/linux-doc/87jz6ckeux.fsf@trenco.lwn.net/

Thanks.

> ---
>  Documentation/kernel-hacking/hacking.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/kernel-hacking/hacking.rst b/Documentation/kernel-hacking/hacking.rst
> index 0042776a9e17..22b880add846 100644
> --- a/Documentation/kernel-hacking/hacking.rst
> +++ b/Documentation/kernel-hacking/hacking.rst
> @@ -794,7 +794,7 @@ Some favorites from browsing the source. Feel free to add to this list.
>  ``arch/sparc/kernel/head.S:``::
>  
>      /*
> -     * Sun people can't spell worth damn. "compatability" indeed.
> +     * Sun people can't spell worth damn. "compatibility" indeed.
>       * At least we *know* we can't spell, and use a spell-checker.
>       */
>  

-- 
~Randy

