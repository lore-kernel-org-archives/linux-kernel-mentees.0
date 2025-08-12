Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732ED285043
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Aug 2025 19:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755025447; cv=none; b=HYf63Qs4TmdAQKwzti/hVCLmXUXWGVxy5z0tfv0wPULUUvNrrMgRifPNrJWb4QgGjPhhSEhbyQt2b29q+7vMzdvJ4aqVqhix/Vnkl+kR9DMu8JXfBJFvSqZM2xse0aiI/iKNp8Tn+KNKYwRpyYnqpddfhXtBdvI/Usf5LLPhvRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755025447; c=relaxed/simple;
	bh=9Wnyfu+XaOOZnlufreHhCk7JiqaiO+DPUVXZqATdgmw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VonUiERS34S/Ex5nheHrqjyqlZUDS4ccotxLAVJwm97kWk6zalCkJ8EUYg2G+Y4qjD+4/k+ZnKp8sv8kNYr/y8bq6UumxAui6GW83VybV7tborgLZiSDKuIwyc8B5/hjQfNEQFlDHcw6IPdF+CcXXAYXNUGrIvOXAJtUb5DDXy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=1NVraV+b; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="1NVraV+b"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D980C6068D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Aug 2025 19:04:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.499
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SceOYE_-h1t3 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Aug 2025 19:04:04 +0000 (UTC)
X-Greylist: delayed 4495 seconds by postgrey-1.37 at util1.osuosl.org; Tue, 12 Aug 2025 19:04:01 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B4333605E8
Authentication-Results: smtp3.osuosl.org; dmarc=none (p=none dis=none) header.from=infradead.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4333605E8
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1NVraV+b
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN> 
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by smtp3.osuosl.org (Postfix) with ESMTPS id B4333605E8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Aug 2025 19:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=lrPIpyIK37IliP12r4RxpJdSz6iDcvTig/imS+n1pZs=; b=1NVraV+bxzQ/9gCkBMs1wm/QQD
	qHdTa3Y/z2Y7OjG8BwS50zH6FmrAreVNBae/1EbYw7vONudBNG2B0KP//0kqnlH5oBPDDmYpgEbWb
	jZCnVgV2ZeEn4X6B9RWHNSaQGN6dBn521augPEKGhGKiN5YibFQNo3Bfu5a7GKIt0rOHhFlWEoe8+
	cMnzzh3HFsz59ek7TmXb9cCE/XGfhXVJrXaRSlvGraICX769vZ4ciI3YYKgNxdN884lkAjHTzLKzU
	13p5PuvnttDmqxouIIf7yPs9NdUnOaeEUXqnRszz34I7esSGyPCwb/mSbXEu+lmnKd8pCmQ/SZFyx
	SgKhDWew==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ult7M-0000000BeBB-0ekg;
	Tue, 12 Aug 2025 17:49:00 +0000
Message-ID: <36b8eed4-2148-4d73-af9f-5614060f9f54@infradead.org>
Date: Tue, 12 Aug 2025 10:48:59 -0700
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: fix spelling mistakes across multiple directories
To: Soham Metha <sohammetha01@gmail.com>, linux-doc@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 skhan@linuxfoundation.org, jaegeuk@kernel.org, chao@kernel.org,
 dlemoal@kernel.org, hch@lst.de, tj@kernel.org, hannes@cmpxchg.org,
 mkoutny@suse.com, agk@redhat.com, snitzer@kernel.org, mpatocka@redhat.com,
 kuurtb@gmail.com, sj@kernel.org, corbet@lwn.net, chenhuacai@kernel.org,
 kernel@xen0n.name
References: <20250812173903.43333-1-sohammetha01@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250812173903.43333-1-sohammetha01@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

The changes all LGTM, although maintainers will probably want the patch split
up by subsystem.


On 8/12/25 10:39 AM, Soham Metha wrote:

> -Availablity
> +Availability
>  ~~~~~~~~~~~
>  

Whenever a heading is made longer, the underline for it must also be
increased in length; otherwise it causes a build warning.

thanks.
-- 
~Randy

