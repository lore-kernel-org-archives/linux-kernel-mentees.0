Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA501AC432
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 31 Jul 2024 09:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722418709; cv=none; b=M2yTyvUMP+hiO/uTY7v1mdiMezPqcv4WJxJ8XRbyjPatfX1fNNXEWE6oViPMnZti6ZasU5mpJZEEoc8AScpocm8yMh8Yl1C7Y7p21qLqshYf+vhlqrwPiX3l0KxrUcduKRthObZyZilpEQVTX8gy5L9DXxXHxDj0zIBhsjGctkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722418709; c=relaxed/simple;
	bh=El/OlgAxq9TxrIRKfWMSE97vAAk/9ll8cfMmyIfgNj8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SOdY5FEbdSP6pP/U+DdifMNrjkNiBLkuB5GxV0KbECm+UwxKgn/Op3NKHmdJofhUV6J7l3VQKAldgw0VjWSdQZ0gk3J3tnUmyd/pqNI9xgrRfzpfKAglqAbXEDSjHhhxIaOOvnj68718MbE+MEQPNs+AN/cvYu8Fj5+vmSdvFRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IZI1PKMD; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IZI1PKMD"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB09C405C5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 31 Jul 2024 09:38:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.3
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PKnLeX1upBAj for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 31 Jul 2024 09:38:27 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=192.198.163.19; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9BD6F40470
Authentication-Results: smtp2.osuosl.org; dmarc=none (p=none dis=none) header.from=linux.intel.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BD6F40470
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IZI1PKMD
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 9BD6F40470
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 31 Jul 2024 09:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722418706; x=1753954706;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=El/OlgAxq9TxrIRKfWMSE97vAAk/9ll8cfMmyIfgNj8=;
  b=IZI1PKMDa9b0qdMOgFO1rVDGqhPS3sf3hPCVJWzSVDsf6wRy0h+z9d0B
   NE5aqbr7KSCf5GyITpepa8FeFfjlxMEmM/v1hLQo2IR6TI0/ts3aoCNz4
   Nh1mg/8VLfiAXitMvgyxwIdcsha5aZo53Rw9/CdkYmVJ7t87lHUNzDA0d
   sZwMEvfF/pZE5x7J1UT04gFKqlLkeO9xKJ61sTmBvfssHBdn8m2Zgl+cv
   hKYz7MdufQUeqXFX74Wd7beEI6JjFSYGdOTiZFFL9knDH6+6ke1WgrL2T
   PyiTkJCLIb3Q4EhmOwwjXBJcEnNlygKJw1i//YAAz56VSZxNJQbQQJ3NS
   Q==;
X-CSE-ConnectionGUID: 5h/xYDvFQ5WT/I2e6fT47Q==
X-CSE-MsgGUID: yv8CLW8PTHyYfWyb4ylALw==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="19977567"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="19977567"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 02:38:21 -0700
X-CSE-ConnectionGUID: Wqu9KbqWRn2Bk4IWFP+HLg==
X-CSE-MsgGUID: AjgKXyRrRC+PlpZVc2jZ0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="58755505"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.118])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 02:38:19 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: W_Armin@gmx.de, corbet@lwn.net, 
 Luis Felipe Hernandez <luis.hernandez093@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org
In-Reply-To: <20240731001602.259338-1-luis.hernandez093@gmail.com>
References: <20240731001602.259338-1-luis.hernandez093@gmail.com>
Subject: Re: [PATCH v3] platform/x86: msi-wmi-platform: Fix spelling
 mistakes
Message-Id: <172241869235.1738.12798114511419991351.b4-ty@linux.intel.com>
Date: Wed, 31 Jul 2024 12:38:12 +0300
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Tue, 30 Jul 2024 20:15:59 -0400, Luis Felipe Hernandez wrote:

> There were a few instances of typos that lead could to confusion
> when reading. The following words have been corrected:
> Binay -> Binary
> singe -> single
> chaged -> changed
> 
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo branch. Note it will show up in the public
platform-drivers-x86/review-ilpo branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: msi-wmi-platform: Fix spelling mistakes
      commit: 6e73c490445ae77c52f62fcf9a49193d17c6f79a

--
 i.

