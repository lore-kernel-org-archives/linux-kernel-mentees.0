Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E8E2F4315
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 23 Jul 2025 14:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753281758; cv=none; b=XpULmXgmlUn4aoSgKSlMdpWh6KfPDxwhS9IjgCmA7fURBcVHZCcSIzSjQFbDve08OYPSkKotI27ltfWV2V0ric+pdPJoqHeJ6wEbsCw3hAZD55hQEf8dJ/R/ePFe1R4z31JXGqSci9UcCtnIWqy5H2R/Nrqg4c8vAyGx2gxu8as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753281758; c=relaxed/simple;
	bh=EixATOmvq6d/Vv+wlPKnzbFFsh7ZcTMGBLQS273gUj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fDXged3FskbAB/6apdu+lgZxZz53+bLgR1P/IXUpMvfnDAI6RVIb7/BGikND4ZnApS2fMMM5vW3Q0jrCP4x41jxC/mpMb1mtmtiBFUTpxMMi/Z9hlPvG4bNpVEKUeSoVTLgkdVEp2C1s4oVru84ZPYFcD6XgRn1Xs0VA6+VXzYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nI/wXrWR; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nI/wXrWR"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CAC6F80E78
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 23 Jul 2025 14:42:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -8.092
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vzBA7WVs_cMf for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Jul 2025 14:42:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=192.198.163.12; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@intel.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3CE7180E6F
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=intel.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CE7180E6F
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nI/wXrWR
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3CE7180E6F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 23 Jul 2025 14:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753281755; x=1784817755;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EixATOmvq6d/Vv+wlPKnzbFFsh7ZcTMGBLQS273gUj8=;
  b=nI/wXrWRiJwL4qZ0gFUXxKystKj+lf6WVgMRmH/s+R0T8cYRnBasHTFZ
   jdslmxHjpOsyR8HiteeniQSOmBfNIyKvjlfsKG0B8eBvQFcRFOX1v6wOs
   bz8LWWNB2z/b1GljxzA5ht4bGyRxbZmAaTd5OlK+43YFq9nKg7JC9F6V3
   Av5aaG6+Os98HJ+O+7tQx1ADVbxdpcC2y47cRf2LXzw/t29j2NUHrBKbb
   V4alWtAm/erNlQxte5jGUkmJrKNi4Zo23vLRsTn3F3Z1cQy9WwNPjXt7j
   /njJ3ahNFDAFd5HruvHL5QZoHZRQWBegrNQennblc62e6IzyOPdVZYjqD
   Q==;
X-CSE-ConnectionGUID: hEROM4xwRoOjphwlM5uAiQ==
X-CSE-MsgGUID: yBFbYvunTLuOT6sS6sCreg==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="59380920"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="59380920"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 07:42:34 -0700
X-CSE-ConnectionGUID: 073E5ZBqT/2LTIIiW0yMZQ==
X-CSE-MsgGUID: C9oyC7lPTZeMSwWIXj4f1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="158821994"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 07:42:32 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1ueafs-00000000JdJ-1Mzt;
	Wed, 23 Jul 2025 17:42:28 +0300
Date: Wed, 23 Jul 2025 17:42:28 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Akshay Bansod <akbansd@gmail.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] iio: st_lsm6dsx: Replace scnprintf with sysfs_emit
Message-ID: <aID01DxC1Hf2PK0i@smile.fi.intel.com>
References: <20250723141359.11723-1-akbansd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250723141359.11723-1-akbansd@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jul 23, 2025 at 07:43:59PM +0530, Akshay Bansod wrote:
> Update the sysfs interface for sampling frequency and scale attributes.
> Replace `scnprintf()` with `sysfs_emit_at()` which is PAGE_SIZE-aware
> and recommended for use in sysfs.

...

>  	fs_table = &hw->settings->fs_table[sensor->id];
>  	for (i = 0; i < fs_table->fs_len; i++)
> -		len += scnprintf(buf + len, PAGE_SIZE - len, "0.%09u ",
> -				 fs_table->fs_avl[i].gain);
> -	buf[len - 1] = '\n';
> +		len += sysfs_emit_at(buf, len, "0.%09u ",
> +				     fs_table->fs_avl[i].gain);
> +
> +	sysfs_emit_at(buf, len - 1, "\n");

Still looks a bit weird (while working).

>  	return len;

I deally we should have a helper doing all this under the hood for plenty of
the (existing) users in the kernel.

In any case, I leave this change to others to comment, I don't object pushing
it in this form, either way len - 1 is simply weird.


-- 
With Best Regards,
Andy Shevchenko


