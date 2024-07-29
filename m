Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EAA15EFCD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 29 Jul 2024 17:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722272446; cv=none; b=ODXBFNDXQq5OK9jY5n4ZvwZInbNJvB8N4YbdNOgvrHgDuw5UfByzXXdZVWbezWuTEjLb/alV1kzzrNPo+lc9/A3KWfazBMlpOjrbc46XGSTAgD+335a4uJ+Daa1tinHknUoYfLC4pJu0iozpSOd7MuLyKVQPFLA9PssGeh2qpV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722272446; c=relaxed/simple;
	bh=IFkGlrBeSobkW77QizdeJQdd6iLBy/wzKY7LKGO4qt0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ZjX3GMvsTL3CpFBfZZF8vNDC0FzhNaefpUKNI/l+/CfDJZg7FzzK+p8A1GPjDUsnj06vtLeetWgz+2VDjVx3Pb5LB/ZrM+X6HwRaCoAPb5evR8aFWMGZ6Cww0YxahZz20oxmTFiUWYBBXoMrnX4hccaYM1jivTrRYCYm/6cjkVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IQJN7uTL; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IQJN7uTL"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACFB44055D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 29 Jul 2024 17:00:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.299
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id id71W3kWca3N for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jul 2024 17:00:43 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=198.175.65.11; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2E391403B5
Authentication-Results: smtp4.osuosl.org; dmarc=none (p=none dis=none) header.from=linux.intel.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E391403B5
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IQJN7uTL
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 2E391403B5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 29 Jul 2024 17:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722272443; x=1753808443;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=IFkGlrBeSobkW77QizdeJQdd6iLBy/wzKY7LKGO4qt0=;
  b=IQJN7uTLrCOMw5JRn7vmNDQon3lH+SBsIWfc6tjImCPzhqvN1mSlUwTc
   4ZUX5Z/vIeMbtursQ/XPqmnLTg6JSQVzNnq8Y00YuCMhJBPc76WsIqSSr
   C0hgWgNmjE3Fcl+717cB0cHoo1pjnJIiyCzhhtG+KzEDNDq/3A6Is6TCl
   HMrpQP2nQjhLxt+0VCI+p2B+vWuTh4JwX0LAt+9JFW6LKmffDS9NvYsaA
   FrzH41O1VLZTRWXFCtuk26u4C6Pdj4+lsaRpUurIDksdkva5KjCi0I9EW
   2QvhpywMVqmFaXtpDrOx8ip0iB99nqSwI4BVOD5fqnXYfagjEzKzl7nBo
   A==;
X-CSE-ConnectionGUID: 4ZacHUPKRg6og6SBqm/NLw==
X-CSE-MsgGUID: m7YnsGxARQe4a/gzzFR39A==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="30634422"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; 
   d="scan'208";a="30634422"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 10:00:41 -0700
X-CSE-ConnectionGUID: oMkXgV2xQoWbjW6vrWpmSA==
X-CSE-MsgGUID: 1J557ww0SsihsETU/nwh8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; 
   d="scan'208";a="58625745"
Received: from fpallare-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.214])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 10:00:38 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 29 Jul 2024 20:00:34 +0300 (EEST)
To: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
cc: W_Armin@gmx.de, corbet@lwn.net, platform-driver-x86@vger.kernel.org, 
    linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] wmi: Fix spelling
In-Reply-To: <20240729164721.125708-1-luis.hernandez093@gmail.com>
Message-ID: <ec63657f-93d1-919b-f87f-eebb13c8938e@linux.intel.com>
References: <20240729164721.125708-1-luis.hernandez093@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 29 Jul 2024, Luis Felipe Hernandez wrote:

Thanks for this change but please don't leave the commit message empty, 
it's not enough to provide just the shortlog (in subject) even if the 
change is obvious/simple. Please resubmit this with the commit message
included.

-- 
 i.


> Signed-off-by: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
> ---
>  Documentation/wmi/devices/msi-wmi-platform.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/wmi/devices/msi-wmi-platform.rst b/Documentation/wmi/devices/msi-wmi-platform.rst
> index 29b1b2e6d42c..31a136942892 100644
> --- a/Documentation/wmi/devices/msi-wmi-platform.rst
> +++ b/Documentation/wmi/devices/msi-wmi-platform.rst
> @@ -130,12 +130,12 @@ data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility:
>  
>  Due to a peculiarity in how Windows handles the ``CreateByteField()`` ACPI operator (errors only
>  happen when a invalid byte field is ultimately accessed), all methods require a 32 byte input
> -buffer, even if the Binay MOF says otherwise.
> +buffer, even if the Binary MOF says otherwise.
>  
>  The input buffer contains a single byte to select the subfeature to be accessed and 31 bytes of
>  input data, the meaning of which depends on the subfeature being accessed.
>  
> -The output buffer contains a singe byte which signals success or failure (``0x00`` on failure)
> +The output buffer contains a single byte which signals success or failure (``0x00`` on failure)
>  and 31 bytes of output data, the meaning if which depends on the subfeature being accessed.
>  
>  WMI method Get_EC()
> @@ -147,7 +147,7 @@ data contains a flag byte and a 28 byte controller firmware version string.
>  The first 4 bits of the flag byte contain the minor version of the embedded controller interface,
>  with the next 2 bits containing the major version of the embedded controller interface.
>  
> -The 7th bit signals if the embedded controller page chaged (exact meaning is unknown), and the
> +The 7th bit signals if the embedded controller page changed (exact meaning is unknown), and the
>  last bit signals if the platform is a Tigerlake platform.
>  
>  The MSI software seems to only use this interface when the last bit is set.
> 
