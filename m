Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA37F2AE8E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 13 Aug 2025 00:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755046410; cv=none; b=Wh2K6Mlzj1Qjll1hPfgldPBpEf3OjEejghr6kX9p5SzVaY09BzpebVXfLvPmvStrOC7v4pfrUiawn4eNYQuC0thMH97sLQkURHa1F0xQiStUiymIWO3VO8ROBVON+tneAh8/vylIfurZJtZhHAJ+7VjEDH69p+3WGlJmEEIsukg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755046410; c=relaxed/simple;
	bh=vtp0RC1sRTsM+aidwfpW673og0T8imyaAXUup4h6biI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g8qFvZ0V+NVd/JoBwng6LasnNMoveqX/864k5/o28sJrJKOh6xiYIq0H135VU70mwr2HPuXDTBa6D5g1TsXyXJ60hVBwT/J3OuS5KR1F5mF+ESDlcj09Pc65iOr055a5Upf4cQEZ1Ykr4WMSpHm27wP35Vw9NyMzmpYrTE/m008=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sqr5my9F; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sqr5my9F"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83CAF41398
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 13 Aug 2025 00:53:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RsFRuC1hc5cJ for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Aug 2025 00:53:28 +0000 (UTC)
X-Greylist: delayed 1132 seconds by postgrey-1.37 at util1.osuosl.org; Wed, 13 Aug 2025 00:53:27 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E2B7D41199
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2B7D41199
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Sqr5my9F
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=dlemoal@kernel.org; receiver=<UNKNOWN> 
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E2B7D41199
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 13 Aug 2025 00:53:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 451DE5C57F4;
	Wed, 13 Aug 2025 00:34:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF329C4CEF0;
	Wed, 13 Aug 2025 00:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755045273;
	bh=vtp0RC1sRTsM+aidwfpW673og0T8imyaAXUup4h6biI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Sqr5my9FYzLh5XZ06mU/2Enj+aYffEhc2/YEfFKM+1fCCLzkiJO7lB0zCNstiMx1E
	 plRUTjFtHPxEyfMNVkmLGjAmYQIrvRO5TeWig/ZMMmmSbFUW6iby1RukB292fU7dbY
	 XkWd8iKwLqhbtcTagyQt1jTm40+IXkOGcIhTQqZORpuJyOPgMsDYNpy7p/Ejc+sgaH
	 TQsJ2sgU8gEuUFoDmxpmM1ZkqUqbl2pocprfrvYfoNS8lZr+AEh0Jaj2zu/hK8Wx3b
	 w3NiIi6a0/xO6g8hB8YFyf0/d2O+K7OHxAZOh69/9FQr2T1Xl05AHz509kBrsBkDnq
	 tdM8NtHFv6coQ==
Message-ID: <25bd83bd-6b39-48cd-b31b-dd6f1df00f94@kernel.org>
Date: Wed, 13 Aug 2025 09:34:31 +0900
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/9] docs: zoned_loop: fixed spelling mistakes in
 documentation
To: Soham Metha <sohammetha01@gmail.com>, linux-doc@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 skhan@linuxfoundation.org, hch@lst.de
References: <20250812202940.70560-1-sohammetha01@gmail.com>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20250812202940.70560-1-sohammetha01@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/13/25 05:29, Soham Metha wrote:
> found/fixed the following typos
> 
> - conventioanl -> conventional
> - directoy -> directory
> 
> in `Documentation/admin-guide/blockdev/zoned_loop.rst`
> 
> Signed-off-by: Soham Metha <sohammetha01@gmail.com>

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research
