Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1AF2D94BC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 03:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755745597; cv=none; b=BZmiIj6kmf9Hbq5JvflLvVtiMIpx/9vL7FeJyYVkF0UgmJTjiS8D4uos1RunTF9jvHPoRW5ZyRGiclWAcO3gAoNG/MH7m8xGV52MOYitudQdiVih/R876xmo5gt+MbNqFgJgWk0UbHoP7RL2gRv2K36fEfgxDKyRkvZhhQtZ4CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755745597; c=relaxed/simple;
	bh=/CQU+pgB2TsyKM5TEeSk4WJeYgiQiaAeoxcIf4oo4J8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZVtcGASGo0yVWtyh2IvgIAUk8l+XHdnFZHuOdfx9jeyNSUSV41SB3QShnw4ld8P++1rwkNo8bX158jzpKvqB9g7QBgZTAwwiKFhnKTnWBKdSKFVoD6A2M9pcxiorJn5fZ7su64W7325NqetyTNs4Ca7v8tUdQ14jAnXlN37+Pk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=d7HeN6U1; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="d7HeN6U1"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8ABE823C0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 03:06:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.398
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ASA5wBjANSPz for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Aug 2025 03:06:34 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B68E782377
Authentication-Results: smtp1.osuosl.org; dmarc=none (p=none dis=none) header.from=infradead.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B68E782377
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d7HeN6U1
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by smtp1.osuosl.org (Postfix) with ESMTPS id B68E782377
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 03:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=hyX8lYPAronULWeVXJ+quZoKMwRITcvWkFrMcTYt3L4=; b=d7HeN6U1qx7JRmLdDoHfTDeEQL
	ozU0H8deFujGarIRqlpaRlA3847cObTumeb/HMHK+k8/3P5fcjDJsMp9wu9n64nfbIcJuiAbkP9ZY
	Hk7toPD+Z11Ss5F/wQ02z12RaXemmkuW6qg4DhvdUb6x+nkNdaN/7K2WmqtYsxjN+Sn2MV/EvS+cI
	fBwkEjVZDl3ivJmXvUHrGJIjH09JbzehGu8bW6m9vVdaNGqddEjVz7cppfLo1aSltyXoK2uFGWFZG
	FeA7T2B4wJHkCzqEPnYCUsYXMpS+z7qHtU8KAIyGj6KEIwyo8VrTqlfIEH4RyJnq7eAiw2X+OHiSS
	LxY5lnLw==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uovd9-0000000Fayb-3xBh;
	Thu, 21 Aug 2025 03:06:23 +0000
Message-ID: <0254008f-1cdf-480f-ad6f-8f002b35d754@infradead.org>
Date: Wed, 20 Aug 2025 20:06:23 -0700
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] docs: gpu: amdgpu: Fix spelling in amdgpu
 documentation
To: Rakuram Eswaran <rakuram.e96@gmail.com>, linux-doc@vger.kernel.org,
 alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 corbet@lwn.net
Cc: tzimmermann@suse.de, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, simona@ffwll.ch, siqueira@igalia.com,
 harry.wentland@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org
References: <20250821025957.22546-1-rakuram.e96@gmail.com>
 <20250821025957.22546-2-rakuram.e96@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250821025957.22546-2-rakuram.e96@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/20/25 7:59 PM, Rakuram Eswaran wrote:
> Fixed following typos reported by Codespell
> 
> 1. propogated ==> propagated
>    aperatures ==> apertures
> In Documentation/gpu/amdgpu/debugfs.rst
> 
> 2. parition ==> partition
> In Documentation/gpu/amdgpu/process-isolation.rst
> 
> 3. conections ==> connections
> In Documentation/gpu/amdgpu/display/programming-model-dcn.rst
> 
> In addition to above,
> Fixed wrong bit-partition naming in gpu/amdgpu/process-isolation.rst
> from "fourth" partition to "third" partition.
> 
> Suggested-by: Randy Dunlap <rdunlap@infradead.org>
> Suggested-by: Alexander Deucher <Alexander.Deucher@amd.com>
> Signed-off-by: Rakuram Eswaran <rakuram.e96@gmail.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  Documentation/gpu/amdgpu/debugfs.rst                       | 4 ++--
>  Documentation/gpu/amdgpu/display/programming-model-dcn.rst | 2 +-
>  Documentation/gpu/amdgpu/process-isolation.rst             | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)


-- 
~Randy
