Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FE91FF1B2
	for <linux-kernel-mentees@lists.linux.dev>; Fri,  1 Aug 2025 07:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754034977; cv=none; b=WhfhWSECcRydPqUhm6jjiq5O6Wlf6RpZk4koTnJzdCgX23GNGaYh3kbXwwxQaQQq24Vx7bZyQzhWlx7ffVHeXWLeRvi2An60tywOSnVFD73BFSEWIgy247W337td/eVTz9Y7dU3sblWpVjB/xKuto6uv8aqrfImcYYEC06A9KA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754034977; c=relaxed/simple;
	bh=2UMcEhhoZlhjw6r12HgvrQgNjxVVNgnGO710rWLwQRU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PB7YGiJM9foy2qCrDL0AMHEe0oB1tbC71PcenYCzMSufHh/9b++u47cdmhorPVVKgEsxrqzZ6+h/LY8oJoOevZYIdbACSjeMEq7u6GTxzj1fY7W2KZNT8S8Ix+i+oTd2Gnw3+J7fXFsY1W6tDs+VR0FLhiH2Lo3vPf4T35fjo8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A7LQrwdp; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A7LQrwdp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754034975; x=1785570975;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=2UMcEhhoZlhjw6r12HgvrQgNjxVVNgnGO710rWLwQRU=;
  b=A7LQrwdp6+YYy7FZVHA6dYgLQ15zhLqLsNnX9vruxhUZ4YJmZI6Lev/9
   oasOsoisnNYxTd9kB6R3rAGsgWMwz5YuVen65rTwD90Zilq1d2OkPCET1
   ErxY8BOH6xrC+zQe0e26QX0TX8Wv8GI+7ELX7UdKmQ9XjxqRELrEUN6I/
   TuRr9oN4tYTUs/IDdaNtOJWK1ME9DlpAkS/qZ2rRqQvtcECXo2/RYa68a
   0mfqIroihqdw/AqWupKA3+2J350CyLT6htqT4mDAHiBGKJzRFeNGYO1O3
   eg9AjsIkKLKP2yzd7k7YdmHwRy21Ga6fCdZySGezDbO0UunrI+rQPgj69
   g==;
X-CSE-ConnectionGUID: +cjystD9QZ6+02Rjnive2Q==
X-CSE-MsgGUID: tZaQYVbURVyZGAGkXXV37g==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="60019013"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="60019013"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2025 00:56:15 -0700
X-CSE-ConnectionGUID: LfvIxM39S6WdKa7/E14LSA==
X-CSE-MsgGUID: 7BmRcL02RbS34FFYpdmvKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="163942874"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.246.164])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2025 00:56:01 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>
Cc: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>,
 dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com, joe@perches.com,
 corbet@lwn.net, apw@canonical.com, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Konstantin
 Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: [PATCH] checkpatch: validate commit tag ordering
In-Reply-To: <45f0995f-17ac-45a3-8bc0-3b276ee91a9d@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250724072032.118554-1-hendrik.hamerlinck@hammernet.be>
 <53eb0068-008b-48e6-9b92-d92de2ed4fc9@kernel.org>
 <CAMuHMdU2e+5Hf3v=C=sE=+25f_A=2=Zzw5rxvcT=hb75VC=iFQ@mail.gmail.com>
 <45f0995f-17ac-45a3-8bc0-3b276ee91a9d@kernel.org>
Date: Fri, 01 Aug 2025 10:55:55 +0300
Message-ID: <3e9106d35d41a044adeadffeea32fa096c9e1370@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, 31 Jul 2025, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 31/07/2025 13:55, Geert Uytterhoeven wrote:
>> B4 does not follow the proper order:
>
> There is no "proper order" in terms of absolute facts.

Let's just decide whatever order b4 uses *is* the proper order, and save
ourselves endless hours of debating! :p

BR,
Jani.


-- 
Jani Nikula, Intel
