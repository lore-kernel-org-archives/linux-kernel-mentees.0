Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AC22773C2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 Aug 2025 17:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755538457; cv=none; b=dPrHEaNCyfE4fWTk7eIwJH8viVGBImkoi/5HTTpeNyoSi21FDBfBWAqjvyFkISO16amaerLfWHOwq1iAZZ326Lkeyr4cXCjOMsdNivkNzM37yQVmIu9aUz1kkfnlfSsBmTbLkKNqImiav0SEoxcWpjQ19Z6x9YmJFKIEw5p9cOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755538457; c=relaxed/simple;
	bh=HwKz2ZvTlrx9A/GRESM903NFMrPusguohKyWSeDg0QM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JmYf+pInzL3QOJm3QdyMS8JSjivozKPhtbAYww1zRzZIkrPA5Ryg39d2SNTwta+wncXJAPHaQ/rNRk50UZsqO8LFyJyuEZ3wS5DPpchCJno4vV9LikZ/NEJ2u4FFfqWhW36MkhH/hSGOWyX6gNVKyGwZ+TDA+q74p3YCKErHvv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I0dJXYb7; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I0dJXYb7"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 523A6605EA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 Aug 2025 17:34:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -7.99
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Prxn6TixoFTc for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Aug 2025 17:34:15 +0000 (UTC)
X-Greylist: delayed 427 seconds by postgrey-1.37 at util1.osuosl.org; Mon, 18 Aug 2025 17:34:15 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 93151605E5
Authentication-Results: smtp3.osuosl.org; dmarc=none (p=none dis=none) header.from=linux.intel.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93151605E5
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I0dJXYb7
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=pawan.kumar.gupta@linux.intel.com; receiver=<UNKNOWN> 
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 93151605E5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 Aug 2025 17:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755538456; x=1787074456;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HwKz2ZvTlrx9A/GRESM903NFMrPusguohKyWSeDg0QM=;
  b=I0dJXYb7IEdaZxLrdz+bTvGFC8a70KWCN8OkFMYemAVC74gNN3UzTfVZ
   YpI59LqMvgw3tKJgN16eDdqJQFCLVaKJVxX/xU7Kir5AedILPTUTPtvrP
   pu78Wu41Z5/LjVHsh+AEsnDxFrv/BvC1tVokf377BdSU2AFMH73lCnkta
   rXsXBeJfkm7uk/pqIhUNmF+sqguEjFk7BjwdX2E0bSpZKXIYqV6vhpeqs
   7tiOae4s2BPaD9xSxWVyxG4TSDl18WTPJE3REEZB7IRnzImFw9s/umEGs
   5iPQJ0JZezm0gftuCFzOmkcCnsKj9FnyoVvEvhgXd18Qwyw4LMxLYTQVo
   Q==;
X-CSE-ConnectionGUID: ZTrgTtWJTKqouIYzsCdjSQ==
X-CSE-MsgGUID: o3Kzrt6aTmeapQKwePcMcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57481494"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="57481494"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 10:27:07 -0700
X-CSE-ConnectionGUID: 4D4u2epWRwGxu77OuzSNcg==
X-CSE-MsgGUID: pmBbF8sQSMWFW7IwRx1oQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="166867851"
Received: from rfrazer-mobl3.amr.corp.intel.com (HELO desk) ([10.124.220.33])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 10:27:07 -0700
Date: Mon, 18 Aug 2025 10:26:55 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: "Nikola Z. Ivanov" <zlatistiv@gmail.com>, tglx@linutronix.de,
	bp@alien8.de, peterz@infradead.org, jpoimboe@kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] docs: Replace dead links to spectre side channel white
 papers
Message-ID: <20250818172655.g7qr6yue5oeewk5w@desk>
References: <20250816190028.55573-1-zlatistiv@gmail.com>
 <875xekaa4a.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875xekaa4a.fsf@trenco.lwn.net>

On Mon, Aug 18, 2025 at 10:05:25AM -0600, Jonathan Corbet wrote:
> "Nikola Z. Ivanov" <zlatistiv@gmail.com> writes:
> 
> > The papers are published by Intel, AMD and MIPS.
> >
> > Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>
> > ---
> > The MIPS blog post is nowhere to be found on mips.com,
> > instead a link is placed to the last time the web archive
> > has crawled it.
> >
> >  Documentation/admin-guide/hw-vuln/spectre.rst | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> I sure wish I understood why companies feel such a need to break links
> so often ... I've applied this, thanks.

Sorry about that, I have let the Intel team know about the broken links.
And requested them to make sure that this does not happen again in the
future.
