Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E4627A12D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Aug 2025 11:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755603894; cv=none; b=Umg4Jb6vVZn1kB9JEjgQB3kboWJtRWmmXq7yVK5OSHgi556VyfBTt+rHAZ5745w3/uOsFuC81g7DhRiBTlKyJtEFTuwe/SVyiodv6pUrhjhHMJ39yt+mB5Gy2/2OEAH1OZVvdCO6u3WCuxpto7UUxwmDDbyvDaQdA9nKDNZVm0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755603894; c=relaxed/simple;
	bh=tQPDpEhl7zy9pGngPafFjhLpKYU6065+GnNw3KMFusI=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PkQ9EIiLPSTVPfWW1H4ZA7g6AfGx573K2wP4x0nhedQBe8MPNacH/Uq0jyNy4pqxn7Sh0g4DTIfO1VCGuoYViLeRKMfC5FOQwT7UwtXqkAEACpHMFQ1VeL0aVuHFPhKqkEYiqta1nYj/W1dCo6BkcYaoX53cDtiBL/6xYMU1Ar8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2686A807C4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Aug 2025 11:44:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -7.889
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AytVH4nz6-PG for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 Aug 2025 11:44:51 +0000 (UTC)
X-Greylist: delayed 992 seconds by postgrey-1.37 at util1.osuosl.org; Tue, 19 Aug 2025 11:44:49 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 26783806CB
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26783806CB
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=<UNKNOWN> 
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 26783806CB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Aug 2025 11:44:49 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4c5nMg1cSVz6GFtT;
	Tue, 19 Aug 2025 19:26:07 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 2A8D21400DC;
	Tue, 19 Aug 2025 19:28:13 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 19 Aug
 2025 13:28:12 +0200
Date: Tue, 19 Aug 2025 12:28:10 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Moktar SELLAMI <smokthar925@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <linux-cxl@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, Dave Jiang <dave.jiang@intel.com>, "Alison
 Schofield" <alison.schofield@intel.com>, Vishal Verma
	<vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>, Dan Williams
	<dan.j.williams@intel.com>, Jonathan Corbet <corbet@lwn.net>, Gregory Price
	<gourry@gourry.net>, Alok Tiwari <alok.a.tiwari@oracle.com>,
	<linux-kernel-mentees@lists.linuxfoundation.org>, <skhan@linuxfoundation.org>
Subject: Re: [PATCH] Documentation/driver-api: Fix typo error in cxl
Message-ID: <20250819122810.00006ca3@huawei.com>
In-Reply-To: <20250819084116.13108-1-smokthar925@gmail.com>
References: <20250819084116.13108-1-smokthar925@gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
 frapeml500008.china.huawei.com (7.182.85.71)

On Tue, 19 Aug 2025 09:41:16 +0100
Moktar SELLAMI <smokthar925@gmail.com> wrote:

> Fixed Typo in the driver-api/cxl/devices/devices.rst
> 
> functionalty -> functionality
> 
> Signed-off-by: Moktar SELLAMI <smokthar925@gmail.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> ---
>  Documentation/driver-api/cxl/devices/device-types.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/driver-api/cxl/devices/device-types.rst b/Documentation/driver-api/cxl/devices/device-types.rst
> index 923f5d89bc04..7f69dfa4509b 100644
> --- a/Documentation/driver-api/cxl/devices/device-types.rst
> +++ b/Documentation/driver-api/cxl/devices/device-types.rst
> @@ -22,7 +22,7 @@ The basic interaction protocol, similar to PCIe configuration mechanisms.
>  Typically used for initialization, configuration, and I/O access for anything
>  other than memory (CXL.mem) or cache (CXL.cache) operations.
>  
> -The Linux CXL driver exposes access to .io functionalty via the various sysfs
> +The Linux CXL driver exposes access to .io functionality via the various sysfs
>  interfaces and /dev/cxl/ devices (which exposes direct access to device
>  mailboxes).
>  

