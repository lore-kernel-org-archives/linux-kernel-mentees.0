Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D648D359FAA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 24 Apr 2026 08:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777020541; cv=none; b=G2xjAE4IK+cYu5wDjTRTwexo4Lw0ulOheUQAgslj8YJMMod0DS4MRCfglLrIB3uaoY+mc/5cvaNPHJxkF1Wg6tp5wAa4SRgxFdZiU9CyjNBqs0adOJJ4D/l9l9foF2srJB91ML+C4xg7mjJFgaa7SuqjcORk+hJVa3YH2cB6bBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777020541; c=relaxed/simple;
	bh=icLhSJhC/W2Qmmmzj/awXVEbDZZ/hREewT1hmQo06/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n3lLR+zvI21yhpwMnxN47jOM1KzjLkOhTK0fNhVtOD/X7bTF7AJNP5UAtdRx3Y6DYSXRUiNjkGqslYdf5QD3nPXij0hkDJYqYxt7h+Tn1hjz+X4W/g3tZTUozLSJApO2GJ5s20STTsaurki0G7iOeW7AxBdHFxlLIXtaJzaZW4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fv1/lpRy; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fv1/lpRy"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90A5A4239B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 24 Apr 2026 08:48:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -8.092
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B05d9yhvRwwB for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2026 08:48:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@intel.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B87E642385
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=intel.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B87E642385
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Fv1/lpRy
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B87E642385
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 24 Apr 2026 08:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777020539; x=1808556539;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=icLhSJhC/W2Qmmmzj/awXVEbDZZ/hREewT1hmQo06/o=;
  b=Fv1/lpRyl3J+IHg7dDfEWhbKN6/q2AYHWOu5H1pncNCGPS2GdXvBWaZz
   3CWb+cgUWjANgh2YmSsdr/ZoGITaYy7iKQPsoqYrLYRNakRPI6VXHId3B
   SmYOCl2T4cnhAJjWTAoYMzohtmNiZaBxCgbEQspn1l9BzlYMsm5KfEPFZ
   +MVnDhLk95RtezxAPGs7H5sD/kxmRzgXScWY0IkTYD83wlNQRCggGil7e
   kbycHLitVbUp2M1vsfu+Pve0JW/9Zy0kERGDPgqWoMXuU8MAW6a50WWL8
   Dqmrk9sITORLcN9U4F+gz7UNDNSfZGj+uBQyE9AcyBq5fGWFoFAhJ/icc
   g==;
X-CSE-ConnectionGUID: c985VQySSSWgnxCCClh9iQ==
X-CSE-MsgGUID: RM6JrE3fTOG0nTUM112/CQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="89461930"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="89461930"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 01:48:58 -0700
X-CSE-ConnectionGUID: 4LesiDtzQCmmlNgyJzqP0A==
X-CSE-MsgGUID: gD7o+QX3Snaw7iLwvxsRxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="237240515"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.71])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 01:48:55 -0700
Date: Fri, 24 Apr 2026 11:48:52 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Robertus Diawan Chris <robertusdchris@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org, me@brighamcampbell.com
Subject: Re: [PATCH RFT v2] media: atomisp: Add error check in
 create_host_regular_capture_pipeline()
Message-ID: <aesudPcQ8Fec0_VU@ashevche-desk.local>
References: <20260424081538.459564-1-robertusdchris@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260424081538.459564-1-robertusdchris@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Apr 24, 2026 at 03:15:38PM +0700, Robertus Diawan Chris wrote:
> When calling ia_css_pipeline_create_and_add_stage() function, there's no
> condition to check whether ia_css_pipeline_create_and_add_stage() throw
> an error or not. So add conditional check for the return value of
> ia_css_pipeline_create_and_add_stage() function.

> This is reported by Coverity Scan with CID 1408952 as UNUSED_VALUE.

Unneeded detail in the commit message. Use the comment block for that (as there
changelog right now and other stuff you explained).

> Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
> Signed-off-by: Robertus Diawan Chris <robertusdchris@gmail.com>
> ---
> v1 -> v2: Add Fixes tag (suggested by Dan Carpenter).
> 
> v1:
> https://lore.kernel.org/all/20260423060246.296986-1-robertusdchris@gmail.com/
> 
> I am not sure if omitting the error check is intentional or not, but from
> what I see from another ia_css_pipeline_create_and_add_stage() usage
> in the same function, we check the return value after the call and return
> the error code if it's non-zero.

Okay, while this observation sounds like a +1 to the suggested change,
you still need to dive into the code and try to get if
ia_css_pipeline_create_and_add_stage() failure is fatal or not for
create_host_regular_capture_pipeline().

> I also don't have the device to test this change.

It's a pity as this driver is quite complicated thing...

-- 
With Best Regards,
Andy Shevchenko


