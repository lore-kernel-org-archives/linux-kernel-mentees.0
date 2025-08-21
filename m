Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4099B2E3718
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 17:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755797954; cv=none; b=a/G/Iri5Ws+QNHC7/zQWkbWKi7+u9nKfXZTqcp8GOAsZ0YvPZ61dEli9s1PsPA9nN4CB2KA6aS2OsHl6f9WSi4QjY4sAbqZjZqd8Wuzfq65ejI9YlvIpQ5gSM+zYrsjENFV6Ni2VldLyEefQ/XZFdfB6LPAG9RHD6h5tLEx4gO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755797954; c=relaxed/simple;
	bh=QkUqQ3zvMKz0kwF5LuYb7dPTc8lI1Aq+1yTo+jAi8q4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h9n5LT3xcGrB33N/upiB7oP0Wz03N5Qy1qExGwR7GUvo+IGkbidi9c9AHmb+I0aahU6XHEHr/LTkBUVCANYv3jgPBsemO/hOUzqBY0fOMEKQ10h8XbGC5bJxLw0VVuRbVJspU/5BcIzioFHij9lj9EEcsdZwvp8zYA8l3FtGmfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e3YIPa+u; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e3YIPa+u"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF3666148C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 17:39:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -8.092
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mzmbqe24askv for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Aug 2025 17:39:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=dave.jiang@intel.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 08E7F61315
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=intel.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08E7F61315
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e3YIPa+u
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 08E7F61315
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 17:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755797952; x=1787333952;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=QkUqQ3zvMKz0kwF5LuYb7dPTc8lI1Aq+1yTo+jAi8q4=;
  b=e3YIPa+uEPZw+5rN1EXk7PzVSgtrgFujfSBuBMNatk3RQ1vRffdD02Al
   c/MJt6OaNFIk6u1i9UC/rTFNZ4gINcEXWa59lc1WA3MkuKMAETKFTIxLw
   raNw19Nd3Zx7mHsUVh7E5hj9iJ7dDY8hKVH2npg9mNLGctwJ24ee4cCu7
   bq2Dma6tgQi0KuljFczFK2sbLUz/T6IIpiGWBSd+mPII/2Xp2u4BE0Onq
   a3i6UDSTMfCaU4RMXrSmwEk7s6UB2L424IfqdXOaWEFK8xQsIm/NW6Wq/
   WMLHO30Knon/XeBMkzeJr2gyQ4wCptmPbhN6cMD1k7pEvk00QjorLzm3u
   w==;
X-CSE-ConnectionGUID: kXXlBz8lQeS4IYqRIP+guA==
X-CSE-MsgGUID: K1YkunHcT0WZMoFqpXlZEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58166494"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="58166494"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 10:39:10 -0700
X-CSE-ConnectionGUID: 0g9v6kcyRjG2mrRUEjPaaQ==
X-CSE-MsgGUID: 7vEKTR1VRdqY9c/BKGa2mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="199346532"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO [10.247.119.210]) ([10.247.119.210])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 10:39:04 -0700
Message-ID: <690d68e2-1efd-4de4-8b78-3a75c71d944e@intel.com>
Date: Thu, 21 Aug 2025 10:38:58 -0700
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

applied to cxl/next
561c4e30bff93b3c33e694a459f8580f8a6b3c8c

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

