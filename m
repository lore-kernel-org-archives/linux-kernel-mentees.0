Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2704229408
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 26 Aug 2024 20:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724704270; cv=none; b=IEXjFeSCRZofBSEDnegGCAbyfXmHNh6mQnnnwVOmMespMEPP0aLOyRtGLQqDeEdSHgNpFVGnonJ3xqmJgFy/J1xGVXWGjgHahFVC1sZ1NHiXdUovHE0sMpMkzHy2zSmmMj60OKmZf+Ghe7QcZF6EO4rIARr6NqJuqCD5ZuB733A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724704270; c=relaxed/simple;
	bh=gtpUXosV9nTewaoVXIBB26T8v/macdxzA2gCDaiEvlM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KTETGdgCFUHcRSU6ITyJlM3uwpGisEVzZo4wGzFkspWez9ZDbVRbYv3qYeMqGpz58RiXKgcxTgIF/OVVIHUlvnKmIYSqc/hZ2quAEIMTf4Ea+dvUEm9BjO5puvX9MjETQDVhOonVp7f9vMlyBpEd89R792cX5oov0b5anyT5dBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ezJ0bpos; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ezJ0bpos"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A92D64024E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 26 Aug 2024 20:31:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -7.989
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ls5vl_czjhoy for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Aug 2024 20:31:02 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=198.175.65.11; helo=mgamail.intel.com; envelope-from=todd.e.brandt@linux.intel.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 832F6400DA
Authentication-Results: smtp2.osuosl.org; dmarc=none (p=none dis=none) header.from=linux.intel.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 832F6400DA
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ezJ0bpos
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 832F6400DA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 26 Aug 2024 20:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724704263; x=1756240263;
  h=message-id:subject:from:reply-to:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=gtpUXosV9nTewaoVXIBB26T8v/macdxzA2gCDaiEvlM=;
  b=ezJ0bpostYTbBHRVHz9J31oYSFiXAAl8Jlht342mJamlr05wyKAAk7Yh
   GxUbk0ZHGxivtDBNIlRrWKSupebm8h7xpR171HJ68ab+YPzCQ7YQZNHbV
   0IB4USZi3CYQ9S76lZr75eTDjJFaf9fTIntNFJ3/AD0/mRobUQI14DgeR
   8APcDGJQyIFo9P5Tp0TQ7xJUvIyIKDPd1JDQHgXskBAVB0EnogZTXC1qt
   FiaNbT/NHItXGeAUF2w2Bu68H4iSznpfILWl49b201kBIcPYy5aTjHaXF
   vCBDj33cUqtYR6YEr5HGvoTz2qB0IQzAmrehO/hGV6TyWrCW8CdXxoP6K
   A==;
X-CSE-ConnectionGUID: /7UYQWwoTluZN1Pocl1OkQ==
X-CSE-MsgGUID: jInPqwvpQ3yRGZRT6EU6AA==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="33718259"
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; 
   d="scan'208";a="33718259"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 13:31:00 -0700
X-CSE-ConnectionGUID: dWFGDeYxRDWN4Oa61Cd7vQ==
X-CSE-MsgGUID: Y46xu62dRjiebJe/ze2JPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; 
   d="scan'208";a="66780154"
Received: from dgramcko-desk.amr.corp.intel.com ([10.124.223.43])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 13:30:58 -0700
Message-ID: <36376e1cb02b3ef44b849fc28e6b3f38e18a50ef.camel@linux.intel.com>
Subject: Re: [PATCH] pm-graph: ignore sleepgraph.py artifacts
From: Todd Brandt <todd.e.brandt@linux.intel.com>
Reply-To: todd.e.brandt@linux.intel.com
To: "Yo-Jung (Leo) Lin" <0xff07@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org, ricardo@marliere.net, 
	skhan@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Date: Mon, 26 Aug 2024 13:30:42 -0700
In-Reply-To: <20240825095353.7578-1-0xff07@gmail.com>
References: <20240825095353.7578-1-0xff07@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Sun, 2024-08-25 at 17:53 +0800, Yo-Jung (Leo) Lin wrote:
> By default, sleepgraph.py creates suspend-{date}-{time} directories
> to store artifacts, or suspend-{date}-{time}-xN if the --multi option
> is used. Ignore those directories by adding a .gitignore file.
>=20
> Signed-off-by: Yo-Jung (Leo) Lin <0xff07@gmail.com>
> ---
> =C2=A0tools/power/pm-graph/.gitignore | 3 +++
> =C2=A01 file changed, 3 insertions(+)
> =C2=A0create mode 100644 tools/power/pm-graph/.gitignore
>=20
> diff --git a/tools/power/pm-graph/.gitignore b/tools/power/pm-
> graph/.gitignore
> new file mode 100644
> index 000000000000..37762a8a06d6
> --- /dev/null
> +++ b/tools/power/pm-graph/.gitignore
> @@ -0,0 +1,3 @@
> +# sleepgraph.py artifacts
> +suspend-[0-9]*-[0-9]*
> +suspend-[0-9]*-[0-9]*-x[0-9]*
This seems fine. If you run the tool inside the tools/power/pm-graph
folder I can see how it would be annoying to have all those output
directories show up in git status.

Signed-off-by: Todd Brandt <todd.e.brandt@linux.intel.com>


