Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8DA2253A1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 Aug 2025 22:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755557712; cv=none; b=QUipMv556YntFFxvg4n5ytXg9C3s/mMPza60+gaRGGnWv+QKfw7c52dfTwqJ6gJkuP1Tl6I7GGkAU7i01gk5h6k3/KC1bpRmPJpknbKT9WXQy+1XB7N4iAQF6J+PLZzzWsZanHhvp3FTjr2OVRVBGjB0zeWsEh0YB0MLpJSb7aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755557712; c=relaxed/simple;
	bh=yABuPzITeNVArb4vGkjBSmYeAjILd0FjDQGDML0bCBA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PTL0omJjaxbUTefnqQZj+KwoBlc/b/vr6WsKQHm//A92uZgYMUELrIpAjjrmqRiCq77IYX/dQK3fuTGTo5kVzfosd4nZnaXfQMdkPy2QP+dat3NUA+PjJGpsXE1xGFOmvCSyZorwN345PP1zS9z8EYZMiixXuSNSapFF3BkbVOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L2K6aKqS; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L2K6aKqS"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC9D7606C8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 Aug 2025 22:55:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -8.092
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K65Q_7VTXZD9 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Aug 2025 22:55:09 +0000 (UTC)
X-Greylist: delayed 427 seconds by postgrey-1.37 at util1.osuosl.org; Mon, 18 Aug 2025 22:55:08 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 286BC606C5
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=intel.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 286BC606C5
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L2K6aKqS
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=dave.jiang@intel.com; receiver=<UNKNOWN> 
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 286BC606C5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 Aug 2025 22:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755557709; x=1787093709;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=yABuPzITeNVArb4vGkjBSmYeAjILd0FjDQGDML0bCBA=;
  b=L2K6aKqS3Rvj+q1sfXvbsEJ2qjBEpYfN/YMs7t1JERjcAOPoSeIqb0mb
   vdz+uhCJ5aRdHW+AqJthZT09QT5gSSo7OicWAuh+vP4NlAdx/wXdOE5yg
   aUQYnkjWh1G7MGVh+eF3bgYONotYLMA1xgBN0VcosVRCvNyjLv1SsMZ/n
   tWxA7LOV27vx1OJ86OlRpfNLV+A81AfM5Zoae7Dhl3R4f5Y9PBg5j9z8Z
   EUKFhD566E1UTtwdnI+R7ga6ULM9f9sYh8iqiSuTD+prJc7MPWT3dm1TJ
   trrsTEIbTSKtqvmjdOx1fQpWRu2qGI0C33NkKcZHUfUQV4MjrqZlrcAAy
   Q==;
X-CSE-ConnectionGUID: wFOjLSyXSfex+/grBHeutA==
X-CSE-MsgGUID: 5Id1jsLkR0a0Jw6kgYhYEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="45366596"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="45366596"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 15:48:01 -0700
X-CSE-ConnectionGUID: xARAHPI0S+eJ+dA8HckXWw==
X-CSE-MsgGUID: nc/jVO4VT8mF78OAKfgplA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="198550778"
Received: from bvivekan-mobl2.gar.corp.intel.com (HELO [10.247.119.196]) ([10.247.119.196])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 15:47:54 -0700
Message-ID: <1232c1c6-5bea-4378-b3ee-041b75a87b94@intel.com>
Date: Mon, 18 Aug 2025 15:47:49 -0700
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] Documentation/driver-api: Fix typo error in cxl
To: Rakuram Eswaran <rakuram.e96@gmail.com>, linux-doc@vger.kernel.org
Cc: dan.j.williams@intel.com, dave@stgolabs.net, jonathan.cameron@huawei.com,
 vishal.l.verma@intel.com, ira.weiny@intel.com, linux-cxl@vger.kernel.org,
 alison.schofield@intel.com, gourry@gourry.net, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org, corbet@lwn.net
References: <20250818175335.5312-1-rakuram.e96@gmail.com>
Content-Language: en-US
From: Dave Jiang <dave.jiang@intel.com>
In-Reply-To: <20250818175335.5312-1-rakuram.e96@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/18/25 10:53 AM, Rakuram Eswaran wrote:
> Fixed the following typo errors
> 
> intersparsed ==> interspersed
> in Documentation/driver-api/cxl/platform/bios-and-efi.rst
> 
> ---
> Changelog:
> 
> Changes since v2:
> - Fixed Signed-off-by line to include fullname
>   (feedback from Jonathan Corbet)
> 
> Changes since v1:
> - Dropped fix for page-allocator.rst as requested by Gregory
> 
> Suggested-by: Gregory Price <gourry@gourry.net> 
> Signed-off-by: Rakuram Eswaran <rakuram.e96@gmail.com>

Reviewed-by: Dave Jiang <dave.jiang@intel.com>
> ---
>  Documentation/driver-api/cxl/platform/bios-and-efi.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/driver-api/cxl/platform/bios-and-efi.rst b/Documentation/driver-api/cxl/platform/bios-and-efi.rst
> index 645322632cc9..a9aa0ccd92af 100644
> --- a/Documentation/driver-api/cxl/platform/bios-and-efi.rst
> +++ b/Documentation/driver-api/cxl/platform/bios-and-efi.rst
> @@ -202,7 +202,7 @@ future and such a configuration should be avoided.
>  
>  Memory Holes
>  ------------
> -If your platform includes memory holes intersparsed between your CXL memory, it
> +If your platform includes memory holes interspersed between your CXL memory, it
>  is recommended to utilize multiple decoders to cover these regions of memory,
>  rather than try to program the decoders to accept the entire range and expect
>  Linux to manage the overlap.

