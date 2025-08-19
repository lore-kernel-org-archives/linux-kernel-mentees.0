Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A3A2FD7DF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Aug 2025 17:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755623992; cv=none; b=VpEe50ZYIBUGamzdkYm+wSv5KHOE/ovmPGqG9fgn010fJeFVfDY/1OsmnBGoTk8Z9sF7J2Eq20K64BCGRJ8nbBkvSm2/4BOEWgE6wKI0e2KvClwtReGcXTlVjlciPWwbje79TrgT9cMc8rkeqZ4w/X14KHZp7nqEK6Ag0HC3pAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755623992; c=relaxed/simple;
	bh=EbEK+wUrPFyIZL6ejm/I4ihD2VipDGgycgoNU3ybRV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VITmth76wredDBltfzLz8E5iMISBKBfgjPppWBK2bJmWl+42V5Bd+2DRue9KhkjJYgXR1bcGj+Bc9eX4VjOuL/h8CvBLBDYOK7zvWjDGZf2iK09gLvANZgzSMv8/N/TCYFaBD1f9MDyIscWTByzE8iqPMOI5JGZ8axvGWmGLCR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=eZBb9Ex3; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="eZBb9Ex3"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB13D60B89
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Aug 2025 17:19:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.398
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0cjnamM2YjFG for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 Aug 2025 17:19:50 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C911360B79
Authentication-Results: smtp3.osuosl.org; dmarc=none (p=none dis=none) header.from=infradead.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C911360B79
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eZBb9Ex3
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by smtp3.osuosl.org (Postfix) with ESMTPS id C911360B79
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Aug 2025 17:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=IpCPFBFrffqol+gRZf+Avntwhnq8pE3YbK9M7WF2nzI=; b=eZBb9Ex3Av08HbtVD4OinOwJVu
	pSIpTEB+WK0HZKK9y1OJSbtiKlMp9+YNdpXz/sWIjZIPqQ2lkUjHbPZDROwtHp6ilgI6w/P/FQLNr
	c71j2eTSlCH/iDMGrNNUjK5/l1pDatsfGKYy1O/IRA5A0cB3nv0BTzzJZnGQwNvvGAI92oynPBQby
	ibw4laTHwz3q0QjeP55/m1CS0YAB3aZAlW658rhKZisViWuOs7eSEk6wMBdILd15Tf2qQsaTtgNGr
	mzC012kfqJBcS68Gh+knP46fI/uGP0wInodcIHOEN/F0zI+OXtLa+kIMp/54OiID9p2AZR9ooyVz1
	hgWTzNfQ==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoPzw-0000000B5Wl-3QJg;
	Tue, 19 Aug 2025 17:19:48 +0000
Message-ID: <c34602fb-b05d-4daa-a0c7-02fca96166de@infradead.org>
Date: Tue, 19 Aug 2025 10:19:48 -0700
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] docs: replace a duplicated word and add missing
 SPDX-License tag
To: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>, corbet@lwn.net
Cc: skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20250819113551.34356-1-kubik.bartlomiej@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250819113551.34356-1-kubik.bartlomiej@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 8/19/25 4:35 AM, Bartlomiej Kubik wrote:
> Fix documentation issues by removing a duplicated word and adding the
> missing SPDX-License identifier.
> 
> Signed-off-by: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
> 
> Changelog:
> 
> Changes since v2:
> - Replace “that” with “the.”
> 
> Changes since v1:		
> - Add missing SPDX-License tag
> - Remove duplicated word "that"
> 
>  Documentation/admin-guide/kernel-parameters.rst | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.rst b/Documentation/admin-guide/kernel-parameters.rst
> index 39d0e7ff0965..7bf8cc7df6b5 100644
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
> +a trailing = on the name of any parameter states that the parameter will
>  be entered as an environment variable, whereas its absence indicates that
>  it will appear as a kernel argument readable via /proc/cmdline by programs
>  running once the system is up.

-- 
~Randy
