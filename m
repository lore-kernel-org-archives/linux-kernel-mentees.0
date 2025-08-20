Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37FA25A2D2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 20 Aug 2025 18:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755714750; cv=none; b=KmykBmSdCTSb+T8NVj2331B4ZQif7lWGf1E95is7rN0kdBC4zZqZnoC+lPa2WWatrhBM/ylNvtoc80h5KhqQigEdAa2rvtXmAI6Q3oPruF/wYbSLz+eCDBMeF7Vg7ZR7PkqjEL/Wns9z6o1UCpZx+e/V+WQkacVOZ8mwjxKuLek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755714750; c=relaxed/simple;
	bh=sPmqSitvB0v6mEUeWYf2NHAGdyCmTuIzM9XDmsGb5Fc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N/INXI1GOHp3Pe2JIZhwUOcI2pGKa0ykQITVf/v+y2qOaHPRP+SiCZ3ygyXcCn/FtOzem7tP6Aaz9tSaWXFaEMKihNBansMsrPM9ipgKXqhOLJsVeeVlP6hj2IC/sbd51UxpL/w02q/qg7zcUA3r3bP1XRmFEFLRCtRpq1b73/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=q/FjGWgG; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="q/FjGWgG"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8134E83C31
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 20 Aug 2025 18:32:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.398
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GopJ94bnSpUv for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Aug 2025 18:32:27 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4E7B783C30
Authentication-Results: smtp1.osuosl.org; dmarc=none (p=none dis=none) header.from=infradead.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E7B783C30
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q/FjGWgG
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4E7B783C30
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 20 Aug 2025 18:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=/IcasXGt5PbdoVVXgghzry42yNZ+BKaeuG0k8SwqEiE=; b=q/FjGWgGcZoyCpEvqzRf8l3Zr/
	JIlfqELevVDHITw5RFmNo9AMXsyBB/1XndCSGlTd09RzWkrSjxKUJIjufaLYz8yxfwKpy8ND60NJs
	76hOsgpGJ+w0JikLmP6MoRsLeA1o9dfAEBPJvORLXkuEWebNamwm+TiBY4A3uaZ+rhmjKxj4UFaBg
	hZKIUQcipMHbmvUS2rvgor0hab0mUAzjR3Y34FzVMejhHia/4mMiFgK2cGU7j54FxNt8M8wez2KoO
	vyvtac4XHa1fdJm5170GVZz3r2HJ+QfgDdX+AwW+PcRxDvPmBvIDOlXXXC4jpx5TO5d5arqEghy9q
	ZHy/YFwA==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uonbe-0000000EgzN-1F8t;
	Wed, 20 Aug 2025 18:32:18 +0000
Message-ID: <1fc93d62-eb77-46a6-964f-c0bc7348d482@infradead.org>
Date: Wed, 20 Aug 2025 11:32:17 -0700
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: gpu: Fix spelling mistakes
To: Rakuram Eswaran <rakuram.e96@gmail.com>, linux-doc@vger.kernel.org,
 alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 corbet@lwn.net
Cc: tzimmermann@suse.de, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, simona@ffwll.ch, siqueira@igalia.com,
 harry.wentland@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org
References: <20250820182259.11227-1-rakuram.e96@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250820182259.11227-1-rakuram.e96@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 8/20/25 11:22 AM, Rakuram Eswaran wrote:
> Fixed following typos reported by Codespell
> 
> 1. filp ==> flip
> In Documentation/gpu/drm-mm.rst
> 

No, that's a "struct file pointer". filp is correct.
See include/drm/drm_gem.h

The others look good.

One more comment below.

> 
> Signed-off-by: Rakuram Eswaran <rakuram.e96@gmail.com>
> ---
>  Documentation/gpu/amdgpu/debugfs.rst                       | 4 ++--
>  Documentation/gpu/amdgpu/display/programming-model-dcn.rst | 2 +-
>  Documentation/gpu/amdgpu/process-isolation.rst             | 2 +-
>  Documentation/gpu/drm-mm.rst                               | 2 +-
>  Documentation/gpu/drm-uapi.rst                             | 2 +-
>  Documentation/gpu/todo.rst                                 | 4 ++--
>  6 files changed, 8 insertions(+), 8 deletions(-)
> 

> diff --git a/Documentation/gpu/amdgpu/process-isolation.rst b/Documentation/gpu/amdgpu/process-isolation.rst
> index 6b6d70e357a7..c1297a9e4d09 100644
> --- a/Documentation/gpu/amdgpu/process-isolation.rst
> +++ b/Documentation/gpu/amdgpu/process-isolation.rst
> @@ -26,7 +26,7 @@ Example of enabling enforce isolation on a GPU with multiple partitions:
>      $ cat /sys/class/drm/card0/device/enforce_isolation
>      1 0 1 0
>  
> -The output indicates that enforce isolation is enabled on zeroth and second parition and disabled on first and fourth parition.
> +The output indicates that enforce isolation is enabled on zeroth and second partition and disabled on first and fourth partition.
It looks like "fourth" should be "third" here.

-- 
~Randy

